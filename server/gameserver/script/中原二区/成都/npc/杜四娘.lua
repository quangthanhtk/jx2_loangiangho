--生产技能戒子材料制作
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\vng\\weapon_upgrade\\upgradesattinh.lua")
--KSGVN
Import("\\script\\ksgvn\\lib.lua")
-- END KSGVN
DSN_NPC = "<color=green>х T� Nng<color>: ";

function main()
	local tSay = {
		format("\nN﹏g c蕄 trang b� S竧 Tinh/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_SATTINH),
		--"\nN﹏g c蕄 trang b� S竧 Tinh/updateSatTinh",
		--"N﹏g c蕄 trang b� 萴 Huy誸 (gi� r�)/updateAmHuyet",
		format("Ti謒 萴 Huy誸/#show_equip_shop(%d)", 3100),
		format("Ti謒 Linh у Gi韎 Ch�/#show_equip_shop(%d)", 3044),
		--format("\n豪侠装备商店/#show_equip_shop(%d)", 3045),
		--format("\n高级材料商店/#show_equip_shop(%d)", 3043),\
		format("фi trang b� H祇 Hi謕 V� H�/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_HHVH),
		--"Ti課 c蕄 trang b� H祇 Hi謕/NormalHaoxia2Level",
		"\nT玦 ch� xem xem th玦/nothing",
	}		
	Say(DSN_NPC..format("%s c� th� gi髉 頲 g� kh玭g?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

tRecipe2Level = {
	[0] = {{"Vi猰 Linh B�", {2, 1, 30676, 15}}, {"Linh Thi誸", {2, 1, 30681, 30}},	{"H祇 Hi謕 L謓h", {2, 95, 2084, 300}}},
	[1] = {{"Ma Lang Gi竝", {2, 1, 30677, 15}}, {"Linh Thi誸", {2, 1, 30681, 30}},	{"H祇 Hi謕 L謓h", {2, 95, 2084, 300}}},
	[2] = {{"Huy襫 Vi猰 Cng", {2, 1, 30675, 20}}, {"Thi猲 M玭 Kim L謓h", {2, 1, 30370, 10}}, {"Thi猲 Cang L謓h", {2, 95, 204, 10}}, {"Linh Kh� R鵦 R�", {2, 1, 31122, 2}},},
	[3] = {{"мa Long Gi竝", {2, 1, 30678, 15}}, {"Linh Thi誸", {2, 1, 30681, 30}},	{"H祇 Hi謕 L謓h", {2, 95, 2084, 300}}},
}

tWuxiaHaoxia = {
	[0] = {"V� H� H祇 Hi謕 L謓h (N鉵)",	{2, 1, 30944, 1, 4}},
	[1] = {"V� H� H祇 Hi謕 L謓h (竜)",	{2, 1, 30945, 1, 4}},
	[2] = {"V� H� H祇 Hi謕 L謓h (V� Kh�)",    {2, 1, 30973, 1, 4}},
	[3] = {"V� H� H祇 Hi謕 L謓h (Qu莕)",	{2, 1, 30946, 1, 4}},
}

tEnhanceAward = {
	[1] = {{2,2,7,1,4}},
	[2] = {{2,2,7,2,4}},
	[3] = {{2,2,7,4,4}},
	[4] = {{2,2,7,8,4}},
	[5] = {{2,2,7,16,4}},
	[6] = {{2,2,7,16,4},{2,2,8,10,4}},
	[7] = {{2,2,7,16,4},{2,2,8,20,4}},
	[8] = {{2,2,7,16,4},{2,2,8,40,4}},
	[9] = {{2,2,7,16,4},{2,2,8,80,4}},
	[10] = {{2,2,7,16,4},{2,2,8,160,4}},	
	[11] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,4,4}},
	[12] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,8,4}},
	[13] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,16,4}},
	[14] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,32,4}},
	[15] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,64,4}},
}

