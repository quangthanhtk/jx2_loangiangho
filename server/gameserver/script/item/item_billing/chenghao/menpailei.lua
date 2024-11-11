-- ÃÅÅÉÀà³ÆºÅµÄÎïÆ·½Å±¾

START_INDEX = 23

tTab_chu =
{
	["index"] = 1,
--ÎïÆ·´óÀà£¬¸±Àà£¬ÏêÏ¸Àà±ğ£¬Á÷ÅÉ£¬ĞèÒªÉùÍû£¬³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬³ÖĞøÊ±¼ä(ÕæÊµÊ±¼ä)£¬Á÷ÅÉÃû
	[2] = 	{80,	"Hµnh gi¶",		23,	1 ,	3600 * 24 * 30, "ThiÕu L©m §ao"	  },
	[4] = 	{80,	"Sa Di",		23,	2 ,	3600 * 24 * 30, "ThiÕu L©m QuyÒn"    },
	[3] = 	{80,	"Khæ Hµnh T¨ng",	23,	3 ,	3600 * 24 * 30, "ThiÕu L©m Tr­îng"    },
	[6] = 	{80,	"Trang Kh¸ch",		23,	4 ,	3600 * 24 * 30, "§­êng M«n"        },
	[8] = 	{80,	"Thanh T©m Sø"  ,	23,	5 ,	3600 * 24 * 30, "Nga My phËt gia"    },
	[9] = 	{80,	"T­ Khóc Sø"  ,	23,	6 ,	3600 * 24 * 30, "Nga My tôc gia"    },
	[11] = 	{80,	"ChÊp B¸t §Ö Tö",	23,	7 ,	3600 * 24 * 30, "C¸i Bang QuyÒn"    },
	[12] = 	{80,	"ChÊp Bæng §Ö Tö",	23,	8 ,	3600 * 24 * 30, "C¸i Bang Bæng"    },
	[14] = 	{80,	"Thanh Tu ®¹o nh©n",	23,	9 ,	3600 * 24 * 30, "Vâ §ang KiÕm"    },
	[15] = 	{80,	"Thanh Phong ®¹o nh©n",	23,	10,	3600 * 24 * 30, "Vâ §ang Bót"    },
	[17] = 	{80,	"Khinh kş binh",	23,	11,	3600 * 24 * 30, "D­¬ng Gia Cung"    },
	[18] = 	{80,	"Xuyªn D­¬ng Thñ",	23,	12,	3600 * 24 * 30, "D­¬ng Gia Th­¬ng"    },
	[20] = 	{80,	"§o¹t Ph¸ch T¶n Nh©n",	23,	13,	3600 * 24 * 30, "HiÖp §éc"    },
	[21] = 	{80,	"§éc Tµm T¶n Nh©n",	23,	14,	3600 * 24 * 30, "Cæ S­"    },
	[23] = 	{30,	"Linh Phï §¹o Nh©n",	23,	15,	3600 * 24 * 30, "C«n L«n"    },
	[25] = 	{30,	"Kim L« Sø",	23,	16,	3600 * 24 * 30, "Th¸nh ChiÕn"    },
	[26] = 	{30,	"TrËn Binh Sø",	23,	17,	3600 * 24 * 30, "TrËn Binh"    },
	[27] = 	{30,	"¸m Tr¶o Sø",	23,	18,	3600 * 24 * 30, "HuyÕt Nh©n"    },
	[29] = 	{30,	"§¹p V©n Tiªn Tö",	23,	19,	3600 * 24 * 30, "Vò Tiªn"    },
	[30] = 	{30,	"TÇm H­¬ng Tiªn Tö",	23,	20,	3600 * 24 * 30, "Linh N÷"    },
	[31] = 	{30,	"Du HiÖp",	23,	21,	3600 * 24 * 30, "NhËm HiÖp"    },
	[32] = 	{30,	"§¹o §ång",	23,	22,	3600 * 24 * 30, "KiÕm T«n"    },
}

