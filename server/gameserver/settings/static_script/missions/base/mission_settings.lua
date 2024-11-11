Include("\\script\\class\\kinifile.lua");
Import("\\script\\lib\\globalfunctions.lua");

msSettings	= {};

g_msOptionCells = {
	{"SetPkFlag",					"bSetPkFlag",					"number",	1},		--练功模式
	{"SetPkCamp", 					"bSetPkCamp",					"number",	1},		--PK模式
	{"ForbidChangePK",				"bForbidChangePK",				"number",	1},		--转换PK色
	{"UseScrollEnable",				"bUseScrollEnable",				"number",	0},		--使用回城符
	{"ForbitTrade",					"bForbitTrade",					"number",	0},		--交易
	{"StallEnable",					"bStallEnable",					"number",	0},		--摆摊
	{"OpenFriendliness",			"bOpenFriendliness",			"number",	0},     --好感度
	{"DeathPunish",					"bDeathPunish",					"number",	0},     --死亡惩罚
	{"ClearMomentum",				"bClearMomentum",				"number",	0},     --清空杀气
	{"ForbitMomentum",				"bForbitMomentum",				"number",	1},     --增加杀气值
	{"InteractiveEnable",			"bInteractiveEnable",			"number",	1},     --互动动作
	{"ForbitTeam",					"bForbitTeam",					"number",	1},		--队伍操作
	{"LeaveTeam",					"bLeaveTeam",					"number",	0},     --离开队伍
	{"ForbitSuperSkill",			"bForbitSuperSkill",			"number",	0},		--屏蔽镇派
	{"RestoreFightState",			"nRestoreFightState",			"number",	0},		--离开战斗状态
	{"RestoreSetPkFlag",			"bRestoreSetPkFlag",			"number",	0},  	--离开练功模式
	{"RestoreSetPkCamp",			"bRestoreSetPkCamp",			"number",	0},  	--离开PK模式
	{"RestoreForbidChangePK",		"bRestoreForbidChangePK",		"number",	0},  	--离开PK状态转换
	{"RestoreUseScrollEnable",		"bRestoreUseScrollEnable",		"number",	1},  	--离开使用回城符
	{"RestoreForbitTrade",			"bRestoreForbitTrade",			"number",	0},  	--离开交易
	{"RestoreStallEnable",			"bRestoreStallEnable",			"number",	1},  	--离开摆摊
	{"RestoreOpenFriendliness",		"bRestoreOpenFriendliness",		"number",	1},  	--离开好感度
	{"RestoreDeathPunish",			"bRestoreDeathPunish",			"number",	1},  	--离开死亡惩罚
	{"RestoreClearMomentum",		"bRestoreClearMomentum",		"number",	0},  	--离开杀气值
	{"RestoreInteractiveEnable",	"bRestoreInteractiveEnable",	"number",	0},  	--离开互动动作
	{"RestoreForbitTeam",			"bRestoreForbitTeam",			"number",	0},  	--离开队伍操作
	{"RestoreLeaveTeam",			"bRestoreLeaveTeam",			"number",	0},  	--离开退队
	{"RestoreTempEffect",			"bRestoreTempEffect",			"number",	1},  	--离开临时状态
};

g_msHeadCells = {
	{"MissionName",					"name",							"string",	""},	--关卡名字
	{"MissionID", 					"missionID",					"number",	nil},	--mission id
	{"MapID", 						"realMapID",					"number",	nil},	--地图模版id
	{"DynamicMap", 					"dynamicMap",					"number",	0},		--地图加载类型
};

g_msPhaseCells = {
	{"TimerID", 					"timerID", 						"number",	0},		--触发器ID
--	{"Frequency", 					"frequency", 					"number",	18},	--timer频率(单位:帧)
--	{"Maxsecond", 					"maxsecond", 					"number",	1},		--最大时间(单位:秒)
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
	-- print("\n[load config] 进行操作 this",this)
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
