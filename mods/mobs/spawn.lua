-- Spawning parameters
-- name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height, day_toggle

-- SPIDERS
mobs:spawn_specific("mobs:tarantula", {"lottmapgen:mirkwood_grass", "default:jungletree"}, {"air"}, 0, 14, 120, 5000, 1, -31000, 31000)

mobs:spawn_specific("mobs:bee", {"group:flower"}, {"air"}, 10, 20, 30, 5000, 1, 0, 1000)
mobs:spawn_specific("mobs:kraken", {"default:water_source"}, {"default:water_source"}, 0, 20, 400, 5000, 1, -31000, 0)
