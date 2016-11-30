local SL = lord.require_intllib()

local get_formspec = function(player,page)
	if page=="brews" then
		return "size[8,5.5]"
               .."background[5,5;1,1;craft_formbg.png;true]"
               .."label[0,0;"..SL("Book of Brewing").."]"
               .."button_exit[6,0;2,0.5;quit;"..SL("Exit").."]"
               .."image_button[7,1;1,1;zcg_next.png;brews2;;false;false;zcg_next_press.png]"
               .."image[6,1;1,1;zcg_previous_inactive.png]"
               --First
               .."label[1,2.2; "..SL("Wine").."]"
               .."item_image_button[4,2;1,1;lottpotion:drinking_glass_water;zcg:vessels:glass_water;]"
               .."item_image_button[5,2;1,1;lottfarming:berries;zcg:berries;5]"
               .."image[6,2;1,1;zcg_craft_arrow.png]"
               .."item_image_button[7,2;1,1;lottpotion:wine;zcg:wine;]"
               --Second
               .."label[1,3.2; "..SL("Beer").."]"
               .."item_image_button[4,3;1,1;lottpotion:drinking_glass_water;zcg:drinking_glass_water;]"
               .."item_image_button[5,3;1,1;farming:wheat;zcg:wheat;3]"
               .."image[6,3;1,1;zcg_craft_arrow.png]"
               .."item_image_button[7,3;1,1;lottpotion:beer;zcg:beer;]"
               --Third
               .."label[1,4.2; "..SL("Mead").."]"
               .."item_image_button[4,4;1,1;lottpotion:drinking_glass_water;zcg:drinking_glass_water;]"
               .."item_image_button[5,4;1,1;bees:bottle_honey;zcg:honey;6]"
               .."image[6,4;1,1;zcg_craft_arrow.png]"
               .."item_image_button[7,4;1,1;lottpotion:mead;zcg:mead;]"
     end
     if page=="brews2" then
		return "size[8,5.5]"
               .."background[5,5;1,1;craft_formbg.png;true]"
               .."label[0,0;"..SL("Book of Brewing").."]"
               .."button_exit[6,0;2,0.5;quit;"..SL("Exit").."]"
               .."image[7,1;1,1;zcg_next_inactive.png]"
               .."image_button[6,1;1,1;zcg_previous.png;brews;;false;false;zcg_previous_press.png]"
               --First
               .."label[1,2.2; "..SL("Cider").."]"
               .."item_image_button[4,2;1,1;lottpotion:drinking_glass_water;zcg:drinking_glass_water;]"
               .."item_image_button[5,2;1,1;default:apple;zcg:apple; 5]"
               .."image[6,2;1,1;zcg_craft_arrow.png]"
               .."item_image_button[7,2;1,1;lottpotion:cider;zcg:cider;]"
               --Second
               .."label[1,3.2; "..SL("Ale").."]"
               .."item_image_button[4,3;1,1;lottpotion:drinking_glass_water;zcg:drinking_glass_water;]"
               .."item_image_button[5,3;1,1;lottfarming:barley;zcg:barley;6]"
               .."image[6,3;1,1;zcg_craft_arrow.png]"
               .."item_image_button[7,3;1,1;lottpotion:ale;zcg:ale;]"
               --Third
               --.."label[1,3.2; Name (Method:Method)]"
               --.."item_image_button[4,3;1,1;modname:itemname;zcg:itemname;]"
               --.."item_image_button[5,3;1,1;modname:itemname;zcg:itemname;number]"
               --.."image[6,3;1,1;zcg_craft_arrow.png]"
               --.."item_image_button[7,3;1,1;modname:output;zcg:output;]"
	end
end

minetest.register_on_player_receive_fields(function(player,formname,fields)
	if fields.brews then
	     inventory_plus.set_inventory_formspec(player, get_formspec(player,"brews"))
	end
     if fields.brews2 then
	     inventory_plus.set_inventory_formspec(player, get_formspec(player,"brews2"))
	end
end)

minetest.register_tool("lottinventory:brewing_book",{
    description = SL("Book of Brewing"),
    inventory_image = "lottinventory_brewing_book.png",
    wield_image = "",
    wield_scale = {x=1,y=1,z=1},
    stack_max = 1,
    groups = {cook_crafts=1, book=1, paper=1},
    tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level=0,
        groupcaps={
            fleshy={times={[2]=0.80, [3]=0.40}, uses=20, maxlevel=1},
            snappy={times={[2]=0.80, [3]=0.40}, uses=20, maxlevel=1},
            choppy={times={[3]=0.90}, uses=20, maxlevel=0}
        }
    },
    on_use = function(itemstack, player, pointed_thing)
          inventory_plus.set_inventory_formspec(player, get_formspec(player,"brews"))
          return itemstack; -- nothing consumed, nothing changed
    end,
})
