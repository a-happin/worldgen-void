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

datapack disable "file/worldgen-void"
datapack disable "file/worldgen-void.zip"
