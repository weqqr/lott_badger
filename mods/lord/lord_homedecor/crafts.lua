-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz
--
-- Mostly my own code; overall template borrowed from game default

local S = minetest.get_translator("lord_homedecor")

-- misc craftitems

minetest.register_craftitem("lord_homedecor:terracotta_base", {
	description     = S("Uncooked Terracotta Base"),
	inventory_image = "homedecor_terracotta_base.png",
})

minetest.register_craftitem("lord_homedecor:roof_tile_terracotta", {
	description     = S("Terracotta Roof Tile"),
	inventory_image = "homedecor_roof_tile_terracotta.png",
})

--minetest.register_craftitem("lord_homedecor:oil_extract", {
--description = S("Oil extract"),
--inventory_image = "homedecor_oil_extract.png",
--})

minetest.register_craft({
	type         = "shapeless",
	output       = "lord_homedecor:terracotta_base 8",
	recipe       = {
		"default:dirt",
		"default:clay_lump",
		"bucket:bucket_water"
	},
	replacements = { { "bucket:bucket_water", "bucket:bucket_empty" }, },
})

minetest.register_craft({
	type   = "cooking",
	output = "lord_homedecor:roof_tile_terracotta",
	recipe = "lord_homedecor:terracotta_base",
})

minetest.register_craft({
	output = "lord_homedecor:shingles_terracotta",
	recipe = {
		{ "lord_homedecor:roof_tile_terracotta", "lord_homedecor:roof_tile_terracotta" },
		{ "lord_homedecor:roof_tile_terracotta", "lord_homedecor:roof_tile_terracotta" },
	},
})

minetest.register_craft({
	output = "lord_homedecor:flower_pot_terracotta",
	recipe = {
		{ "lord_homedecor:roof_tile_terracotta", "default:dirt", "lord_homedecor:roof_tile_terracotta" },
		{ "", "lord_homedecor:roof_tile_terracotta", "" },
	},
})

-- кровля
minetest.register_craft({
	output = "lord_homedecor:shingles_wood 12",
	recipe = {
		{ "group:stick", "group:wood" },
		{ "group:wood", "group:stick" },
	},
})

minetest.register_craft({
	output = "lord_homedecor:shingles_wood 12",
	recipe = {
		{ "group:wood", "group:stick" },
		{ "group:stick", "group:wood" },
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shingles_wood",
	burntime = 30,
})

----

-- мансардные стекла
minetest.register_craft({
	output = "lord_homedecor:skylight 4",
	recipe = {
		{ "default:glass", "default:glass" },
	},
})

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:skylight_frosted",
	recipe = {
		"dye:white",
		"lord_homedecor:skylight"
	},
})

minetest.register_craft({
	type   = "cooking",
	output = "lord_homedecor:skylight",
	recipe = "lord_homedecor:skylight_frosted",
})
--

---- Various colors of shutters / окрашенные ставни
minetest.register_craft({
	output = "lord_homedecor:shutter_oak 2",
	recipe = {
		{ "group:stick", "group:stick" },
		{ "group:stick", "group:stick" },
		{ "group:stick", "group:stick" },
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_oak",
	burntime = 30,
})

----

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_black 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:black"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_black",
	burntime = 30,
})

----

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_dark_grey 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:dark_grey"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_dark_grey",
	burntime = 30,
})

----

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_grey 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:grey"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_grey",
	burntime = 30,
})

--

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_white 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:white"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_white",
	burntime = 30,
})

--

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_mahogany 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:brown"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_mahogany",
	burntime = 30,
})

----

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_red 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:red"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_red",
	burntime = 30,
})

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_yellow 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:yellow"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_yellow",
	burntime = 30,
})

--

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_forest_green 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:dark_green"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_forest_green",
	burntime = 30,
})

--

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_light_blue 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:blue"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_light_blue",
	burntime = 30,
})

----

minetest.register_craft({
	type   = "shapeless",
	output = "lord_homedecor:shutter_violet 4",
	recipe = {
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"lord_homedecor:shutter_oak",
		"dye:violet"
	},
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "lord_homedecor:shutter_violet",
	burntime = 30,
})

