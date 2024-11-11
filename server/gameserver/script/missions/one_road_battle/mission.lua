Include("\\script\\missions\\one_road_battle\\phase.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\sdb.lua");

Import("\\script\\missions\\one_road_battle\\orb_honor.lua")
--=====================================================================
Mission_OneRoadBattle = inherit(missionBase, Mission_OneRoadBattle)

Mission_OneRoadBattle.onMissionInit = function (self)
	--ÉèÖÃÁÄÌìÆµµÀ
	local nMapId =  gf_GetCurMapID();
	g_tMissionParam[nMapId] = {};
	g_tMissionParam[nMapId]["Life"] = {};
	--´´½¨ÐÂµÄÕóÓª
	SetCampRelation(CampSong,    CampHFZ, 8);
	SetCampRelation(CampLiao,    CampHFZ, 8);
	SetCampRelation(CampNeutral, CampHFZ, 8);
	-- CreateChannel("ÏÁÂ·Ïà·ê" .. nMapId, 15);
	CreateChannel("HiÖp Lé T­¬ng Phïng-Tèng" .. nMapId, 40);
	CreateChannel("HiÖp Lé T­¬ng Phïng-Liªu" .. nMapId, 41);
end

Mission_OneRoadBattle.onMissionClose = function (self)
	local nMapId =  gf_GetCurMapID();
	-- DeleteChannel("ÏÁÂ·Ïà·ê" .. nMapId, 15);
	DeleteChannel("HiÖp Lé T­¬ng Phïng-Tèng" .. nMapId, 40);
	DeleteChannel("HiÖp Lé T­¬ng Phïng-Liªu" .. nMapId, 41);
end

Mission_OneRoadBattle.msOption.bForbitTeam = 1;
Mission_OneRoadBattle.msOption.OnPlayerJoin = function(self, nCamp)
	ResetToPlayerDamage();
	ClearColdDown();	--Çå³ýËùÓÐÒ©CD
	CastState("imme_clear_skill_interval",-1,0);	--Ïû³ýËùÓÐ¼¼ÄÜµÄÀäÈ´Ê±¼ä
	RemvoeTempEffect();	--Çå³ýËùÓÐÁÙÊ±×´Ì¬
	ClearStolenSkill();	--Çå³ýÒÑÍµÈ¡µÄ¼¼ÄÜ£¬Õë¶Ô¹÷×Ó
	SetLockCurTitle(0);	--²»¿É¸ü»»³ÆºÅ
	ORB_RemoveNonlicetState();
	KillFollower();
	SetPKFlag(1,0,0);
	ForbidChangePK(1);	--×ª»»PK×´Ì¬
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
	-- EnterChannel("ÏÁÂ·Ïà·ê" .. nMapID);
	if nCamp == CAMP_SONG then
		EnterChannel("HiÖp Lé T­¬ng Phïng-Tèng" .. nMapID);
	elseif nCamp == CAMP_LIAO then
		EnterChannel("HiÖp Lé T­¬ng Phïng-Liªu" .. nMapID);
	elseif nCamp == CAMP_NEUTRAL then
		SetPKFlag(0,0);
		SetFightState(0);
		DesaltPlayer(1,10);
		EnterChannel("HiÖp Lé T­¬ng Phïng-Tèng" .. nMapID);
		EnterChannel("HiÖp Lé T­¬ng Phïng-Liªu" .. nMapID);
	end
	SendScript2Client("SyncClear()");
end

Mission_OneRoadBattle.msOption.OnPlayerLeave = function(self, nCamp)
	DesaltPlayer(0);
	ForbidChangePK(0);	--×ª»»PK×´Ì¬
	ORB_RemoveNonlicetState();
	SetFightState(0);
	SetCreateTeam(0); --ÔÊÐí×é¶Ó²Ù×÷
	LeaveTeam(1);
	local nMapID = gf_GetCurMapID();
	-- LeaveChannel("ÏÁÂ·Ïà·ê" .. nMapID);
	nCamp = GetTask(TASKID_ORB_CAMP);
	if nCamp == CAMP_SONG then
		LeaveChannel("HiÖp Lé T­¬ng Phïng-Tèng" .. nMapID);
	elseif nCamp == CAMP_LIAO then
		LeaveChannel("HiÖp Lé T­¬ng Phïng-Liªu" .. nMapID);
	elseif nCamp == CAMP_NEUTRAL then
		LeaveChannel("HiÖp Lé T­¬ng Phïng-Tèng" .. nMapID);
		LeaveChannel("HiÖp Lé T­¬ng Phïng-Liªu" .. nMapID);
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
			SetLogoutRV(0)	-- NewWorld³É¹¦ºó²ÅÖÃ0, ÒòÎªÍæ¼ÒÓÐ¿ÉÄÜÏÂÏßÀ´leave	
		end
	else
		if ChangeGroupWorld(m,x,y) == 1 then
			SetLogoutRV(0)	-- NewWorld³É¹¦ºó²ÅÖÃ0, ÒòÎªÍæ¼ÒÓÐ¿ÉÄÜÏÂÏßÀ´leave	
		end
	end
end

Mission_OneRoadBattle.msOption.nInitFightState = 0;
Mission_OneRoadBattle.msOption.szInitDeahScript = thisFile;
Mission_OneRoadBattle.msOption.szInitReviveScript = thisFile;
Mission_OneRoadBattle.msOption.bForbitSuperSkill = 1;
this = Mission_OneRoadBattle;

--======================================================================================