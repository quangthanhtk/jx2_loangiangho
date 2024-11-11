--É±ÐÇÁîÅÆ£¨Í·,ÒÂ,¿ã£©
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")

g_CapDialog = {
	baseAttr = {
		{2825,0,0},
	},
	UnLockAttr = {
        {2831,2832,2833,2834,2835,2836,2837,2838,2839},
        {2841,2842,2843,2844,2845,2846,2847,2848},
        {2850,2851,2852,2853},
	},
};

g_ClothDialog = {
	baseAttr = {
		{2827,0,0},
	},
	UnLockAttr = {
		{2831,2832,2833,2834,2835,2836,2837,2838,2839},
		{2841,2842,2843,2844,2845,2846,2847,2848},
		{2850,2851,2852,2853},
	},
};

g_ShoeDialog = {
	baseAttr = {
		{2829,0,0},
	},
	UnLockAttr = {
		{2831,2832,2833,2834,2835,2836,2837,2838,2839},
		{2841,2842,2843,2844,2845,2846,2847,2848},
		{2850,2851,2852,2853},
	},
};

g_WeaponDialog = {
	baseAttr = {
		["Vò khÝ s¸t th­¬ng"] = {{2891, 2892}, 2894,0},
		["CÇm chuyªn dïng"] = {{2886, 2887}, 2894,0},
		["Néi c«ng "] = {2884, 2894 ,0},
		["Ngo¹i c«ng"] = {2889, 2894 ,0},
	},
	UnLockAttr = {
        {2896,2897,2898,2899,2900,2901},
        {2903,2904,2905},
        {2907,2908,2909,2910,2911,2912},
	},
};

g_RingDialog = {
	baseAttr = {
		{2855,0,0},
	},
	UnLockAttr = {
        {2857,2858,2859,2860,2861,2862,2863,2864},
        {2866,2867,2868,2869,2870,2871,2872,2873},
        {2875,2876,2877,2878,2879,2880,2881,2882},
	},
};

function GetAttrTable(nItem)
	local nP = GetItemParticular(nItem);
	local tItem2Attr = {
		[31313] = g_CapDialog,
		[31314] = g_ClothDialog,
		[31315] = g_ShoeDialog,
		[31316] = g_WeaponDialog,
		[31317] = g_RingDialog,
	}
	return tItem2Attr[nP];
end

