Import("\\script\\lib\\subdata.lua")
Import("\\script\\class\\ktabfile.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")


--Id thuéc tİnh cña Th­¬ng H¶i Ch©u sÏ ®­îc update
g_tLpAttrIDByOldVersion = {
	--[Sè phiªn b¶n cò] = {ID thuéc tİnh ch©u 1,ID thuéc tİnh ch©u  2, ... },
	[1] = {17,18,19,20,57,60,61,77,78},
}

--C©u h×nh sè thuéc tİnh phô cña Th­¬ng H¶i Ch©u
g_tLevelAttrCount = {
	[1] = 0, --Di ch©u cÊp 1
	[2] = 0, --CÊp 2
	[3] = 1,
	[4] = 2,
	[5] = 2,
	[6] = 3,
	[7] = 4,
	[8] = 4,
};

T_RUNTIME_STATE_KEY = {
	-- = {nMainId, nSubId}
	["quench_cost1"] = {98, 1},
	["quench_num"] = {100, 1},
}

function get_attr_list(strAttr)
	local tStrAttr = {};
	local tNumAttr = {};
	
	tStrAttr = split(strAttr, "|");
	
	for i = 1, getn(tStrAttr) do
		tNumAttr[i] = MagicAttrStr2Idx(tStrAttr[i]);
	end
	
	return tNumAttr;
end

-- ½âÎö:1~10:1;1~10:1|1~10:1;1~10:1
-- ×îĞ¡Öµ[~×î´óÖµ][:Á£¶È]
function get_value_list(strAttr)
	if strAttr == "" then
		return {};
	end
	
	local tTempList = split(strAttr, "|")
	
	local tRet = {};
	for i = 1, getn(tTempList) do
		local szExp = tTempList[i];
		
		local tExp = split(szExp, ';');
		local tData = {};
		for j = 1, getn(tExp) do
			local szValue = tExp[j];
			local tValue = {};
			
			local tt = split(szValue, "~");
			
			tValue[1] = tonumber(tt[1]) or 0;
			
			if tt[2] then
				local ttt = split(tt[2], ":");
				tValue[2] = tonumber(ttt[1]) or tValue[1];
				tValue[3] = tonumber(ttt[2]) or 1;
			end
			tData[j] = tValue;
		end
		tRet[i] = tData;
	end

	return tRet;
end

g_tAttrLevelData = {};
ff_GetTabFileTable([[\settings\item\left_pearl\left_pearl_attr.txt]], 3, {
		tonumber,--ID
		get_attr_list,	-- Ä§·¨ÊôĞÔ
		nil,			--EventType
		nil,			--Description
		get_value_list,	--Value1
		get_value_list,	--Probability1
		get_value_list,	--Time1
		get_value_list,	--Value2
		get_value_list,	--Probability2
		get_value_list,	--Time2
		get_value_list,	--Value3
		get_value_list,	--Probability3
		get_value_list,	--Time3
		get_value_list,	--Value4
		get_value_list,	--Probability4
		get_value_list,	--Time4
		get_value_list,	--Value5
		get_value_list,	--Probability5
		get_value_list,	--Time5
		get_value_list,	--Value6
		get_value_list,	--Probability6
		get_value_list,	--Time6
		get_value_list,	--Value7
		get_value_list,	--Probability7
		get_value_list,	--Time7
		get_value_list,	--Value8
		get_value_list,	--Probability8
		get_value_list,	--Time8
	}, 
	function(tConfig)
		local nAttrID = tConfig[1];
		tConfig.n = nil;
		g_tAttrLevelData[nAttrID] = tConfig
	end
)
g_tAttrGroup = {};
ff_GetTabFileTable([[\settings\item\left_pearl\left_pearl_attr_group.txt]], 3, {
		tonumber,	-- GroupID
		tonumber,	-- ÊôĞÔID
		--tonumberex,	-- ÊÇ·ñÎªÖ÷ÊôĞÔ
		tonumberex,	-- ³öÏÖÈ¨Öµ
		tonumberex,	-- ´ãÁ¶È¨Öµ
	},
	function (tConfig)
		local nGroupID = tConfig[1];
		--local nMainAttr = tConfig[3];
		local nMainAttr = 0;
		
		if not g_tAttrGroup[nGroupID] then
			g_tAttrGroup[nGroupID] = {{}, {}};
		end
		
		if nMainAttr == 1 then
			tinsert(g_tAttrGroup[nGroupID][1], tConfig);
		else
			tinsert(g_tAttrGroup[nGroupID][2], tConfig);
		end
	end
)

