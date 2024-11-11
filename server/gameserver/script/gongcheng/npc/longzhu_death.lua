Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local msState = GetMissionV(MV_MISSION_STATE)
	if msState ~= MS_STATE_GONGMEN and msState ~= MS_STATE_GONGCHENG then
			return 0;
	end;
	if GetMissionV(MV_LONGZHU_FLAG) ~= 1 then
		return 0;
	end
	SetMissionV(MV_LONGZHU_FLAG, 2);
	Msg2MSAll(MISSION_ID, "Long Tr� �� b� ph� h�y, th�ng b�i �� ph�n, C�ng Th�nh ��i Chi�n s�p k�t th�c!");
	SetNpcLifeTime(nNpcIdx, 0);	
	StopMissionTimer(MISSION_ID,TIMER_ID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
	SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
	StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	local szResult = "";
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
	szResult = "C�ng th�nh chi�n �� k�t th�c, cu�i c�ng bang h�i <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color> chi�m l�nh th�nh c�ng (do bang h�i <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> th� v�) <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
	GCZ_PlaySound(GONG_ID,"����սʤ��.wav");
	GCZ_PlaySound(SHOU_ID,"����սʧ��.wav");
	SetMissionV(MV_WAR_RESULT,GONG_ID);	--���ý��	
	AddRuntimeStat(58, 1, 0, 1) --����ʤ��ͳ��
	local lfFunc = function(tArg)
		Say(%szResult,0);
		SetFightState(0);
		if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
			SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			if GetTongDuty() == 1 and GetTongName() == tArg[1] then
				SetTask(TNC_TONG_AWARD, 1);
			end
		else
			SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			if GetTongDuty() == 1 and GetTongName() == tArg[2] then
				SetTask(TNC_TONG_AWARD, 2);
			end
		end;
	end;
	mf_OperateAllPlayer(MISSION_ID,lfFunc,{GetMissionS(MS_GONG_TONG_NAME),GetMissionS(MS_SHOU_TONG_NAME)},ALL_ID);
	AddGlobalCountNews(szResult,1);
	Msg2Global(sf_RemoveTag(szResult,"<",">"));
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	Msg2MSAll(MISSION_ID,"C�ng th�nh chi�n �� k�t th�c, m�i ng��i r�i kh�i chi�n tr��ng th�i");
	WriteLog("[c�ng th�nh C�ng th�nh chi�n]:"..sf_RemoveTag(szResult,"<",">").."MSUID l� "..GetMissionV(MV_MISSION_UID));
end