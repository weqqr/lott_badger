local SL = minetest.get_translator("lord_money")

local shop = {}
shop.current_shop = {}
shop.formspec = {
	customer = function(pos)
		local list_name = "nodemeta:"..pos.x..","..pos.y..","..pos.z
		local formspec = "size[8,9]"..
		"background[-0.5,-0.65;9,10.35;gui_chestbg.png]"..
		"listcolors[#606060AA;#888;#141318;#30434C;#FFF]"..

		"label[0,-0.35;"..SL("Owner gives").."]"..
		"list["..list_name..";owner_gives;0,0.1;2,2;]"..

		"label[0,1.95;"..SL("Owner wants").."]"..
		"list["..list_name..";owner_wants;0,2.4;2,2;]"..

		"label[3,-0.35;"..SL("Customer gives (pay here !)").."]"..
		"list[current_player;customer_gives;3,0.1;5,2;]"..

		"label[3,1.95;"..SL("Customer gets").."]"..
		"list[current_player;customer_gets;3,2.4;5,2;]"..

		"button[0,4.35;8,1;exchange;"..SL("Exchange").."]"..
		"list[current_player;main;0,5.3;8,4;]"..

		"listring[current_player;customer_gets]"..
		"listring[current_player;main]"..
		"listring[current_player;customer_gives]"..
		"listring[current_player;main]"

		return formspec
	end,
	owner = function(pos)
		local list_name = "nodemeta:"..pos.x..","..pos.y..","..pos.z
		local formspec = "size[8,9]"..
		"background[-0.5,-0.65;9,10.35;gui_chestbg.png]"..
		"listcolors[#606060AA;#888;#141318;#30434C;#FFF]"..

		"label[0,-0.35;"..SL("In exchange, you give:").."]"..
		"list["..list_name..";owner_gives;0,0.1;2,2;]"..

		"label[0,1.95;"..SL("You want:").."]"..
		"list["..list_name..";owner_wants;0,2.4;2,2;]"..

		"label[3,-0.35;"..SL("Your stock:").."]"..
		"list["..list_name..";stock;3,0.1;5,2;]"..

		"label[3,1.95;"..SL("Customers gave:").."]"..
		"list["..list_name..";customers_gave;3,2.4;5,2;]"..

		"label[0,4.35;"..SL("Owner, Use(E)+Place(RMB) for customer interface").."]"..
		"list[current_player;main;0,5.3;8,4;]"..

		"listring["..list_name..";owner_gives]"..
		"listring[current_player;main]"..
		"listring["..list_name..";stock]"..
		"listring[current_player;main]"..
		"listring["..list_name..";owner_wants]"..
		"listring[current_player;main]"..
		"listring["..list_name..";customers_gave]"..
		"listring[current_player;main]"

		return formspec
	end,
}

shop.player_has_access = function(player, shop_pos)
	local owner_name = minetest.get_meta(shop_pos):get_string("owner")
	local player_name = player:get_player_name()
	local is_admin = minetest.get_player_privs(player_name).server

	return player_name == owner_name or is_admin
end

