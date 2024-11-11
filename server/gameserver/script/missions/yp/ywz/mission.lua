Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\missions\\yp\\ywz\\mission_head.lua")

---------------------------------------------------------
stageFight = {
	name = "tbYWZ",
	frequency = firePhases.frequency,
	maxsecond = firePhases.maxsecond,
	guage = {msg = "Ti�n �� Di�n V� Chi�n",	time = 60,	cyc = 0, id = 1,},
	actionsType = "second",
}

function stageFight:createSomeNpc()
	local nMapID = this.msPosition:getMapID();
	local tNpcList = {
		{"SFYWZ_SFQXG", "Quan Ti�n Tuy�n Phe Th�", 1739, 3197, "camp_player", "\\script\\missions\\yp\\ywz\\npc_qianxiannpc.lua"},
		{"SFYWZ_GFQXG1", "Quan Ti�n Tuy�n Phe C�ng", 1567, 4037, "camp_enemy", "\\script\\missions\\yp\\ywz\\npc_qianxiannpc.lua"},
		{"SFYWZ_GFQXG2", "Quan Ti�n Tuy�n Phe C�ng", 1885, 4031, "camp_enemy", "\\script\\missions\\yp\\ywz\\npc_qianxiannpc.lua"},
		{"SFYWZ_YDSW1", "Th� V� Doanh Tr�i", 1731, 3340, "camp_player"},
		{"SFYWZ_YDSW1", "Th� V� Doanh Tr�i", 1741, 3340, "camp_player"},
		{"SFYWZ_YDSW1", "Th� V� Doanh Tr�i", 1724, 3303, "camp_player"},
		{"SFYWZ_YDSW1", "Th� V� Doanh Tr�i", 1746, 3302, "camp_player"},
		{"SFYWZ_YDSW2", "Th� V� Doanh Tr�i", 1635, 3953, "camp_enemy"},
		{"SFYWZ_YDSW2", "Th� V� Doanh Tr�i", 1646, 3968, "camp_enemy"},
		{"SFYWZ_YDSW2", "Th� V� Doanh Tr�i", 1610, 3977, "camp_enemy"},
		{"SFYWZ_YDSW2", "Th� V� Doanh Tr�i", 1620, 3989, "camp_enemy"},
		{"SFYWZ_YDSW3", "Th� V� Doanh Tr�i", 1809, 3977, "camp_enemy"},
		{"SFYWZ_YDSW3", "Th� V� Doanh Tr�i", 1821, 3962, "camp_enemy"},
		{"SFYWZ_YDSW3", "Th� V� Doanh Tr�i", 1838, 4003, "camp_enemy"},
		{"SFYWZ_YDSW3", "Th� V� Doanh Tr�i", 1848, 3986, "camp_enemy"},
		{"SFYWZ_WPBGR", "Th� kh�", 1724, 3209, "camp_player", thisFile},
		{"SFYWZ_WPBGR", "Th� kh�", 1586, 4038, "camp_enemy", thisFile},
		{"SFYWZ_WPBGR", "Th� kh�", 1886, 4019, "camp_enemy", thisFile},
	}
	for i = 1, getn(tNpcList) do
		local v = tNpcList[i];
		local npcIndex = CreateNpc(v[1], v[2], nMapID, v[3], v[4]);
		if npcIndex > 0 then
			SetCampToNpc(npcIndex, v[5]);
			CastState2Npc(npcIndex, "state_destiny_armor_point_add", 1000, -1);
			if v[6] then
				SetNpcScript(npcIndex, v[6]);
			end
		end
	end
end

