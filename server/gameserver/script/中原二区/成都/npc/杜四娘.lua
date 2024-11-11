--Éú²ú¼¼ÄÜ½ä×Ó²ÄÁÏÖÆ×÷
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\vng\\weapon_upgrade\\upgradesattinh.lua")
--KSGVN
Import("\\script\\ksgvn\\lib.lua")
-- END KSGVN
DSN_NPC = "<color=green>§ç Tø N­¬ng<color>: ";

function main()
	local tSay = {
		format("\nN©ng cÊp trang bÞ S¸t Tinh/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_SATTINH),
		--"\nN©ng cÊp trang bÞ S¸t Tinh/updateSatTinh",
		--"N©ng cÊp trang bÞ Èm HuyÕt (gi¸ rÎ)/updateAmHuyet",
		format("TiÖm Èm HuyÕt/#show_equip_shop(%d)", 3100),
		format("TiÖm Linh §å Giíi ChØ/#show_equip_shop(%d)", 3044),
		--format("\nºÀÏÀ×°±¸ÉÌµê/#show_equip_shop(%d)", 3045),
		--format("\n¸ß¼¶²ÄÁÏÉÌµê/#show_equip_shop(%d)", 3043),\
		format("§æi trang bÞ Hµo HiÖp V« H¹/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_HHVH),
		--"TiÕn cÊp trang bÞ Hµo HiÖp/NormalHaoxia2Level",
		"\nT«i chØ xem xem th«i/nothing",
	}		
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

tRecipe2Level = {
	[0] = {{"Viªm Linh Bè", {2, 1, 30676, 15}}, {"Linh ThiÕt", {2, 1, 30681, 30}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 300}}},
	[1] = {{"Ma Lang Gi¸p", {2, 1, 30677, 15}}, {"Linh ThiÕt", {2, 1, 30681, 30}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 300}}},
	[2] = {{"HuyÒn Viªm C­¬ng", {2, 1, 30675, 20}}, {"Thiªn M«n Kim LÖnh", {2, 1, 30370, 10}}, {"Thiªn Cang LÖnh", {2, 95, 204, 10}}, {"Linh KhÝ Rùc Rì", {2, 1, 31122, 2}},},
	[3] = {{"§Þa Long Gi¸p", {2, 1, 30678, 15}}, {"Linh ThiÕt", {2, 1, 30681, 30}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 300}}},
}