minetest.register_node("lord_money:shop", {
	description = SL("Shop Chest"),
	tiles = {"shop_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_lock.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, wooden=1},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer, itemstack)
		local owner = placer:get_player_name()
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", SL("Exchange shop (owned by").." "..owner..")")
		meta:set_string("owner",owner)
		local inv = meta:get_inventory()
		inv:set_size("customers_gave", 5*2)
		inv:set_size("stock", 5*2)
		inv:set_size("owner_wants", 2*2)
		inv:set_size("owner_gives", 2*2)
	end,
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:get_inventory():set_size("customer_gives", 5*2)
		clicker:get_inventory():set_size("customer_gets", 5*2)
		local user_name = clicker:get_player_name()
		shop.current_shop[user_name] = pos
		if shop.player_has_access(clicker, pos) and not clicker:get_player_control().aux1 then
			minetest.show_formspec(user_name,"lord_money:shop_formspec",shop.formspec.owner(pos))
		else
			minetest.show_formspec(user_name,"lord_money:shop_formspec",shop.formspec.customer(pos))
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if shop.player_has_access(player, pos) then
			return count
		end
		return 0
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if shop.player_has_access(player, pos) then
			return stack:get_count()
		end
		return 0
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if shop.player_has_access(player, pos) then
			return stack:get_count()
		end
		return 0
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv  = meta:get_inventory()

		return inv:is_empty("stock") and
			inv:is_empty("customers_gave") and
			inv:is_empty("owner_wants") and
			inv:is_empty("owner_gives")
	end
})

minetest.register_craftitem("lord_money:license", {
	description = SL("License"),
	inventory_image = "shop_license.png",
	groups = {not_in_creative_inventory=1, book=1, paper=1},
})

minetest.register_craft({
	type = "shapeless",
	output = "lord_money:shop",
	recipe = {"lord_money:license", "default:chest_locked"}
})

minetest.register_on_player_receive_fields(function(sender, formname, fields)
	if formname == "lord_money:shop_formspec" then -- форма от магазина
		local name = sender:get_player_name() -- имя покупателя
		if fields.exchange then -- нажата кнопка "купить"
			local pos = shop.current_shop[name] -- расположение магазина
			local meta = minetest.get_meta(pos) -- метаданные магазина
			local mail = ""
			if minetest.get_modpath("mail_list") then -- если есть мод взаимодействия с e-mail
				mail = get_mail(meta:get_string("owner")) -- адрес владельца
			end
			local minv = meta:get_inventory() -- инвентари магазина
			local pinv = sender:get_inventory() -- инвентари покупателя
			local wants = minv:get_list("owner_wants") -- цена
			local gives = minv:get_list("owner_gives") -- товар
			if wants == nil or gives == nil then return end -- предохранитель
			local can_exchange = true -- ставим возможность обмена "да"
			-- ПРОВЕРКА НАЛИЧИЯ ТОВАРА НА СКЛАДЕ
			local temp = "temp_"..name
			local size = minv:get_size("owner_gives")
			minv:set_size(temp, size) -- делаем инвентарь-буфер;
			for _, stack in pairs(gives) do -- проверяем все стеки на продажу
				if minv:contains_item("stock", stack) then -- если такой можно достать со склада, перекидываем его из склада в буфер
					minv:remove_item("stock", stack)
					minv:add_item(temp, stack)
				else -- если же нет, переключаем возможность обмена и выходим из цикла
					can_exchange = false
					break
				end
			end
			for _, stack in pairs(minv:get_list(temp)) do -- возвращаем всё из буфера на склад
				minv:add_item("stock", stack)
			end
			minv:set_size(temp, 0) -- закрываем буфер
			if not can_exchange then -- если обмен не возможен, пишем отчёт "товара нет на складе" и выходим из функции.
				if mail ~= nil and mail ~= "" then
					local report = SL("In your store").." "..minetest.pos_to_string(pos).." "..SL("ended goods.")
					os.execute("echo '"..report.."' | mail -s 'store' "..mail)
				end
				minetest.log(
					"action",
					"магазин " .. minetest.pos_to_string(pos) ..
						" - игрок " .. name .. " пытался совершить обмен, но товара нет на складе"
				)
				minetest.chat_send_player(name, SL("Exchange can not be done, ended goods."))
				return
			end
			-- ПРОВЕРКА СООТВЕТСТВИЯ ОПЛАТЫ ЦЕНЕ
			size = minv:get_size("owner_wants")
			minv:set_size(temp, size) -- делаем инвентарь-буфер;
			for _, stack in pairs(wants) do -- проверяем все стеки цены
				-- если такой можно достать с оплаты, перекидываем его из оплаты в буфер
				if pinv:contains_item("customer_gives", stack) then
					pinv:remove_item("customer_gives", stack)
					minv:add_item(temp, stack)
				else -- если же нет, переключаем возможность обмена и выходим из цикла
					can_exchange = false
					break
				end
			end
			for _, stack in pairs(minv:get_list(temp)) do -- возвращаем всё из буфера в оплату
				pinv:add_item("customer_gives", stack)
			end
			minv:set_size(temp, 0) -- закрываем буфер
			-- если обмен не возможен, пишем отчёт "оплата не соответствует цене" и выходим из функции.
			if not can_exchange then
				minetest.log(
					"action",
					"магазин " .. minetest.pos_to_string(pos) ..
						" - игрок " .. name .. " пытался совершить обмен, но его оплата не соответствует цене"
				)
				minetest.chat_send_player(name, SL("Exchange can not be done, check if you put all items!"))
				return
			end
			-- ПРОВЕРКА НАЛИЧИЯ МЕСТА НА СКЛАДЕ
			size = minv:get_size("owner_wants")
			minv:set_size(temp, size) -- делаем инвентарь-буфер;
			for _, stack in pairs(wants) do -- проверяем все стеки цены
				-- если такой можно поместить на склад, добавляем его на склад и в буфер
				if minv:room_for_item("customers_gave", stack) then
					minv:add_item("customers_gave", stack)
					minv:add_item(temp, stack)
				else -- если же нет, переключаем возможность обмена и выходим из цикла
					can_exchange = false
					break
				end
			end
			for _, stack in pairs(minv:get_list(temp)) do -- убираем всё, что есть в буфере, из склада
				minv:remove_item("customers_gave", stack)
			end
			minv:set_size(temp, 0) -- закрываем буфер
			if not can_exchange then -- если обмен не возможен, пишем отчёт "нет места на складе" и выходим из функции.
				if mail ~= nil and mail ~= "" then
					local report = SL("In your store").." "..minetest.pos_to_string(pos).." "..SL("ended place.")
					os.execute("echo '"..report.."' | mail -s 'store' "..mail)
				end
				minetest.log(
					"action",
					"магазин " .. minetest.pos_to_string(pos) ..
						" - игрок " .. name .. " пытался совершить обмен, но на складе не оказалось места"
				)
				minetest.chat_send_player(name, SL("Exchange can not be done, ended place."))
				return
			end
			-- ПРОВЕРКА НАЛИЧИЯ МЕСТА У ПОКУПАТЕЛЯ
			size = minv:get_size("owner_wants")
			minv:set_size(temp, size) -- делаем инвентарь-буфер;
			for _, stack in pairs(gives) do -- проверяем все стеки на продажу
				-- если такой можно поместить к игроку, добавляем его на склад и к игроку
				if pinv:room_for_item("customer_gets", stack) then
					pinv:add_item("customer_gets", stack)
					minv:add_item(temp, stack)
				else -- если же нет, переключаем возможность обмена и выходим из цикла
					can_exchange = false
					break
				end
			end
			for _, stack in pairs(minv:get_list(temp)) do -- убираем всё, что есть в буфере, от игрока
				pinv:remove_item("customer_gets", stack)
			end
			minv:set_size(temp, 0) -- закрываем буфер
			if not can_exchange then -- если обмен не возможен, пишем отчёт "нет места у игрока" и выходим из функции.
				minetest.log(
					"action",
					"магазин " .. minetest.pos_to_string(pos) ..
						" - игрок " .. name .. " пытался совершить обмен, но у него не оказалось места"
				)
				minetest.chat_send_player(name, SL("Exchange can not be done, check if you have place!"))
				return
			end
			-- ВРОДЕ ВСЁ НОРМАЛЬНО, ПРОИЗВОДИМ ОБМЕН
			for _, stack in pairs(wants) do -- для всех стеков цены
				pinv:remove_item("customer_gives", stack) -- забираем у игрока
				minv:add_item("customers_gave", stack) -- помещаем на склад
			end
			for _, stack in pairs(gives) do -- для всех стеков на продажу
				minv:remove_item("stock", stack) -- забираем со склада
				pinv:add_item("customer_gets", stack) -- добавляем к игроку
			end
			-- пишем отчёт "всё в порядке" и выходим из функции.
			minetest.log("action", "магазин "..minetest.pos_to_string(pos).." - игрок "..name.." произвёл обмен - всё в порядке")
			minetest.chat_send_player(name, SL("Exchanged!"))
		elseif fields.quit then -- выход с формы
			local inv = sender:get_inventory()
			for i = 1, inv:get_size("customer_gives") do -- для всех стеков в customer_gives
				local stack = inv:get_stack("customer_gives", i)
				if inv:room_for_item("main", stack) then inv:add_item("main", stack) -- если помещается, кидаем в main,
				else minetest.item_drop(stack, sender, sender:get_pos()) -- если нет - кидаем на пол
				end
			end
			inv:set_size("customer_gives", 0) -- удаляем customer_gives
			for i = 1, inv:get_size("customer_gets") do -- для всех стеков в customer_gets
				local stack = inv:get_stack("customer_gets", i)
				if inv:room_for_item("main", stack) then inv:add_item("main", stack) -- если помещается, кидаем в main,
				else minetest.item_drop(stack, sender, sender:get_pos()) -- если нет - кидаем на пол
				end
			end
			inv:set_size("customer_gets", 0) -- удаляем customer_gets
		end
	end
end)
