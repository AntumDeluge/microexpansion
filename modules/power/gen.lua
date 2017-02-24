-- power/gen.lua

local me = microexpansion

-- [register node] Fuel Fired Generator
me.register_node("fuel_fired_generator", {
  description = "Fuel-Fired Generator",
  tiles = {
    "fuelgen_sides",
		"fuelgen_sides",
		"fuelgen_sides",
		"fuelgen_sides",
		"fuelgen_sides",
		"fuelgen_front",
  },
  recipe = {
    "single",
    { 1,
      { "default:steel_ingot", "default:furnace", "default:steel_ingot" },
      {"default:steel_ingot", "microexpansion:machine_casing", "default:steel_ingot" },
      { "default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
    }
  },
  groups = { cracky = 1 },
  paramtype2 = "facedir",
})
