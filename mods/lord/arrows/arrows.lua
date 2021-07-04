
local SL = minetest.get_translator("arrows")

local KFR = 0.0002

local STEEL_DC = 0.1
local MITHRIL_DC = 0.4

local STEEL_ARROW_MASS = 0.03
local MITHRIL_ARROW_MASS = 0.025
local ARROW_VELOCITY = 50

local STEEL_BOLT_MASS = 0.1
local MITHRIL_BOLT_MASS = 0.03
local BOLT_VELOCITY = 60

-- Arrow nodebox
local arrow_node_box = {
	type = "fixed",
	fixed = {
		-- Shaft
		{-6.5/17, -1.5/17, -1.5/17, 6.5/17, 1.5/17, 1.5/17},
		-- Spitze
		{-4.5/17, 2.5/17, 2.5/17, -3.5/17, -2.5/17, -2.5/17},
		{-8.5/17, 0.5/17, 0.5/17, -6.5/17, -0.5/17, -0.5/17},
		-- Federn
		{6.5/17, 1.5/17, 1.5/17, 7.5/17, 2.5/17, 2.5/17},
		{7.5/17, -2.5/17, 2.5/17, 6.5/17, -1.5/17, 1.5/17},
		{7.5/17, 2.5/17, -2.5/17, 6.5/17, 1.5/17, -1.5/17},
		{6.5/17, -1.5/17, -1.5/17, 7.5/17, -2.5/17, -2.5/17},

		{7.5/17, 2.5/17, 2.5/17, 8.5/17, 3.5/17, 3.5/17},
		{8.5/17, -3.5/17, 3.5/17, 7.5/17, -2.5/17, 2.5/17},
		{8.5/17, 3.5/17, -3.5/17, 7.5/17, 2.5/17, -2.5/17},
		{7.5/17, -2.5/17, -2.5/17, 8.5/17, -3.5/17, -3.5/17},
	}
}

local register_arrow = function(material, material_group, dc, mass)
	local name = "arrows:arrow_"..material
	minetest.register_craftitem(name, {
		description = SL(material.." arrow"),
		inventory_image = "lottthrowing_arrow_"..material..".png",
	})

	minetest.register_craft({
		output = name..' 16',
		recipe = {
			{'default:stick', 'default:stick', material_group..':'..material..'_ingot'},
		}
	})

	minetest.register_node(name.."_box", {
		drawtype = "nodebox",
		node_box = arrow_node_box,
		tiles = {
			"lottthrowing_arrow_"..material..".png",
			"lottthrowing_arrow_"..material..".png",
			"lottthrowing_arrow_"..material.."_back.png",
			"lottthrowing_arrow_"..material.."_front.png",
			"lottthrowing_arrow_"..material.."_2.png",
			"lottthrowing_arrow_"..material..".png"
		},
		groups = {not_in_creative_inventory=1},
	})

	arrows:register_arrow(name, {
		texture = name.."_box",
		visual = "wielditem",
		arrow_type = "arrow",
		mass = mass,
		kfr = KFR,
		damage_coefficient = dc,
		velocity = ARROW_VELOCITY,
		fly_sound = {
			sound = "lottthrowing_sound",
			sound_distance = 5,
		},
	})
end

register_arrow("steel", "default", STEEL_DC, STEEL_ARROW_MASS)
register_arrow("mithril", "lottores", MITHRIL_DC, MITHRIL_ARROW_MASS)

-- Bolt nodebox --
local bolt_node_box = {
	type = "fixed",
	fixed = {
		-- Shaft
		{-6.5/17, -1.5/17, -1.5/17, 6.5/17, 1.5/17, 1.5/17},
		--Spitze
		{-4.5/17, 2.5/17, 2.5/17, -3.5/17, -2.5/17, -2.5/17},
		{-8.5/17, 0.5/17, 0.5/17, -6.5/17, -0.5/17, -0.5/17},
		--Federn
		{6.5/17, 1.5/17, 1.5/17, 7.5/17, 2.5/17, 2.5/17},
		{7.5/17, -2.5/17, 2.5/17, 6.5/17, -1.5/17, 1.5/17},
		{7.5/17, 2.5/17, -2.5/17, 6.5/17, 1.5/17, -1.5/17},
		{6.5/17, -1.5/17, -1.5/17, 7.5/17, -2.5/17, -2.5/17},

		{7.5/17, 2.5/17, 2.5/17, 8.5/17, 3.5/17, 3.5/17},
		{8.5/17, -3.5/17, 3.5/17, 7.5/17, -2.5/17, 2.5/17},
		{8.5/17, 3.5/17, -3.5/17, 7.5/17, 2.5/17, -2.5/17},
		{7.5/17, -2.5/17, -2.5/17, 8.5/17, -3.5/17, -3.5/17},
	}
}

local register_bolt = function(material, material_group, dc, mass)
	local name = "arrows:bolt_"..material
	minetest.register_craftitem(name, {
		description = SL(material.." bolt"),
		inventory_image = "lottthrowing_bolt_"..material..".png",
	})

	minetest.register_craft({
		output = name..' 16',
		recipe = {
			{'default:steel_ingot', material_group..':'..material..'_ingot'},
		}
	})

	minetest.register_node(name.."_box", {
		drawtype = "nodebox",
		node_box = bolt_node_box,
		tiles = {
			"lottthrowing_bolt_"..material..".png",
			"lottthrowing_bolt_"..material..".png",
			"lottthrowing_bolt_"..material.."_back.png",
			"lottthrowing_bolt_"..material.."_front.png",
			"lottthrowing_bolt_"..material.."_2.png",
			"lottthrowing_bolt_"..material..".png"
		},
		groups = {not_in_creative_inventory=1},
	})

	arrows:register_arrow(name, {
		texture = name.."_box",
		visual = "wielditem",
		arrow_type = "bolt",
		mass = mass,
		kfr = KFR,
		damage_coefficient = dc,
		velocity = BOLT_VELOCITY,
		fly_sound = {
			sound = "lottthrowing_sound",
			sound_distance = 5,
		},
	})
end

register_bolt("steel", "default", STEEL_DC, STEEL_BOLT_MASS)
register_bolt("mithril", "lottores", MITHRIL_DC, MITHRIL_BOLT_MASS)