function init_left_pearl(nItemIdx, nLpLevel, nGroupID, nQuenchCount)
	if not g_tAttrGroup[nGroupID] then
		return
	end
	
	if not g_tLevelAttrCount[nLpLevel] then
		return
	end
	local g, d, p = GetItemInfoByIndex(nItemIdx);
	if p >=561 or p <=640 then
		nLpLevel=8;
	end
	sd_AddItemSubData(nItemIdx, enumCCDT_Item_LeftPearl, 1);
	
	local nAttrCount = g_tLevelAttrCount[nLpLevel];
	--print("nAttrCount = ", nAttrCount); --//////////////////////////////

	-- Ö÷ÊôĞÔÒ»¶¨ÓĞ ËùÒÔ+1
	LeftPearl_SetAttrCount(nItemIdx, nAttrCount + 1);
	
	-- --Ö÷ÊôĞÔËæ»ú
	-- local tMainAttr = gf_RandRate(g_tAttrGroup[nGroupID][1], nil, 4);
	-- local nMainID = tMainAttr[2];
	local nMainID = LeftPearl_GetMainAttrIDByGDP(GetItemInfoByIndex(nItemIdx));
	--print("nMainID = ", nMainID); --//////////////////////////////

	add_left_pearl_attr(nItemIdx, nMainID, nLpLevel, 1);

	
	-- ¸±ÊôĞÔËæ»ú
	local tTemp = new(g_tAttrGroup[nGroupID][2]);
	--local countSub =1
	for i = 1, nAttrCount do
		local tResult, nIdx = gf_RandRate(tTemp, nil, 3)
		local nSubID = tResult[2];
		--countSub= countSub.."+"..nSubID
		add_left_pearl_attr(nItemIdx, nSubID, nLpLevel, 1 + i);
		
		tremove(tTemp, nIdx);
	end
	--local quech= LeftPearl_GetQuenchNum(nItemIdx)
	--Msg2Player("MainID:"..nMainID.."GroupID: "..nGroupID.."- Level: "..nLpLevel.."- Subid: "..countSub.."-Quech: "..quech)
	SyncItem2Client(nItemIdx);
	
	--todo: ´ãÁ¶¶È
	
	write_left_pearl_log(nItemIdx, "IdentifyLeftPearl")
end

function add_left_pearl_attr(nItemIdx, nAttrID, nLpLv, nIdx)
	if not g_tAttrLevelData[nAttrID] then
		local g, d, p = GetItemInfoByIndex(nItemIdx);
		WriteLog(format("[acc:%s role:%s][left_pearl][attribute %d miss match][g:%d d:%d p%d attrid:%d]", GetAccount(), GetName(), nIdx, g, d, p, nAttrID))
		return
	end
	
	local tAttrData = g_tAttrLevelData[nAttrID];
	--if nIdx == 1 then
	--print("tAttrData = "); --///////////////////
	--gf_PrintTable(tAttrData) --/////////////////
	--end
	--Th­¬ng h¶i di ch©u chØ cã 3 thuéc tİnh ma ph¸p
	local tValue = {};
	local tProbability = {};
	local nFrame = 0;
	for i = 1, 3 do
		if not tAttrData[2][i] then
			break
		end
		tValue[i] = random_value(tAttrData[2 + nLpLv * 3][i] and tAttrData[2 + nLpLv * 3][i][1] or {0});
		tProbability[i] = random_value(tAttrData[3 + nLpLv * 3][i] and tAttrData[3 + nLpLv * 3][i][1] or {10000});
	end
	-- HiÖn t¹i chØ hç trî 1
	nFrame = random_value(tAttrData[4 + nLpLv * 3][1] and tAttrData[4 + nLpLv * 3][1][1] or {-1})

	LeftPearl_SetAttrData(nItemIdx, nIdx - 1, nAttrID, tValue, tProbability, nFrame);
