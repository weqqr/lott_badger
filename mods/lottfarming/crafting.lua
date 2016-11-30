local SL = lord.require_intllib()

-- ITEMS and TOOLS

minetest.register_craft({
	output = "lottfarming:bowl",
	recipe = {
		{"default:wood", "", "default:wood"},
		{"", "default:wood", ""},
		{"", "", ""},
	}
})

minetest.register_craftitem("lottfarming:bowl", {
	description = SL("Bowl"),
	inventory_image = "lottfarming_bowl.png",
})

minetest.register_node("lottfarming:decay_tree", {
	description = SL("Decaying Wood"),
	tiles = {'default_tree_top.png^lottfarming_decay_tree.png', 'default_tree.png', 	'default_tree.png'},
     is_ground_content = true,
	groups = {crumbly=3, fungi=3},
	sounds = default.node_sound_dirt_defaults(),
	drop = "default:dirt",
})

local function decaying_wood(pos)
	if pos == nil then return false end
	local node = minetest.get_node(pos)
	local name = node.name
	local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
	if name == "default:tree_trunk" or name == "default:jungletree_trunk" then
		if above.name == "air" then
			node.name = "lottfarming:decay_tree"
			minetest.set_node(pos, node)
			return true
		end
	end
	return false
end

local function growgen(pos)
	if pos == nil then return false end
	name = minetest.get_node(pos).name
	local farm_list = {
		["lottfarming:turnips_1"] = "lottfarming:turnips_2",
		["lottfarming:turnips_2"] = "lottfarming:turnips_3",
		["lottfarming:turnips_3"] = "lottfarming:turnips_4",
		["lottfarming:athelas_1"] = "lottfarming:athelas_2",
		["lottfarming:athelas_2"] = "lottfarming:athelas_3",
		["lottfarming:barley_1"] = "lottfarming:barley_2",
		["lottfarming:barley_2"] = "lottfarming:barley_3",
		["lottfarming:berries_1"] = "lottfarming:berries_2",
		["lottfarming:berries_2"] = "lottfarming:berries_3",
		["lottfarming:berries_3"] = "lottfarming:berries_4",
		["lottfarming:blue_mushroom_1"] = "lottfarming:blue_mushroom_2",
		["lottfarming:blue_mushroom_2"] = "lottfarming:blue_mushroom_3",
		["lottfarming:blue_mushroom_3"] = "lottfarming:blue_mushroom_4",
		["lottfarming:brown_mushroom_1"] = "lottfarming:brown_mushroom_2",
		["lottfarming:brown_mushroom_2"] = "lottfarming:brown_mushroom_3",
		["lottfarming:brown_mushroom_3"] = "lottfarming:brown_mushroom_4",
		["lottfarming:cabbage_1"] = "lottfarming:cabbage_2",
		["lottfarming:cabbage_2"] = "lottfarming:cabbage_3",
		["lottfarming:green_mushroom_1"] = "lottfarming:green_mushroom_2",
		["lottfarming:green_mushroom_2"] = "lottfarming:green_mushroom_3",
		["lottfarming:green_mushroom_3"] = "lottfarming:green_mushroom_4",
		["lottfarming:melon_1"] = "lottfarming:melon_2",
		["lottfarming:melon_2"] = "lottfarming:melon_3",
		["lottfarming:pipeweed_1"] = "lottfarming:pipeweed_2",
		["lottfarming:pipeweed_2"] = "lottfarming:pipeweed_3",
		["lottfarming:pipeweed_3"] = "lottfarming:pipeweed_4",
		["lottfarming:potato_1"] = "lottfarming:potato_2",
		["lottfarming:potato_2"] = "lottfarming:potato_3",
		["lottfarming:red_mushroom_1"] = "lottfarming:red_mushroom_2",
		["lottfarming:red_mushroom_2"] = "lottfarming:red_mushroom_3",
		["lottfarming:red_mushroom_3"] = "lottfarming:red_mushroom_4",
		["lottfarming:tomatoes_1"] = "lottfarming:tomatoes_2",
		["lottfarming:tomatoes_2"] = "lottfarming:tomatoes_3",
		["lottfarming:tomatoes_3"] = "lottfarming:tomatoes_4",
		["lottfarming:corn_1"] = "lottfarming:corn_2",
		["lottfarming:corn_2"] = "lottfarming:corn_21",
		["lottfarming:corn_21"] = "lottfarming:corn_32",
		["farming:wheat_1"] = "farming:wheat_2",
		["farming:wheat_2"] = "farming:wheat_3",
		["farming:wheat_3"] = "farming:wheat_4",
		["farming:wheat_4"] = "farming:wheat_5",
		["farming:wheat_5"] = "farming:wheat_6",
		["farming:wheat_6"] = "farming:wheat_7",
		["farming:wheat_7"] = "farming:wheat_8",
		["farming:cotton_1"] = "farming:cotton_2",
		["farming:cotton_2"] = "farming:cotton_3",
		["farming:cotton_3"] = "farming:cotton_4",
		["farming:cotton_4"] = "farming:cotton_5",
		["farming:cotton_5"] = "farming:cotton_6",
		["farming:cotton_6"] = "farming:cotton_7",
		["farming:cotton_7"] = "farming:cotton_8",
	}
	for farm_1, farm_2 in pairs(farm_list) do
		if name == farm_1 then
			minetest.set_node(pos, {name=farm_2})
			return true
		end
	end
	return false
