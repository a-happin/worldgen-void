#> worldgen-void:load
#@within tag/function load

fill -8 -61 -8 24 -61 24 black_stained_glass
setblock 8 -61 8 bedrock

gamerule disableRaids true
gamerule doDaylightCycle false
gamerule doInsomnia false
gamerule doPatrolSpawning false
gamerule doTraderSpawning false
gamerule doWeatherCycle false
gamerule maxCommandChainLength 16777216
gamerule spawnRadius 0

gamerule commandModificationBlockLimit 2147483647
# execute in the_end run forceload add -90 -90 90 90
# execute in the_end run fill -90 48 -90 90 48 90 end_stone
# execute in the_end run forceload remove -90 -90 90 90

datapack disable "file/worldgen-void"
datapack disable "file/worldgen-void.zip"