end

function quench_left_pearl_attr(nItemIdx, nAttrID, nLpLv, nIdx, tLeftPearlAttrData)
	if not g_tAttrLevelData[nAttrID] then
		local g, d, p = GetItemInfoByIndex(nItemIdx);
		WriteLog(format("[acc:%s role:%s][left_pearl][attribute %d miss match][g:%d d:%d p%d group:%d attrid:%d]", GetAccount(), GetName(), nIdx, g, d, p, nAttrID))
		return
	end
	local g, d, p = GetItemInfoByIndex(nItemIdx);
	if p >=561 or p <=640 then
		nLpLv=8;
	end
	local tAttrData = g_tAttrLevelData[nAttrID];

	--Th­¬ng h¶i di ch©u chØ cã 3 thuéc tİnh ma ph¸p
	local tValue = {};
	local tProbability = {};
	local nFrame = 0;
	for i = 1, 3 do
		if not tAttrData[2][i] then
			break
		end
		tValue[i] = tLeftPearlAttrData[2][i] + random_value(tAttrData[2 + nLpLv * 3][i] and tAttrData[2 + nLpLv * 3][i][2] or {0});
		tProbability[i] = tLeftPearlAttrData[3][i] + random_value(tAttrData[3 + nLpLv * 3][i] and tAttrData[3 + nLpLv * 3][i][2] or {0});
	end
	-- HiÖn t¹i chØ hç trî 1
	nFrame = tLeftPearlAttrData[4] + random_value(tAttrData[4 + nLpLv * 3][1] and tAttrData[4 + nLpLv * 3][1][2] or {0})

	LeftPearl_SetAttrData(nItemIdx, nIdx - 1, nAttrID, tValue, tProbability, nFrame);
end

function random_value(tValue)
	if not tValue[2] or tValue[2] == 0 then
		return tValue[1] or 0;
	end

	local nMin = tValue[1];
	local nMax = tValue[2];

	if nMin >= nMax then
		return nMin
	end

	local nStep = tValue[3];
	if nStep == 0 then
		return random(nMin, nMax);
	end

	local nNum = ceil((nMax - nMin) / nStep);

	local nRand = random(1, nNum + 1);
	return min(nMin + nStep * (nRand - 1), nMax);
end

function DisassembleLeftPearl(nItemIdx)
	if not nItemIdx or nItemIdx <= 0 then
		Talk(1, "", "VËt phÈm kh«ng tån t¹i");  
		return
	end

	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó ®¶m b¶o an toµn tµi s¶n, ®¹i hiÖp h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end

	--if GetPermission(2) == 0 then
	--	Talk(1, "", "§¨ng nhËp b»ng mËt m· phô kh«ng thÓ tiÕn hµnh thao t¸c nµy");
	--	return
	--end

	local tAward = LeftPearl_GetDisassemblyData(nItemIdx);

	--print("DisassembleLeftPearl", GetItemName(nItemIdx));

	if not tAward or getn(tAward) == 0 then
		return 0;
	end
	
	-- local strOwner = GetItemOwner(nItemIdx);
	-- if strOwner ~= "" and strOwner ~= GetName() then
	-- 	Talk(1,"", "Ëø»êºóµÄ²×º£ÒÅÖéÎŞ·¨½øĞĞ²ğ½â¡£");
	-- 	return 0;
	-- end

	if GetItemSpecialAttr(nItemIdx,"LOCK") == 1 or GetItemSpecialAttr(nItemIdx,"UNLOCKING") == 1 then
		Talk(1,"", "Th­¬ng H¶i Ch©u ®ang ®­îc Khãa hoÆc Më Khãa, kh«ng thÓ t¸ch.");
		return 0;
	end

	if LeftPearl_CanDisassembleLeftPearl(nItemIdx) ~= 1 then
		Talk(1, "", "VËt phÈm kh«ng thÓ T¸ch.");
		return 0;
	end
	
	--todo: ÅĞ¶Ïµş¼ÓÊı
	-- Ä¿Ç°Ö»ÓĞÒ»¸ö²ğ½â½±Àø ¾ÍÔİÊ±ÓÃÕâ¸öÀ´ÅĞ¶Ïroom°É
	local nAwardCount = tAward[1][4];

	local g, d, p = GetItemInfoByIndex(nItemIdx);
	local nCount = 1;
	if g == 2 then
		nCount = GetEquipAttr(nItemIdx, 4);
	end

	local nNeedRoom = ceil(nAwardCount * nCount / 10000);

	if gf_Judge_Room_Weight(nNeedRoom, 10, "") ~= 1 then return 0; end

	write_left_pearl_log(nItemIdx, "DisassembleLeftPearl(before)");
	
	gf_SetLogCaption("[LeftPearl][DisassembleLeftPearl]");

	if gf_DelItemByIndex(nItemIdx, -1) ~= 1 then
		Talk(1, "", "VËt phÈm kh«ng tån t¹i");
		gf_SetLogCaption("");
		return 0;
	end

	--gf_ModifyTask(TASKID_LEFT_PEARL_ACHIEVE8,nCount)
	--gf_OnAchEvent(TASKID_LEFT_PEARL_ACHIEVE8)

	gf_SetLogCaption("T¸ch th­¬ng h¶i ch©u");
	for i = 1, getn(tAward) do
		gf_AddItemEx(tAward[i], GetItemName(tAward[i][1], tAward[i][2], tAward[i][3]), nCount * tAward[i][4]);
	end
	gf_SetLogCaption("");
	return 1;
