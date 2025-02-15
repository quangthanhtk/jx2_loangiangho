Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\missionfunctions.lua");
Import("\\script\\online_activites\\task_values.lua");
Import("\\script\\task_access_code_def.lua")

CR_TEMPLATE = "shengdanxueren";
CR_NAME = "Ngi Tuy誸 p";

SB_START_TIME = {2020, 11, 24, 0, 0, 0}
SB_END_TIME = {2021, 1, 3, 23, 59, 0}

SB_COST = 300000;
SB_MIN_LEVEL = 80;
SB_MAX_EXP = 2000000000;
SB_T_KILL_EXP = {
	["monster1"] = 10000000,
	["monster2"] = 20000000,
	["boss"] 	 = 50000000,
}
SB_MAX_ZHENQI = 10000;
SB_TASK_KEY_ENTRANCE_MAP_INDEX = 2641;
SB_TASK_KEY_EXP_GAINED = 2649;
SB_TASK_KEY_ZHENQI_GAINED = 3110;
SB_TASK_TIME_SEQ = 3280;
SB_TASK_ITEM_LIMIT = 3281;
SB_TASK_GET_NEWYEAR_AWARD=3499 --12-25 1-1领取奖励标志
SB_MISSION_ID = 77;
SB_MISSION_TIMER_ID = 111;
SB_WAVE_TIMER_ID = 83;
SB_TIMER_INTERVAL = 30 * 18;
SB_MISSION_TIMER_COUNT = 60 * 60 * 18 / SB_TIMER_INTERVAL - 1;
SB_WAVE_TIMER_COUNT = 60 * 5 * 18 / SB_TIMER_INTERVAL - 1;
SB_CAMP_ID = 1;
SB_MAX_PLAYER = 100;
SB_MAP_TASK_KEY_STATE = 1;
SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE = 2;
SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX = 3;
SB_MAP_TASK_KEY_ATTACK_BOSS_INDEX = 4;
SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE = 5;
SB_MAP_TASK_KEY_MISSION_TIMER_LOOP = 6;
SB_MAP_TASK_KEY_WAVE_TIMER_LOOP = 7;
SB_MAP_TASK_KEY_WAVE_TIMEOUT = 8;

SB_MONSTER_WAVE_THRESHOLD = 10;
SB_MAX_TIME = 60 * 60 * 18;

SB_MonsterSpawnPointList = 
{
	{1729, 3354},
	{1759, 3275},
	{1818, 3291},
	{1822, 3399},
	{1795, 3527},
	{1753, 3592},
	{1689, 3562},
	{1696, 3461},
	{1670, 3373},
	{1728, 3362}
};

SB_BossSpawnPoint = 
{
	1756, 
	3427
}

SB_CarterSpawnPointList = 
{
	{1665, 3652},
	{1665, 3224},
	{1857, 3226},
	{1856, 3652},
}

SB_DIALOG_BOSS_TEMPLATE = "BOSS tuy誸 y猽 i tho筰";
SB_DIALOG_BOSS_NAME = "Thi猲 S琻 Tuy誸 Y猽";
SB_ATTACK_BOSS_TEMPLATE = "BOSS tuy誸 y猽 chi課 u";
SB_ATTACK_BOSS_NAME = "Thi猲 S琻 Tuy誸 Y猽";
SB_MONSTER1_TEMPLATE = "Tuy誸 qu竔 1";
SB_MONSTER1_NAME = "Ti觰 Tuy誸 Qu竔";
SB_MONSTER1_COUNT = 20;
SB_MONSTER2_TEMPLATE = "Tuy誸 qu竔 3";
SB_MONSTER2_NAME = "Чi Tuy誸 Qu竔";
SB_MONSTER2_COUNT = 4;
SB_MONSTER_COUNT_PER_WAVE = getn(SB_MonsterSpawnPointList) * (SB_MONSTER1_COUNT+SB_MONSTER2_COUNT)

SB_ExitSpawnPoint = {
	[100] = {100, 1414, 3007},
	[200] = {200, 1372, 2897},
	[300] = {300, 1752, 3560},
};

SB_MapList = 
{
	961,
	962,
	963,
}

SB_MapMap = 
{
	[100] = SB_MapList[1],
	[200] = SB_MapList[2],
	[300] = SB_MapList[3],
};

SB_SkillList = 
{
	30001,
	30002,
	30003,
	30004,
	30005,
	30006,
	30007,
	30008,
	30009
};

