execute as @a at @s run scoreboard players set @s vp.llamaCaravan 0
execute as @a at @s if entity @e[type=llama,nbt={Leash:{}}] run execute at @e[type=minecraft:llama,distance=..10] run scoreboard players add @s vp.llamaCaravan 1