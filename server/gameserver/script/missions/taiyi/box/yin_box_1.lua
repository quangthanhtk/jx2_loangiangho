----银宝箱1
--Import("\\script\\lib\\globalfunctions.lua")
--Import("\\script\\lib\\define.lua")
--Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\class\\clause3.lua")
--
--Include("\\script\\missions\\taiyi\\head.lua")
--Include("\\script\\missions\\taiyi\\tyfunctions.lua")
--
--Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--
--MV_WHO_IS_DAYE = tTY.mv_35;
--MV_LOOT_ID = tTY.mv_36;
--LOG_TITLE = "焚天林-太一塔";
--NEED_ROOM = 2;
--OPEN_BOX_NEED = {"天骄令", 2, 97, 236, 1};
--msg = "恭喜$n在焚天林-太一塔中开启宝箱获得$i";
--
--thisFilePath = "\\script\\missions\\taiyi\\box\\yin_box_1.lua"
--
--tAward = {
--	randMulti = 1,
--	subclauses = {
--        {{"小般若树种"	,{2,0,504,1},nil,{7*24*3600}},5000},
--        {{"般若树种"    ,{2,0,398,1},nil,{7*24*3600}},5000},
--        {{"四灵树"    	,{2,1,30269,1},nil,{7*24*3600}},5000},
--        {{"白驹丸"    	,{2,1,270,1},nil,{7*24*3600}},8000},
--        {{"大白驹丸"    ,{2,1,1007,1},nil,{7*24*3600}},6000},
--        {{"白驹仙丹"    ,{2,1,1008,1},nil,{7*24*3600}},5000},
--        {{"大人参果"    ,{2,0,553,1},nil,{7*24*3600}},5000},
--        {{"英雄勋章"    ,{2,1,30499,1,4}},20000},
--        {{"英雄勋章"    ,{2,1,30499,2,4}},7000},
--        {{"英雄勋章"    ,{2,1,30499,4,4}},800},
--        {{"英雄勋章"    ,{2,1,30499,10,4}},200},
--        {{"太一令"    	,{2,1,30687,1,4},msg},0},
--        {{"太一令"    	,{2,1,30687,2,4},msg},0},
--        {{"太一令"    	,{2,1,30687,4,4},msg},0},
--				{{"炎灵丝"			,{2,1,30671,1}},10000},
--				{{"魔狼皮"			,{2,1,30672,1}},10000},
--				{{"地龙皮"			,{2,1,30673,1}},10000},
--				{{"指定体型灵徒头" , "gf_RandLingTu(1, 1)", thisFilePath},1000},
--				{{"指定体型灵徒衣" , "gf_RandLingTu(2, 1)", thisFilePath},1000},
--				{{"指定体型灵徒裤" , "gf_RandLingTu(3, 1)", thisFilePath},1000},
--	},
--	giveClause = ClauseRandom.giveClause,
--	give = ClauseRandom.giveClause,
--}
--
--function main()
--	local npcIdx = GetTargetNpc();
--	if GetMissionV(MV_WHO_IS_DAYE) == 0 then
--		Say("开启[银宝箱]需要1个[天骄令]（商城有售）。",
--			2,
--			"\n确认开启/#IamDaye("..npcIdx..")",
--			"\n取消开启/nothing");
--		return
--	else
--		speLoot(npcIdx);
--	end
--end
--
--function IamDaye(npcIdx)
--	local daye = GetMissionV(MV_WHO_IS_DAYE);
--
--	if 0 ~= daye then
--		Talk(1, "", "已经有人开此箱子了");
--		return 0;
--	end
--
--	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
--		SetMissionV(MV_WHO_IS_DAYE, PlayerIndex);
--		speLoot(npcIdx);
--		AddRuntimeStat(18, 5, GetMissionV(2)-1, (OPEN_BOX_NEED[5] or 1));
--		
--		local tClause = getLootSeting();
--		local nLootItemId = GetMissionV(MV_LOOT_ID);
--		if nLootItemId > 0 and nLootItemId <= getn(tClause) then
--			local tItem = tClause[nLootItemId][1];
--			if tItem and type(tItem) == "table" then
--				if tItem[1] == "炎灵丝" then
--					AddRuntimeStat(18, 44, 0, 1);
--				elseif tItem[1] == "魔狼皮" then
--					AddRuntimeStat(18, 45, 0, 1);
--				elseif tItem[1] == "地龙皮" then
--					AddRuntimeStat(18, 46, 0, 1);
--				elseif tItem[1] == "太一令" then
--					AddRuntimeStat(18, 47, 0, 1);
--				end
--			end
--		end
--		
--		--cdkey
--		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_SetCostIB(%d)", OPEN_BOX_NEED[5]));	
--		vaf_award_api("tTYTYinBox")
--	else
--		Talk(1, "", "你身上没有[天骄令]，不能开启<color=green>银宝箱<color>。[天骄令]可以从<color=yellow>商城<color>购买");
--	end
--end
--
--function getLootSeting()
--	return tAward.subclauses;
--end
--
--function getLootItem()
--	local tClause = getLootSeting();
--
--	local nMax = 0;
--	for i = 1, getn(tClause) do
--		nMax = nMax + tClause[i][2];
--	end
--	local rnd = random(1, nMax);
--	for i = 1, getn(tClause) do
--		rnd = rnd - tClause[i][2];
--		if rnd <= 0 then
--			return i, tClause[i][1];
--		end
--	end
--	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
--	assert();
--end
--
--function speLoot(npcIdx)
--	local daye = GetMissionV(MV_WHO_IS_DAYE);
--	if daye == 0 then
--		return 0;
--	end
--	local tSel = {
--			"结束对话/nothing",
--		}
--	local OldPlayerIndex = PlayerIndex;
--	if daye == PlayerIndex then
--		local player_name = ""
--		for i = 1,GetTeamSize() do
--			PlayerIndex = GetTeamMember(i);
--			if PlayerIndex ~= OldPlayerIndex then
--				player_name = GetName();
--				player_name = zgc_pub_name_replace(player_name,"/","-");
--				player_name = zgc_pub_name_replace(player_name,"|","-");
--				player_name = zgc_pub_name_replace(player_name,":","-");
--				tinsert(tSel, 1, "我要把奖励分配给"..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
--			end
--		end
--		PlayerIndex = OldPlayerIndex;
--		tinsert(tSel, 1, "我要拾取奖励/#lootAward("..PlayerIndex..","..npcIdx..")");
--	end
--
--
--	local nLootItemId = GetMissionV(MV_LOOT_ID);
--	if nLootItemId == 0 then
--		nLootItemId = getLootItem();
--		SetMissionV(MV_LOOT_ID, nLootItemId);
--	end
--
--	local tClause = getLootSeting();
--	local tLootItem = tClause[nLootItemId][1];
--	local nCount = 1;
--	if tLootItem[2] and type(tLootItem[2]) == "table" then
--		nCount = tLootItem[2][4];
--	end
--	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
--	Say("<color=green>宝箱<color>: 这里有"..msg, getn(tSel), tSel);
--end
--
--function lootAwardOther(player_index, box_index)
--	local player_index_save = PlayerIndex
--	--判断该索引是否还是在该队伍中
--	local index_chg_chk_flag = 0
--	local team_size = GetTeamSize()
--	if team_size ~= 0 then
--		index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
--	else
--		index_chg_chk_flag = 1
--	end
--	if index_chg_chk_flag ~= 1 then
--		Talk(1,"","<color=green>提示<color>：请重新检查您要分配的对象是否在您的<color=yellow>队伍<color>中！")
--		return
--	end
--	--分配对象的空间负重检测
--	PlayerIndex = player_index
--	local s_palyer_name = GetName()
--	if GetFreeItemRoom()  < NEED_ROOM then
--		Talk(1,"","<color=green>提示<color>：您的<color=yellow>包裹<color>空间不足！")
--		PlayerIndex = player_index_save
--		Talk(1,"","<color=green>提示<color>：<color=green>"..s_palyer_name.."<color>的<color=yellow>包裹<color>空间不足，无法进行分配！")
--		return
--	end
--
--	PlayerIndex = player_index_save
--	lootAward(player_index, box_index)
--end
--
--function lootAward(player_index, box_index)
--	local player_index_save = PlayerIndex
--
--	PlayerIndex = player_index;
--	if gf_JudgeRoomWeight(NEED_ROOM, 100, "") ~= 1 then return end
--	PlayerIndex = player_index_save;
--
--	local nLootItemId = GetMissionV(MV_LOOT_ID);
--	if nLootItemId == 0 then
--		nLootItemId = getLootItem();
--	end
--	local tLoot = getLootSeting()[nLootItemId][1];
--	SetMissionV(MV_LOOT_ID, 0);
--	SetMissionV(MV_WHO_IS_DAYE, 0);
--	SetNpcLifeTime(box_index, 0);
--	PlayerIndex = player_index;
--	gf_SetLogCaption(LOG_TITLE);
--	Clause3.giveClause(tLoot);
--	gf_SetLogCaption("");
--	
--	PlayerIndex = player_index_save;
--end