function NormalHaoxia2Level()
	local tSay = {
		format("фi V� H� H祇 Hi謕 L謓h (N鉵)/#NormalHaoxia2Level_do(%d)", 0),
		format("фi V� H� H祇 Hi謕 L謓h (竜)/#NormalHaoxia2Level_do(%d)", 1),
		format("фi V� H� H祇 Hi謕 L謓h (Qu莕)/#NormalHaoxia2Level_do(%d)", 3),
		format("%s/#NormalHaoxia2Level_do(%d)", "фi V� H� H祇 Hi謕 L謓h (V� kh�)", 2),
		"\nT玦 ch� xem xem th玦/nothing",
	}
	Say(DSN_NPC..format("Ti課 c蕄 trang b� H祇 Hi謕, m阨 %s h穣 ch鋘 lo筰 c莕 i: <color=red> (H穣 m芻 trang b� H祇 Hi謕 tr猲 ngi)<color>", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function NormalHaoxia2Level_do(nPos)
	local msg = "фi [<color=green>%s<color>] c莕 ti猽 hao: %s. <color=red>(Sau khi i trang b� H祇 Hi謕  cng h鉧, ho祅 tr�  cng h鉧 theo quy t綾 t竎h)<color>"
	local tRecipe = tRecipe2Level[nPos];
	local szCost = ""
	for i = 1, getn(tRecipe) do
		szCost = format("%s, %d [%s]", szCost, tRecipe[i][2][4], tRecipe[i][1])
	end
	szCost = strsub(szCost,2)
	msg = format(msg, tWuxiaHaoxia[nPos][1], szCost)
	Say(DSN_NPC..msg, 2, format("фi ngay/#Exchange2Wuxiaohao(%d)", nPos), "T筰 h� ch� xem qua th玦/nothing")
end

function Exchange2Wuxiaohao(nPos)
	local nItemIndex = GetPlayerEquipIndex(nPos);
	local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
	local nP = GetItemParticular(nItemIndex);
	if (nPos~= 2 and nP ~= 30568) or (nPos==2 and not(nP >= 30724 and nP <= 30743) and nP ~= 32190 and nP ~= 32162) then
		Talk(1,"",DSN_NPC.."Ph秈 m芻 trang b� H祇 Hi謕 l猲 ngi m韎 頲 ti課 c蕄!");
		return 0;
	end
	local tRecipe = tRecipe2Level[nPos];
	for i = 1, getn(tRecipe) do
		if GetItemCount(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3]) < tRecipe[i][2][4] then
			Talk(1,"",DSN_NPC..format("%s kh玭g  %d c竔, kh玭g th� ho祅 th祅h i.", tRecipe[i][1], tRecipe[i][2][4]));
			return 0;
		end
	end
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	for i = 1, getn(tRecipe) do
		if DelItem(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3], tRecipe[i][2][4]) ~= 1 then
			return 0;
		end
	end
	if DelItemByIndex(nItemIndex, -1) ~= 1 then
		return 0;
	end	
	if nEnhance > 0 then
		local t = tEnhanceAward[nEnhance];
		for _, v in t do
			gf_AddItemEx2(v, GetItemName(v[1],v[2],v[3]), "Ti課 c蕄 H祇 Hi謕", "Ho祅 tr�  cng h鉧", 0, 1);
		end
	end
	local tAward = tWuxiaHaoxia[nPos];
	gf_AddItemEx2(tAward[2], tAward[1], "Ti課 c蕄 H祇 Hi謕", "V� H� H祇 Hi謕 L謓h", 0, 1);
end

function updateAmHuyet()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N﹏g c蕄 trang b� 萴 Huy誸 c莕 ti猽 hao: Thi猲 M玭 Kim L謓h, Thi猲 Cang L謓h, Huy誸 B� б, C鰑 Thi猲 V� C鵦 Кn"
	
	tinsert(tbSayDialog,"N﹏g c蕄 N鉵 萴 Huy誸 (8 TMKL, 8 TCL, 5 HB�)/#updateAmHuyet_choose(1)")
	tinsert(tbSayDialog,"N﹏g c蕄 Qu莕 萴 Huy誸 (8 TMKL, 8 TCL, 5 HB�)/#updateAmHuyet_choose(2)")
	tinsert(tbSayDialog,"N﹏g c蕄 竜 萴 Huy誸 (8 TMKL, 8 TCL, 5 HB�)/#updateAmHuyet_choose(3)")
	tinsert(tbSayDialog,"N﹏g c蕄 V� Kh� 萴 Huy誸 (18 TMKL, 18 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(4)")
	tinsert(tbSayDialog,"N﹏g c蕄 Trang S鴆 萴 Huy誸 (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/updateAmHuyet_trangsuc")
	tinsert(tbSayDialog,"T玦 ch� xem xem th玦/nothing")
	nSaySize = getn(tbSayDialog);
	Say(DSN_NPC..msg, nSaySize, tbSayDialog);
end
function updateAmHuyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N﹏g c蕄 trang s鴆 萴 Huy誸 c莕 ti猽 hao: 12 Thi猲 M玭 Kim L謓h, 12 Thi猲 Cang L謓h, 5 Huy誸 B� б, 1 C鰑 Thi猲 V� C鵦 Кn"
	
	tinsert(tbSayDialog,"N﹏g c蕄 T� Gi韎 萴 Huy誸 (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(5)")
	tinsert(tbSayDialog,"N﹏g c蕄 H鱱 Gi韎 萴 Huy誸 (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(6)")
	tinsert(tbSayDialog,"N﹏g c蕄 Tr魕 萴 Huy誸 (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(7)")
	tinsert(tbSayDialog,"N﹏g c蕄 B閕 萴 Huy誸 (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(8)")
	tinsert(tbSayDialog,"T玦 ch� xem xem th玦/nothing")
	nSaySize = getn(tbSayDialog);
	Say(DSN_NPC..msg, nSaySize, tbSayDialog);
