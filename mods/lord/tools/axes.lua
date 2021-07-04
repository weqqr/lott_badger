local SL = minetest.get_translator("tools")

tools.axe = {
	get_recipes = function(source)
		return {{
				{source, source},
				{source, 'group:stick'},
				{'', 'group:stick'},
			},
			{
				{source, source},
				{'group:stick', source},
				{'group:stick', ''},
			}
		}
	end,
	wood = {
		description = SL("Wooden Axe"),
		full_punch_interval = 1.0,
		max_drop_level = 0,
		choppy = {
			times = {[3]=2.00},
			uses = 10,
			maxlevel = 1
		},
		damage_groups = {fleshy=2},
		groups = {wooden = 1, axe = 1, flammable = 2},
	},
	stone = {
		description = SL("Stone Axe"),
		full_punch_interval = 1.2,
		max_drop_level = 0,
		choppy = {
			times={[2]=2.00, [3]=1.50},
			uses=20,
			maxlevel=1
		},
		damage_groups = {fleshy=3},
		groups = {axe = 1},
	},
	steel = {
		description = SL("Steel Axe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		choppy = {
			times={[1]=2.50, [2]=1.40, [3]=1.00},
			uses=20,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {steel_item = 1, axe = 1},
	},
	bronze = {
		description = SL("Bronze Axe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		choppy = {
			times={[1]=2.50,
			[2]=1.40, [3]=1.00},
			uses=30, maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {bronze_item = 1, axe = 1},
	},
	copper = {
		description = SL("Copper Axe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		choppy = {
			times={[1]=2.50, [2]=1.40, [3]=1.00},
			uses=20,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {copper_item = 1, axe = 1},
	},
	tin = {
		description = SL("Tin Axe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		choppy = {
			times={[1]=2.50, [2]=1.40, [3]=1.00},
			uses=25,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {tin_item = 1, axe = 1},
	},
	silver = {
		description = SL("Silver Axe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		choppy = {
			times={[1]=2.30, [2]=1.20, [3]=0.80},
			uses=20,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {silver_item = 1, axe = 1},
	},
	gold = {
		description = SL("Gold Axe"),
		full_punch_interval = 1.0,
		max_drop_level = 1,
		choppy = {
			times={[1]=2.30, [2]=1.20, [3]=0.80},
			uses=30,
			maxlevel=2
		},
		damage_groups = {fleshy=4},
		groups = {gold_item = 1, axe = 1},
	},
	galvorn = {
		description = SL("Galvorn Axe"),
		full_punch_interval = 0.9,
		max_drop_level = 1,
		choppy = {
			times={[1]=2.20, [2]=1.00, [3]=0.60},
			uses=30,
			maxlevel=3
		},
		damage_groups = {forbidden=1, fleshy=6},
		groups = {galvorn_item = 1, axe = 1},
	},
	mithril = {
		description = SL("Mithril Axe"),
		full_punch_interval = 0.8,
		max_drop_level = 1,
		choppy = {
			times={[1]=1.80, [2]=0.60, [3]=0.30},
			uses=60,
			maxlevel=2
		},
		damage_groups = {fleshy=7},
		groups = {mithril_item = 1, axe = 1},
	}
}
