Include("\\script\\function\\world_boss\\wb_define.lua")
Include("\\script\\lib\\date.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task_access_code_def.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\online_activites\\award.lua");

----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\fix\\fix_clone_pk_boss.lua");
----------------------------------------------------------------------------------------------------

function wb_RelayCallCreateBoss(nRandSeed)
	--ÊÇ·ñ¹Ø±Õ
	if not WB_SWITCH or WB_SWITCH ~= 1 then
		return
	end
	--Ã¿ÖÜÁùÖÜÈÕË¢ÐÂ
	--local today = Date();
	--local wDay = today:week();
	--if wDay ~= 6 and wDay ~= 0 then
	--	return
	--end
	if not nRandSeed then
		return
	end
	randomseed(nRandSeed)
	local nIndex = random(getn(WB_WORLD_BOSS));
	--¹ã²¥
	local msg = format("Theo t×nh b¸o, %s hiÖn ®ang xuÊt hiÖn ë b¶n ®å %s, c¸c hiÖp sÜ h·y ®Õn ®ã xem thö.", WB_WORLD_BOSS[nIndex][2], WB_WORLD_BOSS_MAP[nIndex]);
	Msg2Global(msg);
	AddLocalNews(msg);
	Msg2Global(WB_WORLD_BOSS_INFO[nIndex]);
	AddLocalNews(WB_WORLD_BOSS_INFO[nIndex]);
	--µØÍ¼ÔÚÄÄ¸öGSÉÏ
	if SubWorldID2Idx(WB_WORLD_BOSS_POS[nIndex][1][1]) == -1 then
		return
	end
	--¿ªË¢
	local nPosIndex = random(getn(WB_WORLD_BOSS_POS[nIndex]));
	local tPos = WB_WORLD_BOSS_POS[nIndex][nPosIndex];
	if not tPos or getn(tPos) ~= 3 then return end
	local npcIndex = CreateNpc(WB_WORLD_BOSS[nIndex][1], WB_WORLD_BOSS[nIndex][2], tPos[1], tPos[2], tPos[3]);
	if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");
		SetNpcLifeTime(npcIndex, 20 * 60);
		
		_w_fix_ClonePk_OpenFreePk(tPos[1]); --Fix clone c©u tkt
	end
end

function wb_MatchNpc(szName)
	for k, v in WB_WORLD_BOSS do
		if getn(v) == 2 and v[2] == szName then
			return k;
		end
	end
	return -1;
end

function wb_GetBossName()
	for k, v in WB_WORLD_BOSS do
		if type(v) == "table" and getn(v) == 2 then
			if GetToNpcDamageByName(v[2]) > 0 then
				return v[2];
			end
		end		
	end	
	return nil
end

function wb_GetBossMapId()
	for i = 1, getn(WB_WORLD_BOSS) do
		if type(WB_WORLD_BOSS[i]) == "table" and getn(WB_WORLD_BOSS[i]) == 2 then
			if GetToNpcDamageByName(WB_WORLD_BOSS[i][2]) > 0 then
				return WB_WORLD_BOSS_POS[i][1][1];
			end
		end		
	end	
	return 0;
end

function wb_GetSmallBoxFlag()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 1);
end

function wb_SetSmallBoxFlag()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 1, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end

function wb_GetSmallBoxFlag1()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 2);
end

function wb_SetSmallBoxFlag1()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 2, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end

function wb_GetBigBoxFlag()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 3);
end

function wb_SetBigBoxFlag()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 3, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end

function wb_GetBigBoxIndex()
	return gf_GetMyTaskBit(TASKID_WORLD_BOSS_USE, 4, 31)
end

function wb_SetBigBoxIndex(index)
	gf_SetMyTaskBit(TASKID_WORLD_BOSS_USE, 4, 31, index, TASK_ACCESS_CODE_WORLD_BOSS)
end

