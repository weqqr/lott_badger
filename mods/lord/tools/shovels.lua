local SL = minetest.get_translator("tools")

tools.shovel = {
	get_recipes = function(source)
		return {{
			{source},
			{'group:stick'},
			{'group:stick'},
		}}
	end,
	wood = {
		description = SL("Wooden Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.2,
		max_drop_level = 0,
		crumbly = {
			times={[1]=3.00, [2]=1.60, [3]=0.60},
			uses=10,
			maxlevel=1
		},
		damage_groups = {fleshy=2},
		groups = {wooden = 1, shovel = 1, flammable = 2},
	},
	stone = {
		description = SL("Stone Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.4,
		max_drop_level = 0,
		crumbly = {
			times={[1]=1.80, [2]=1.20, [3]=0.50},
			uses=20,
			maxlevel=1
		},
		damage_groups = {fleshy=2},
		groups = {shovel = 1},
	},
	steel = {
		description = SL("Steel Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.1,
		max_drop_level = 1,
		crumbly = {
			times={[1]=1.50, [2]=0.90, [3]=0.40},
			uses=30, maxlevel=2
		},
		damage_groups = {fleshy=3},
		groups = {steel_item = 1, shovel = 1},
	},
	bronze = {
		description = SL("Bronze Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.1,
		max_drop_level = 1,
		crumbly = {
			times={[1]=1.50, [2]=0.90, [3]=0.40},
			uses=40,
			maxlevel=2
		},
		damage_groups = {fleshy=3},
		groups = {bronze_item = 1, shovel = 1},
	},
	copper = {
		description = SL("Copper Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.1,
		max_drop_level = 1,
		crumbly = {
			times={[1]=1.50, [2]=0.90, [3]=0.40},
			uses=30,
			maxlevel=2
		},
		damage_groups = {fleshy=3},
		groups = {copper_item = 1, shovel = 1},
	},
	tin = {
		description = SL("Tin Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.1,
		max_drop_level = 1,
		crumbly = {
			times={[1]=1.50, [2]=0.90, [3]=0.40},
			uses=35,
			maxlevel=2
		},
		damage_groups = {fleshy=3},
		groups = {tin_item = 1, shovel = 1},
	},
	silver = {
		description = SL("Silver Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.1,
		max_drop_level = 1,
		crumbly = {
			times={[1]=1.30, [2]=0.70, [3]=0.35},
			uses=30,
			maxlevel=2
		},
		damage_groups = {fleshy=3},
		groups = {silver_item = 1, shovel = 1},
	},
	gold = {
		description = SL("Gold Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.1,
		max_drop_level = 1,
		crumbly = {
			times={[1]=1.30, [2]=0.70, [3]=0.35},
			uses=40,
			maxlevel=2
		},
		damage_groups = {fleshy=3},
		groups = {gold_item = 1, shovel = 1},
	},
	galvorn = {
		description = SL("Galvorn Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 1.0,
		max_drop_level = 3,
		crumbly = {
			times={[1]=1.20, [2]=0.60, [3]=0.30},
			uses=30,
			maxlevel=3
		},
		damage_groups = {fleshy=4},
		groups = {forbidden=1, galvorn_item = 1, shovel = 1},
	},
	mithril = {
		description = SL("Mithril Shovel"),
		wield_image_transform = "^[transformR90",
		full_punch_interval = 0.9,
		max_drop_level = 3,
		crumbly = {
			times={[1]=0.90, [2]=0.40, [3]=0.20},
			uses=60,
			maxlevel=3
		},
		damage_groups = {fleshy=4},
		groups = {mithril_item = 1, shovel = 1},
	}
}