SB_PlayerSpawnPointList = 
{
	{1859,3230},
	{1664,3654},
	{1664,3229},
	{1854,3654}
};

function CreateNpcOnlyEffectBySnowBattleSkill(tmp, name, m, x, y)
	local npcIndex = CreateNpc(tmp, name, m, x, y);
	CastState2Npc(npcIndex, "state_specified_skill_effect",	4, 18*60*60, 0, 2123);
	CastState2Npc(npcIndex, "state_ignore_poison_damage",	100, 18*60*60, 0, 2124);
	return npcIndex;
end

function SB_SnowBattleNpcCreate()
	if gf_CheckDuration(SB_START_TIME, SB_END_TIME) == 1 then
		local SB_CarterPositions = {
			{100, 1414, 3007},
			{200, 1372, 2897},
			{300, 1752, 3560},
		}
		for i=1, getn(SB_CarterPositions) do
			local npcIndex = CreateNpcOnlyEffectBySnowBattleSkill(CR_TEMPLATE, CR_NAME, SB_CarterPositions[i][1], SB_CarterPositions[i][2], SB_CarterPositions[i][3]);
			SetNpcScript(npcIndex, "\\script\\online\\snowbattle\\npc\\carter.lua");
		end
		local SB_CarterPositions2 = {
			{150, 1703, 3160},
			{350, 1427, 3009},
			{500, 1742, 3161},
		}
		for i=1, getn(SB_CarterPositions2) do
			local npcIndex = CreateNpcOnlyEffectBySnowBattleSkill(CR_TEMPLATE, CR_NAME, SB_CarterPositions2[i][1], SB_CarterPositions2[i][2], SB_CarterPositions2[i][3]);
			SetNpcScript(npcIndex, "\\script\\online\\snowbattle\\npc\\carter_helper.lua");
		end
	end
end

function SB_HandleExp(exp, zqValue)
	--小怪给经验
	local expGained = GetTask(SB_TASK_KEY_EXP_GAINED);
	if expGained < SB_MAX_EXP then
		local realExp = exp;
		if exp + expGained >= SB_MAX_EXP then
			realExp = SB_MAX_EXP - expGained;
		end
		ModifyExp(realExp);
		SetTask(SB_TASK_KEY_EXP_GAINED, GetTask(SB_TASK_KEY_EXP_GAINED)+realExp);
	else
		Msg2Player("S� lng qu竔 ti猽 di謙 qu竔 nh� trong tr薾 n祔  t gi韎 h筺, kh玭g th� nh薾 th猰 甶觤 kinh nghi謒 khi ti猽 di謙 qu竔 nh�");
	end
	--给予真气
	local zqGained = GetTask(SB_TASK_KEY_ZHENQI_GAINED);
	if zqGained < SB_MAX_ZHENQI then
		local realZQ = zqValue;
		if zqValue + zqGained >= SB_MAX_ZHENQI then
			realZQ = SB_MAX_ZHENQI - zqGained;
		end
		AwardGenuineQi(realZQ);
		SetTask(SB_TASK_KEY_ZHENQI_GAINED, zqGained + realZQ, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN);
	else
		Msg2Player("S� lng ch﹏ kh� khi di謙 qu竔 nh薾 頲 trong tr薾 n祔 c馻 c竎 h�  t gi韎 h筺, kh玭g th� nh薾 th猰 ch﹏ kh� khi gi誸 qu竔");
	end
end

function SB_HandleRandItem()
	-- local tAward = {
	-- 	[1] = {1, 20, {2,1,30747,1}, "圣诞装饰品"},
	-- 	[2] = {1, 20, {2,1,30683,1}, "雷炎石"},
	-- 	[3] = {31, 60, "nothing()", 1},
	-- }
	-- local nIndex = gf_GetRandItemByTable(tAward, 100, 1);
	-- if nIndex == 1 then
	-- 	if gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 1, 2) >= 200 then
	-- 		return 0;
	-- 	end
	-- 	gf_AddItemEx2(tAward[nIndex][3], tAward[nIndex][4], "打雪仗", "小雪怪", 0, 1)
	-- 	gf_SetMyTaskByte(SB_TASK_ITEM_LIMIT, 1, 2, gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 1, 2) + 1, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN)
	-- elseif nIndex == 2 then
	-- 	if gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 3, 4) >= 200 then
	-- 		return 0;
	-- 	end
	-- 	gf_AddItemEx2(tAward[nIndex][3], tAward[nIndex][4], "打雪仗", "小雪怪", 0, 1)
	-- 	gf_SetMyTaskByte(SB_TASK_ITEM_LIMIT, 3, 3, gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 3, 3) + 1, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN)
	-- end
	local szAward = "sb_monster";
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then return 0 end
	if CustomAwardGiveGroup(szAward, 0) > 0 then   --二号参数为是否给予全部奖励
        return 1
	end
