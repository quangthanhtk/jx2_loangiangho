Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\sdb.lua");
Import("\\script\\missions\\kuafu_boss\\yanmenguan\\mission_head.lua")

Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\missions\\kuafu_boss\\yanmenguan\\phase.lua")

--=====================================================================
Mission_Kfb = inherit(missionBase, Mission_Kfb)

function JoinMission(RoleIndex,nCamp)
	local nOldPlayerIndex = PlayerIndex
	PlayerIndex = RoleIndex
	local nMapId =  gf_GetCurMapID()
	kfb_enterMission(nMapId, nCamp)
	PlayerIndex = nOldPlayerIndex
end

--�ⲿ����
function gotoNextPhase()
	local tCurPhase = Mission_Kfb.msPhases[1]:getCurPhase()
	if not tCurPhase then
		return
	end
	if g_kfbDebug == 1 then
		print(format("===gotoNextPhase=== nMissionId=%d, nMapId=%d, nCurPhaseTime=%d",
			Mission_Kfb.missionID, gf_GetCurMapID(), tCurPhase.second ))
	end
	tCurPhase:onTimeout()
end

Mission_Kfb.onMissionInit = function (self)
	local nMapId =  gf_GetCurMapID();
	
	ClearMapNpc(nMapId);
	ClearMapTrap(nMapId);
	kfb_createNpc(nMapId);
	--��������Ƶ��
	--CreateChannel(Mission_Kfb.name .. nMapId, KFB_COMMON_PLAYER_CAMP);
end

Mission_Kfb.onMissionClose = function (self)
	local nMapId =  gf_GetCurMapID();
	--DeleteChannel(Mission_Kfb.name .. nMapId, KFB_COMMON_PLAYER_CAMP);
end

Mission_Kfb.msOption.OnPlayerJoin = function(self, nCamp)
	--SetTempRevScript(thisFile);
	if g_kfbDebug == 1 then
		RestoreAll();
	end
	ResetToPlayerDamage();
	--ClearColdDown();	--�������ҩCD
	--CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
	--RemvoeTempEffect();	--���������ʱ״̬
	--ClearStolenSkill();	--�����͵ȡ�ļ��ܣ���Թ���
	--SetLockCurTitle(0);	--���ɸ����ƺ�
	--KillFollower();
	SetPKFlag(KFB_PK_FLAG,0,0); --0���� 3��ս
	ForbidChangePK(1);	--ת��PK״̬
	SetFightState(0);
	local nMapId = gf_GetCurMapID();
	--EnterChannel(Mission_Kfb.name .. nMapId);
	--SendScript2Client("SyncClear()");
	SetTempRevPos(nMapId, VIRTUAL_REVIVE_POS[1]*32, VIRTUAL_REVIVE_POS[2]*32);	--��������������
	kfb_AddJoinMisisonBuff(KFB_MS_TYPE) --����buff
	kfb_AddJoinMisisonDeBuff(KFB_MS_TYPE) --����buff
end

Mission_Kfb.msOption.OnPlayerLeave = function(self, nCamp)
	----SetTempRevScript("");

	DesaltPlayer(0);
	ForbidChangePK(0);	--ת��PK״̬
	SetFightState(0);
	SetCreateTeam(0); --������Ӳ���
	LeaveTeam(1);
	local nMapId = gf_GetCurMapID();
	--LeaveChannel(Mission_Kfb.name .. nMapId);
	--SendScript2Client("SyncClear()");

	kfb_RemoveJoinMisisonBuff(KFB_MS_TYPE)
	kfb_RemoveJoinMisisonDeBuff(KFB_MS_TYPE)
end

Mission_Kfb.msPhases = {
	phase_kfb,
}

Mission_Kfb.msPosition.entryPos = ENTER_POS;
Mission_Kfb.msPosition.exitPos = EXIT_POS;

Mission_Kfb.msPosition.getExitPos = function (self)
	return gf_UnPack(self.exitPos[random(1, getn(self.exitPos))]);
end

-- Mission_Kfb.onLeave = function (self)
-- 	self.msOption:restoreState();
-- 	local m,x,y = this.msPosition:getExitPos();
-- 	local nVersion,nCurGs = GetRealmType();
-- 	if nCurGs == 0 then
-- 		if NewWorld(m,x,y) == 1 then
-- 			SetLogoutRV(0)	-- NewWorld�ɹ������0, ��Ϊ����п���������leave	
-- 		end
-- 	else
-- 		if ChangeGroupWorld(m,x,y) == 1 then
-- 			SetLogoutRV(0)	-- NewWorld�ɹ������0, ��Ϊ����п���������leave	
-- 		end
-- 	end
-- end

Mission_Kfb.msOption.nInitFightState = 0;
Mission_Kfb.msOption.szInitDeahScript = thisFile;
Mission_Kfb.msOption.szInitReviveScript = thisFile;
Mission_Kfb.msOption.bForbitSuperSkill = 1;
Mission_Kfb.msOption.bUseScrollEnable = 0; 	--����ؿ�ʱ�Ƿ�����ʹ�ûسǷ�
Mission_Kfb.msOption.bForbitTeam = 1;		--����ؿ�ʱ�Ƿ��ֹ�������
Mission_Kfb.msOption.bLeaveTeam = 1;		--����ؿ�ʱ�Ƿ�Ҫ�뿪����
Mission_Kfb.msOption.bRestoreTempEffect = 0;--�뿪�ؿ�ʱ�Ƿ������ʱ״̬

this = Mission_Kfb;

--======================================================================================