function stageFight:CreateTraps()
	local tPos = {
		{{1730, 3328}, {1741, 3329}, "\\script\\missions\\yp\\ywz\\trap\\trap1.lua"},
		{{1731, 3341}, {1743, 3346}, "\\script\\missions\\yp\\ywz\\trap\\trap1.lua"},
		{{1628, 3961}, {1636, 3974}, "\\script\\missions\\yp\\ywz\\trap\\trap2.lua"},
		{{1632, 3956}, {1639, 3974}, "\\script\\missions\\yp\\ywz\\trap\\trap2.lua"},
		{{1817, 3983}, {1831, 3968}, "\\script\\missions\\yp\\ywz\\trap\\trap3.lua"},
		{{1832, 3992}, {1841, 3982}, "\\script\\missions\\yp\\ywz\\trap\\trap3.lua"},
	};
	local mapID = this.msPosition:getMapID();
	for _, t in tPos do
		local tPoint = gf_Line(t[1][1], t[1][2], t[2][1], t[2][2]);
		for i = 1, getn(tPoint) do
			AddMapTrap(mapID, tPoint[i][1]*32, tPoint[i][2]*32, t[3]);
		end
	end
end

function stageFight:CreateRandom()
	local nMapId = this.msPosition:getMapID();
	--print("CreateRandom", this.mvRandom1, this.mvRandom2)
	for i = this.mvRandom1, this.mvRandom2 do
		local npcIdx = GetMissionV(i);
		--print("CreateRandom", i, GetMissionV(i), GetNpcName(npcIdx))
		if GetNpcName(npcIdx) == "R��ng tr�ng th�i ng�u nhi�n" then
			SetNpcLifeTime(GetMissionV(i), 0);
		end
	end
	local tPos = {
		{1737,3371}, {1710,3453},
		{1743,3505}, {1790,3481},
		{1762,3430}, {1738,3580},
		{1709,3595}, {1782,3606},
		{1721,3624}, {1720,3654},
		{1757,3642}, {1755,3682},
		{1738,3682}, {1778,3698},
		{1702,3701}, {1728,3779},
		{1693,3812}, {1779,3791},
		{1773,3820}, {1758,3827},
		{1744,3797}, {1717,3814},
		{1688,3836}, {1686,3872},
		{1683,3915}, {1718,3896},
		{1745,3912}, {1737,3873},
		{1762,3870}, {1773,3901},
	}
	for i = 1, getn(tPos) do
		local npcIndex = CreateNpc("SFYWZ_ZTBX", "R��ng tr�ng th�i ng�u nhi�n", nMapId, tPos[i][1], tPos[i][2]);
		if npcIndex > 0 then
			--print("CreateRandom", this.mvRandom1 + i - 1, npcIndex)
			SetNpcScript(npcIndex, thisFile);
			SetMissionV(this.mvRandom1 + i - 1, npcIndex);
		end
	end
	this:Msg2MSAll("�� t�o m�i R��ng tr�ng th�i ng�u nhi�n");
end

function stageFight:CreateBox()
	local nMapId = this.msPosition:getMapID();
	--print("CreateBox", this.mvBox1, this.mvBox2)
	for i = this.mvBox1, this.mvBox2 do
		local npcIdx = GetMissionV(i);
		--print("CreateBox", i, GetMissionV(i), GetNpcName(npcIdx))
		if GetNpcName(npcIdx) == "R��ng Di�n V�" then
			SetNpcLifeTime(GetMissionV(i), 0);
		end
	end
	local tPos = {
		{1727,3405}, {1746,3417},
		{1785,3432}, {1767,3488},
		{1714,3477}, {1738,3610},
		{1700,3669}, {1723,3671},
		{1775,3651}, {1722,3715},
		{1721,3782}, {1751,3779},
		{1761,3810}, {1734,3822},
		{1706,3847}, {1700,3888},
		{1752,3892}, {1771,3918},
		{1770,3849}, {1703,3808},
	}
	for i = 1, getn(tPos) do
		local npcIndex = CreateNpc("SFYWZ_YWBX", "R��ng Di�n V�", nMapId, tPos[i][1], tPos[i][2]);
		if npcIndex > 0 then
			SetNpcScript(npcIndex, thisFile);
			--print("CreateBox", this.mvBox1 + i - 1, npcIndex)
			SetMissionV(this.mvBox1 + i - 1, npcIndex);
		end
	end
	this:Msg2MSAll("�� t�o m�i R��ng Di�n V�");