minetest.register_craft({
	output = "lord_homedecor:pole_wrought_iron 6",
	recipe = {
		{ "default:steel_ingot", },
		{ "default:steel_ingot", },
		{ "default:steel_ingot", },
	},
})

-- Lighting / Освещение

-- candles / свечи

minetest.register_craft({
	output = "lord_homedecor:candle_thin 4",
	recipe = {
		{ "farming:string" },
		{ "bees:wax" }
	}
})

minetest.register_craft({
	output = "lord_homedecor:candle 2",
	recipe = {
		{ "farming:string" },
		{ "bees:wax" },
		{ "bees:wax" }
	}
})

minetest.register_craft({
	output = "lord_homedecor:wall_sconce 2",
	recipe = {
		{ "default:iron_lump", "", "" },
		{ "default:iron_lump", "lord_homedecor:candle", "" },
		{ "default:iron_lump", "", "" },
	}
})

minetest.register_craft({
	output = "lord_homedecor:candlestick_wrought_iron",
	recipe = {
		{ "" },
		{ "lord_homedecor:candle_thin" },
		{ "default:iron_lump" },
	}
})

minetest.register_craft({
	output = "lord_homedecor:candlestick_brass",
	recipe = {
		{ "" },
		{ "lord_homedecor:candle_thin" },
		{ "default:bronze_ingot" },
	}
})

minetest.register_craft({
	output = "lord_homedecor:well",
	recipe = {
		{ "lord_homedecor:shingles_wood", "lord_homedecor:shingles_wood", "lord_homedecor:shingles_wood" },
		{ "group:wood", "group:stick", "group:wood" },
		{ "default:cobble", "bucket:bucket_water", "default:cobble" }
	},
})

minetest.register_craft({
	output = "lord_homedecor:bench_large_1",
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "group:wood", "group:wood", "group:wood" },
		{ "lord_homedecor:pole_wrought_iron", "", "lord_homedecor:pole_wrought_iron" }
	},
})

minetest.register_craft({
	output = "lord_homedecor:bench_large_2_left",
	recipe = {
		{ "lord_homedecor:shutter_oak", "lord_homedecor:shutter_oak", "lord_homedecor:shutter_oak" },
		{ "group:wood", "group:wood", "group:wood" },
		{ "stairs:slab_wood", "", "stairs:slab_wood" }
	},
})

minetest.register_craft({
	output = "lord_homedecor:bench_large_2_left",
	recipe = {
		{ "lord_homedecor:shutter_oak", "lord_homedecor:shutter_oak", "lord_homedecor:shutter_oak" },
		{ "group:wood", "group:wood", "group:wood" },
		{ "stairs:slab_junglewood", "", "stairs:slab_junglewood" }
	},
})

minetest.register_craft({
	output = "lord_homedecor:simple_bench",
	recipe = {
		{ "stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood" },
		{ "stairs:slab_wood", "", "stairs:slab_wood" }
	},
})

minetest.register_craft({
	output = "lord_homedecor:window_flowerbox",
	recipe = {
		{ "lord_homedecor:roof_tile_terracotta", "default:dirt",                        "lord_homedecor:roof_tile_terracotta" }, -- luacheck: ignore
		{ "lord_homedecor:roof_tile_terracotta", "lord_homedecor:roof_tile_terracotta", "lord_homedecor:roof_tile_terracotta" }, -- luacheck: ignore
	},
})

minetest.register_craft({
	output = "lord_homedecor:stonepath 16",
	recipe = {
		{ "stairs:slab_stone", "", "stairs:slab_stone" },
		{ "", "stairs:slab_stone", "" },
		{ "stairs:slab_stone", "", "stairs:slab_stone" }
	},
})

minetest.register_craft({
	output = "lord_homedecor:swing",
	recipe = {
		{ "farming:string", "", "farming:string" },
		{ "farming:string", "", "farming:string" },
		{ "farming:string", "stairs:slab_wood", "farming:string" }
	},
})

minetest.register_craft({
	output = "lord_homedecor:wall_lamp 2",
	recipe = {
		{ "default:glass", "default:torch", "default:glass" },
		{ "default:iron_lump", "group:stick", "" },
		{ "default:iron_lump", "group:stick", "" },
	},
})

