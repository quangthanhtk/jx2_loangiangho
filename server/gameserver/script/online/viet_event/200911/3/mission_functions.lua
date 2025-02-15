--=============================================
--create by baiyun 2009.10.19
--describe:越南版11月活动神奇树mission函数
--=============================================
Include("\\script\\online\\viet_event\\200911\\3\\mission_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission  b総 u, MSUID:"..nMSUID);
end;
--Mission开始
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
end;
--Mission结束
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission  k誸 th骳, MSUID:"..nMSUID);
end;
--离开Mission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nMapId = GetGlbValue(1015);
		local nMapX = GetGlbValue(1016);
		local nMapY = GetGlbValue(1017);
		local nDengLongIndex = GetGlbValue(1014);
		--这里创建胖兔子
		for i = 1, 20 do
			local nNpcIndex = CreateNpc("Th� M藀", "Th� M藀", nMapId, nMapX, nMapY);
			--SetNpcLifeTime(nNpcIndex, 300);
			SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\3\\death_pangtuzi.lua");
		end
		local nState = GetUnitCurStates(nDengLongIndex, 4)
		AddUnitStates(nDengLongIndex, 4, (0 - nState));--把此状态清0
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--登陆触发器函数
function OnLogin()

end;
--=====================================================================================
--转换Mission当前状态
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置开始状态的持续时间
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()

end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()

end;