end
function updateAmHuyet_choose(nChoose)
	local tCondition = { --Thi猲 m玭 kim l謓h, Thi猲 cang l謓h, Huy誸 b� , C鰑 thi猲 v� c鵦 n
				[1] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 103, 30610, 1},"n鉵 萴 huy誸"},
				[2] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 101, 30610, 1},"Qu莕 萴 huy誸"},
				[3] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 100, 30610, 1},"竜 萴 huy誸"},
				[4] = {18, {2,1,30370}, 18, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {},"v� kh� 萴 huy誸"},
				[5] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31272, 1},"t� gi韎 萴 huy誸"},
				[6] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31273, 1},"h鱱 gi韎 萴 huy誸"},
				[7] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31415, 1},"tr魕 萴 huy誸"},
				[8] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31414, 1},"b閕 萴 huy誸"},
				
			}
	local tVuKhi = {
				[2] = {0,3,30884, 1},
				[3] = {0,8,30885, 1},
				[4] = {0,0,30886, 1},
				[6] = {0,1,30887, 1},
				[8] = {0,2,30888, 1},
				[9] = {0,10,30889, 1},
				[11] = {0,0,30890, 1},
				[12] = {0,5,30891, 1},
				[14] = {0,2,30892, 1},
				[15] = {0,9,30893, 1},
				[17] = {0,6,30894, 1},
				[18] = {0,4,30895, 1},
				[20] = {0,7,30896, 1},
				[21] = {0,11,30897, 1},
				[23] = {0,2,30898, 1},
				[25] = {0,3,30899, 1},
				[26] = {0,9,30900, 1},
				[27] = {0,11,30901, 1},
				[29] = {0,13,30902, 1},
				[30] = {0,12,30903, 1},
				[31] = {0,14,32164, 1},
				[32] = {0,2,32192, 1},
			}
	local nRoute = GetPlayerRoute()		
	if ( nRoute == 0 )  then
		Talk ( 1, "" , "Thi誹 hi謕 ch璦 v� m玭 ph竔 n猲 kh玭g th� nh薾 thng!" )
		return 0
	end
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][1] then
		Talk(1, "","Чi hi謕 kh玭g mang  "..tCondition[nChoose][1].." Thi猲 M玭 Kim L謓h.")
		return 0
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][3] then
		Talk(1, "", "Чi hi謕 kh玭g mang  "..tCondition[nChoose][3].." Thi猲 Cang L謓h.")
		return 0
	end
	if GetItemCount(2,1,31241) < tCondition[nChoose][5] then
		Talk(1, "", "Чi hi謕 kh玭g mang  "..tCondition[nChoose][5].." Huy誸 B� б.")
		return 0
	end
	if GetItemCount(2,1,1006) < tCondition[nChoose][7] then
		Talk(1, "", "Чi hi謕 kh玭g mang  "..tCondition[nChoose][7].." C鰑 Thi猲 V� C鵦 Кn.")
		return 0
	end
	if DelItem(2,1,30370,tCondition[nChoose][1]) ~= 1 then
		Talk(1,"", "X鉧 kh玭g th祅h c玭g v藅 ph萴 1")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x鉧 v藅 ph萴 TMKL")
		return 0
	end
	if DelItem(2,95,204,tCondition[nChoose][3]) ~= 1 then
		Talk(1,"", "X鉧 kh玭g th祅h c玭g v藅 ph萴 2")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x鉧 v藅 ph萴 TCL")
		return 0
	end
	if DelItem(2,1,31241,tCondition[nChoose][5]) ~= 1 then
		Talk(1,"", "X鉧 kh玭g th祅h c玭g v藅 ph萴 3")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x鉧 v藅 ph萴 HBD")
		return 0
	end
	if DelItem(2,1,1006,tCondition[nChoose][7]) ~= 1 then
		Talk(1,"", "X鉧 kh玭g th祅h c玭g v藅 ph萴 4")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x鉧 v藅 ph萴 CTVCD")
		return 0
	end
	if nChoose == 4 then
		gf_AddItemEx2(tVuKhi[nRoute], tCondition[nChoose][10], "TIEN CAP AM HUYET", "Trang b� 萴 huy誸");
		Talk(1, "", "Ch骳 m鮪g i hi謕  n﹏g c蕄 th祅h c玭g v� kh� 萴 Huy誸.")
	else
		gf_AddItemEx2(tCondition[nChoose][9], tCondition[nChoose][10], "TIEN CAP AM HUYET", "Trang b� 萴 huy誸");
		Talk(1, "", "Ch骳 m鮪g i hi謕  n﹏g c蕄 th祅h c玭g trang b� 萴 Huy誸.")
	end
	gf_WriteLogEx("NANG CAP AM HUYET", "nhan", 1, "N﹏g c蕄 th祅h c玭g")
end