local SL = minetest.get_translator("tools")

tools.pick = {
	get_recipes = function(source)
		return {{
			{source, source, source},
			{'', 'group:stick', ''},
			{'', 'group:stick', ''},
		}}
	end,
	wood = {
		description = SL("Wooden Pickaxe"),
		full_punch_interval = 1.2,
		max_drop_level = 0,
		cracky = {
			times={[3]=1.60},
			uses=10,
			maxlevel=1
		},
		damage_groups = {fleshy=2},
		groups = {wooden = 1, pickaxe = 1, flammable = 2},
	},
	stone = {
		description = SL("Stone Pickaxe"),
		full_punch_interval = 1.3,
		max_drop_level = 0,
		cracky = {
			times={[2]=2.0, [3]=1.20},
			uses=20,
			maxlevel=1
		},
		damage_groups = {fleshy = 3},
		groups = {pickaxe = 1},
	},
	steel = {
		description = SL("Steel Pickaxe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		cracky = {
			times={[1]=4.00, [2]=1.60, [3]=0.80},
			uses=20,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {steel_item = 1, pickaxe = 1},
	},
	bronze = {
		description = SL("Bronze Pickaxe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		cracky = {
			times={[1]=4.00, [2]=1.60, [3]=0.80},
			uses=30,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {bronze_item = 1, pickaxe = 1},
	},
	copper = {
		description = SL("Copper Pickaxe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		cracky = {
			times={[1]=4.00, [2]=1.60, [3]=0.80},
			uses=20,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {copper_item = 1, pickaxe = 1},
	},
	tin = {
		description = SL("Tin Pickaxe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		cracky = {
			times={[1]=4.00, [2]=1.60, [3]=0.80},
			uses=25,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {tin_item = 1, pickaxe = 1},
	},
	silver = {
		description = SL("Silver Pickaxe"),
		full_punch_interval = 1.0,
		max_drop_level = 2,
		cracky = {
			times={[1]=3.00, [2]=1.40, [3]=0.70},
			uses=20,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {silver_item = 1, pickaxe = 1},
	},
	gold = {
		description = SL("Gold Pickaxe"),
		full_punch_interval = 1.0,
		max_drop_level = 2,
		cracky = {
			times={[1]=3.00, [2]=1.40, [3]=0.70},
			uses=30,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {gold_item = 1, pickaxe = 1},
	},
	galvorn = {
		description = SL("Galvorn Pickaxe"),
		full_punch_interval = 0.9,
		max_drop_level = 3,
		cracky = {
			times={[1]=2.4, [2]=1.2, [3]=0.60},
			uses=30,
			maxlevel=3
		},
		damage_groups = {fleshy=5},
		groups = {forbidden = 1, galvorn_item = 1, pickaxe = 1},
	},
	mithril = {
		description = SL("Mithril Pickaxe"),
		full_punch_interval = 0.8,
		max_drop_level = 3,
		cracky = {
			times={[1]=1.5, [2]=0.8, [3]=0.40},
			uses=60,
			maxlevel=3
		},
		damage_groups = {fleshy=5},
		groups = {mithril_item = 1, pickaxe = 1},
	}
}
