Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\class\\ktabfile.lua")

LP_IDENTIFY_INFO = {};
g_bLpInited = 0;

ff_GetTabFileTable([[\settings\item\left_pearl\left_pearl_identify.txt]], 3, {
		tonumber,		--Level
		tostring,		--Name
		tonumber,		--Àà±ð
		tonumber,		--G
		tonumber,		--D
		tonumber,		--P
		tonumber,		--Weight
	}, 
	function(tConfig)
		local nLevel = tConfig[1];
		tConfig.n = nil;
		if not LP_IDENTIFY_INFO[nLevel] then
			LP_IDENTIFY_INFO[nLevel] = {};
		end
		tinsert(LP_IDENTIFY_INFO[nLevel], tConfig);
	end
)
LP_IDENTIFY_INFO.n = nil;

--gf_PrintTable(LP_IDENTIFY_INFO); --///////////////////////////

-- T_ACHI_LEFT_PEARL = {
-- 	[1] = TASKID_LEFT_PEARL_ACHIEVE1, --1¼¶
-- 	[2] = TASKID_LEFT_PEARL_ACHIEVE2,
-- 	[3] = TASKID_LEFT_PEARL_ACHIEVE3,
-- 	[4] = TASKID_LEFT_PEARL_ACHIEVE4,
-- 	[5] = TASKID_LEFT_PEARL_ACHIEVE5,
-- 	[6] = TASKID_LEFT_PEARL_ACHIEVE6,
-- 	[7] = TASKID_LEFT_PEARL_ACHIEVE7, --7¼¶
-- }

T_IDENTIFY_ITEM_INFO_LEVEL = {
	[gf_PackItemGDP(2, 102, 208)] = {1, 1},
	[gf_PackItemGDP(2, 102, 209)] = {2, 1},
	[gf_PackItemGDP(2, 102, 210)] = {3, 1},
	[gf_PackItemGDP(2, 102, 211)] = {4, 1},
	[gf_PackItemGDP(2, 102, 212)] = {5, 1},
	[gf_PackItemGDP(2, 102, 213)] = {6, 1},
	[gf_PackItemGDP(2, 102, 214)] = {7, 1},
	[gf_PackItemGDP(2, 102, 226)] = {8, 1},
	[gf_PackItemGDP(2, 102, 219)] = {1},
	[gf_PackItemGDP(2, 102, 220)] = {2},
	[gf_PackItemGDP(2, 102, 221)] = {3},
	[gf_PackItemGDP(2, 102, 222)] = {4},
	[gf_PackItemGDP(2, 102, 223)] = {5},
	[gf_PackItemGDP(2, 102, 224)] = {6},
	[gf_PackItemGDP(2, 102, 225)] = {7},
	[gf_PackItemGDP(2, 102, 227)] = {8},
}

T_RUNTIME_STATE_KEY = {
	-- = {nMainId, nSubId}
	[gf_PackItemGDP(2, 102, 208)] = {97, 1},
	[gf_PackItemGDP(2, 102, 209)] = {97, 2},
	[gf_PackItemGDP(2, 102, 210)] = {97, 3},
	[gf_PackItemGDP(2, 102, 211)] = {97, 4},
	[gf_PackItemGDP(2, 102, 212)] = {97, 5},
	[gf_PackItemGDP(2, 102, 213)] = {97, 6},
	[gf_PackItemGDP(2, 102, 214)] = {97, 7},
	[gf_PackItemGDP(2, 102, 226)] = {97, 8},
	[gf_PackItemGDP(2, 102, 219)] = {99, 1},
	[gf_PackItemGDP(2, 102, 220)] = {99, 2},
	[gf_PackItemGDP(2, 102, 221)] = {99, 3},
	[gf_PackItemGDP(2, 102, 222)] = {99, 4},
	[gf_PackItemGDP(2, 102, 223)] = {99, 5},
	[gf_PackItemGDP(2, 102, 224)] = {99, 6},
	[gf_PackItemGDP(2, 102, 225)] = {99, 7},
	[gf_PackItemGDP(2, 102, 227)] = {99, 8},
}

function IdentifyLeftPearl(nItemIdx)
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó ®¶m b¶o an toµn tµi s¶n, ®¹i hiÖp h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end

	-- if GetPermission(2) == 0 then 
	-- 	Talk(1, "", "ÓÉÓÚ¸±ÃÜÂëµÇÂ½Î´ÉèÖÃÏà¹ØÈ¨ÏÞÎÞ·¨²Ù×÷");  
	-- 	return 
	-- end

	local g, d, p = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(g, d, p);

	if not T_IDENTIFY_ITEM_INFO_LEVEL[nGDP] then
		Talk(1, "", "VËt phÈm kh«ng thÓ gi¸m ®Þnh Th­¬ng H¶i Ch©u!");
		return 0;
	end

	local tLpLvData = T_IDENTIFY_ITEM_INFO_LEVEL[nGDP]
	local nLpLv = tLpLvData[1];
	--print("nLpLv = ",nLpLv)--//////////////////////////////////// LP_IDENTIFY_INFO[8];
	local tInfo = LP_IDENTIFY_INFO and LP_IDENTIFY_INFO[nLpLv];
	--gf_PrintTable(tInfo);--///////////////////////////

	if not tInfo then
		Talk(1, "", "VËt phÈm nµy kh«ng thÓ gi¸m ®Þnh ra Th­¬ng H¶i Ch©u.");
		return 0;
	end

	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end

	gf_SetLogCaption("[LeftPearl][IdentifyLeftPearl]");

	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		Talk(1, "", "VËt phÈm nµy kh«ng thÓ gi¸m ®Þnh ra Th­¬ng H¶i Ch©u.");
		return 0;
	end

	local tRet = gf_RandRate(tInfo, nil, 7);

	local nBind = tLpLvData[2] and 4 or 1;

	local nRet, nLeftPearlIdx = gf_AddItemEx({tRet[4],tRet[5],tRet[6], 1, nBind}, format("%s(cÊp %d)", tRet[2] or GetItemName(tRet[4],tRet[5],tRet[6]), tRet[1] or nLpLv), 1);
	--print("nLeftPearlIdx = ", nLeftPearlIdx)--//////////////////////////

	if nRet == 1 then
		--print("g,d,p =", tRet[4],tRet[5],tRet[6]);

		-- local nTaskID = T_ACHI_LEFT_PEARL[GetItemLevel(nLeftPearlIdx)] or 0;
		-- if nTaskID ~= 0 then
		-- 	gf_ModifyTask(nTaskID, 1);
		-- 	gf_OnAchEvent(nTaskID);
		-- end
	end

	local nGroupID = LeftPearl_GetGroupIDByGDP(tRet[4],tRet[5],tRet[6]);

	SendScript2VM([[\script\misc\left_pearl\left_pearl.lua]], format("init_left_pearl(%d, %d, %d, %d)", nLeftPearlIdx, GetItemLevel(nLeftPearlIdx), nGroupID, 0));
	gf_SetLogCaption("");

	if T_RUNTIME_STATE_KEY[nGDP] then
		local tStateKey = T_RUNTIME_STATE_KEY[nGDP];
		AddRuntimeStat(tStateKey[1], tStateKey[2], 0, 1);
	end

	return nLeftPearlIdx;
end