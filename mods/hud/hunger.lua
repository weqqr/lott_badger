-- Keep these for backwards compatibility
function hud.save_hunger(player)
	hud.set_hunger(player)
end
function hud.load_hunger(player)
	hud.get_hunger(player)
end

-- Poison player
local function poisenp(tick, poisen, time_left, player)
	local time_full = math.abs(poisen)
	time_left = time_left + tick
	if time_left < time_full then
		minetest.after(tick, poisenp, tick, poisen, time_left, player)
	end
	if (player:get_hp()+1 < 20)and(poisen > 0) then
		player:set_hp(player:get_hp() + 1)
	elseif (player:get_hp()-1 > 0)and(poisen < 0) then
		player:set_hp(player:get_hp() - 1)
	end

end

function hud.item_eat(hunger_change, replace_with_item, poisen)
	return function(itemstack, user, pointed_thing)
		if itemstack:take_item() ~= nil and user ~= nil then
			local name = user:get_player_name()
			local h = tonumber(hud.hunger[name])
			h=h+hunger_change
			if h>30 then h=30 end
			hud.hunger[name]=h
			hud.set_hunger(user)
			local inv = user:get_inventory()
			if inv:room_for_item("main", replace_with_item) then
				inv:add_item("main", replace_with_item)
			else
				minetest.item_drop(ItemStack(replace_with_item), user, user:getpos())
			end
			--sound:eat
			if poisen then
				poisenp(1.0, poisen, 0, user)
			end
		end
		return itemstack
	end
end

local function overwrite(name, hunger_change, replace_with_item, poisen)
	local tab = minetest.registered_items[name]
	if tab == nil then return end
	tab.on_use = hud.item_eat(hunger_change, replace_with_item, poisen)
	minetest.registered_items[name] = tab
end

overwrite("bees:bottle_honey", 2, "vessels:glass_bottle", 3)

overwrite("default:apple", 1)

overwrite("farming:bread", 8)

if minetest.get_modpath("lottfarming") ~= nil then
	overwrite("lottfarming:berries", 1)
	overwrite("lottfarming:blue_mushroom", 1, "", -2)
	overwrite("lottfarming:brown_mushroom", 1)
	overwrite("lottfarming:cabbage", 2)
	overwrite("lottfarming:carrot_item", 2)
	overwrite("lottfarming:cookie_cracker", 2)
	overwrite("lottfarming:ear_of_corn", 2)
	overwrite("lottfarming:green_mushroom", 1, "", -2)
	overwrite("lottfarming:melon", 1)
	overwrite("lottfarming:mushroom_soup", 6, "lottfarming:bowl")
	overwrite("lottfarming:potato", 1)
	overwrite("lottfarming:potato_cooked", 5)
	overwrite("lottfarming:red_mushroom", -8, "", -8)
	overwrite("lottfarming:salad", 4, "lottfarming:bowl")
	overwrite("lottfarming:tomato_soup", 5, "lottfarming:bowl")
	overwrite("lottfarming:tomatoes", 1)
	overwrite("lottfarming:tomatoes_cooked", 3)
	overwrite("lottfarming:turnips", 1)
	overwrite("lottfarming:turnips_cooked", 2)
end

if minetest.get_modpath("lottmobs") ~= nil then
	overwrite("lottmobs:chicken_cooked", 7)
	overwrite("lottmobs:chicken_raw", 1, "", -4)
	overwrite("lottmobs:fish_cooked", 4)
	overwrite("lottmobs:fish_raw", 1, "", -2)
	overwrite("lottmobs:fried_egg", 3)
	overwrite("lottmobs:horsemeat_cooked", 9)
	overwrite("lottmobs:horsemeat_raw", 2, "", -3)
	overwrite("lottmobs:meat", 5)
	overwrite("lottmobs:meat_raw", 1, "", -4)
	overwrite("lottmobs:pork_cooked", 10)
	overwrite("lottmobs:pork_raw", 2, "", -4)
	overwrite("lottmobs:rabbit_cooked", 4)
	overwrite("lottmobs:rabbit_raw", 1, "", -4)
	overwrite("lottmobs:rotten_meat", -6, "", -6)
end

if minetest.get_modpath("lottores") ~= nil then
	overwrite("lottores:salt", 0, "", -2)
	overwrite("lottores:salt_block", 0, "", -24)
end

if minetest.get_modpath("lottplants") ~= nil then
	overwrite("lottplants:honey", 2)
	overwrite("lottplants:plum", 1)
	overwrite("lottplants:yavannamirefruit", 9, "", 4)
end

if minetest.get_modpath("lottpotion") ~= nil then
	overwrite("lottpotion:ale", 1, "vessels:drinking_glass", 4)
	overwrite("lottpotion:beer", 2, "vessels:drinking_glass", 2)
	overwrite("lottpotion:cider", 2, "vessels:drinking_glass", 2)
	overwrite("lottpotion:mead", 3, "vessels:drinking_glass", 4)
	overwrite("lottpotion:wine", 2, "vessels:drinking_glass", 5)
end