end

function stageFight.Init()
	self = stageFight;
	self:createSomeNpc();
	self:CreateTraps();
	this:Msg2MSAll("B�n �� NPC...");
end

function stageFight.Msg()
	--print("stageFight.Msg", GetMissionV(MV_TIMER_SECOND))
	self = stageFight;
	if GetMissionV(this.mvFlag) == 0 then
		local nCurTime = GetMissionV(MV_TIMER_SECOND) + 2;
		this:Msg2MSAll(format("Giai �o�n chu�n b� (%d/%d)", floor(nCurTime / 60), 5));
	else
		local nCurTime = GetMissionV(MV_TIMER_SECOND) + 2 - 300;
		this:Msg2MSAll(format("Nh�c nh� ti�n �� (%d/%d)", floor(nCurTime / 60), 55));
	end
end

function stageFight.Start()
	self = stageFight;
	SetMissionV(this.mvFlag, 1);
	local nMapID = this.msPosition:getMapID();
	local tPos = {
		{1734, 3842},
		{1739, 3653},
		{1745, 3450},
	}
	local tMv = {this.mvNpcIdx1, this.mvNpcIdx2, this.mvNpcIdx3}
	for i = 1, getn(tPos) do
		local npcIndex = CreateNpc("SFYWZ_SFQZ", "C� Phe Th�", nMapID, tPos[i][1], tPos[i][2]);
		if npcIndex > 0 then
			CastState2Npc(npcIndex, "state_destiny_armor_point_add", 1000, -1);
			SetNpcDeathScript(npcIndex, thisFile);
			SetCampToNpc(npcIndex, "camp_player");
			SetMissionV(tMv[i], npcIndex);
		end
	end
	self:CreateRandom();
	self:CreateBox();
	this:Msg2MSAll("Tr�n ��u ch�nh th�c b�t ��u, ch�c c�c v� ��i hi�p s� gi�nh vinh quang v� cho th� l�c c�a m�nh!");
	local oldPlayerIndex = PlayerIndex;
	local nMapID = this.msPosition:getMapID();
	local tPlayer = GetMapPlayer(nMapID);
	for i = 1, getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		local nCamp, _ = ywzm_GetParam();
		AddRuntimeStat(41, 2, nCamp, 1);
		local nRouter = GetPlayerRoute();
		AddRuntimeStat(41, 4, nRouter, 1);
		local nReborn = gf_GetPlayerRebornCount()
		AddRuntimeStat(41, 7, nReborn, 1);
	end
	PlayerIndex = oldPlayerIndex;
end

function stageFight:onNpcDeath(event, tParam)
	--print("stageFight.onNpcDeath", event, tParam)
	if tParam[2] ~= 0 then return 0; end
	local npcIndex = tonumber(tParam[1]);
	local nMapID, nX, nY = GetNpcWorldPos(npcIndex);
	local npcName = GetNpcName(npcIndex);
	local mv = ywzm_GetNpcMvIndex(npcIndex);
	if mv < this.mvNpcIdx1 or mv > this.mvNpcIdx3 then
		return 0;
	end
	--print(nMapID, nX, nY, npcName, mv)
	if npcName == "C� Phe Th�" then
		local npcIdx = CreateNpc("SFYWZ_GFQZ", "C� Phe C�ng", nMapID, nX, nY);
		if npcIdx > 0 then
			CastState2Npc(npcIdx, "state_destiny_armor_point_add", 1000, -1);
			SetNpcDeathScript(npcIdx, thisFile);
			SetCampToNpc(npcIdx, "camp_enemy");
			SetMissionV(mv, npcIdx);
		else
			error("npcIdx <= 0");
		end
		ywzm_AddScore(50);
		Msg2Player(format("Nh�n ���c %d �i�m di�n v�, hi�n �� nh�n ���c %d �i�m di�n v�.", 50, ywzm_GetScore()));
		self:SetShiliScore(50);
	elseif npcName == "C� Phe C�ng" then
		local npcIdx = CreateNpc("SFYWZ_SFQZ", "C� Phe Th�", nMapID, nX, nY);
		if npcIdx > 0 then
			CastState2Npc(npcIdx, "state_destiny_armor_point_add", 1000, -1);
			SetNpcDeathScript(npcIdx, thisFile);
			SetCampToNpc(npcIdx, "camp_player");
			SetMissionV(mv, npcIdx);
		else
			error("npcIdx <= 0");
		end
		ywzm_AddScore(50);
		Msg2Player(format("Nh�n ���c %d �i�m di�n v�, hi�n �� nh�n ���c %d �i�m di�n v�.", 50, ywzm_GetScore()));
		self:SetShiliScore(50);
	end
	SetNpcLifeTime(npcIndex, 0);