end

function GetDisassembleLeftPearlAward(nItemIdx)
	local tAward = LeftPearl_GetDisassemblyData(nItemIdx);

	if not tAward or getn(tAward) == 0 then
		return 0;
	end
	
	-- Ä¿Ç°Ö»ÓĞÒ»¸ö²ğ½â½±Àø ¾ÍÔİÊ±ÓÃÕâ¸öÀ´ÅĞ¶Ïroom°É
	local nAwardCount = tAward[1][4];

	local g, d, p = GetItemInfoByIndex(nItemIdx);
	local nCount = 1;
	if g == 2 then
		nCount = GetEquipAttr(nItemIdx, 4);
	end

	for i = 1, getn(tAward) do
		nCount = nCount*tAward[i][4]
	end

	return nCount
end

function QuenchLeftPearl(nItemIdx)
	if not nItemIdx or nItemIdx <= 0 then
		Talk(1, "", "VËt phÈm kh«ng tån t¹i");  
		return
	end

	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó ®¶m b¶o an toµn tµi, ®¹i hiÖp h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end

	-- if GetPermission(2) == 0 then 
	-- 	Talk(1, "", "ÓÉÓÚ¸±ÃÜÂëµÇÂ½Î´ÉèÖÃÏà¹ØÈ¨ÏŞÎŞ·¨²Ù×÷");  
	-- 	return 
	-- end

	local g, d, p = GetItemInfoByIndex(nItemIdx);

	if g ~= item_equip or d ~= enumBD_LEFT_PEARL then
		Talk(1, "", "VËt phÈm kh«ng thÓ T«i LuyÖn.");
		return 0;
	end

	if GetItemLevel(nItemIdx) < 3 then
		Talk(1, "", "Th­¬ng H¶i Ch©u cÊp nµy kh«ng thÓ T«i LuyÖn.");  
		return
	end

	-- local nOwnName = GetItemOwner(nEquipIdx);
	-- local nPlayerName = GetName();
	-- if not (not nOwnName or nOwnName == "" or nOwnName == nPlayerName) then
	-- 	Talk(1, "", "Ëø»ê×´Ì¬µÄ²×º£ÒÅÖéÖ»ÓĞÆä¹éÊôÈË²Å¿ÉÒÔ½øĞĞ´ãÁ¶");  
	-- 	return
	-- end
	
	local tData = LeftPear_GetQuenchData(nItemIdx);

	if not tData then
		Talk(1, "", "VËt phÈm kh«ng cÇn T«i LuyÖn n÷a.");
		return 0;
	end

	local tLpData = LeftPearl_GetLeftPearlData(nItemIdx);
	if not tLpData then
		Talk(1, "", "VËt phÈm bŞ lçi, h·y liªn hÖ CSKH ®Ó ®­îc gi¶i quyÕt.");
		return 0;
	end


	if GetCash() < tData[1] then
		Talk(1, "", "B¹n kh«ng ®ñ tiÒn!")
		return 0;
	end

	local nSucessRate = tData[2]; --v/10000
	local nCostItemNum1 = tData[3] and tData[3][4] or 0;

	for i = 3, getn(tData) do
		local t = tData[i];

		local nItemCount = GetItemCount(t[1], t[2], t[3]);
		if nItemCount < t[4] then
			Talk(1, "", format("[%s] trªn ng­êi kh«ng ®ñ %d.", GetItemName(t[1], t[2], t[3]), t[4]));
			return 0;
		end
	end
	
	gf_SetLogCaption("[LeftPearl][QuenchLeftPearl]");

	if Pay(tData[1]) ~= 1 then
		Talk(1, "", "B¹n kh«ng ®ñ tiÒn!")
		return 0;
	end

	for i = 3, getn(tData) do
		local t = tData[i];

		if gf_DelItem(t[1], t[2], t[3], t[4]) ~= 1 then
			Talk(1, "", format("[%s] trªn ng­êi kh«ng ®ñ %d.", GetItemName(t[1], t[2], t[3]), t[4]));
			return 0;
		end
	end
	
	write_left_pearl_log(nItemIdx, "QuenchLeftPearl(before)");
	write_quench_log(nItemIdx, "QuenchLeftPearl(before)");

	local nQuench = LeftPearl_GetQuenchNum(nItemIdx);
	local nLpLv = GetItemLevel(nItemIdx);

	local nAttrID = tLpData[1][1];
	--quench_left_pearl_attr(nItemIdx, nAttrID, nLpLv, 1, tLpData[1]);

	local nGroupID = LeftPearl_GetGroupIDByGDP(GetItemInfoByIndex(nItemIdx));
	local nRand = random(10000)
	local bSuccess = nil;

	if nRand <= nSucessRate then
		--´ãÁ¶³É¹¦ Ëæ»úÇ¿»¯Ä³ÌõÒÑÓĞ¸±ÊôĞÔ
		bSuccess = 1;
		local tTemp = {};

		for j = 2, getn(tLpData) do
			nAttrID = tLpData[j][1];

			for k = 1, getn(g_tAttrGroup[nGroupID][2]) do
				if nAttrID == g_tAttrGroup[nGroupID][2][k][2] then
					tTemp[j - 1] = g_tAttrGroup[nGroupID][2][k];
				end
			end
		end

		local tResult, nAttrIdx = gf_RandRate(tTemp, nil, 4);
		quench_left_pearl_attr(nItemIdx, tResult[2], nLpLv, nAttrIdx + 1, tLpData[nAttrIdx + 1]);

		-- gf_ModifyTask(TASKID_LEFT_PEARL_ACHIEVE9, 1);
		-- gf_OnAchEvent(TASKID_LEFT_PEARL_ACHIEVE9);
	else
		bSuccess = 0;
	end

	LeftPearl_SetQuenchNum(nItemIdx, nQuench + 1); --ÎŞÂÛ³É¹¦Ê§°Ü
	EquipAndUnEquip(nItemIdx, -1);

	local szMsg = ""
	if bSuccess == 1 then
		szMsg = "T«i LuyÖn thµnh c«ng"
	else
		szMsg = "T«i LuyÖn thÊt b¹i"
	end
	Msg2Player(szMsg)
	write_quench_log(nItemIdx, "QuenchLeftPearl(done  )", bSuccess);
	write_left_pearl_log(nItemIdx, "QuenchLeftPearl(done  )");
	gf_SetLogCaption("");

	if T_RUNTIME_STATE_KEY["quench_cost1"] then
		local tStateKey = T_RUNTIME_STATE_KEY["quench_cost1"];
		AddRuntimeStat(tStateKey[1], tStateKey[2], 0, nCostItemNum1);
	end
	if T_RUNTIME_STATE_KEY["quench_num"] then
		local tStateKey = T_RUNTIME_STATE_KEY["quench_num"];
		AddRuntimeStat(tStateKey[1], tStateKey[2], 0, 1);
	end

	FireEvent("event_equip_operation", "quench_lp", bSuccess, nLpLv, LeftPearl_GetQuenchNum(nItemIdx), nItemIdx)

	return 1;
