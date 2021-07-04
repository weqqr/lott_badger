local SL = minetest.get_translator("arrows")

AXE_MASS = 3.0
AXE_VEL = 20
AXE_BASE_DC = 0.1
AXE_KFR = 0.05

local axe_node_box = {
	type = "fixed",
	fixed = {
		{0.375, -0.5, -0.0625, 0.5, -0.375, 0.0625}, -- NodeBox1
		{0.25, -0.375, -0.0625, 0.375, -0.25, 0.0625}, -- NodeBox2
		{0.125, -0.25, -0.0625, 0.25, -0.125, 0.0625}, -- NodeBox3
		{0, -0.125, -0.0625, 0.125, 0, 0.0625}, -- NodeBox4
		{-0.125, 0, -0.0625, 0, 0.125, 0.0625}, -- NodeBox5
		{-0.25, 0, -0.0625, -0.125, 0.25, 0.0625}, -- NodeBox6
		{-0.375, 0, -0.0625, -0.25, 0.375, 0.0625}, -- NodeBox7
		{-0.5, 0, -0.0625, -0.375, 0.5, 0.0625}, -- NodeBox8
	}
}

local lottthrowing_register_axe = function(axe, desc, damage, craft1, craft2)
	local name = "arrows:axe_"..axe
	local inventory_image = "lottthrowing_axe_"..axe.."_inv.png"
	local description = SL(desc.." Throwing Axe")

	minetest.register_node(name.."_axe_box", {
		drawtype = "nodebox",
		node_box = axe_node_box,
		tiles = {
			"lottthrowing_axe_top.png",
			"lottthrowing_axe_top.png",
			"lottthrowing_axe_back.png",
			"lottthrowing_axe_" .. axe .. "_front.png",
			"lottthrowing_axe_" .. axe .. ".png",
			"lottthrowing_axe_" .. axe .. "2.png"
		},
		groups = {not_in_creative_inventory=1},
	})


	arrows:register_throwing_weapon(name, {
		arrow = {
			visual = "wielditem",
			visual_size = {x=.5, y=.5},
			texture = name.."_axe_box",
			velocity = AXE_VEL,
			mass = AXE_MASS,
			kfr = AXE_KFR,
			damage_coefficient = AXE_BASE_DC * damage,
			drop = true,
			fly_sound = {
				sound = "lottthrowing_sound",
				sound_distance = 5,
			},
		},
		craftitem = {
			description = description,
			inventory_image = inventory_image,
		},

	})
	if not craft2 then
		minetest.register_craft({
			output = name.." 4",
			recipe = {
				{craft1, "group:stick"},
				{craft1, "group:stick"},
				{"", "group:stick"},
			}
		})
	else
		minetest.register_craft({
		output = name.." 4",
			recipe = {
				{craft2, "group:stick"},
				{craft1, "group:stick"},
				{"", "group:stick"},
			}
		})
	end
end

lottthrowing_register_axe("dwarf", "Dwarvern", 1.2, "lottores:mithril_ingot", "default:steel_ingot")
lottthrowing_register_axe("elf", "Elven", 1.0, "lottores:galvorn_ingot", "default:steel_ingot")
lottthrowing_register_axe("steel", "Steel", 0.5, "default:steel_ingot")
lottthrowing_register_axe("galvorn", "Galvorn", 0.7, "lottores:galvorn_ingot")
