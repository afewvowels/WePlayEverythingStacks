-- Belt stacking research for games without Space Age.
-- Mirrors Space Age's three tiers:
--   Stack inserter              -> belt stack 2
--   Transport belt capacity 1   -> belt stack 3
--   Transport belt capacity 2   -> belt stack 4, non-bulk inserter capacity +1
-- Skipped when Space Age (or another mod) already provides these techs.

if mods["space-age"] or data.raw.technology["transport-belt-capacity-1"] then
  return
end

local util = require("util")
local icon = "__base__/graphics/technology/logistics-3.png"

local red    = {"automation-science-pack", 1}
local green  = {"logistic-science-pack", 1}
local blue   = {"chemical-science-pack", 1}
local purple = {"production-science-pack", 1}
local yellow = {"utility-science-pack", 1}

data:extend({
  {
    type = "technology",
    name = "es-belt-stacking-1",
    icons = util.technology_icon_constant_stack_size(icon),
    effects = {
      {type = "belt-stack-size-bonus", modifier = 1}
    },
    prerequisites = {"bulk-inserter", "chemical-science-pack"},
    unit = {
      count = 300,
      ingredients = {red, green, blue},
      time = 30
    },
    upgrade = true,
    order = "c-o-a"
  },
  {
    type = "technology",
    name = "es-belt-stacking-2",
    icons = util.technology_icon_constant_stack_size(icon),
    effects = {
      {type = "belt-stack-size-bonus", modifier = 1}
    },
    prerequisites = {"es-belt-stacking-1", "logistics-3", "production-science-pack"},
    unit = {
      count = 600,
      ingredients = {red, green, blue, purple},
      time = 45
    },
    upgrade = true,
    order = "c-o-b"
  },
  {
    type = "technology",
    name = "es-belt-stacking-3",
    icons = util.technology_icon_constant_stack_size(icon),
    effects = {
      {type = "belt-stack-size-bonus", modifier = 1},
      {type = "inserter-stack-size-bonus", modifier = 1}
    },
    prerequisites = {"es-belt-stacking-2", "utility-science-pack", "inserter-capacity-bonus-7"},
    unit = {
      count = 900,
      ingredients = {red, green, blue, purple, yellow},
      time = 60
    },
    upgrade = true,
    order = "c-o-c"
  }
})