end

function SB_HandleBothItem()
	if gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 1, 2) < 200 then
		gf_AddItemEx2({2,1,30747,1}, "H閜 Trang Tr� Gi竛g Sinh", "Цnh tr薾 tuy誸", "Ti觰 Tuy誸 Qu竔", 0, 1)
		gf_SetMyTaskByte(SB_TASK_ITEM_LIMIT, 1, 2, gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 1, 2) + 1, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN)
	end
	if gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 3, 4) < 200 then
		gf_AddItemEx2({2,1,30683,1}, "L玦 Vi猰 Th筩h", "Цnh tr薾 tuy誸", "Ti觰 Tuy誸 Qu竔", 0, 1)
		gf_SetMyTaskByte(SB_TASK_ITEM_LIMIT, 3, 4, gf_GetMyTaskByte(SB_TASK_ITEM_LIMIT, 3, 4) + 1, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN)
	end
end

function SB_IsInSnowMap()
	local mapID = GetWorldPos()
	local result = 0;
	for i=1, getn(SB_MapList) do
		if mapID == SB_MapList[i] then
			result = 1;
			break;
		end
	end
	return result;
end

function SB_GetMonsterWave(mapID)
	return mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, mapID);
end

function SB_IsMonsterWaveKilled(mapID)
	local killedCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, mapID);
	if killedCount >= SB_MONSTER_COUNT_PER_WAVE then
		return 1;
	else
		return 0;
	end
end

function SB_IsMonsterWaveTimeout(mapID)
	if 1 == mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, mapID) then
		return 1;
	else
		return 0;
	end
end

function SB_LearnSkill()
	for i=1, getn(SB_SkillList) do
		--WriteLog("SB_LearnSkill::skillID: "..SB_SkillList[i])
		LearnSkill(SB_SkillList[i]);
	end
end

function SB_SetState()
	StallEnable(0);
	SetPKFlag(2,1);
	ForbidChangePK(1);
	LeaveTeam();
	ForbidRead(1); -- 下线会清除
	SetCreateTeam(1);
	
	--角色A（不是邪侠）在城里和角色B（邪侠）切磋，B（邪侠）用引魂咒让尸体攻击A，然后A，B都进入雪球场（雪球大战活动场地），此时B的引魂咒效果仍然在A身上生效，尸体仍然跟随并攻击A，尸体的伤害aoe到场地的怪身上
	RemoveRevivalAttackTarget(); -- 清楚引魂咒后，已经有仇恨目标的尸体还是会持续攻击目标，因此再这里还需要清楚尸体的目标
	RemvoeTempEffect();
	CleanInteractive();
	if GetTime() - GetTask(SB_TASK_TIME_SEQ) > 3600 then
		SetTask(SB_TASK_KEY_EXP_GAINED, 0);
		SetTask(SB_TASK_KEY_ZHENQI_GAINED, 0, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN);
		SetTask(SB_TASK_ITEM_LIMIT, 0, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN);
		SetTask(SB_TASK_TIME_SEQ, GetTime(), TASK_ACCESS_CODE_CHRISTMASSNOWDOWN)
	end
	local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
	if bOk == 1 then
		ChangeModel2WorkingPet();
	end
	ForbitChangeModel(1);
end

function SB_ResetState()
	--WriteLog("SB_ResetState::GetName(): "..GetName());
	ForbidChangePK(0);		
	SetFightState(0);		
	SetPKFlag(0, 0);
	ForbitTrade(0);
	SetCreateTeam(0);
	InteractiveEnable(1);
	for i=1, getn(SB_SkillList) do
		--WriteLog("SB_ResetState::skillID: "..SB_SkillList[i]);
		if 1 == HaveLearnedSkill(SB_SkillList[i]) then
			RemoveSkill(SB_SkillList[i])
		end;
	end
	ForbitChangeModel(0); --容许pet变身
end