end


minetest.register_tool("lottfarming:bacteria_fertiliser", {
	description = SL("Bacteria Fertiliser"),
	tiles = {"vessels_glass_bottle.png^lottfarming_bacteria_fertiliser.png"},
	inventory_image = "vessels_glass_bottle_inv.png^lottfarming_bacteria_fertiliser.png",
	on_use = function(itemstack, user, pointed_thing)
		if decaying_wood(pointed_thing.under) or growgen(pointed_thing.under) then
			itemstack:add_wear(65535/20)
			return itemstack
		end
	end
})

minetest.register_craft({
	output = "lottfarming:bacteria_fertiliser",
	recipe = {{"lottpotion:glass_bottle_water", "bones:bonedust"}}
})

minetest.register_craft({
	output = 'lottfarming:pipe',
	recipe = {
		{'', '', 'group:stick'},
		{'group:wood', 'group:stick', ''},
		{'group:stick', '', ''},
	}
})

-- SOUPS and SALADS

minetest.register_craft({
	output = 'lottfarming:mushroom_soup',
	recipe = {
		{'group:mushroom', 'group:mushroom', 'group:mushroom'},
		{'', 'lottfarming:bowl', ''},
	}
})

minetest.register_craft({
	output = 'lottfarming:salad',
	recipe = {
		{'group:salad', 'group:salad', 'group:salad'},
		{'', 'lottfarming:bowl', ''},
	}
}) 

-- SEEDS

minetest.register_craft({
	output = 'lottfarming:athelas_seed 2',
	recipe = {
		{'lottfarming:athelas'},
	}
})

minetest.register_craft({
	output = 'lottfarming:barley 6',
	recipe = {
		{'lottfarming:sheaf_barley'},
	}
})

minetest.register_craft({
	output = 'lottfarming:berries_seed 2',
	recipe = {
		{'lottfarming:berries'},
	}
})

minetest.register_craft({
	output = 'lottfarming:cabbage_seed 2',
	recipe = {
		{'lottfarming:cabbage'},
	}
})

minetest.register_craft({
	output = 'lottfarming:corn 6',
	recipe = {
		{'lottfarming:ear_of_corn'},
	}
})

minetest.register_craft({
	output = 'lottfarming:tomatoes_seed 2',
	recipe = {
		{'lottfarming:tomatoes'},
	}
})

minetest.register_craft({
	output = 'lottfarming:melon_seed 2',
	recipe = {
		{'lottfarming:melon'},
	}
})

minetest.register_craft({
	output = 'lottfarming:half_of_potatoe 2',
	recipe = {
		{'lottfarming:potato'},
	}
})

minetest.register_craft({
	output = 'lottfarming:pipeweed_seed 2',
	recipe = {
		{'lottfarming:pipeweed'},
	}
})
minetest.register_craft({
	output = 'lottfarming:turnips_seed 2',
	recipe = {
		{'lottfarming:turnips'},
	}
})

-- FOOD

minetest.register_craft({
	output = 'lottfarming:melon 9',
	recipe = {{'lottfarming:melon_3'}},
})

-- COOKING
minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottfarming:barley_cooked",
	recipe = "lottfarming:sheaf_barley"
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottfarming:pipeweed_cooked",
	recipe = "lottfarming:pipeweed"
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottfarming:potato_cooked",
	recipe = "lottfarming:potato"
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottfarming:turnips_cooked",
	recipe = "lottfarming:turnips"
})
