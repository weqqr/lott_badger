local SL = lord.require_intllib()

minetest.register_craftitem("lottfarming:barley", {
	description = SL("Barley"),
	inventory_image = "lottfarming_barley.png",
	on_place = function(itemstack, placer, pointed_thing)
		local ptu = pointed_thing.under
		local nu = minetest.get_node(ptu)
		if minetest.registered_nodes[nu.name].on_rightclick then
			return minetest.registered_nodes[nu.name].on_rightclick(ptu, nu, placer, itemstack)
		end
		return place_seed(itemstack, placer, pointed_thing, "lottfarming:barley_1")
	end,
})

minetest.register_node("lottfarming:barley_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"lottfarming_barley_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottfarming:barley_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	waving = 1,
	tiles = {"lottfarming_barley_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+9/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottfarming:barley_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	waving = 1,
	tiles = {"lottfarming_sheaf_barley.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottfarming:sheaf_barley'} },
			{ items = {'lottfarming:sheaf_barley'}, rarity = 2 },
			{ items = {'lottfarming:sheaf_barley'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottfarming:sheaf_barley", {
	description = SL("Sheaf barley"),
	inventory_image = "lottfarming_sheaf_barley.png",
})

farming:add_plant("lottfarming:barley_3", {"lottfarming:barley_1", "lottfarming:barley_2"}, 50, 20)

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "lottfarming:barley_cooked",
	recipe = "lottfarming:sheaf_barley"
})

minetest.register_craftitem("lottfarming:barley_cooked", {
	description = SL("Cooked Barley"),
	inventory_image = "lottfarming_barley_cooked.png",
	on_use = minetest.item_eat(2),
})