function wb_DailyClear()
	SetTask(TASKID_WORLD_BOSS_USE, 0, TASK_ACCESS_CODE_WORLD_BOSS);
end

--»÷É±boss½±Àø
function wb_KillAward()
	gf_Modify("Exp", 8000000);
	gf_AddItemEx2({2, 201, 13,  1 }, "Thiªn V¨n Th¹ch", "BOSS ThÕ Giíi", "Tiªu diÖt BOSS", 1, 1)
	gf_AddItemEx2({2, 1, 30669, 20}, "M¶nh MËt TÞch", "BOSS ThÕ Giíi", "Tiªu diÖt BOSS", 0, 1)
	local msg = format("Chóc Mõng [%s] ®· tiªu diÖt %s, nhËn ®­îc %d kinh nghiÖm, %s*%d", GetName(), wb_GetBossName() or "BOSS", 8000000, "M¶nh MËt TÞch", 20, "Thiªn V¨n Th¹ch", 1);
	Msg2Global(msg);
	AddLocalNews(msg);
end

function wb_SmallBoxAward()
	--LongDaiKa: mod thªm ®iÒu kiÖn yªu cÇu bËt PK
	if g_WCFG_WORLDBOSS.bPkReq == WEnv.TRUE and WPlayer:IsPKState() ~= WEnv.TRUE then
		WNpc:Talk("B¶o r­¬ng cÇn thªm s¸t khÝ, bËt chiÕn ®Êu míi cã thÓ më r­¬ng!", 1);
		return WEnv.RETCODE_ERROR;
	end

	if gf_Judge_Room_Weight(10, 10," ") ~= 1 then
		return 0;
	end
	--LongDaiKa: ®ãng quµ mÆc ®Þnh
	--½±Àø
	--gf_Modify("Exp", 4000000);
	--local tAward = {
	--	{1, 20000, "M¶nh MËt TÞch", {2, 1, 30669, 1, 4}, 0},
	--
	--	{1, 5000, "L­u Kim", {2, 1, 31096, 1, 4}, 0, 0, 0, 1},
	--	{1, 7000, "Da §Þa Long", {2, 1, 30672, 50, 1}, 0},
	--	{1, 7000, "Da Ma Lang", {2, 1, 30673, 50, 1}, 0},
	--	{1, 7000, "Viªm Linh Ti", {2, 1, 30671, 50, 1}, 0},
	--	{1, 7000, "HuyÒn Viªm ThiÕt", {2, 1, 30670, 30, 1}, 0},
	--	{1, 7000, "Tiªn ¢m Th¹ch", {2, 1, 30674, 20, 1}, 0},
	--	{1, 5000, "§ång TÕ Chi NguyÖn", {2, 1, 30913, 1, 1}, 0},
	--	{1, 4999, "§¹i Nh©n s©m", {2, 0, 553, 1, 4}, 0},
	--	{1, 10000, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1, 4}, 0},
	--	{1, 20000, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1, 4}, 0},
	--	{1, 1, "MËt TÞch Tiªu Dao", {0, 112, 224, 1}, 0, 0, 0, 1},
	--}
	--gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "BOSS ThÕ Giíi", "§¹i ChiÕn B¶o H¹p")
	--LongDaiKa: ®ãng quµ mÆc ®Þnh

	WAward:WorldBoss_OpenSmallBox(); --LongDaiKa: chuyÓn phÇn th­ëng vÒ 1 file
	
	--»î¶¯
	vaf_get_prize_item_30709(5, 1);
	AddRuntimeStat(23, 2, 0, 1);
	--²ú³ö°ïÅÉÁîÅÆËéÆ¬
	SendScript2VM("\\script\\function\\honor_tong\\ht_head.lua", "ht_GetTongChip(100, 1)")
	--¸ø»î¶¯½±Àø
	SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tWorldBossBox')");
	--FireEvent("event_mission_box_award", "worldboss", "small", 0)
	return 1;
