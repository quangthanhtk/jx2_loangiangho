Include("\\settings\\static_script\\kf_newbattles\\head.lua");
Include("\\script\\system_switch_config.lua")

function main()
	if IsKfNewBattleOpen() ~= 1 then
		return 0;
	end
	local _,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		return 0;
	end
	WriteLog("[NewBattle]:Initialize Main-Battle");
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nHour = tonumber(date("%H"));
		-- AddGlobalNews("跨服雁门关战场即将开始，请立即前往参加。");
		-- Msg2Global("跨服雁门关战场即将开始，请立即前往参加。");
		local nOldSubWorld = SubWorld;
		SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+3);	--设为XX3，注意，这里的XX可能和副战场的XX不一样哦
		SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
		if RANDOM_CAMP_PLACE == 1 then
			SetGlbValue(GLB_RANDOM_PLACE_MAIN,random(0,1));
		end;
		if SubWorld >= 0 then
			WriteLog("[NewBattle]:Opening Main-Battle");
			OpenMission(tBTMSInfo[MAINBATTLE_ID][1]);
		else
			WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[MAINBATTLE_ID][2])..",SubWorld ID:"..tostring(SubWorld));
		end;
		SubWorld = nOldSubWorld;
	end;
end;