function SB_CheckEquipment()
	local result = 1;
	tForbid = {
		2,--武器
		20,--令牌
	}
	for i=1,getn(tForbid) do
		local nPart = tForbid[i]
		local genre, detail, particular = GetPlayerEquipInfo(nPart);
		if genre ~= 0 or detail ~= 0 or particular ~= 0 then
			result = 0;
			break;
		end
	end
	return result;
end

function SB_CheckPlayerCount(mapID)
	local playerCount = mf_GetPlayerCount(SB_MISSION_ID, SB_CAMP_ID, mapID);
	if SB_MAX_PLAYER <= playerCount then
		return 0
	else
		return 1
	end
end

function SB_CheckState(mapID)
	--WriteLog("SB_CheckState::mapID: "..mapID);
	if 1 == mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, mapID) then
		return 1;
	else
		return 0;
	end
end

function SB_LockEquipment(lock)
	local equipPositions = {0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28};
	for i=1,getn(equipPositions) do
		ForbidEquipSolt(equipPositions[i], lock);
		EnableEquipAttr(equipPositions[i], 1-lock) --强制让锁定的装备失效，非锁定的装备生效
	end;
	local limitSkillList = {30001, 30002, 30003, 30004, 30005, 30006, 30007, 30008, 30009}
	for i=1,getn(limitSkillList) do
		skillId = limitSkillList[i]
		if 1 == lock then
			--UnBlockSkill(skillId);
			LimitSkill(skillId);
		else
			--BlockSkill(skillId);
			UnLimitSkill(skillId);
		end
	end
	if lock == 0 then
		VerifyEquip()--再检查一次是否有穿戴失效的装备
	end
end;

function SB_OnEntered()
	SB_SetState();
	SB_LearnSkill();
	SB_LockEquipment(1);
end

function SB_Join()
	local mapID = GetWorldPos();
	local enterMapID = SB_MapMap[mapID];
	if 1 == Pay(SB_COST) then
		local itemID = {2, 3, 219, 10};
		local itemName = "Ti觰 tuy誸 c莡";
		gf_AddItemEx2(itemID, itemName, "Цnh tr薾 tuy誸", "application gift");
		local nIndex = random(1, getn(SB_PlayerSpawnPointList))
		local spawnPoint = SB_PlayerSpawnPointList[nIndex];
		CleanInteractive();
		if 1 == NewWorld(enterMapID, spawnPoint[1], spawnPoint[2]) then
			AddMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
			--WriteLog("SB_Enter::GetMSPlayerCount("..SB_MISSION_ID..", "..SB_CAMP_ID.."): "..GetMSPlayerCount(SB_MISSION_ID, SB_CAMP_ID));
			SetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX, mapID);
			SetTempRevPos(enterMapID, spawnPoint[1]*32, spawnPoint[2]*32);
			SetDeathScript("\\script\\online\\snowbattle\\player_death.lua");
			SB_OnEntered();
		end
	end
end

function SB_Leave()
	local entranceMapIndex = GetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX);
	if 0 == entranceMapIndex then
		entranceMapIndex = 1;
	end
	local exitSpawnPoint = SB_ExitSpawnPoint[entranceMapIndex];
	if 1 == NewWorld(exitSpawnPoint[1], exitSpawnPoint[2], exitSpawnPoint[3]) then
		SB_ResetState();
		SB_LockEquipment(0);
	end
end

function SB_Announce()
	AddGlobalNews("Thi猲 S琻 Tuy誸 Y猽 d蒼 theo ti觰 qu竔  xu蕋 hi謓 t筰 u Trng Tuy誸 i n竜 linh nh, c竎 v� anh h飊g hao ki謙 h穣 nhanh ch鉵g n t譵 Xa Phu u Trng Tuy誸 t筰 Th祅h Й, Bi謓 Kinh v� Tuy襫 Ch﹗  chuy觧 v祇 u trng tuy誸 thu ph鬰 b鋘 ch髇g");	
end

function SB_OnPlayerLogin()
	if gf_CheckDuration(SB_START_TIME, SB_END_TIME) == 1 then
		SB_ResetState();
	end
end

function main()
	if gf_CheckDuration(SB_START_TIME, SB_END_TIME) == 1 then
		SB_Start();
	end
end

function SB_Start()
	for i=1, getn(SB_MapList) do
		ClearMapNpc(SB_MapList[i], 1);
		mf_OpenMission(SB_MISSION_ID, SB_MapList[i]);
	end;
	SB_Announce();
end

