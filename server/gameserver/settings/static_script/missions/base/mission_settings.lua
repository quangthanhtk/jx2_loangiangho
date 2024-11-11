Include("\\script\\class\\kinifile.lua");
Import("\\script\\lib\\globalfunctions.lua");

msSettings	= {};

g_msOptionCells = {
	{"SetPkFlag",					"bSetPkFlag",					"number",	1},		--����ģʽ
	{"SetPkCamp", 					"bSetPkCamp",					"number",	1},		--PKģʽ
	{"ForbidChangePK",				"bForbidChangePK",				"number",	1},		--ת��PKɫ
	{"UseScrollEnable",				"bUseScrollEnable",				"number",	0},		--ʹ�ûسǷ�
	{"ForbitTrade",					"bForbitTrade",					"number",	0},		--����
	{"StallEnable",					"bStallEnable",					"number",	0},		--��̯
	{"OpenFriendliness",			"bOpenFriendliness",			"number",	0},     --�øж�
	{"DeathPunish",					"bDeathPunish",					"number",	0},     --�����ͷ�
	{"ClearMomentum",				"bClearMomentum",				"number",	0},     --���ɱ��
	{"ForbitMomentum",				"bForbitMomentum",				"number",	1},     --����ɱ��ֵ
	{"InteractiveEnable",			"bInteractiveEnable",			"number",	1},     --��������
	{"ForbitTeam",					"bForbitTeam",					"number",	1},		--�������
	{"LeaveTeam",					"bLeaveTeam",					"number",	0},     --�뿪����
	{"ForbitSuperSkill",			"bForbitSuperSkill",			"number",	0},		--��������
	{"RestoreFightState",			"nRestoreFightState",			"number",	0},		--�뿪ս��״̬
	{"RestoreSetPkFlag",			"bRestoreSetPkFlag",			"number",	0},  	--�뿪����ģʽ
	{"RestoreSetPkCamp",			"bRestoreSetPkCamp",			"number",	0},  	--�뿪PKģʽ
	{"RestoreForbidChangePK",		"bRestoreForbidChangePK",		"number",	0},  	--�뿪PK״̬ת��
	{"RestoreUseScrollEnable",		"bRestoreUseScrollEnable",		"number",	1},  	--�뿪ʹ�ûسǷ�
	{"RestoreForbitTrade",			"bRestoreForbitTrade",			"number",	0},  	--�뿪����
	{"RestoreStallEnable",			"bRestoreStallEnable",			"number",	1},  	--�뿪��̯
	{"RestoreOpenFriendliness",		"bRestoreOpenFriendliness",		"number",	1},  	--�뿪�øж�
	{"RestoreDeathPunish",			"bRestoreDeathPunish",			"number",	1},  	--�뿪�����ͷ�
	{"RestoreClearMomentum",		"bRestoreClearMomentum",		"number",	0},  	--�뿪ɱ��ֵ
	{"RestoreInteractiveEnable",	"bRestoreInteractiveEnable",	"number",	0},  	--�뿪��������
	{"RestoreForbitTeam",			"bRestoreForbitTeam",			"number",	0},  	--�뿪�������
	{"RestoreLeaveTeam",			"bRestoreLeaveTeam",			"number",	0},  	--�뿪�˶�
	{"RestoreTempEffect",			"bRestoreTempEffect",			"number",	1},  	--�뿪��ʱ״̬
};

g_msHeadCells = {
	{"MissionName",					"name",							"string",	""},	--�ؿ�����
	{"MissionID", 					"missionID",					"number",	nil},	--mission id
	{"MapID", 						"realMapID",					"number",	nil},	--��ͼģ��id
	{"DynamicMap", 					"dynamicMap",					"number",	0},		--��ͼ��������
};

g_msPhaseCells = {
	{"TimerID", 					"timerID", 						"number",	0},		--������ID
--	{"Frequency", 					"frequency", 					"number",	18},	--timerƵ��(��λ:֡)
--	{"Maxsecond", 					"maxsecond", 					"number",	1},		--���ʱ��(��λ:��)
};

function msSettings:GetMissionOptions(tConfigFile)
	local msOptions = gf_CopyInherit(this.msOption)
	
	for i = 1, getn(g_msOptionCells) do
		msOptions[g_msOptionCells[i][2]] = tConfigFile:getItem("msOption", g_msOptionCells[i][1]);
		
		if g_msOptionCells[i][3] == "number" then
			msOptions[g_msOptionCells[i][2]] = tonumber(msOptions[g_msOptionCells[i][2]]);
		end
		if not msOptions[g_msOptionCells[i][2]] then
			msOptions[g_msOptionCells[i][2]] = g_msOptionCells[i][4];
		end
	end
	return msOptions;
end

function msSettings:GetMissionHead(tConfigFile)
	local tMissionHead = gf_CopyInherit(missionHead);
	tMissionHead.iniCfg = tConfigFile;
	
	for i = 1, getn(g_msHeadCells) do
		tMissionHead[g_msHeadCells[i][2]] = tConfigFile:getItem("msHead", g_msHeadCells[i][1]);
		if g_msHeadCells[i][3] == "number" then
			tMissionHead[g_msHeadCells[i][2]] = tonumber(tMissionHead[g_msHeadCells[i][2]]);
		end
		if not tMissionHead[g_msHeadCells[i][2]] then
			tMissionHead[g_msHeadCells[i][2]] = g_msHeadCells[i][4];
		end
	end
	return tMissionHead;
end

function msSettings:GetPhaseSettings(tConfigFile)
	local tPhaseSettings = gf_CopyInherit(phaseBase)
	for i = 1, getn(g_msPhaseCells) do
		tPhaseSettings[g_msPhaseCells[i][2]] = tConfigFile:getItem("msPhase", g_msPhaseCells[i][1]);
		if g_msPhaseCells[i][1] == "number" then
			tPhaseSettings[g_msPhaseCells[i][1]] = tonumber(tPhaseSettings[g_msPhaseCells[i][1]]);
		end
		-- print(g_msPhaseCells[i][2], tPhaseSettings[g_msPhaseCells[i][2]]);
		if not tPhaseSettings[g_msPhaseCells[i][1]] then
			tPhaseSettings[g_msPhaseCells[i][1]] = g_msPhaseCells[i][4];
		end
	end
	return tPhaseSettings;
end

function msSettings:LoadConfig()
	if not this then
		print("[Error] [this is nil]");
		return
	end
	
	if not this.iniCfg then
		print("[Error] [this.iniCfg is nil]");
		return
	end
	
	this = gf_CopyInherit(missionBase, this);
	
	this.msOption = self:GetMissionOptions(this.iniCfg);
	this.msPhases[1] = self:GetPhaseSettings(this.iniCfg);
	-- print("\n[load config] ���в��� this",this)
end

function msSettings:LoadHead(nMissionId)
	if not nMissionId or type(nMissionId) ~= "number" then
		print("[Error] [msSettings: nMissionId is not a number]");
		return
	end
	
	local szFilePath = format("\\settings\\task\\missions\\%d.ini", nMissionId);
	local tConfigFile = new(KIniFile, szFilePath);
	
	local tHead = self:GetMissionHead(tConfigFile);
	
	if tHead.missionID ~= nMissionId then
		print(format("[Error] [mission id not match] [tHead.missionID = %s, nMissionId = %s]", tostring(tHead.missionID), tostring(nMissionId)));
	end
--	IniFile_Unload(szFilePath);
	return tHead;

end
