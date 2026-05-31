#> worldgen-void:load
#@within tag/function load

fill -8 -61 -8 24 -61 24 black_stained_glass strict
setblock 8 -61 8 bedrock strict

gamerule advance_time false
gamerule advance_weather false
gamerule max_block_modifications 2147483647
gamerule max_command_forks 2147483647
gamerule max_command_sequence_length 16777216
gamerule raids false
gamerule respawn_radius 0
gamerule spawn_patrols false
gamerule spawn_phantoms false
gamerule spawn_wandering_traders false

teleport @a ~ -60 ~

datapack disable "file/worldgen-void"
datapack disable "file/worldgen-void.zip"