function SB_OnMissionTimer()
	--WriteLog("SB_OnTimer::SB_MAP_TASK_KEY_MISSION_TIMER_LOOP: "..SB_MAP_TASK_KEY_MISSION_TIMER_LOOP);
	local mapID = SubWorldIdx2ID(SubWorld);
	local loopCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, mapID);
	--WriteLog("SB_OnTimer::loopCount: "..loopCount);
	if 0 == loopCount then
		CloseMission(SB_MISSION_ID);
	else
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, loopCount-1, mapID);
	end
end

function SB_OnWaveTimer()
	local mapID = SubWorldIdx2ID(SubWorld);
	local loopCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, mapID);
	--WriteLog("SB_OnWaveTimer::loopCount: "..loopCount);	
	if 0 == loopCount then
		--WriteLog("SB_OnWaveTimer::timeout");
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, 1, mapID);
	else
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, loopCount-1, mapID);
	end
end

function SB_SpawnMonsters(mapID, x, y, monsterTemplate, monsterName, deathScript, monsterCount)
	--WriteLog("SB_SpawnMonsters::mapID: "..mapID);
	--WriteLog("SB_SpawnMonsters:: x: "..x..", y: "..y..", monsterTemplate: "..monsterTemplate..", monsterName: "..monsterName..", deathScript: "..deathScript);
	--WriteLog("SB_SpawnMonsters::monsterCount: "..monsterCount);
	for j=1, monsterCount do
		local deltaX = random(-5, 5);
		local deltaY = random(-5, 5);
		local npcIndex = CreateNpcOnlyEffectBySnowBattleSkill(monsterTemplate, monsterName, mapID, x+deltaX, y+deltaY); 
		if deathScript ~= "" then
			SetNpcDeathScript(npcIndex, deathScript);
		end
	end	
end

function SB_SpawnWaveMonsters(mapID)
	local nMonsterWave = SB_GetMonsterWave(mapID);
	if nMonsterWave >= SB_MONSTER_WAVE_THRESHOLD then
		return
	elseif nMonsterWave ~= 0 and SB_IsMonsterWaveKilled(mapID) ~= 1 and SB_IsMonsterWaveTimeout(mapID) ~= 1 then
		return
	end
	--WriteLog("SB_SpawnWaveMonsters::mapID: "..mapID);
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == SB_MONSTER1_NAME or npcName == SB_MONSTER2_NAME then
			SetNpcLifeTime(npcIndices[i], 0);
		end
	end	

	for i=1, getn(SB_MonsterSpawnPointList) do
		SB_SpawnMonsters(mapID, SB_MonsterSpawnPointList[i][1], SB_MonsterSpawnPointList[i][2], SB_MONSTER1_TEMPLATE, SB_MONSTER1_NAME, "\\script\\online\\snowbattle\\npc\\monster1_death.lua", SB_MONSTER1_COUNT);
		SB_SpawnMonsters(mapID, SB_MonsterSpawnPointList[i][1], SB_MonsterSpawnPointList[i][2], SB_MONSTER2_TEMPLATE, SB_MONSTER2_NAME, "\\script\\online\\snowbattle\\npc\\monster2_death.lua", SB_MONSTER2_COUNT);
	end
	local monsterWave = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, mapID);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, monsterWave+1, mapID);
	--WriteLog("SB_SpawnWaveMonsters::monsterWave: "..monsterWave+1);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, 0, mapID);
	StopMissionTimer(SB_MISSION_ID, SB_WAVE_TIMER_ID);
	StartMissionTimer(SB_MISSION_ID, SB_WAVE_TIMER_ID, SB_TIMER_INTERVAL);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, SB_WAVE_TIMER_COUNT, mapID);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, 0, mapID);
	Msg2MSAll(SB_MISSION_ID, "Tuy誸 qu竔 xu蕋 hi謓, c竎 v� i hi謕 h穣 nhanh ch鉵g ti猽 di謙 ch髇g");
end

function SB_SpawnBoss()
	local mapID = SubWorldIdx2ID(SubWorld);
	local dialogBossIndex = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, mapID);
	if 0 == dialogBossIndex then --avoid more click
		return 0
	end
	SetNpcLifeTime(dialogBossIndex, 0);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, 0, mapID);
	local attackBossIndex = CreateNpcOnlyEffectBySnowBattleSkill(SB_ATTACK_BOSS_TEMPLATE, SB_ATTACK_BOSS_NAME, mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
	SetNpcDeathScript(attackBossIndex, "\\script\\online\\snowbattle\\npc\\attack_boss_death.lua");
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_ATTACK_BOSS_INDEX, attackBossIndex, mapID);
end