end

function stageFight.Check()
	--print("stageFight.Check")
	self = stageFight;
	local oldPlayerIndex = PlayerIndex;
	local nMapID = this.msPosition:getMapID();
	local tPlayer = GetMapPlayer(nMapID);
	--gf_PrintTable(tPlayer)
	for i = this.mvNpcIdx1, this.mvNpcIdx3 do
		local npcIdx = GetMissionV(i);
		local szNpcName = GetNpcName(npcIdx);
		local nNpcCamp = 0;
		if szNpcName == "C� Phe Th�" then
			nNpcCamp = 1;
		elseif szNpcName == "C� Phe C�ng" then
			nNpcCamp = 2;
		end
		if nNpcCamp ~= 0 then
			local _, npcX, npcY = GetNpcWorldPos(npcIdx);
			for j = 1, getn(tPlayer) do
				PlayerIndex = tPlayer[j];
				if ywzm_GetCamp() == nNpcCamp and IsPlayerDeath() ~= 1 then
					local _, playerX, PlayerY = GetWorldPos();
					local x = playerX - npcX;
					local y = PlayerY - npcY;
					if (x)^2 + (y)^2 < 200 then
						ywzm_AddScore(3);
						Msg2Player(format("Nh�n ���c %d �i�m di�n v�, hi�n �� nh�n ���c %d �i�m di�n v�.", 3, ywzm_GetScore()));
						self:SetShiliScore(3);
						PlaySound("\\sound\\sound_i016.wav");
						SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
					end
				end
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function stageFight.Broadcast()
	self = stageFight;
	if GetMissionV(this.mvFlag) ~= 1 then
		return 0;
	end
	this:Msg2MSAll(format("T�ng �i�m di�n v� c�a T�y H�: %d �i�m, t�ng �i�m di�n v� c�a Th� Ph�n: %d �i�m, t�ng �i�m di�n v� c�a ��i L�: %d �i�m.", GetMissionV(this.mv3), GetMissionV(this.mv2), GetMissionV(this.mv1)));
end

function stageFight:onPlayerDeath(event, killId)
	--print("stageFight.onPlayerDeath")
	local nMapID = this.msPosition:getMapID();
	local nX, nY = ywzm_GetPos();
	SetDeathScript(thisFile);
	SetTempRevPos(nMapID, nX*32, nY*32);
	CastState("state_destiny_armor_point_add", 1000, 3600*18, 1, 10011, 1);
	local nValue = GetTaskTemp(0);
	SetTaskTemp(0, nValue + 1);
	local deathName = GetName();
	local oldPlayerIndex = PlayerIndex;
	PlayerIndex = NpcIdx2PIdx(killId);
	local killName = GetName();
	SetTaskTemp(0, 0);
	if nValue + 1 < 2 then
		ywzm_AddScore(2);
		Msg2Player(format("b�n �� gi�t %s", deathName));
		Msg2Player(format("Nh�n ���c %d �i�m di�n v�, hi�n �� nh�n ���c %d �i�m di�n v�.", 2, ywzm_GetScore()));
		self:SetShiliScore(2);
	else
		Msg2Player(format("%s �� li�n t�c t� vong v��t qu� %d l�n kh�ng th� ti�p t�c nh�n ���c l�i �ch", deathName, 2));
	end
	PlayerIndex = oldPlayerIndex;
	Msg2Player(format("b�n b� %s gi�t", killName));
	AddRuntimeStat(41, 3, 0, 1);
