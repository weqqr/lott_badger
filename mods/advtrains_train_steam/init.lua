local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("newlocomotive", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_engine_steam.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=6,
	seats = {
		{
			name=S("Driver Stand (left)"),
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
			group = "dstand",
		},
		{
			name=S("Driver Stand (right)"),
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
			group = "dstand",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {},
		},
	},
	assign_to_seat_group = {"dstand"},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"advtrains:boiler", "advtrains:chimney", "advtrains:driver_cab", "advtrains:wheel_pair 5", "lottores:tilkal_ingot 6"},
}, S("Steam Engine"), "advtrains_engine_steam_inv.png")

advtrains.register_wagon("detailed_steam_engine", {
	mesh="advtrains_detailed_steam_engine.b3d",
	textures = {"advtrains_detailed_steam_engine.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=10,
	seats = {
		{
			name=S("Driver Stand (left)"),
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
			group = "dstand",
		},
		{
			name=S("Driver Stand (right)"),
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
			group = "dstand",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {},
		},
	},
	assign_to_seat_group = {"dstand"},
	visual_size = {x=1, y=1},
	wagon_span=2.05,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2.3, z=1.45},
			maxpos = {x=0, y=2.3, z=1.4},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"advtrains:boiler", "advtrains:chimney", "advtrains:driver_cab", "advtrains:wheel_pair 3", "lottores:tilkal_ingot 6"},
}, S("Detailed Steam Engine"), "advtrains_detailed_engine_steam_inv.png")

advtrains.register_wagon("wagon_default", {
	mesh="advtrains_passenger_wagon.b3d",
	textures = {"advtrains_wagon.png"},
	drives_on={default=true},
	max_speed=10,
	seats = {
		{
			name="1",
			attach_offset={x=-4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
	},
	seat_groups = {
		pass={
			name = "Passenger area",
			access_to = {},
		},
	},
	assign_to_seat_group = {"pass"},
	visual_size = {x=1, y=1},
	wagon_span=3.1,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"advtrains:wheel_pair 4", "lottores:tilkal_ingot 6", "lottblocks:pine_chair", "lottblocks:pine_table", "default:steelblock 2"},
}, S("Passenger Wagon"), "advtrains_wagon_inv.png")
advtrains.register_wagon("wagon_box", {
	mesh="advtrains_wagon.b3d",
	textures = {"advtrains_wagon_box.png"},
	drives_on={default=true},
	max_speed=10,
	seats = {},
	visual_size = {x=1, y=1},
	wagon_span=1.8,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"advtrains:wheel_pair 4", "lottores:tilkal_ingot 6", "default:chest"},
	has_inventory = true,
	get_inventory_formspec = function(self)
        return "size[15,11]"..
            "list[detached:advtrains_wgn_"..self.unique_id..";box;0,0;15,6;]"..
            "list[current_player;main;4,7;8,4;]"..
            "listring[]"
    end,
    inventory_list_sizes = {
        box=15*11,
	},
}, S("Box Wagon"), "advtrains_wagon_box_inv.png")

advtrains.register_wagon("wagon_post", {
    mesh="advtrains_wagon.b3d",
    textures = {"advtrains_wagon_post.png"},
    drives_on={default=true},
    max_speed=10,
    seats = {},
    visual_size = {x=1, y=1},
    wagon_span=1.8,
    collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
    drops={"advtrains:wheel_pair 4", "lottores:tilkal_ingot 6", "default:chest"},
    has_inventory = true,
    get_inventory_formspec = function(self)
        return "size[13,10]"..
            "list[detached:advtrains_wgn_"..self.unique_id..";box;0,0;13,5;]"..
            "list[current_player;main;2,6;8,4;]"..
            "listring[]"
    end,
    inventory_list_sizes = {
        box=13*10,
    },
}, S("POST Wagon"), "advtrains_wagon_post_inv.png")

-- minetest.register_craft({
-- 	output = 'advtrains:newlocomotive',
-- 	recipe = {
-- 		{'protector_lott:protect2', 'dye:black', 'advtrains:chimney'},
-- 		{'advtrains:driver_cab', 'lottores:galvorn_block', 'advtrains:boiler'},
-- 		{'advtrains:trolley', 'advtrains:wheel_pair', 'advtrains:trolley'},
-- 	},
-- })
--
-- minetest.register_craft({
-- 	output = 'advtrains:detailed_steam_engine',
-- 	recipe = {
-- 		{'protector_lott:protect2', 'dye:green', 'advtrains:chimney'},
-- 		{'advtrains:driver_cab', 'lottores:galvorn_block', 'advtrains:boiler'},
-- 		{'advtrains:wheel_pair', '', 'advtrains:trolley', 'carts:steam_mechanism'},
-- 	},
-- })
--
-- minetest.register_craft({
-- 	output = 'advtrains:wagon_default',
-- 	recipe = {
-- 		{'default:steelblock', 'dye:green', 'default:steelblock'},
-- 		{'lottblocks:pine_chair', 'lottores:galvorn_block', 'lottblocks:pine_table'},
-- 		{'advtrains:trolley', '', 'advtrains:trolley'},
-- 	},
-- })
-- minetest.register_craft({
-- 	output = 'advtrains:wagon_box',
-- 	recipe = {
-- 		{'group:wood', 'group:wood', 'group:wood'},
-- 		{'technic:iron_chest', 'lottores:galvorn_block', 'technic:iron_chest'},
-- 		{'advtrains:trolley', '', 'advtrains:trolley'},
-- 	},
-- })
-- minetest.register_craft({
-- 	output = 'advtrains:wagon_post',
-- 	recipe = {
-- 		{'group:wood', 'dye:blue', 'group:wood'},
-- 		{'default:chest', 'lottores:galvorn_block', 'default:chest'},
-- 		{'advtrains:trolley', '', 'advtrains:trolley'},
-- 	},
-- })
