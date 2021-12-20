# teleport target passenger to target vehicle
execute as @e[tag=vp.targetPsgr] at @s run tp @s @e[type=horse,limit=1,distance=..3,sort=nearest]
execute as @e[tag=vp.targetPsgr] at @s run tag @e[type=horse,limit=1,distance=..1] add vp.targetVhcl
# summon jockey
execute as @e[type=husk,tag=vp.targetPsgr] at @s run summon horse ~ ~ ~ {Tags:["vp.jockeyVhcl"],Passengers:[{id:"minecraft:husk",IsBaby:1b,Tags:["vp.jockeyPsgr"]}]}
execute as @e[type=zombie,tag=vp.targetPsgr] at @s run summon horse ~ ~ ~ {Tags:["vp.jockeyVhcl"],Passengers:[{id:"minecraft:zombie",IsBaby:1b,Tags:["vp.jockeyPsgr"]}]}
execute as @e[type=zombie_villager,tag=vp.targetPsgr] at @s run summon horse ~ ~ ~ {Tags:["vp.jockeyVhcl"],Passengers:[{id:"minecraft:zombie_villager",IsBaby:1b,Tags:["vp.jockeyPsgr"]}]}

# transfer data from 'target' to jockey'
execute as @e[tag=vp.jockeyPsgr] at @s run data modify entity @s ArmorItems set from entity @e[tag=vp.targetPsgr,limit=1,sort=nearest] ArmorItems
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s ArmorItems set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] ArmorItems
execute as @e[tag=vp.jockeyPsgr] at @s run data modify entity @s HandItems set from entity @e[tag=vp.targetPsgr,limit=1,sort=nearest] HandItems
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s Age set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] Age
execute as @e[tag=vp.jockeyPsgr] at @s run data modify entity @s VillagerData set from entity @e[tag=vp.targetPsgr,limit=1,sort=nearest] VillagerData
execute as @e[tag=vp.jockeyPsgr] at @s run data modify entity @s Rotation set from entity @e[tag=vp.targetPsgr,limit=1,sort=nearest] Rotation
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s Rotation set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] Rotation
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s Attributes[1] set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] Attributes[0]
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s Attributes[2] set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] Attributes[1]
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s Attributes[4] set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] Attributes[4]
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s Variant set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] Variant
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s SaddleItem set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] SaddleItem
execute as @e[tag=vp.jockeyVhcl] at @s run data modify entity @s Tame set from entity @e[tag=vp.targetVhcl,limit=1,sort=nearest] Tame

# send them to the shadow realm
execute positioned as @e[tag=vp.jockeyPsgr] run execute in minecraft:the_end run tp @e[tag=vp.targetPsgr,limit=1,sort=nearest] 0 -124 0
execute positioned as @e[tag=vp.jockeyVhcl] run execute in minecraft:the_end run tp @e[tag=vp.targetVhcl,limit=1,sort=nearest] 0 -124 0
