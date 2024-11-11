Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_settings.lua");
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Import("\\script\\lib\\define.lua");
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
thisFile = "\\script\\missions\\wantedboss\\mission.lua";

tWBMission = {
	-- realMapID = 8914,
	name = "V� L�m Truy S�t L�nh",
	missionID = 92, 	-- ΨһID,�鿴���ñ�
	dynamicMap = 1, 	-- ��̬��ͼ
--	����ΪmissionV����
	mvBossDifficult = 1,
	mvBossTemplete = 2,
	mvBossID = 3,
	mvTeamSize = 4,
	mvResult = 5,
}

tWBMission = gf_CopyInherit(missionHead, tWBMission);
tWBMission = gf_CopyInherit(missionBase, tWBMission);
this = tWBMission


----------------------------------------------
-- ͨ���� ��汾
-- ��Ҫ�ؿ��ʱ��WB_VERSION ��Ҫ��1
----------------------------------------------
WB_VERSION = 2
----------------------------------------------
WB_TASK_VERSION = 3578
PREPARE_TIME = 5--60
FIGHT_TIME = 30*60--30 * 60
END_TIME = 5--60
WB_PLAYER_MAX_DEATH_CNT = 3

WB_MISSION_MAX = 200

WB_KILL_COIN_DAILY_LIMIT = 100000  --ÿ�ռ��׻�������51000 ��Ϊ100K

WB_TSKID_RATING = 3543 	-- �ȼ�����
WB_TSKID_COIN 	= 3544	-- �ͽ�

WB_TSKID_DAILY_KILLCOIN = 3572

WB_TSKID_MISSION_DEAD = 3569	-- ÿ�θ����е���������������������ʼʱ���Զ�����
WB_TSKID_DAILY_FREE_SEARCH = 3570
WB_TSKID_KILLBOSS = 3571
WB_TSKID_DAILY_TICKET = 3574
WB_TSKID_MS_END_SIGNAL = 3575  -- ���������־
WB_TSKID_ADD_MAX_DAILY_BOUNTY = 3576 -- ÿ����������ȡ���ͽ�
WB_TSKID_DAILY_BOUNTY_GOT = 3577

WB_BEGIN_DATE = {
	y = 2019,
	m = 6,
	d = 25,
	ymd = 20190625,
}

WB_END_DATE = {
	y = 2019,
	m = 7,
	d = 5,
	ymd = 20190705,
}


WB_BEGIN_TIME = 800
WB_END_TIME = 2300

WB_TICKET = {
	{2,1,31297,1, "B�ch Ng�n Truy S�t L�nh"},
	{2,1,31297,1, "B�ch Ng�n Truy S�t L�nh"},
	{2,1,31296,1, "Ho�ng Kim Truy S�t L�nh"},
	{2,1,31296,1, "Ho�ng Kim Truy S�t L�nh"},
}

tWB_AWARD = {
	{Bounty = 150, Rating = 150},
	{Bounty = 300, Rating = 300},
	{Bounty = 300, Rating = 375},
	{Bounty = 600, Rating = 750},
}
tWB_ACHIEVEMENT_TARGET = {
	{
		tskid = 3571,
		target = 6,
	},
	{
		tskid = 3571,
		target = 30,
	},
	{
		tskid = 3571,
		target = 60,
	},
	{
		tskid = 3571,
		target = 90,
	},
	{
		tskid = 3571,
		target = 120,
	},
}
tWB_ACHIEVEMENT_AWARD = {
	{
		{"��ng T� Chi Nguy�n", {2,1,30913,5,4}},
		{"Hi�p Ngh�a Chi Ch�ng", {2,1,30912,50,4}},
		{"Ng�ng Tinh L�",{2,1,30804,5,4}},
	},
	{
		{"L�nh b�i �� c�ng hi�n", {2,1,30914,1,4}},
		{"��ng T� Chi Nguy�n", {2,1,30913,10,4}},
		{"Ng�ng Tinh L�",{2,1,30804,5,4}},
	},
	{
		{"L�nh b�i �� c�ng hi�n", {2,1,30914,1,4}},
		{"T�i �� Qu� C�p 2", {2,1,30999,4,4}},
		{"��i Ti�u L�nh",{2,95,918,5,4}},
	},
	{
		{"Ch�n V� H�n Th�ch", {2,114,143,1,4}},
		{"T�i �� Qu� C�p 3", {2,1,31000,2,4}},
		{"��i Ti�u L�nh",{2,95,918,5,4}},
	},
	{
		{"H�p Kh� Tr�m Chu�i", {2,1,31302,1,4}},
		{"T�i �� Qu� C�p 4", {2,1,31001,2,4}},
		{"Ch�n V� H�n Th�ch", {2,114,143,2,4}},
	},
}