minetest.register_craft({
	output = "lord_homedecor:lattice_wood 8",
	recipe = {
		{ "group:stick", "group:wood", "group:stick" },
		{ "group:wood", "", "group:wood" },
		{ "group:stick", "group:wood", "group:stick" },
	},
})

minetest.register_craft({
	output = "lord_homedecor:lattice_white_wood 8",
	recipe = {
		{ "group:stick", "group:wood", "group:stick" },
		{ "group:wood", "dye:white", "group:wood" },
		{ "group:stick", "group:wood", "group:stick" },
	},
})

minetest.register_craft({
	output = "lord_homedecor:lattice_wood_vegetal 8",
	recipe = {
		{ "group:stick", "group:wood", "group:stick" },
		{ "group:wood", "lottplants:lebethronleaf", "group:wood" },
		{ "group:stick", "group:wood", "group:stick" },
	},
})

minetest.register_craft({
	output = "lord_homedecor:lattice_white_wood_vegetal 8",
	recipe = {
		{ "group:stick", "group:wood", "group:stick" },
		{ "group:wood", "lottplants:lebethronleaf", "group:wood" },
		{ "group:stick", "dye:white", "group:stick" },
	},
})

minetest.register_craft({
	output = "lord_homedecor:stained_glass 8",
	recipe = {
		{ "", "dye:blue", "" },
		{ "dye:red", "default:glass", "dye:green" },
		{ "", "dye:yellow", "" },
	},
})

minetest.register_craftitem("lord_homedecor:flower_pot_small", {
	description     = S("Small Flower Pot"),
	inventory_image = "homedecor_flowerpot_small_inv.png"
})

minetest.register_craft({
	output = "lord_homedecor:flower_pot_small",
	recipe = {
		{ "default:clay_brick", "", "default:clay_brick" },
		{ "", "default:clay_brick", "" }
	}
})

minetest.register_craft({
	output = "lord_homedecor:flower_pot_small 3",
	recipe = { { "lord_homedecor:flower_pot_terracotta" } }
})

minetest.register_craft({
	output = "lord_homedecor:shrubbery_green 3",
	recipe = {
		{ "lottplants:lebethronleaf", "lottplants:lebethronleaf", "lottplants:lebethronleaf" },
		{ "lottplants:lebethronleaf", "lottplants:lebethronleaf", "lottplants:lebethronleaf" },
		{ "group:stick", "group:stick", "group:stick" }
	}
})

for _, color in ipairs(lord_homedecor.shrub_colors) do

	minetest.register_craft({
		type   = "shapeless",
		output = "lord_homedecor:shrubbery_large_" .. color,
		recipe = {
			"lord_homedecor:shrubbery_" .. color
		}
	})

	minetest.register_craft({
		type   = "shapeless",
		output = "lord_homedecor:shrubbery_" .. color,
		recipe = {
			"lord_homedecor:shrubbery_large_" .. color
		}
	})

	if color ~= "green" then
		minetest.register_craft({
			type   = "shapeless",
			output = "lord_homedecor:shrubbery_large_" .. color,
			recipe = {
				"lord_homedecor:shrubbery_large_green",
				"dye:" .. color
			}
		})

		minetest.register_craft({
			type   = "shapeless",
			output = "lord_homedecor:shrubbery_" .. color,
			recipe = {
				"lord_homedecor:shrubbery_green",
				"dye:" .. color
			}
		})

	end
end


-- перила
for i in ipairs(lord_homedecor.banister_materials) do

	local name    = lord_homedecor.banister_materials[i][1]
	local topmat  = lord_homedecor.banister_materials[i][5]
	local vertmat = lord_homedecor.banister_materials[i][6]
	local dye1    = lord_homedecor.banister_materials[i][7]
	local dye2    = lord_homedecor.banister_materials[i][8]

	minetest.register_craft({
		output = "lord_homedecor:banister_" .. name .. "_horizontal 2",
		recipe = {
			{ topmat, "", dye1 },
			{ vertmat, topmat, "" },
			{ dye2, vertmat, topmat }
		},
	})
end
