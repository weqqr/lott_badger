local SL = minetest.get_translator("lottores")

stairs.register_stair_and_slab("tilkal", "lottores:tilkal",
{forbidden=1},
{"lottores_tilkal.png"},
SL("Tilkal Stair"),
SL("Tilkal Slab"),
default.node_sound_metal_defaults())

stairs.register_stair_and_slab("limestone", "lottores:limestone",
{cracky=3, stone=2},
{"lottores_limestone_ore.png"},
SL("Limestone Stair"),
SL("Limestone Slab"),
default.node_sound_stone_defaults())

stairs.register_stair_and_slab("marble", "lottores:marble",
{cracky=3},
{"lottores_marble.png"},
SL("Marble Stair"),
SL("Marble Slab"),
default.node_sound_stone_defaults())

stairs.register_stair_and_slab("silver_block", "lottores:silver_block",
{cracky=1,level=2},
{"lottores_silver_block.png"},
SL("Silver Stair"),
SL("Silver Slab"),
default.node_sound_metal_defaults())

stairs.register_stair_and_slab("tin_block", "lottores:tin_block",
{cracky=1},
{"lottores_tin_block.png"},
SL("Tin Stair"),
SL("Tin Slab"),
default.node_sound_metal_defaults())

stairs.register_stair_and_slab("lead_block", "lottores:lead_block",
{cracky=1},
{"lottores_lead_block.png"},
SL("Lead Stair"),
SL("Lead Slab"),
default.node_sound_metal_defaults())

stairs.register_stair_and_slab("mithril_block", "lottores:mithril_block",
{cracky=1,level=2},
{"lottores_mithril_block.png"},
SL("Mithril Stair"),
SL("Mithril Slab"),
default.node_sound_metal_defaults())

stairs.register_stair_and_slab("galvorn_block", "lottores:galvorn_block",
{cracky=1,level=2,forbidden=1},
{"lottores_galvorn_block.png"},
SL("Galvorn Stair"),
SL("Galvorn Slab"),
default.node_sound_metal_defaults())

stairs.register_stair_and_slab("pearl", "lottores:pearl_block",
		{cracky=3,oddly_breakable_by_hand=3},
		{"lottores_pearl_block.png"},
		SL("Pearl Stair"),
		SL("Pearl Slab"),
		default.node_sound_glass_defaults())

stairs.register_stair_and_slab("salt", "lottores:salt_block",
		{cracky=3,oddly_breakable_by_hand=3},
		{"lottores_salt_block.png"},
		SL("Salt Stair"),
		SL("Salt Slab"),
		default.node_sound_stone_defaults())
