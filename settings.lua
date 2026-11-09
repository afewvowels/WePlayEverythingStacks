data:extend({
  {
    -- Hard cap per entity. The real limit is still the researched belt stack size,
    -- so raise this only if another mod adds belt stacking beyond 4.
    type = "int-setting",
    name = "everything-stacks-max-belt-stack",
    setting_type = "startup",
    default_value = 4,
    minimum_value = 1,
    maximum_value = 255,
    order = "a"
  },
  {
    type = "bool-setting",
    name = "everything-stacks-include-loaders",
    setting_type = "startup",
    default_value = true,
    order = "b"
  }
})