end

--todo : Log chi tiÕt
function write_left_pearl_log(nItemIdx, szLogCaption)

	local tLpData = LeftPearl_GetLeftPearlData(nItemIdx);
	if not tLpData then
		WriteLog(format("[acc:%s role:%s][left_pearl][Kh«ng cã d÷ liÖu ®¹o cô Th­¬ng H¶i Ch©u][%s][ItemName:%s]", GetAccount(), GetName(), szLogCaption, GetItemName(nItemIdx)))
		--ItemLog(nItemIdx, szLogCaption);
		return 0;
	end

	local szLog = format("[acc:%s role:%s][left_pearl][%s][ItemName:%s]", GetAccount(), GetName(), szLogCaption, GetItemName(nItemIdx));

	local fVal2Str = function (t)
		local m = "{";
		for i = 1, getn(t) do
			m = m .. t[i] .. ","
		end
		m = m .. "}";
		return m;
	end

	for i = 1, getn(tLpData) do
		local tData = tLpData[i];
		szLog = szLog .. format("[idx:%d attrid:%d values:%s probability:%s frame:%d]", i, tData[1], fVal2Str(tData[2]), fVal2Str(tData[3]), tData[4]);
	end

	local nCurQuenchNum = LeftPearl_GetQuenchNum(nItemIdx);
	szLog = szLog .. format("[quench times:%d]", nCurQuenchNum);

	WriteLog(szLog);
	--ItemLog(nItemIdx, szLogCaption);

	return 1;