tWuxiaHaoxia = {
	[0] = {"V« H¹ Hµo HiÖp LÖnh (Nãn)",	{2, 1, 30944, 1, 4}},
	[1] = {"V« H¹ Hµo HiÖp LÖnh (¸o)",	{2, 1, 30945, 1, 4}},
	[2] = {"V« H¹ Hµo HiÖp LÖnh (Vò KhÝ)",    {2, 1, 30973, 1, 4}},
	[3] = {"V« H¹ Hµo HiÖp LÖnh (QuÇn)",	{2, 1, 30946, 1, 4}},
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
		format("§æi V« H¹ Hµo HiÖp LÖnh (Nãn)/#NormalHaoxia2Level_do(%d)", 0),
		format("§æi V« H¹ Hµo HiÖp LÖnh (¸o)/#NormalHaoxia2Level_do(%d)", 1),
		format("§æi V« H¹ Hµo HiÖp LÖnh (QuÇn)/#NormalHaoxia2Level_do(%d)", 3),
		format("%s/#NormalHaoxia2Level_do(%d)", "§æi V« H¹ Hµo HiÖp LÖnh (Vò khÝ)", 2),
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(DSN_NPC..format("TiÕn cÊp trang bÞ Hµo HiÖp, mêi %s h·y chän lo¹i cÇn ®æi: <color=red> (H·y mÆc trang bÞ Hµo HiÖp trªn ng­êi)<color>", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function NormalHaoxia2Level_do(nPos)
	local msg = "§æi [<color=green>%s<color>] cÇn tiªu hao: %s. <color=red>(Sau khi ®æi trang bÞ Hµo HiÖp ®· c­êng hãa, hoµn tr¶ ®é c­êng hãa theo quy t¾c t¸ch)<color>"
	local tRecipe = tRecipe2Level[nPos];
	local szCost = ""
	for i = 1, getn(tRecipe) do
		szCost = format("%s, %d [%s]", szCost, tRecipe[i][2][4], tRecipe[i][1])
	end
	szCost = strsub(szCost,2)
	msg = format(msg, tWuxiaHaoxia[nPos][1], szCost)
	Say(DSN_NPC..msg, 2, format("§æi ngay/#Exchange2Wuxiaohao(%d)", nPos), "T¹i h¹ chØ xem qua th«i/nothing")
end

function Exchange2Wuxiaohao(nPos)
	local nItemIndex = GetPlayerEquipIndex(nPos);
	local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
	local nP = GetItemParticular(nItemIndex);
	if (nPos~= 2 and nP ~= 30568) or (nPos==2 and not(nP >= 30724 and nP <= 30743) and nP ~= 32190 and nP ~= 32162) then
		Talk(1,"",DSN_NPC.."Ph¶i mÆc trang bÞ Hµo HiÖp lªn ng­êi míi ®­îc tiÕn cÊp!");
		return 0;
	end
	local tRecipe = tRecipe2Level[nPos];
	for i = 1, getn(tRecipe) do
		if GetItemCount(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3]) < tRecipe[i][2][4] then
			Talk(1,"",DSN_NPC..format("%s kh«ng ®ñ %d c¸i, kh«ng thÓ hoµn thµnh ®æi.", tRecipe[i][1], tRecipe[i][2][4]));
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
			gf_AddItemEx2(v, GetItemName(v[1],v[2],v[3]), "TiÕn cÊp Hµo HiÖp", "Hoµn tr¶ ®é c­êng hãa", 0, 1);
		end
	end
	local tAward = tWuxiaHaoxia[nPos];
	gf_AddItemEx2(tAward[2], tAward[1], "TiÕn cÊp Hµo HiÖp", "V« H¹ Hµo HiÖp LÖnh", 0, 1);
end

function updateAmHuyet()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N©ng cÊp trang bÞ Èm HuyÕt cÇn tiªu hao: Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, HuyÕt Bå §Ò, Cöu Thiªn V« Cùc §¬n"
	
	tinsert(tbSayDialog,"N©ng cÊp Nãn Èm HuyÕt (8 TMKL, 8 TCL, 5 HB§)/#updateAmHuyet_choose(1)")
	tinsert(tbSayDialog,"N©ng cÊp QuÇn Èm HuyÕt (8 TMKL, 8 TCL, 5 HB§)/#updateAmHuyet_choose(2)")
	tinsert(tbSayDialog,"N©ng cÊp ¸o Èm HuyÕt (8 TMKL, 8 TCL, 5 HB§)/#updateAmHuyet_choose(3)")
	tinsert(tbSayDialog,"N©ng cÊp Vò KhÝ Èm HuyÕt (18 TMKL, 18 TCL, 5 HB§, 1 CTVC§)/#updateAmHuyet_choose(4)")
	tinsert(tbSayDialog,"N©ng cÊp Trang Søc Èm HuyÕt (12 TMKL, 12 TCL, 5 HB§, 1 CTVC§)/updateAmHuyet_trangsuc")
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(DSN_NPC..msg, nSaySize, tbSayDialog);
end
function updateAmHuyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N©ng cÊp trang søc Èm HuyÕt cÇn tiªu hao: 12 Thiªn M«n Kim LÖnh, 12 Thiªn Cang LÖnh, 5 HuyÕt Bå §Ò, 1 Cöu Thiªn V« Cùc §¬n"
	
	tinsert(tbSayDialog,"N©ng cÊp T¶ Giíi Èm HuyÕt (12 TMKL, 12 TCL, 5 HB§, 1 CTVC§)/#updateAmHuyet_choose(5)")
	tinsert(tbSayDialog,"N©ng cÊp H÷u Giíi Èm HuyÕt (12 TMKL, 12 TCL, 5 HB§, 1 CTVC§)/#updateAmHuyet_choose(6)")
	tinsert(tbSayDialog,"N©ng cÊp Trôy Èm HuyÕt (12 TMKL, 12 TCL, 5 HB§, 1 CTVC§)/#updateAmHuyet_choose(7)")
	tinsert(tbSayDialog,"N©ng cÊp Béi Èm HuyÕt (12 TMKL, 12 TCL, 5 HB§, 1 CTVC§)/#updateAmHuyet_choose(8)")
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(DSN_NPC..msg, nSaySize, tbSayDialog);
end
function updateAmHuyet_choose(nChoose)
	local tCondition = { --Thiªn m«n kim lÖnh, Thiªn cang lÖnh, HuyÕt bå ®Ò, Cöu thiªn v« cùc ®¬n
				[1] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 103, 30610, 1},"nãn Èm huyÕt"},
				[2] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 101, 30610, 1},"QuÇn Èm huyÕt"},
				[3] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 100, 30610, 1},"¸o Èm huyÕt"},
				[4] = {18, {2,1,30370}, 18, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {},"vò khÝ Èm huyÕt"},
				[5] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31272, 1},"t¶ giíi Èm huyÕt"},
				[6] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31273, 1},"h÷u giíi Èm huyÕt"},
				[7] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31415, 1},"trôy Èm huyÕt"},
				[8] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31414, 1},"béi Èm huyÕt"},
				
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
		Talk ( 1, "" , "ThiÕu hiÖp ch­a v« m«n ph¸i nªn kh«ng thÓ nhËn th­ëng!" )
		return 0
	end
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][1] then
		Talk(1, "","§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][1].." Thiªn M«n Kim LÖnh.")
		return 0
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][3] then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][3].." Thiªn Cang LÖnh.")
		return 0
	end
	if GetItemCount(2,1,31241) < tCondition[nChoose][5] then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][5].." HuyÕt Bå §Ò.")
		return 0
	end
	if GetItemCount(2,1,1006) < tCondition[nChoose][7] then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][7].." Cöu Thiªn V« Cùc §¬n.")
		return 0
	end
	if DelItem(2,1,30370,tCondition[nChoose][1]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 1")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "xãa vËt phÈm TMKL")
		return 0
	end
	if DelItem(2,95,204,tCondition[nChoose][3]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 2")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "xãa vËt phÈm TCL")
		return 0
	end
	if DelItem(2,1,31241,tCondition[nChoose][5]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 3")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "xãa vËt phÈm HBD")
		return 0
	end
	if DelItem(2,1,1006,tCondition[nChoose][7]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 4")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "xãa vËt phÈm CTVCD")
		return 0
	end
	if nChoose == 4 then
		gf_AddItemEx2(tVuKhi[nRoute], tCondition[nChoose][10], "TIEN CAP AM HUYET", "Trang bÞ Èm huyÕt");
		Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng vò khÝ Èm HuyÕt.")
	else
		gf_AddItemEx2(tCondition[nChoose][9], tCondition[nChoose][10], "TIEN CAP AM HUYET", "Trang bÞ Èm huyÕt");
		Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng trang bÞ Èm HuyÕt.")
	end
	gf_WriteLogEx("NANG CAP AM HUYET", "nhan", 1, "N©ng cÊp thµnh c«ng")
end