# teleport the zombie to the host
tp @s @e[type=llama,limit=1,distance=..3,sort=nearest,tag=!vp.jockeyHost]
tag @e[type=llama,limit=1,distance=..3,sort=nearest,tag=!vp.jockeyHost] add vp.jockeyHost
# summon the jockey, depending on the zombie
execute if entity @s[type=zombie] run summon llama ~ ~ ~ {Tags:["vp.jockeyVehicle"],Passengers:[{id:"minecraft:zombie",IsBaby:1b,Tags:["vp.jockeyPassenger"]}]}
execute if entity @s[type=husk] run summon llama ~ ~ ~ {Tags:["vp.jockeyVehicle"],Passengers:[{id:"minecraft:husk",IsBaby:1b,Tags:["vp.jockeyPassenger"]}]}
execute if entity @s[type=zombie_villager] run summon llama ~ ~ ~ {Tags:["vp.jockeyVehicle"],Passengers:[{id:"minecraft:zombie_villager",IsBaby:1b,Tags:["vp.jockeyPassenger"]}]}

#> Transfer data from 'targets' to summoned'
# zombie passenger
execute as @e[tag=vp.jockeyPassenger] at @s run data modify entity @s ArmorItems set from entity @e[tag=vp.canBeJockey,limit=1,sort=nearest] ArmorItems
execute as @e[tag=vp.jockeyPassenger] at @s run data modify entity @s HandItems set from entity @e[tag=vp.canBeJockey,limit=1,sort=nearest] HandItems
execute as @e[tag=vp.jockeyPassenger] at @s run data modify entity @s Rotation set from entity @e[tag=vp.canBeJockey,limit=1,sort=nearest] Rotation
# zombie villager passenger
execute as @e[tag=vp.jockeyPassenger] at @s run data modify entity @s VillagerData set from entity @e[tag=vp.canBeJockey,limit=1,sort=nearest] VillagerData

# llama vehicle
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s Rotation set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] Rotation
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s Age set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] Age
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s Attributes[2] set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] Attributes[2]
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s Variant set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] Variant
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s Strength set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] Strength
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s ChestedHorse set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] ChestedHorse
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s DecorItem set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] DecorItem
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s Items set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] Items
execute as @e[tag=vp.jockeyVehicle] at @s run data modify entity @s Tame set from entity @e[tag=vp.jockeyHost,limit=1,sort=nearest] Tame


# send them to the shadow realm
execute positioned as @e[tag=vp.jockeyPassenger] in the_end run tp @e[tag=vp.canBeJockey,limit=1,sort=nearest] 0.5 -124.5 0.5
execute positioned as @e[tag=vp.jockeyVehicle] in the_end run tp @e[tag=vp.jockeyHost,limit=1,sort=nearest] 0.5 -124.5 0.5