TOTAL_TIME = FIGHT_TIME + PREPARE_TIME + END_TIME

WB_NPC_TEMP = "tjl_bk"

WB_NPC_NAME = "Th�n B� L�c Phi�n M�n"

function wb_achievement_mail_award(idx)
	local tAward = tWB_ACHIEVEMENT_AWARD[idx]
	Msg2Player(format("Hi�p s� �� ho�n th�nh m�c ti�u th�nh t�u V� L�m Truy S�t L�nh: %d!", idx))
	for i = 1, getn(tAward) do
		local award = tAward[i][2]
		gf_AddItemEx({award[1],award[2],award[3],award[4],award[5]}, tAward[i][1]);
	end
end

function wb_daily_ticket_award()
	local silver = WB_TICKET[1];
	local gold = WB_TICKET[3];
	local n,idx = gf_AddItemEx({silver[1],silver[2],silver[3],4,4}, silver[5])
	SetItemExpireTime(idx, 24*3600);
	n,idx = gf_AddItemEx({gold[1],gold[2],gold[3],1,4}, gold[5])
	SetItemExpireTime(idx, 24*3600);
end

function wb_do_achievement_award(idx)
	if gf_Judge_Room_Weight(3,100,nil) ~= 1 then
		-- �����������ʼĹ�ȥ
		sendScriptMail(
			WB_NPC_NAME, 
			GetName(), 
			"Th��ng Th�nh T�u V� L�m Truy S�t L�nh", 
			format("Hi�p s� �� ho�n th�nh m�c ti�u th�nh t�u V� L�m Truy S�t L�nh: %d. Nh�n ���c ph�n th��ng d��i ��y.", idx),
			[[SendScript2VM("\\script\\missions\\wantedboss\\head.lua", format("wb_achievement_mail_award(%d)",idx))]], 
			"wb_achievement_check")
		return
	end
	wb_achievement_mail_award(idx)
end



tBOSS = {
	-- �˴���shareCoin����Ϊ��ʾ��Ϣ��ʾ���ã�ʵ����Ч�ķֺ��ڳ���KRWantedBoss.cpp DefaultBounty�ﶨ��
	[1] = {templete = "tjl_jll", 	 shareCoin = 150, name = "Ph�ng Ho�ng",},
	[2] = {templete = "tjl_yhkr", 	 shareCoin = 150, name = "Ng�c H�a Cu�ng Nh�n",},
	[3] = {templete = "tjl_bhw", 	 shareCoin = 150, name = "B�ch H� V��ng",},
	[4] = {templete = "tjl_cfy", 	 shareCoin = 150, name = "Tr�n Phi D��ng",},
	[5] = {templete = "tjl_ylby", 	 shareCoin = 150, name = "D� L�c B� Nham",},
	[6] = {templete = "tjl_dfbb", 	 shareCoin = 150, name = "��ng Ph��ng B�t B�i",},
	[7] = {templete = "tjl_hw", 	 shareCoin = 150, name = "Ph� th�y b�ng gi�",},
	[8] = {templete = "tjl_bfy", 	 shareCoin = 150, name = "B� Phi Y�n",},
	[9] = {templete = "tjl_myty_cl", shareCoin = 150, name = "Tr�n L�i",},
	[10] = {templete = "tjl_wylz", 	 shareCoin = 150, name = "Ng� Vi�t L�o T�",},
	[11] = {templete = "tjl_bllsdw", shareCoin = 150, name = "��i v��ng l�c l�m B�c",},
	[12] = {templete = "tjl_qsyt", 	 shareCoin = 150, name = "Th��ng Th�n Doanh Thi�n",},
	[13] = {templete = "tjl_lxl", 	 shareCoin = 150, name = "L�nh H��ng L�ng",},
	[14] = {templete = "tjl_MW", 	 shareCoin = 150, name = "U Tr�ch Chi �nh Minh V�",},
	[15] = {templete = "tjl_TJ", 	 shareCoin = 150, name = "Ng�c S�n Chi Linh Thi�n C�u",},
	[16] = {templete = "tjl_CLBZ", 	 shareCoin = 150, name = "T�y V�c Th��ng Lang B� V��ng",},
	[17] = {templete = "tjl_HL", 	 shareCoin = 150, name = "��o Hoa ��o Ch� Ho�ng Long",},
}