end

--Log t«i luyÖn
function write_quench_log(nItemIdx, szLogCaption, bSuccess)

	local szLog = format("[acc:%s role:%s][left_pearl][%s][ItemName:%s]", GetAccount(), GetName(), szLogCaption, GetItemName(nItemIdx));
	local nCurQuenchNum = LeftPearl_GetQuenchNum(nItemIdx);
	local nLpLv = GetItemLevel(nItemIdx)

	if not bSuccess then
		szLog = szLog..format("[QuenchNum:%d][lpLv:%d]", nCurQuenchNum, nLpLv);
	elseif bSuccess == 1 then
		szLog = szLog..format("[QuenchNum:%d][lpLv:%d][QuenchResult:Success]", nCurQuenchNum, nLpLv);
	elseif bSuccess == 0 then
		szLog = szLog..format("[QuenchNum:%d][lpLv:%d][QuenchResult:Failed]", nCurQuenchNum, nLpLv);
	end
	WriteLog(szLog);

	return 1;
end

function process_error_left_pearl()
	local obj_index, nItemIdx = GetFirstItem();
	local nDeletedCount = 0;
	while (obj_index ~= 0 and nItemIdx ~= 0) do
		local g, d, p = GetItemInfoByIndex(nItemIdx);

		if g == 0 and d == 135 then
			local tLpData = LeftPearl_GetLeftPearlData(nItemIdx);
			if tLpData then
				local nAttrCnt = getn(tLpData);
				if nAttrCnt > 0 then
					
					-- ÅĞ¶ÏÖ÷ÊôĞÔÉ±¹Ö»ØÑª»ØÀ¶
					do
						if tLpData[1][1] == 25 or tLpData[1][1] == 26 then
							local tAttrData = g_tAttrLevelData[tLpData[1][1]];

							local tValue = {};
							local tProbability = {};
							local nFrame = 0;

							nLpLv = GetItemLevel(nItemIdx)
							for i = 1, 3 do
								if not tAttrData[2][i] then
									break
								end
								tValue[i] = random_value(tAttrData[2 + nLpLv * 3][i] and tAttrData[2 + nLpLv * 3][i][1] or {0});
								tProbability[i] = random_value(tAttrData[3 + nLpLv * 3][i] and tAttrData[3 + nLpLv * 3][i][1] or {10000});
							end
							-- HiÖn t¹i chØ hç trî 1
							nFrame = random_value(tAttrData[4 + nLpLv * 3][1] and tAttrData[4 + nLpLv * 3][1][1] or {-1})
	
							write_left_pearl_log(nItemIdx, "repair_lp(before)");
							LeftPearl_SetAttrData(nItemIdx, 0, tLpData[1][1], tValue, tProbability, nFrame);
							write_left_pearl_log(nItemIdx, "repair_lp(done  )");
							SyncItem2Client(nItemIdx);
						end
					end
					
					-- ÅĞ¶Ï×îºóÒ»Î»ÊôĞÔµÄnFrameÊÇ·ñ´íÎó
					do
						local nSaveFrame = tLpData[nAttrCnt][4];
						if g_tAttrLevelData[tLpData[nAttrCnt][1]] then
							local tAttrData = g_tAttrLevelData[tLpData[nAttrCnt][1]]
							-- Ê±¼ä ÔİÖ»Ö§³ÖÒ»¸ö
							local tRange = tAttrData[4 +  GetItemLevel(nItemIdx) * 3][1] and tAttrData[4 +  GetItemLevel(nItemIdx) * 3][1][1] or {-1}
							tRange[2] = tRange[2] or tRange[1];
							
							if nSaveFrame < tRange[1] or nSaveFrame > tRange[2] then
								tLpData[nAttrCnt][4] = random_value(tRange);
								write_left_pearl_log(nItemIdx, "repair_lp(before)");
								LeftPearl_SetAttrData(nItemIdx, nAttrCnt - 1, tLpData[nAttrCnt][1], tLpData[nAttrCnt][2], tLpData[nAttrCnt][3], tLpData[nAttrCnt][4]);
								write_left_pearl_log(nItemIdx, "repair_lp(done  )");
								SyncItem2Client(nItemIdx);
							end
						end
					end
				end
			end
		end
		obj_index, nItemIdx = GetNextItem(obj_index, nItemIdx)
	end
