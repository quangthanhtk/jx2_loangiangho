Include("\\settings\\static_script\\kf_newbattles\\head.lua");
Include("\\script\\system_switch_config.lua")

function main()
	if IsKfNewBattleOpen() ~= 1 then
		return 0;
	end
	local _,at_ggs = GetRealmType()
	if at_ggs ~= 1 then
		return 0;
	end
	local nHour = tonumber(date("%H"));
	local nWeek = tonumber(date("%w"));
	WriteLog("[NewBattle]:Initialize Sub-Battle");
	SetGlbValue(GLB_VILLAGE,0);	--不管怎样，都把战场的结果清掉
	SetGlbValue(GLB_RESOURCE,0);
	SetGlbValue(GLB_EMPLACEMENT,0);
	SetGlbValue(GLB_MAINBATTLE,0);
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
		if nGlobalState == 0 then
			-- AddGlobalNews("跨服炮台站即将开始，请立即前往参加。");
			-- Msg2Global("跨服炮台站即将开始，请立即前往参加。");
			local nOldSubWorld = SubWorld;
			SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+1);	--设为XX1
			if RANDOM_CAMP_PLACE == 1 then
				SetGlbValue(GLB_RANDOM_PLACE_VILL,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_RESO,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_EMPL,random(0,1));
			end;	
			for i=1,3 do
				SubWorld = SubWorldID2Idx(tBTMSInfo[i][2]);
				if SubWorld >= 0 then
					WriteLog("[NewBattle]:Opening Sub-Battle");
					OpenMission(tBTMSInfo[i][1]);
				else
					WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[i][2])..",SubWorld ID:"..tostring(SubWorld));
				end;
			end;
			SubWorld = nOldSubWorld;
		else
			WriteLog("[NewBattle]:Global state error,value:"..tostring(nGlobalState));
		end;
	end;
end;