tWBExitPos = {
	{100, 1487, 3020},
	{200, 1366, 2700},
	{300, 1700, 3536},
	{400, 1514, 2851},
	{500, 1859, 3131},
	{150, 1688, 3127},
	{350, 1489, 3027},
}
tWantedBossMAP = {
	
	[0] = {
		realMapID = 8915,
		entryPos = {1591, 3231},
		exitNpcPos = {1602, 3216},
		bossPos = {1592, 3208},
	},
	[1] = {
		realMapID = 8913,
		entryPos = {1601, 3257},
		
		exitNpcPos = {1622, 3224},
		bossPos = {1600, 3220},
	},
	[2] = {
		realMapID = 8914,
		entryPos = {1619, 3218},
		
		exitNpcPos = {1613, 3183},
		bossPos = {1596, 3192},
	},
	[3] = {
		realMapID = 8912,
		entryPos = {1574, 3117},
		
		exitNpcPos = {1579, 3112},
		bossPos = {1564, 3154},
	}
	
}

tFlag = {"Thi�n Ki�u L�nh x1", {2,97,236,1}, 3000, 2}
WB_TSKID_FLAG_SENT = 3573

function wb_player_check()    -- bFlag Ϊ��ʱ����ʾ�Զ����ѡ������ʾ�������أ������ѡ�
    -- c)59������ѧ��55������
    local nLv = GetLevel();
    local nTrans = gf_GetTransCount();
    local level = nTrans*100 + nLv;
	if level < 59 or gf_Check55FullSkill() ~= 1 then 
		return 0;
	end;
    return 1;
end

function finish_current_stage()
	local tCurPhase = this.msPhases[1]:getCurPhase();
	tCurPhase:onFinish();
end

function wb_mission_failed()
	CloseMission(this.missionID);
end

function wb_check_date()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= WB_BEGIN_DATE.ymd and nDate <= WB_END_DATE.ymd then
		return 1;
	end
	return 0;
end

function wb_check_time()
	local nTime = tonumber(date("%H%M"))
	if nTime >= WB_BEGIN_TIME and nTime <= WB_END_TIME then
		return 1;
	end
	return 0;
end

function wb_check_map()
	local nMap, _, _ = GetWorldPos()
	local tOKMap = {100,200,300,150,350,400,500,}
	local bCheck = 0;
	for i = 1,getn(tOKMap) do
		if nMap == tOKMap[i] then
			bCheck = 1;
			break
		end
	end
	if bCheck == 1 then
		return 1
	end
	
	return 0
end

function wb_CheckActiveTime()
	if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho�t ��ng %s �� k�t th�c!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if wb_check_time() == 0 then
        Say(format("<color=green>%s<color>: C� th� tham gia %s trong th�i gian 8:00-23:00 m�i ng�y, hi�n kh�ng trong th�i gian ho�t ��ng!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
	end
	return 1;
end

WB_STAT_CREATEBOSS 	  = 1
WB_STAT_BOSSDEATH 	  = 2
WB_STAT_ENTERMISSION  = 3
WB_STAT_GETBOUNTY 	  = 4
WB_STAT_ADDEXBOUNTY   = 5
WB_STAT_GETBOUNTY1 	  = 6
WB_STAT_GETBOUNTY3000 = 7
WB_STAT_GETBOUNTY6000 = 8
WB_STAT_BUYITEMLEVEL1 = 9
WB_STAT_BUYITEMLEVEL2 = 10
WB_STAT_BUYITEMLEVEL3 = 11

function wb_runtime_stat(nSubId, nType, nVar)
	AddRuntimeStat(72, nSubId, nType, nVar)
end