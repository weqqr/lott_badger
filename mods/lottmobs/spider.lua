mobs:register_mob("lottmobs:spider", {
	type = "monster",
	hp_min = 20,
	hp_max = 40,
	collisionbox = {-0.5, 0.00, -0.5, 0.5, 0.9, 0.5},
	mesh = "tarantula.x",
	textures = {{"tarantula.png"}},
	visual_size = {x=8,y=8},
	visual = "mesh",
    rotate = -90,
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	armor = 200,
	damage = 3,
	drops = {
		{name = "farming:string",
		chance = 3,
		min = 1,
		max = 6,},
		{name = "lottmobs:spiderpoison",
		chance = 7,
		min = 1,
		max = 5,},
		{name = "wool:white",
		chance = 10,
		min = 1,
		max = 3,},
		{name = "lottmobs:meat_raw",
		chance = 5,
		min = 1,
		max = 2,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 1,
		stand_end = 60,
		walk_start = 100,
		walk_end = 140,
		run_start = 140,
		run_end = 160,
		punch_start = 180,
		punch_end = 200,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_spider",
		death = "mobs_howl",
		attack = "mobs_oerkki_attack",
	},
	step = 1,
	on_die = function(self, pos)
		minetest.add_particlespawner(
			200, --amount
			0.1, --time
			{x=pos.x-1, y=pos.y-1, z=pos.z-1}, --minpos
			{x=pos.x+1, y=pos.y+1, z=pos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=1, y=1, z=1}, --maxvel
			{x=-0.5,y=5,z=-0.5}, --minacc
			{x=0.5,y=5,z=0.5}, --maxacc
			0.1, --minexptime
			1, --maxexptime
			3, --minsize
			4, --maxsize
			false, --collisiondetection
			"tnt_smoke.png" --texture
		)
		--minetest.add_entity(pos, "lottmobs:spider")
	end,
})