end



--Í¨¹ıÒÅÖéÊôĞÔIDºÍ°æ±¾ºÅ£¬¸üĞÂÍæ¼ÒÒÅÖéÊôĞÔ
--¸üĞÂ¹æÔò£ºÍ¨¹ıg_tLpAttrIDByOldVersionÖĞËùÓĞk >= nOldVersionµÄÅäÖÃÏî¼ì²éÊôĞÔÊÇ·ñĞèÒª¸üĞÂ £¬ÈôĞèÒª¸ü£¬ÔòÖ±½Ó¸üĞÂµ½×îĞÂ°æ±¾µÄÊôĞÔ
--×¢	Òâ£ºÒÀÀµÅäÖÃ±íÅäÖÃµÄ¸üĞÂ£¬ÅäÖÃ±íĞëÍ¬²½¸üĞÂ£»
function update_left_pearl_by_version(nItemIdx, nOldVersion)
	if not nItemIdx or nItemIdx <= 0 then
		return 0;
	end

	local g, d, p = GetItemInfoByIndex(nItemIdx);
	if g ~= item_equip or d ~= enumBD_LEFT_PEARL then
		return 0;
	end

	if not g_tLpAttrIDByOldVersion or getn(g_tLpAttrIDByOldVersion) < 1 then
		return 0;
	end

	local nMaxVersion = 0;
	for k, v in g_tLpAttrIDByOldVersion do
		nMaxVersion = max(nMaxVersion, k);
	end

	-- print("nMaxVersion = ",nMaxVersion,"nOldVersion=",nOldVersion)

	if nMaxVersion < nOldVersion then
		return 0;
	end

	local tLpData = LeftPearl_GetLeftPearlData(nItemIdx);

	-- print("tLpData = "); 
	-- gf_PrintTable(tLpData);

	if tLpData then
		local nAttrCnt = getn(tLpData);
		local bBeforeLog, bAfterLog = 0, 0;

		if nAttrCnt > 0 then

			--±éÀúÃ¿Ò»ÌõÒÅÖéÖ÷¡¢¸±ÊôĞÔ
			for i=1, nAttrCnt do
				local nAttrID = tLpData[i][1] or 0;
				if check_lp_attr_need_update(nAttrID, nOldVersion) == 1 then
					--¸ÃÊôĞÔĞèÒª±»¸üĞÂ

					if bBeforeLog == 0 then
						write_left_pearl_log(nItemIdx, format("update lp attr version: %d (before)", nOldVersion or 0) );
						bBeforeLog = 1;
					end

					local tAttrData = g_tAttrLevelData[nAttrID];
					local nLpLv = GetItemLevel(nItemIdx)

					local tProbability = {};
					local nFrame = 0;

					--1¡¢ÖØÉè¸ÅÂÊtable
					for j = 1, 3 do
						if not tAttrData[2][j] then
							break
						end
						--tValue[j] = random_value(tAttrData[2 + nLpLv * 3][j] and tAttrData[2 + nLpLv * 3][j][1] or {0});
						tProbability[j] = random_value(tAttrData[3 + nLpLv * 3][j] and tAttrData[3 + nLpLv * 3][j][1] or {10000});
					end

					--2 Reset, hiÖn t¹i chØ hç trî 1
					nFrame = random_value(tAttrData[4 + nLpLv * 3][1] and tAttrData[4 + nLpLv * 3][1][1] or {-1})

					LeftPearl_SetAttrData(nItemIdx, i - 1, tLpData[i][1], tLpData[i][2], tProbability, nFrame);

					bAfterLog = 1; --ĞèÒª¼Ç¸üĞÂºóµÄÈÕÖ¾
				end
			end --for

			if bAfterLog == 1 then
				write_left_pearl_log(nItemIdx, format("update lp attr version: %d (done)", nOldVersion or 0) );
				SyncItem2Client(nItemIdx);
			end

			--3. Additional repair operations
			tLpData = LeftPearl_GetLeftPearlData(nItemIdx);
			nAttrCnt = getn(tLpData);
			if nOldVersion == 1 then
				-- X¸c ®Şnh xem nFrame cña thuéc tİnh cuèi cã sai hay kh«ng
				local nSaveFrame = tLpData[nAttrCnt][4];
				local nAttrID = tLpData[nAttrCnt][1];

				if g_tAttrLevelData[nAttrID] then
					local tAttrData = g_tAttrLevelData[nAttrID]
					-- HiÖn t¹i chØ hç trî 1
					local tRange = tAttrData[4 +  GetItemLevel(nItemIdx) * 3][1] and tAttrData[4 +  GetItemLevel(nItemIdx) * 3][1][1] or {-1}
					tRange[2] = tRange[2] or tRange[1];
					--print("nAttrID=",nAttrID,"nSaveFrame=",nSaveFrame,"tRange[1]=",tRange[1],"tRange[2]=",tRange[2]);
					if nSaveFrame < tRange[1] or nSaveFrame > tRange[2] then
						tLpData[nAttrCnt][4] = random_value(tRange);
						write_left_pearl_log(nItemIdx, "Repair LP Attr (before)");
						LeftPearl_SetAttrData(nItemIdx, nAttrCnt - 1, nAttrID, tLpData[nAttrCnt][2], tLpData[nAttrCnt][3], tLpData[nAttrCnt][4]);
						write_left_pearl_log(nItemIdx, "Repair LP Attr (after)");
						SyncItem2Client(nItemIdx);
					end
				end
			end
		end
	end
end

function check_lp_attr_need_update(nAttrID, nOldVersion)
	local nRet;
	if  not nAttrID or nAttrID <= 0 or not nOldVersion or nOldVersion <= 0 then
		return nRet;
	end

	local nMaxVersion = 0;
	for k, v in g_tLpAttrIDByOldVersion do
		nMaxVersion = max(nMaxVersion, k);
	end

	if nMaxVersion < nOldVersion then
		return nRet;
	end

	for i = nOldVersion, nMaxVersion do
		local tLpAttrID = g_tLpAttrIDByOldVersion[i] or {};
		if tLpAttrID and getn(tLpAttrID) > 0 then
			for j = 1, getn(tLpAttrID) do
				local nTempID = tLpAttrID[j] or 0;
				if nTempID == nAttrID then
					nRet = 1;
					break;
				end
			end
			if nRet == 1 then
				break;
			end
		end
	end

	return nRet;
end

function CanEquipLeftPearl()
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ch­a gia nhËp m«n ph¸i kh«ng thÓ dïng Th­¬ng H¶i Ch©u")
		return 0
	end

	return 1;
end