end

function wb_BigBoxAward()
	local npcIndex = wb_GetBigBoxIndex();
	if GetNpcName(npcIndex) ~= "R­¬ng Vµng §¹i ChiÕn" then
		Msg2Player("§éng t¸c qu¸ chËm, b¶o r­¬ng ®· bÞ ng­êi kh¸c nhÆt mÊt");
		return 0;
	end
	if IsNpcDeath(npcIndex) ~= 0 then
		Msg2Player("§éng t¸c qu¸ chËm, b¶o r­¬ng ®· bÞ ng­êi kh¸c nhÆt mÊt");
		return 0;
	end
	local nMapId = GetWorldPos();
	if nMapId ~= wb_GetBossMapId() then
		Talk(1,"","B¶n ®å hiÖn t¹i kh«ng thÓ më b¶o r­¬ng")
		return 0;
	end
	if IsPlayerDeath() == 1 then
		return 0;
	end

	--LongDaiKa: mod thªm ®iÒu kiÖn yªu cÇu bËt PK
	if g_WCFG_WORLDBOSS.bPkReq == WEnv.TRUE and WPlayer:IsPKState() ~= WEnv.TRUE then
		WNpc:Talk("B¶o r­¬ng cÇn thªm s¸t khÝ, bËt chiÕn ®Êu míi cã thÓ më r­¬ng!", 1);
		return WEnv.RETCODE_ERROR;
	end

	if gf_Judge_Room_Weight(10, 10," ") ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	wb_SetBigBoxFlag();
	--LongDaiKa: ®ãng phÇn th­ëng më r­¬ng mÆc ®Þnh
	----½±Àø
	--gf_Modify("Exp", 10000000);
	--gf_AddItemEx2({2, 1, 30669, 40}, "M¶nh MËt TÞch", "BOSS ThÕ Giíi", "R­¬ng Vµng §¹i ChiÕn", 0, 1);
	--local tAward = {
	--	{1, 140, "L¨ng Ba Vi Bé", {0, 112, 78, 1}, 0},
	--	--{1, 0, "Ê¦ÃÅÕæ¾í°ü¹ü", {2, 1, 30665, 1}, 0},
	--	{1, 150, "MËt TÞch Tiªu Dao Tµn QuyÓn", {0, 112, 225, 1}, 0},
	--	{1, 409, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 3}, 0},
	--	{1, 70, "VÈy Kú L©n", 	 {2, 1, 31064, 1}, 0, 0, 0, 1},
	--	{1, 20, "§ång TÕ Chi NguyÖn",  {2, 1, 30913, 5}, 0},
	--	{1, 100, "§¹i Nh©n s©m", {2, 0, 553, 1}, 0},
	--	{1, 100, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 2}, 0},
	--	{1, 1, "Cæ Kim Th¹ch", {2, 201, 14, 1}, 0},
	--	{1, 10, "MËt TÞch Tiªu Dao", {0, 112, 224, 1}, 0, 0, 0, 1},
	--}
	--gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "BOSS ThÕ Giíi", "R­¬ng Vµng §¹i ChiÕn");
	--LongDaiKa: ®ãng phÇn th­ëng më r­¬ng mÆc ®Þnh

	WAward:WorldBoss_OpenBigBox(); --LongDaiKa: chuyÓn phÇn th­ëng vÒ 1 file
	
	--»î¶¯
	vaf_get_prize_item_30709(10, 1);
	AddRuntimeStat(23, 3, 0, 1);
	--²ú³ö°ïÅÉÁîÅÆËéÆ¬
	SendScript2VM("\\script\\function\\honor_tong\\ht_head.lua", "ht_GetTongChip(100, 5)")
	--¸ø»î¶¯½±Àø
	SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tWorldBossJinBox')");
	--FireEvent("event_mission_box_award", "worldboss", "gold", 0)
	return 1;
end
