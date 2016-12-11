local SL = lord.require_intllib()

minetest.register_craftitem("mobs:kraken_tentacle", {
	description = "Kraken Tentacle",
	image = "tentacle_curly.png",
})

minetest.register_craftitem("mobs:tentacle", {
	description = "Tentacle",
	image = "tentacle.png",
	on_use = minetest.item_eat(2),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("mobs:tarantula_chelicerae", {
	description = "Tarantula Chelicerae",
	image = "tarantula_chelicerae.png",
})

minetest.register_craftitem("mobs:spider_leg", {
	description = "Spider Leg",
	image = "spider_leg.png",
	on_use = minetest.item_eat(2),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("mobs:roasted_spider_leg", {
	description = "Roasted Spider Leg",
	image = "roasted_spider_leg.png",
	on_use = minetest.item_eat(4),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("mobs:surimi", {
	description = "Surimi",
	image = "surimi.png",
	on_use = minetest.item_eat(4),
	groups = { meat=1, eatable=1 },
})

minetest.register_craftitem("mobs:white_wolf_fur", {
	description = "White Wolf Fur",
	image = "white_wolf_fur.png",
})

minetest.register_craftitem("mobs:life_energy", {
	description = "Life Energy",
	inventory_image = "life_energy.png",
})

minetest.register_node("mobs:ink", {
	description = "Ink",
	inventory_image = minetest.inventorycube("ink.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "ink_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	--alpha = 420,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	liquid_range= 0,
	drowning = 1,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_alternative_flowing = "mobs:ink",
	liquid_alternative_source = "mobs:ink",
	liquid_viscosity = 1,
	post_effect_color = {a=2000, r=30, g=30, b=30},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_abm({
	nodenames = {"mobs:web"},
	neighbors = {"default:junglegrass"},
	interval = 20.0,
	chance = 20,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local n = minetest.env:get_node(pos).name
		if n== "air" then
			minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "mobs:web"})
		end
	end
})

--Eggs

function nssm_register_egg (name, descr)


minetest.register_craftitem("mobs:".. name .."_egg", {
	description = descr .. " Egg",
	image = name .. "_egg.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, above)
		pos1.y=pos1.y+1.5
		core.after(0.1, function()
			minetest.add_entity(pos1, "mobs:".. name)
		end)
		itemstack:take_item()
		return itemstack
	end,
})

end

nssm_register_egg ('tarantula', 'Tarantula')
nssm_register_egg ('kraken', 'Kraken')
