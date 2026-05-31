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

datapack disable "file/worldgen-void_1.18.2-1.19.4"
datapack disable "file/worldgen-void_1.18.2-1.19.4.zip"