function SB_OnMonsterDied()
	--WriteLog("SB_OnMonsterDied::called");
	local mapID = SubWorldIdx2ID(SubWorld);
	local killedCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, mapID);
	killedCount = killedCount + 1;
	--WriteLog("SB_OnMonsterDied::mapID: "..mapID..", killedCount: "..killedCount);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, killedCount, mapID);
	--WriteLog("SB_OnMonsterDied::SB_MISSION_ID: "..SB_MISSION_ID..", SB_CAMP_ID: "..SB_CAMP_ID..", SB_MONSTER_COUNT_PER_WAVE: "..SB_MONSTER_COUNT_PER_WAVE);
	--WriteLog("SB_OnMonsterDied::GetMSPlayerCount("..SB_MISSION_ID..", "..SB_CAMP_ID.."): "..GetMSPlayerCount(SB_MISSION_ID, SB_CAMP_ID));
	Msg2MSGroup(SB_MISSION_ID, "Qu竔 v藅  b� ti猽 di謙"..killedCount.."/"..SB_MONSTER_COUNT_PER_WAVE..")", SB_CAMP_ID);
	if killedCount >= SB_MONSTER_COUNT_PER_WAVE then
		Msg2MSAll(SB_MISSION_ID, "Qu竔 v藅  b� ti猽 di謙 to祅 b�, c� th� khi猽 chi課 t qu竔 ti衟 theo");
	end
end

function SB_OnBossDied()
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, 0, mapID);
	StopMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID);
	CloseMission(SB_MISSION_ID);
end

function SB_Init()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_Init::SubWorld: "..SubWorld..", mapID: "..mapID);
	--WriteLog("SB_Init::test1");		
	local npcIndex = CreateNpcOnlyEffectBySnowBattleSkill(SB_DIALOG_BOSS_TEMPLATE, SB_DIALOG_BOSS_NAME, mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
	--WriteLog("SB_Init::npcIndex: "..npcIndex);		
	SetNpcScript(npcIndex, "\\script\\online\\snowbattle\\npc\\dialog_boss.lua");
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, npcIndex, mapID);	
	
	for i=1, getn(SB_CarterSpawnPointList) do
		npcIndex = CreateNpcOnlyEffectBySnowBattleSkill(CR_TEMPLATE, CR_NAME, mapID, SB_CarterSpawnPointList[i][1], SB_CarterSpawnPointList[i][2]);
		SetNpcScript(npcIndex, "\\script\\online\\snowbattle\\npc\\carter.lua");
	end
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, 1, mapID);
	--WriteLog("SB_Init::SB_CheckState("..mapID.."): "..SB_CheckState(mapID));
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, 0, mapID);
	StartMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID, SB_TIMER_INTERVAL);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, SB_MISSION_TIMER_COUNT, mapID);
	RunMission(SB_MISSION_ID);
end

function SB_DeleteAllPlayers()
	local playerIndices = mf_GetMSPlayerIndex(SB_MISSION_ID,0);
	local oldPlayerIndex = PlayerIndex;
	for i=1,getn(playerIndices) do
		PlayerIndex = playerIndices[i];
		if PlayerIndex > 0 then
			DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
		end
	end;
	PlayerIndex = oldPlayerIndex;
end;

function SB_End()
	SB_DeleteAllPlayers();
	StopMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID);
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_End::SubWorld: "..SubWorld..", mapID: "..mapID);
	ClearMapNpc(mapID, 0);
	mf_ClearMissionData(mapID);
end

function SB_TestKillAll()
	--WriteLog("SB_TestKillAll::called");
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == "Ti觰 Tuy誸 Qu竔" or npcName == "Чi Tuy誸 Qu竔" then
			Death(npcIndices[i]);
		end
	end
end

function SB_TestGoBoss()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_TestGoBoss::mapID: "..mapID);
	NewWorld(mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
end

function SB_TestGoCarter()
	SB_Leave();
end

function SB_TestSetMonsterWave(wave)
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, wave, mapID);
end

function SB_TestSetMonsterKilled(killedCount)
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, killedCount, mapID);
end

function SB_TestKillBoss()
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == SB_ATTACK_BOSS_NAME then
			Death(npcIndices[i]);
		end
	end	
end

function SB_Test1()
	SB_TestSetMonsterWave(10);
	SB_TestSetMonsterKilled(264);
end