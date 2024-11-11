--=============================================
--create by baiyun 2009.11.22
--describe:Խ�ϰ�12�·�ʥ���ڻ��¯mission����
--=============================================
Include("\\script\\online\\viet_event\\200912\\5\\mission_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission �� b�t ��u, MSUID:"..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
end;
--Mission����
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--��Mission����ɾ�����е����
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission �� k�t th�c, MSUID:"..nMSUID);
end;
--�뿪Mission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
        --����boss�Ĳ�����ģ���������֣������ű�·��
        local BossParam = {
            {"Th� M�p", "Th� M�p", "\\script\\online\\viet_event\\200912\\5\\death_pangtuzi.lua"},
            {"chicken_viet", "G�", "\\script\\online\\viet_event\\200912\\5\\death_ji.lua"},
            {"dark_viet", "V�t", "\\script\\online\\viet_event\\200912\\5\\death_ya.lua"},
            {"ship_viet", "D�", "\\script\\online\\viet_event\\200912\\5\\death_yang.lua"},
        };
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nMapId = GetGlbValue(1015);
		local nMapX = GetGlbValue(1016);
		local nMapY = GetGlbValue(1017);
		local nDengLongIndex = GetGlbValue(1014);
		--���ﴴ�������ӡ�����Ѽ�������������һ��
                local nRand = random(1, 4);
		for i = 1, 10 do
			local nNpcIndex = CreateNpc(BossParam[nRand][1], BossParam[nRand][2], nMapId, nMapX, nMapY);
			SetNpcLifeTime(nNpcIndex, 600);--BOSS����ʱ��Ϊ600��
			SetNpcDeathScript(nNpcIndex, BossParam[nRand][3]);
		end
		--local nState = GetUnitCurStates(nDengLongIndex, 4)
		--AddUnitStates(nDengLongIndex, 4, (0 - nState));--�Ѵ�״̬��0
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--��½����������
function OnLogin()

end;
--=====================================================================================
--ת��Mission��ǰ״̬
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
		SetMissionV(MV_TIMER_LOOP,floor(GetGlbValue(1018)/STARTED_TIMER_INTERVAL)-1);	--���ÿ�ʼ״̬�ĳ���ʱ��
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()

end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()

end;
