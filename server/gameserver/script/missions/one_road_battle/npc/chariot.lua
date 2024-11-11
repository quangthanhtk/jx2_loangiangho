Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")

function OnDeath(nNpcIndx, nSubWorldIndex, nKiller)
	print(nNpcIndx, nSubWorldIndex, nKiller)
	local szNpcName = GetNpcName(nNpcIndx);
	SubWorld = nSubWorldIndex;
	local szKillCamp = GetNpcCamp(nKiller);
	print(nNpcIndx, nSubWorldIndex, nKiller);
	SendScript2VM(thisFile, format("on_chariot_death(%d, %d, %d)", nNpcIndx, nSubWorldIndex, nKiller));
end

function OnRemove(nNpcIndx)
	local szNpcName = GetNpcName(nNpcIndx);
	if szNpcName ~= CHARIOT_DEAD_NPC[2] then
		return 0;
	end
	local nMap = GetNpcWorldPos(nNpcIndx);
	SubWorld = SubWorldID2Idx(nMap);
	SendScript2VM(thisFile, "create_chariot()");
end

function main()
end