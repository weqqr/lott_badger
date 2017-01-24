local SL = lord.require_intllib()

-- money
minetest.register_craftitem("lord_money:diamond_coin", {
	description = SL("Diamond Coin"),
	inventory_image = "money_diamond_coin.png",
	groups = {not_in_creative_inventory=1},
	stack_max = 999,
})

minetest.register_craftitem("lord_money:gold_coin", {
	description = SL("Gold Coin"),
	inventory_image = "money_gold_coin.png",
	groups = {not_in_creative_inventory=1},
	stack_max = 999,
})

minetest.register_craftitem("lord_money:silver_coin", {
	description = SL("Silver Coin"),
	inventory_image = "money_silver_coin.png",
	groups = {not_in_creative_inventory=1},
	stack_max = 999,
})

minetest.register_craftitem("lord_money:copper_coin", {
	description = SL("Copper Coin"),
	inventory_image = "money_copper_coin.png",
	groups = {not_in_creative_inventory=1},
	stack_max = 999,
})
