-- Runs last so inserters and loaders from other mods get patched too.

local max_stack = settings.startup["everything-stacks-max-belt-stack"].value
local include_loaders = settings.startup["everything-stacks-include-loaders"].value

local function raise_stack(proto)
  if (proto.max_belt_stack_size or 1) < max_stack then
    proto.max_belt_stack_size = max_stack
  end
end

-- Inserters: the stack dropped on a belt is capped by the researched belt
-- stack size and by what's in the hand. grab_less_to_match_belt_stack makes a
-- big hand (e.g. bulk, 10) grab a multiple of the belt stack (8 at stack 4)
-- so it drops full stacks, while a small hand (e.g. 2) drops stacks of 2.
for _, inserter in pairs(data.raw["inserter"]) do
  raise_stack(inserter)
  inserter.grab_less_to_match_belt_stack = true
end

-- Loaders: stack up to the researched size, adjustable per loader in its GUI.
if include_loaders then
  for _, loader_type in pairs({"loader", "loader-1x1"}) do
    for _, loader in pairs(data.raw[loader_type] or {}) do
      raise_stack(loader)
      loader.adjustable_belt_stack_size = true
    end
  end
end
