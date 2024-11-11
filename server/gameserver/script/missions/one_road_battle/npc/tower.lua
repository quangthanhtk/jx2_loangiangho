Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\one_road_battle\\orb_honor.lua")

g_tTowerInfo = {
	[TOWER_NPC[1][2]] = 50,
	[TOWER_NPC[2][2]] = 100,
	[TOWER_NPC[3][2]] = 150,
}

function OnDeath(nNpcIndx, nSubWorldIndex, nKiller)
	local szNpcName = GetNpcName(nNpcIndx);
	SubWorld = nSubWorldIndex;
	local szKillCamp = GetNpcCamp(nKiller);
	local szTowerCamp = GetNpcCamp(nNpcIndx);
	local nTowerCamp = CAMPSTR2IDX[szTowerCamp]
	local nKillCamp = mod(CAMPSTR2IDX[szTowerCamp], 2) + 1;
	if nTowerCamp == 1 then -- ´óÆìºÍ¼ýËþ±»´Ý»Ù¶¼»áÔö¼ÓÕâ¸ö±äÁ¿µÄÊýÁ¿¡£
		SetMissionV(MV_CAMP1_TOWER_DESTORIED, GetMissionV(MV_CAMP1_TOWER_DESTORIED) + 1);
	else 
		SetMissionV(MV_CAMP2_TOWER_DESTORIED, GetMissionV(MV_CAMP2_TOWER_DESTORIED) + 1);
	end

	if g_tTowerInfo[szNpcName] then
		CastState2Npc(nKiller, "state_move_speed_percent_add", g_tTowerInfo[szNpcName],
			18 * 60 * 60, 4097);
		Msg2MSAll(Mission_OneRoadBattle.missionID, "ChiÕn Xa ®­îc ®­îc tiÔn th¸p tiÕp viÖn, tèc ®é t¨ng!");
		SendScript2VM(thisFile, format("on_tower_death(%d, %d)", nKillCamp, nNpcIndx));
	elseif szNpcName == "Cê Tèng" then
		SendScript2VM(thisFile, "on_flag_death(2)");
	elseif szNpcName == "Cê Liªu" then
		SendScript2VM(thisFile, "on_flag_death(1)");
	end
end