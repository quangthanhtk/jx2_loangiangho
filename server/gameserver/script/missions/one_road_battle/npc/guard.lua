Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")

function OnDeath(nNpcIndx, nSubWorldIndex, nKiller)
	SendScript2VM(thisFile, format("add_activity(%d)", ACTIVITY_RANDOM_BOSS));
end