end

function stageFight:OnTalk(event)
	--print("stageFight.OnTalk")
	local npcIndex = GetTargetNpc();
	local szNpcName = GetNpcName(npcIndex);
	if szNpcName == "R��ng Di�n V�" then
		SetNpcLifeTime(npcIndex, 0);
		ywzm_AddScore(10);
		Msg2Player(format("Nh�n ���c %d �i�m di�n v�, hi�n �� nh�n ���c %d �i�m di�n v�.", 10, ywzm_GetScore()));
		self:SetShiliScore(10);
	elseif szNpcName == "R��ng tr�ng th�i ng�u nhi�n" then
		local tState = {
			{"state_life_percent_per10s_anytime", 10, 60*18, 10003, "M�i 10 gi�y ph�c h�i 10% �i�m sinh l�c, duy tr� 60 gi�y"},
			{"state_neili_percent_per10s_anytime", 10, 60*18, 10004, "M�i gi�y ph�c h�i 10% �i�m n�i l�c, duy tr� 60 gi�y"},
			{"state_p_attack_percent_add", 100, 60*18, 10005, "Ngo�i c�ng t�ng 100%, duy tr� 60 gi�y"},
			{"state_m_attack_percent_add", 100, 60*18, 10006, "N�i c�ng t�ng 100%, duy tr� 60 gi�y"},
			{"state_physical_parmor_poi_add", 30, 60*18, 10007, "Ph�ng th� ngo�i c�ng 30%, duy tr� 60 gi�y"},
			{"state_magic_parmor_poi_add", 30, 60*18, 10008, "Ph�ng th� n�i c�ng 30%, duy tr� 60 gi�y"},
			{"state_dispear", 100, 20*18, 10009, "Tr�ng th�i v� ��ch, duy tr� 20 gi�y"},
			{"state_move_speed_percent_add", 50, 60*18, 10010, "T�ng 50% t�c �� di chuy�n, duy tr� 60 gi�y"},
		}
		SetNpcLifeTime(npcIndex, 0);
		local nIndex = random(getn(tState));
		local t = tState[nIndex];
		CastState(t[1], t[2], t[3], 1, t[4], 0);
		SyncCustomState(1, t[4], 1, t[5]);
		Msg2Player(format("B�n nh�n ���c %s", t[5]));
	elseif szNpcName == "Th� kh�" then
		OpenBox()
		EnableBoxLock(1)
	end
end

function stageFight:SetShiliScore(nValue)
	local nCamp, _ = ywzm_GetParam();
	local tCampMv = {this.mv1, this.mv2, this.mv3};
	local mv = tCampMv[nCamp];
	local nTotal = GetMissionV(mv) + nValue;
	SetMissionV(mv, nTotal);
	local nLevel = 0;
	local nCount = GetMSPlayerCount(this.missionID);
	if nCount >= 200 then
		nLevel = 1;
	elseif nCount >= 100 then
		nLevel = 2;
	else
		nLevel = 3;
	end
	--�Ƿ����
	local t = {86000, 54000, 21000};
	if nTotal >= t[nLevel] then
		self:onFinish();
		return 0;
	end
	--�Ƿ�ˢnpc
	local tScore = {
		{25800, 51600},
		{16200, 32400},
		{6300, 12600},
	}
	local tScoreSub = tScore[nLevel];
	if nTotal >= tScoreSub[2] then
		if GetMissionV(this.mvFlag2) == 0 then
			self:CreateRandom();
			self:CreateBox();
			SetMissionV(this.mvFlag2, 1);
		end
	elseif nTotal >= tScoreSub[1] then
		if GetMissionV(this.mvFlag1) == 0 then
			self:CreateRandom();
			self:CreateBox();
			SetMissionV(this.mvFlag1, 1);
		end
	end
