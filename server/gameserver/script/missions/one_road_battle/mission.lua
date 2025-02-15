Include("\\script\\missions\\one_road_battle\\phase.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\sdb.lua");

Import("\\script\\missions\\one_road_battle\\orb_honor.lua")
--=====================================================================
Mission_OneRoadBattle = inherit(missionBase, Mission_OneRoadBattle)

Mission_OneRoadBattle.onMissionInit = function (self)
	--设置聊天频道
	local nMapId =  gf_GetCurMapID();
	g_tMissionParam[nMapId] = {};
	g_tMissionParam[nMapId]["Life"] = {};
	--创建新的阵营
	SetCampRelation(CampSong,    CampHFZ, 8);
	SetCampRelation(CampLiao,    CampHFZ, 8);
	SetCampRelation(CampNeutral, CampHFZ, 8);
	-- CreateChannel("狭路相逢" .. nMapId, 15);
	CreateChannel("Hi謕 L� Tng Ph飊g-T鑞g" .. nMapId, 40);
	CreateChannel("Hi謕 L� Tng Ph飊g-Li猽" .. nMapId, 41);
end

Mission_OneRoadBattle.onMissionClose = function (self)
	local nMapId =  gf_GetCurMapID();
	-- DeleteChannel("狭路相逢" .. nMapId, 15);
	DeleteChannel("Hi謕 L� Tng Ph飊g-T鑞g" .. nMapId, 40);
	DeleteChannel("Hi謕 L� Tng Ph飊g-Li猽" .. nMapId, 41);
end

Mission_OneRoadBattle.msOption.bForbitTeam = 1;
Mission_OneRoadBattle.msOption.OnPlayerJoin = function(self, nCamp)
	ResetToPlayerDamage();
	ClearColdDown();	--清除所有药CD
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	RemvoeTempEffect();	--清除所有临时状态
	ClearStolenSkill();	--清除已偷取的技能，针对棍子
	SetLockCurTitle(0);	--不可更换称号
	ORB_RemoveNonlicetState();
	KillFollower();
	SetPKFlag(1,0,0);
	ForbidChangePK(1);	--转换PK状态
	SetFightState(0);
	LearnSkill(2637);
	SetTask(TASKID_ORB_CAMP, nCamp);
	SetTask(TASKID_ORB_TIMEIDENTITY, orb_GetTimeIdentity())
	orb_honor:OnPlayerJoin()
	local nMapID = gf_GetCurMapID();
	SetTask(TASKID_DLGC_CAMP, nCamp)
	SetTask(TASKID_ORB_MAPID, nMapID)
	SetTask(TASKID_DLGC_DEAD, 0)
	SetTask(TASKID_ORB_ACTIVITY, 0)
	Orb_AddRuntimeStat(RUNTIMEID_PlayerJoinCount, 0 ,1)
	Orb_AddRuntimeStat(RUNTIMEID_EachRouterJoinCount, GetPlayerRoute() ,1)
	-- EnterChannel("狭路相逢" .. nMapID);
	if nCamp == CAMP_SONG then
		EnterChannel("Hi謕 L� Tng Ph飊g-T鑞g" .. nMapID);
	elseif nCamp == CAMP_LIAO then
		EnterChannel("Hi謕 L� Tng Ph飊g-Li猽" .. nMapID);
	elseif nCamp == CAMP_NEUTRAL then
		SetPKFlag(0,0);
		SetFightState(0);
		DesaltPlayer(1,10);
		EnterChannel("Hi謕 L� Tng Ph飊g-T鑞g" .. nMapID);
		EnterChannel("Hi謕 L� Tng Ph飊g-Li猽" .. nMapID);
	end
	SendScript2Client("SyncClear()");
end

Mission_OneRoadBattle.msOption.OnPlayerLeave = function(self, nCamp)
	DesaltPlayer(0);
	ForbidChangePK(0);	--转换PK状态
	ORB_RemoveNonlicetState();
	SetFightState(0);
	SetCreateTeam(0); --允许组队操作
	LeaveTeam(1);
	local nMapID = gf_GetCurMapID();
	-- LeaveChannel("狭路相逢" .. nMapID);
	nCamp = GetTask(TASKID_ORB_CAMP);
	if nCamp == CAMP_SONG then
		LeaveChannel("Hi謕 L� Tng Ph飊g-T鑞g" .. nMapID);
	elseif nCamp == CAMP_LIAO then
		LeaveChannel("Hi謕 L� Tng Ph飊g-Li猽" .. nMapID);
	elseif nCamp == CAMP_NEUTRAL then
		LeaveChannel("Hi謕 L� Tng Ph飊g-T鑞g" .. nMapID);
		LeaveChannel("Hi謕 L� Tng Ph飊g-Li猽" .. nMapID);
	end
	if HaveLearnedSkill(2637) == 1 then
		RemoveSkill(2637);
	end
	KillFollower();
	DelItem(BUCKET_GDP[1], BUCKET_GDP[2], BUCKET_GDP[3], 1);
	SendScript2Client("SyncClear()");
end

Mission_OneRoadBattle.msPhases = {
	phaseOne_Road_Battle,
}

Mission_OneRoadBattle.msPosition.entryPos = ENTER_POS;
Mission_OneRoadBattle.msPosition.exitPos = EXIT_POS;

Mission_OneRoadBattle.msPosition.getExitPos = function (self)
	local nCamp = GetTask(TASKID_ORB_CAMP);
	return gf_UnPack(self.exitPos[nCamp]);
end

Mission_OneRoadBattle.onLeave = function (self)
	self.msOption:restoreState();
	local m,x,y = this.msPosition:getExitPos();
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 0 then
		if NewWorld(m,x,y) == 1 then
			SetLogoutRV(0)	-- NewWorld成功后才置0, 因为玩家有可能下线来leave	
		end
	else
		if ChangeGroupWorld(m,x,y) == 1 then
			SetLogoutRV(0)	-- NewWorld成功后才置0, 因为玩家有可能下线来leave	
		end
	end
end

Mission_OneRoadBattle.msOption.nInitFightState = 0;
Mission_OneRoadBattle.msOption.szInitDeahScript = thisFile;
Mission_OneRoadBattle.msOption.szInitReviveScript = thisFile;
Mission_OneRoadBattle.msOption.bForbitSuperSkill = 1;
this = Mission_OneRoadBattle;

--======================================================================================