tTab_zhong =
{
	["index"] = 2,
--ÎïÆ·´óÀà£¬¸±Àà£¬ÏêÏ¸Àà±ğ£¬Á÷ÅÉ£¬ĞèÒªÉùÍû£¬³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬³ÖĞøÊ±¼ä(ÕæÊµÊ±¼ä)£¬Á÷ÅÉÃû
	[2] = 	{3000,	"Hçn Nguyªn T¨ng",	24,	1 ,	3600 * 24 * 30, "ThiÕu L©m §ao"	  },
	[4] = 	{3000,	"§Êu T¨ng",		24,	2 ,	3600 * 24 * 30, "ThiÕu L©m QuyÒn"    },
	[3] = 	{3000,	"ThiÒn Tu T¨ng",	24,	3 ,	3600 * 24 * 30, "ThiÕu L©m Tr­îng"    },
	[6] = 	{3000,	"Hé VÖ",		24,	4 ,	3600 * 24 * 30, "§­êng M«n"        },
	[8] = 	{3000,	"Vò Y Sø"  ,	24,	5 ,	3600 * 24 * 30, "Nga My phËt gia"    },
	[9] = 	{3000,	"Ph¹n ¢m Sø"  ,	24,	6 ,	3600 * 24 * 30, "Nga My tôc gia"    },
	[11] = 	{3000,	"Trõ Gian §Ö Tö",	24,	7 ,	3600 * 24 * 30, "C¸i Bang QuyÒn"    },
	[12] = 	{3000,	"Trõng ¸c §Ö Tö",	24,	8 ,	3600 * 24 * 30, "C¸i Bang Bæng"    },
	[14] = 	{3000,	"NhËp Quan ®¹o nh©n",	24,	9 ,	3600 * 24 * 30, "Vâ §ang KiÕm"    },
	[15] = 	{3000,	"S¬n D­¬ng ®¹o nh©n",	24,	10,	3600 * 24 * 30, "Vâ §ang Bót"    },
	[17] = 	{3000,	"HiÖu óy",		24,	11,	3600 * 24 * 30, "D­¬ng Gia Cung"    },
	[18] = 	{3000,	"§« óy",		24,	12,	3600 * 24 * 30, "D­¬ng Gia Th­¬ng"    },
	[20] = 	{3000,	"Th«i MÖnh T¶n Nh©n",	24,	13,	3600 * 24 * 30, "HiÖp §éc"    },
	[21] = 	{3000,	"Thùc T©m T¶n Nh©n",	24,	14,	3600 * 24 * 30, "Cæ S­"    },
	[23] = 	{120,	"Bİ Ph¸p §¹o Nh©n",	24,	15,	3600 * 24 * 30, "C«n L«n"    },
	[25] = 	{120,	"B¹o S¸t Sø",	24,	16,	3600 * 24 * 30, "Th¸nh ChiÕn"    },
	[26] = 	{120,	"Tö SÜ Sø",	24,	17,	3600 * 24 * 30, "TrËn Binh"    },
	[27] = 	{120,	"DiÖt Hån Sø",	24,	18,	3600 * 24 * 30, "HuyÕt Nh©n"    },
	[29] = 	{120,	"T©m Vò Tiªn Tö",	24,	19,	3600 * 24 * 30, "Vò Tiªn"    },
	[30] = 	{120,	"Th¸m Ngäc Tiªn Tö",	24,	20,	3600 * 24 * 30, "Linh N÷"    },
	[31] = 	{120,	"S¸t Thñ V« T×nh",	24,	21,	3600 * 24 * 30, "NhËm HiÖp"    },
	[32] = 	{120,	"LuyÖn KiÕm §¹o Nh©n",	24,	22,	3600 * 24 * 30, "KiÕm T«n"    },
}