function GetAwardTable(nItem)
	local nP = GetItemParticular(nItem);
	local tItemAward = {
		[31313] = {{0, 103, 865, 1, 4, -1, -1, -1, -1, -1, -1},"MÆt N¹ S¸t Tinh"},
		[31314] = {{0, 100, 865, 1, 4, -1, -1, -1, -1, -1, -1},"¸o S¸t Tinh"},
		[31315] = {{0, 101, 865, 1, 4, -1, -1, -1, -1, -1, -1},"QuÇn S¸t Tinh"},
		[31316] = {{
			{{0,	14,	32503, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Ng­ Tµng (NhËm HiÖp Chñy)"},	
			{{0,	2,	32504, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-ChØ Qua (C«n L«n KiÕm T«n)"},	
			{{0,	3	, 32483, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-L­u Ly Giíi §ao (ThiÕu L©m §ao)"},
			{{0,	8	, 32485, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Kinh L«i ThiÒn Tr­îng (ThiÕu L©m ThiÒn)"},
			{{0,	0	, 32484, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-L«i ¢m Nang Thñ (ThiÕu L©m Thñ)"},
			{{0,	1	, 32486, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-¢m D­¬ng Xuyªn ¶nh (§­êng M«n Ch©m)"},
			{{0,	2	, 32487, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Tõ Hµn ¢m KiÕm (Nga My KiÕm)"},
			{{0,	10  , 32488, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Cöu Hoµn Bèi CÇm (Nga My CÇm)"},
			{{0,	0	, 32489, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Quy L©n Hé Thñ (C¸i Bang Thñ)"},
			{{0,	5	, 32490, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-TrÊn Ng¹o C«n (C¸i Bang C«n)"},
			{{0,	2	, 32491, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-ThuÇn Phong KiÕm (Vâ §ang KiÕm)"},
			{{0,	9	, 32492, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Tinh §Èu ChuyÓn Bót (Vâ §ang Bót)"},
			{{0,	6	, 32493, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Ph¸ Qu©n TrËn Th­¬ng (D­¬ng M«n Th­¬ng)"},
			{{0,	4	, 32494, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Truy MÖnh Cung (D­¬ng M«n Cung)"},
			{{0,	7	, 32495, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-ThiÖp Cèt HuyÕt §ao (Ngò §éc §ao)"},
			{{0,	11  , 32496, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-LuyÖn Hån HuyÕt Tr¶o (Ngò §éc Tr¶o)"},
			{{0,	2	, 32497, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Ngù Thiªn Phong KiÕm (C«n L«n Thiªn S­)"},
			{{0,	13  , 32501, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Linh Lung Chi (Thóy Yªn PhiÕn)"},
			{{0,	12  , 32502, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Cöu Tiªu S¸o (Thóy Yªn S¸o)"},	
			{{0,	3   , 32498, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-ThÇn DiÖm Thiªn §ao (Minh Gi¸o §ao)"},
			{{0,	9   , 32499, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-ThÇn Phong Ph¸n Bót (Minh Gi¸o Bót)"},
			{{0,	11  , 32500, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-ThÇn Linh Chó Tr¶o (Minh Gi¸o Tr¶o)"},	
		},"Vò KhÝ S¸t Tinh"},
		[31317] = {{
			{{0, 102, 31850, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Cöu Linh Háa Giíi"},
			{{0, 102, 31851, 1, 4, -1, -1, -1, -1, -1, -1}, "S¸t Tinh-Ng­ng Ngäc Thæ Hoµn"},
		},"Trang Søc S¸t Tinh"},
	}
	return tItemAward[nP];
end

function GetItemFeedAttrDesc(id)
	if not g_FeedItemDesc then
		g_ItemFeedDesc = {};
	end
	if not g_ItemFeedDesc[id] then
		local itemDesc = GetItemFeedAttiDesc(id);
		itemDesc = sf_Replace(itemDesc, "<enter>", ", ")
		itemDesc = sf_RemoveTag(itemDesc, "<", ">")
		g_ItemFeedDesc[id] = itemDesc

	end
	return g_ItemFeedDesc[id];
end

function ComposeFeedItem(nItem, nLineID)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	local szItemName = GetItemName(nItem);
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local szName = GetName();
	local tRet = GetAwardTable(nItem);
	if nLineID then
		tRet = tRet[1][nLineID];
	end
	local tLineID = tempLineID[szName];
	local nRet, nItemIdx = gf_AddItemEx2(tRet[1], tRet[2], szItemName, tRet[2], 0, 1);
	if nItemIdx then
		SetItemFeedUpAttrs(nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]);
		gf_WriteLogEx(szItemName, tRet[2], format("Index:%d LineID:%d|%d|%d|%d|%d|%d", nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]))
	end
end

--Ñ¡Ôñ½âËøÊôÐÔ
function ChoiceUnLockAttr(nItem, nLineID)
	local szName = GetName();
	local tDialog = GetAttrTable(nItem);
	local tLineID = tempLineID[szName];
	if nLineID and getn(tLineID) < 6 then
		tLineID[getn(tLineID) + 1] = nLineID;
		nLineID = nil
	end
	if getn(tLineID) < 6 then
		local nIndex = getn(tLineID) - 2;
		local unlock = tDialog.UnLockAttr;
		local tCurrList = unlock[nIndex];
		local tbSay = {};
		local tName = { "Thuéc tÝnh tÊn c«ng", "Thuéc tÝnh phßng thñ", "Thuéc tÝnh kh¸c" };
		tbSay.msg = format("lùa chän %s:", tName[nIndex]);
		tbSay.sel = {};
		for i = 1, getn(tCurrList) do
			tinsert(tbSay.sel, { GetItemFeedAttrDesc(tCurrList[i]), format("#ChoiceUnLockAttr(%d, %d)", nItem, tCurrList[i]) });
		end
		tinsert(tbSay.sel, { "\n rót lui", "nothing" });
		temp_Talk(tbSay);
		return 0;
	end
	--×îºóµÄÈ·ÈÏ
	local tRet = GetAwardTable(nItem);
	if not nLineID and type(tRet[1][1]) == "table" then
		local tbSay = {};
		tbSay.msg = format("H·y chän lo¹i cña %s: ", tRet[2]);
		tbSay.sel = {};
		for i = 1, getn(tRet[1]) do
			tinsert(tbSay.sel, { tRet[1][i][2],
													 format("#ChoiceUnLockAttr(%d, %d)", nItem, i) });
		end
		tinsert(tbSay.sel, { "\n rót lui", "nothing" });
		temp_Talk(tbSay);
		return 0;
	end
	local szDialog = format("§ång ý/#ComposeFeedItem(%d)", nItem);
	if nLineID and type(tRet[1][1]) == "table" then
		tRet = tRet[1][nLineID]
		szDialog = format("§ång ý/#ComposeFeedItem(%d, %d)", nItem, nLineID);
	end
	local msg = "Thuéc tÝnh lùa chän cuèi cïng nh­ sau:\n";
	msg = msg .. format("Thuéc tÝnh mÆc ®Þnh: \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[1]), GetItemFeedAttrDesc(tLineID[2]), GetItemFeedAttrDesc(tLineID[3]));
	msg = msg .. format("Thuéc tÝnh më khãa:  \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[4]), GetItemFeedAttrDesc(tLineID[5]), GetItemFeedAttrDesc(tLineID[6]));
	msg = msg .. format("QuyÕt ®Þnh dïng <color=gold>%s<color> ghÐp thµnh <color=gold>%s<color> kh«ng?", GetItemName(nItem), tRet[2]);
	Say(msg, 2, szDialog, "§Ó ta suy nghÜ/nothing");
end

--Ñ¡Ôñ»ù´¡ÊôÐÔ
function ChoiceBaseAttr(nItem, choice1, curIndex, choice2)
	local szName = GetName();
	local tDialog = GetAttrTable(nItem);
	local base = tDialog.baseAttr;
	if not choice1 and getn(base) ~= 1 then
		local tSay = {};
		for k, v in base do
			tinsert(tSay, format("%s/#ChoiceBaseAttr(%d, '%s')", k, nItem, k));
		end
		tinsert(tSay, "\n rót lui/nothing");
		Say("H·y chän lo¹i thuéc tÝnh c¬ b¶n: ", getn(tSay), tSay);
		return 0;
	end
	if not choice1 then
		choice1 = 1;
	end
	local tLineID = tempLineID[szName];
	local tBaseAttr = tDialog.baseAttr[choice1];
	if choice2 then
		tLineID[curIndex] = tBaseAttr[curIndex][choice2];
		choice2 = nil;
	end
	if not curIndex then
		curIndex = 0;
	end
	for i = curIndex + 1, getn(tBaseAttr) do
		if not choice2 and type(tBaseAttr[i]) == "table" then
			local tSay = {}
			for j = 1, getn(tBaseAttr[i]) do
				local szFormat = "%s/#ChoiceBaseAttr(%d, '%s', %d, %d)";
				if type(choice1) == "number" then
					szFormat = "%s/#ChoiceBaseAttr(%d, %d, %d, %d)";
				end
				tinsert(tSay, format(szFormat, GetItemFeedAttrDesc(tBaseAttr[i][j]), nItem, choice1, i, j));
			end
			tinsert(tSay, "\n rót lui/nothing");
			Say("H·y chän lo¹i thuéc tÝnh con c¬ b¶n: ", getn(tSay), tSay);
			return 0;
		end
		tLineID[i] = tBaseAttr[i];
	end
	ChoiceUnLockAttr(nItem);
end

function OnUseItem(nItem)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	if gf_Check55FullSkill() ~= 1 then
		Talk(1, "", "Gia nhËp l­u ph¸i vµ häc kü n¨ng cÊp 55 míi ®­îc dïng!");
		return 0;
	end
	if not tempLineID then
		tempLineID = {};
	end
	local szName = GetName();
	tempLineID[szName] = {};
	ChoiceBaseAttr(nItem);
end

function OnUse(nItem)
	local szItemName = GetItemName(nItem);
	local szAwardName = GetAwardTable(nItem)[2];
	Say(format("Sö dông <color=gold>%s<color> cã thÓ hîp thµnh <color=gold>%s<color>, x¸c nhËn sö dông kh«ng?", szItemName, szAwardName), 2,
			format("\n§ång ý dïng/#OnUseItem(%d)", nItem), "\n§Ó ta suy nghÜ l¹i/nothing");
end