end

function stageFight:onFinish()
	local nMapID = this.msPosition:getMapID();
	ywzm_ProcessOver(nMapID);
	phaseBase.onFinish(self)
	this:Msg2MSAll("Th� L�c Ba Phe-Di�n V� Chi�n �� k�t th�c!");
	CloseMission(this.missionID);
end

function stageFight:onTimeout()
	return self:onFinish();
end

----------------------------------------------------------------------
stageFight.actions = {
	[4] = stageFight.Init,
	[302] = stageFight.Start,
}

stageFight.cycActions = {
	[5] = { --5����һ��
		[0] = stageFight.Check,
	},
	[60] = {
		[0] = stageFight.Msg,
	},
	[180] = {--3����
		[0] = stageFight.Broadcast,
	},
}

stageFight.triggers = {
	PlayerDeath = {
		{action = stageFight.onPlayerDeath,},
	},
	NpcDeath = {
		{action = stageFight.onNpcDeath,},
	},
	Talk = {
		{action = stageFight.OnTalk,},
	},
}
stageFight = inherit(cycPhase, stageFight);

----------------------------------------------------------------------
tbYWZ = gf_CopyInherit(missionBase, tbYWZ);

firePhases.phases = {stageFight,};

tbYWZ.msPhases = {firePhases,};

tbYWZ.msPosition.getEntryPos = function(self, nCamp)
	return this.msPosition:getMapID(), ywzm_GetPos();
end

tbYWZ.onLeave = function(self)
	for i = 1, 11 do
		RemoveState(10000+i);
	end
	SetTempRevPos(0, 0, 0);
	SetDeathScript("");
	SetFightState(0);
	local nRealCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nRealCamp == 1 then
		SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
	elseif nRealCamp == 2 then
		SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
	elseif nRealCamp == 3 then
		SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
	end
end

tbYWZ.msOption.OnPlayerJoin = function(self, nCamp)
	--print("OnPlayerJoin")
	local nMapID = this.msPosition:getMapID();
	local nX, nY = ywzm_GetPos();
	SetDeathScript(thisFile);
	SetTempRevPos(nMapID, nX*32, nY*32);
	ywzm_ResetScore(); --���������������
	SetFightState(0);
	CastState("state_destiny_armor_point_add", 1000, 3600*18, 1, 10011, 1);
	Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c %d �i�m thu�c t�nh v� c�", 1000));
	this:Msg2MSAll(format("%s �� v�o Di�n V� Chi�n Tr��ng", GetName()));
	AddRuntimeStat(36, 8, 0, 1);
end

function StartYwzMission()
	if SubWorldID2Idx(this.realMapID) == -1 then
		return 0;
	end
	if ywzm_GetMap() ~= 0 then
		return 0;
	end
	local nMapID = this:Create();
	if nMapID > 0 then
		local msg = "Th� L�c Ba Phe-Di�n V� Chi�n �� b�t ��u!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
	end
end

function JoinYwzMission(nCamp)
	local nMapID = ywzm_GetMap();
	if not nMapID then
		Talk(1,"","Kh�ng bi�t ���ng �i");
		return 0;
	end
	local nFlag = ywzm_GetMissionState(nMapID);
	if nFlag == 1 then
		Talk(1,"","Ng��i ��n tr� r�i, l�n sau h�y quay l�i!");
		return 0;
	end
	this:Enter(nMapID, nCamp);
end

this = tbYWZ;