tTab_gao =
{
	["index"] = 3,
--ÎïÆ·´óÀà£¬¸±Àà£¬ÏêÏ¸Àà±ğ£¬Á÷ÅÉ£¬ĞèÒªÉùÍû£¬³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬³ÖĞøÊ±¼ä(ÕæÊµÊ±¼ä)£¬Á÷ÅÉÃû
	[2] = 	{6000,	"§¹t Ma Kim Cang",	25,	1 ,	3600 * 24 * 30, "ThiÕu L©m §ao"	  },
	[4] = 	{6000,	"La H¸n Hé Ph¸p",	25,	2 ,	3600 * 24 * 30, "ThiÕu L©m QuyÒn"    },
	[3] = 	{6000,	"TruyÒn kinh ph¸p s­",	25,	3 ,	3600 * 24 * 30, "ThiÕu L©m Tr­îng"    },
	[6] = 	{6000,	"Bİ ®éc thİch kh¸ch",	25,	4 ,	3600 * 24 * 30, "§­êng M«n"        },
	[8] = 	{6000,	"Tö Tróc sø"  ,	25,	5 ,	3600 * 24 * 30, "Nga My phËt gia"    },
	[9] = 	{6000,	"H¶i NguyÖt sø"  ,	25,	6 ,	3600 * 24 * 30, "Nga My tôc gia"    },
	[11] = 	{6000,	"Tø H¶i hiÖp"  ,	25,	7 ,	3600 * 24 * 30, "C¸i Bang QuyÒn"    },
	[12] = 	{6000,	"§Ö tö t¸m tói",	25,	8 ,	3600 * 24 * 30, "C¸i Bang Bæng"    },
	[14] = 	{6000,	"V« ng· ®¹o nh©n",	25,	9 ,	3600 * 24 * 30, "Vâ §ang KiÕm"    },
	[15] = 	{6000,	"Nhµn V©n HiÖp §¹o",	25,	10,	3600 * 24 * 30, "Vâ §ang Bót"    },
	[17] = 	{6000,	"PhÊn vò t­íng qu©n",	25,	11,	3600 * 24 * 30, "D­¬ng Gia Cung"    },
	[18] = 	{6000,	"PhÊn uy t­íng qu©n",	25,	12,	3600 * 24 * 30, "D­¬ng Gia Th­¬ng"    },
	[20] = 	{6000,	"H¾c V« Th­êng"  ,	25,	13,	3600 * 24 * 30, "HiÖp §éc"    },
	[21] = 	{6000,	"B¹ch V« Th­êng"  ,	25,	14,	3600 * 24 * 30, "Cæ S­"    },
	[23] = 	{1000,	"TrÊn Yªu §¹o Nh©n",	25,	15,	3600 * 24 * 30, "C«n L«n"    },
	[25] = 	{1000,	"Hé Gi¸o Sø",	25,	16,	3600 * 24 * 30, "Th¸nh ChiÕn"    },
	[26] = 	{1000,	"Tr­êng Kú Sø",	25,	17,	3600 * 24 * 30, "TrËn Binh"    },
	[27] = 	{1000,	"Thanh Minh Sø",	25,	18,	3600 * 24 * 30, "HuyÕt Nh©n"    },
	[29] = 	{1000,	"Thu NguyÖt Sø",	25,	19,	3600 * 24 * 30, "Vò Tiªn"    },
	[30] = 	{1000,	"Nghªnh H­¬ng Sø",	25,	20,	3600 * 24 * 30, "Linh N÷"    },
	[31] = 	{1000,	"S¸t Thñ §­êng Gia",	25,	21,	3600 * 24 * 30, "NhËm HiÖp"    },
	[32] = 	{1000,	"DiÖu HuyÒn §¹o SÜ",	25,	22,	3600 * 24 * 30, "KiÕm T«n"    },
}                                   

tTab_zuigao =
{
	["index"] = 4,
--ÎïÆ·´óÀà£¬¸±Àà£¬ÏêÏ¸Àà±ğ£¬Á÷ÅÉ£¬ĞèÒªÉùÍû£¬³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬³ÖĞøÊ±¼ä(ÕæÊµÊ±¼ä)£¬Á÷ÅÉÃû
	[2] = 	{10000,	"B¸t Bé Thiªn Long",	26,	1 ,	3600 * 24 * 30, "ThiÕu L©m §ao"	  },
	[4] = 	{10000,	"B¸t B¶o La H¸n",	26,	2 ,	3600 * 24 * 30, "ThiÕu L©m QuyÒn"    },
	[3] = 	{10000,	"V« L­îng Ph¸p T«n",	26,	3 ,	3600 * 24 * 30, "ThiÕu L©m Tr­îng"    },
	[6] = 	{10000,	"Thiªn C¬ Sø Gi¶",	26,	4 ,	3600 * 24 * 30, "§­êng M«n"        },
	[8] = 	{10000,	"B¹ch Liªn Tiªn Tö",	26,	5 ,	3600 * 24 * 30, "Nga My phËt gia"    },
	[9] = 	{10000,	"Ngäc VËn Tiªn Tö",	26,	6 ,	3600 * 24 * 30, "Nga My tôc gia"    },
	[11] = 	{10000,	"Long §Çu ThÇn C¸i",	26,	7 ,	3600 * 24 * 30, "C¸i Bang QuyÒn"    },
	[12] = 	{10000,	"KhÊt Thiªn ThÇn C¸i",	26,	8 ,	3600 * 24 * 30, "C¸i Bang Bæng"    },
	[14] = 	{10000,	"Ch­ëng Kinh ®¹o nh©n",	26,	9 ,	3600 * 24 * 30, "Vâ §ang KiÕm"    },
	[15] = 	{10000,	"Th¸i Êt T¶n Nh©n",	26,	10,	3600 * 24 * 30, "Vâ §ang Bót"    },
	[17] = 	{10000,	"Long T­¬ng t­íng qu©n",	26,	11,	3600 * 24 * 30, "D­¬ng Gia Cung"    },
	[18] = 	{10000,	"Hæ Dùc t­íng qu©n",	26,	12,	3600 * 24 * 30, "D­¬ng Gia Th­¬ng"    },
	[20] = 	{10000,	"U Minh Quû S¸t",	26,	13,	3600 * 24 * 30, "HiÖp §éc"    },
	[21] = 	{10000,	"V« §æng La S¸t",	26,	14,	3600 * 24 * 30, "Cæ S­"    },
	[23] = 	{3500,	"Tö Vi §¹o Nh©n",	26,	15,	3600 * 24 * 30, "C«n L«n"    },
	[25] = 	{3500,	"Tiªu Dao ThÇn Sø",	26,	16,	3600 * 24 * 30, "Th¸nh ChiÕn"    },
	[26] = 	{3500,	"Thiªn Cuång §¹i T­íng",	26,	17,	3600 * 24 * 30, "TrËn Binh"    },
	[27] = 	{3500,	"NguyÖt nh Ma T«n",	26	18,	3600 * 24 * 30, "HuyÕt Nh©n"    },
	[29] = 	{3500,	"Cöu Thiªn Th¸i Ph­îng",	26,	19,	3600 * 24 * 30, "Vò Tiªn"    },
	[30] = 	{3500,	"B¨ng T©m Ngäc N÷",	26,	20,	3600 * 24 * 30, "Linh N÷"    },
	[31] = 	{3500,	"Quû MŞ Thİch Kh¸ch",	26,	21,	3600 * 24 * 30, "NhËm HiÖp"    },
	[32] = 	{3500,	"Tr¶m Ma §¹o Nh©n",	26,	22,	3600 * 24 * 30, "KiÕm T«n"    },
}

tItem =
{
	{2, 1, 1053, tTab_chu},
	{2, 1, 1054, tTab_zhong},
	{2, 1, 1018, tTab_gao},
	{2, 1, 1055, tTab_zuigao},
}

function GetPlayerSex()
	if GetSex() == 1 then
		return "ThiÕu hiÖp"
	else
		return "N÷ hiÖp "
	end
end

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tItem do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	SetTaskTemp(30, nTabIndex)
	local tTab = tItem[nTabIndex][4]
	
	local nRoute = GetPlayerRoute()
	if tTab[nRoute] == nil then
		Say("Ng­¬i ch­a gia nhËp m«n ph¸i, kh«ng thÓ sö dông vËt phÈm nµy", 0)
		return
	end
	Say(tTab[nRoute][6].."§iÓm cèng hiÕn ®Ö tö s­ m«n ®¹t ®­îc <color=yellow>"..tTab[nRoute][1].."<color> lµ ®­îc phong <color=green> "..tTab[nRoute][2].." <color>, muèn dïng kh«ng?", 2, "§óng/yes_say", "Sai/no_say")
end

function yes_say()
	local nIndex = GetTaskTemp(30)
	local tTab = tItem[nIndex][4]
	local nRoute = GetPlayerRoute()
	
	local nExist = 0
	for i = 1, getn(tItem) do
		if IsTitleExist(i + START_INDEX - 1, tTab[nRoute][4]) > 0 then
			local t = tItem[i][4]
			nExist = t["index"]
			break
		end
	end
	
	if nIndex < nExist then
		Say("§¼ng cÊp x­ng hiÖu s­ m«n cña b¹n lín h¬n ®¼ng cÊp x­ng hiÖu sö dông vËt phÈm, kh«ng cÇn dïng vËt phÈm nµy.", 0)
	elseif nIndex == nExist then
		Say("Ng­¬i ®· lµ <color=green> "..tTab[nRoute][2].." <color> råi.", 0)
	elseif GetTask(336) < tTab[nRoute][1] then
		Say(GetPlayerSex().."§é cèng hiÕn s­ m«n cña b¹n kh«ng ®ñ.", 0)
	elseif nExist > 0 then
		Say("HiÖn ng­¬i ®· cã danh hiÖu <color=red> "..tItem[nExist][4][nRoute][2].." <color>! Cã muèn ®æi thµnh <color=green> "..tTab[nRoute][2].." <color>?", 2, "§óng/#yes_change_title("..nIndex..")", "Sai/no_say")
	else
		yes_change_title(nIndex)
	end
end

function yes_change_title(nIndex)
	local tTab = tItem[nIndex][4]
	local nRoute = GetPlayerRoute()

	if DelItem(tItem[nIndex][1], tItem[nIndex][2], tItem[nIndex][3], 1) == 1 then
		-- É¾³ıµôµÍ¼¶ÉùÍû
		for i = START_INDEX, START_INDEX + getn(tItem) do
			RemoveTitle(i, tTab[nRoute][4])
		end
		local nGenre = tTab[nRoute][3]
		local nDetail = tTab[nRoute][4]
		local nTime = tTab[nRoute][5]
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGenre, nDetail, 0)
		Msg2Player("B¹n nhËn ®­îc x­ng hiÖu"..tTab[nRoute][2])
		SetCurTitle(nGenre, nDetail)
	end
end

function no_say()

end