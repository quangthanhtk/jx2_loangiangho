Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Import("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")

--Include("\\script\\class\\clause3.lua");
--Include("\\script\\lib\\itemfunctions.lua")
--Import("\\script\\lib\\val2str.lua");

TAIXU_TASKID_EXP_DRUG_TIME = 3536 -- ¼ÇÂ¼Ì«Ğé×¨ÓÃexp¼Ó³ÉµÀ¾ßÊ±Ğ§
TAIXU_TASKID_EXP_DRUG_TYPE = 3538 -- ¼ÇÂ¼Ì«Ğé×¨ÓÃexp¼Ó³ÉµÀ¾ßÀàĞÍ

tTxExpItem = {
	{1, "Th¸i H­ ThÇn Du §¬n", "TÊt c¶ th­ëng x2"},
	{2, "Th¸i H­ L­îc nh §¬n", "Kinh nghiÖm x2"},
}
tTxExpGDP2Item = {
    [PackItemId(2,1,31268)] = tTxExpItem[1],
    [PackItemId(2,1,31269)] = tTxExpItem[2],
}

g_MaxLevel = 30 ;--¹Ø¿¨×î´ó¹ØÊı
g_NeedLevel= 70 ;--Íæ¼ÒĞèÒªµÄµÈ¼¶
tbTaiXu = {
	name = "Th¸i H­",
	missionID = 90, --Î¨Ò»ID£¬²é¿´ÅäÖÃ±í
	realMapID = 1010,
	dynamicMap = 1, -- ¶¯Ì¬µØÍ¼
	

--	timerTriggerID = 101,
--	costomerID = 101,
--ÒÔÏÂÎªmissionV±äÁ¿
--	mv1	= 1, --Èë¿ÚNPCµÄÖ÷³ÇID
	mv2 = 2, --Õâ¹ØÏûÃğµÄÔÓ±øÊı£¨Í¨¹ı±¾¹ØÊ±£¬Çå0£©
	mv3 = 3, --Õâ¹ØÊÇ·ñÏûÃğÁË¾«Ó¢¹Ö£¨Í¨¹ı±¾¹ØÊ±£¬Çå0£©
	mv4 = 4, --ÇøÓò£¬1£º±ùÌìÑ©µØ£¬2½­ÄÏ 3µØÓü 4å«º£»ÆÉ³
	mv5 = 5, --±ê¼ÇÊÇ·ñÒÑ¾­ÁìÁË½±ÀøÁË£¨Í¨¹ı±¾¹ØÊ±£¬Çå0£©
	mv6 = 6, --±ê¼ÇÌø¹ØµÄ×´Ì¬(0Ã»ÓĞÌø¹Ø 1´Ó41¹Ø¿ªÊ¼ 2´Ó61¹Ø¿ªÊ¼)
--ÒÔÏÂÎªmissionS±äÁ¿	
	ms1 = 1,  --Ô¤Áô 
}
tbTaiXu = gf_CopyInherit(missionHead, tbTaiXu);
tbTaiXu = gf_CopyInherit(missionBase, tbTaiXu);



tEnterPos = {
	{1543,3297},
	{1625,3300},
	{1542,3458},
	{1625,3470},
	}
	
tExitPos = 
{
	[100] = {100, 1379, 2858},
	[200] = {200, 1151, 2850},
	[300] = {300, 1975, 3552},
	}
	
thisFile = "\\script\\missions\\taixu_mission\\mission.lua";


tBossType = 
{
	{["Th¸i H­ NguyÖt L­îng Thè"  ] = 1, ["Th¸i H­ Bµn Thá"    ] = 2,},--[nStage] ={ ["NPCÃû×Ö"] =  1, ["NPCÃû×Ö"] =  2}, ×¢£º1±íÊ¾¾«Ó¢¹Ö ,2±íÊ¾Ğ¡ÔÓ±ø
	{["Th¸i H­ Viªn Nh©n V­¬ng"  ] = 1, ["Th¸i H­ V­în to"      ] = 2,},
	{["Th¸i H­ Hæ tr¾ng"    ] = 1, ["Th¸i H­ M·nh hæ"      ] = 2,},
	{["Th¸i H­ B¹ch §iªu"    ] = 1, ["Th¸i H­ Qu¹ §en"      ] = 2,},
	{["Th¸i H­ H¹o Vò KiÕm"  ] = 1, ["Th¸i H­ KiÕm S¸t"      ] = 2,},
	{["Th¸i H­ Thô Yªu"    ] = 1, ["Th¸i H­ Thùc Nh©n hoa"    ] = 2,},
	{["Th¸i H­ HáaYªu Hå"  ] = 1, ["Th¸i H­ B¹ch Yªu Hå"    ] = 2,},
	{["Th¸i H­ ThÇn N÷"    ] = 1, ["Th¸i H­ CÇm Tiªn Tö"    ] = 2,},
	{["Th¸i H­ Tr­ V­¬ng"    ] = 1, ["Th¸i H­ TuyÕt Qu¸i"      ] = 2,},
	{["Th¸i H­Tr× §«ng"    ] = 1, ["Th¸i H­ Th¶o KhÊu"      ] = 2,},
	{["Th¸i H­ Du Hån"    ] = 1, ["Th¸i H­ Lam TiÓu ®ao quû"  ] = 2,},
	{["Th¸i H­ Oan Hån"    ] = 1, ["Th¸i H­ TiÓu Hång xoa quû"  ] = 2,},
	{["Th¸i H­ L·nh H­¬ng Ng­ng"  ] = 1, ["Th¸i H­ Lam Phi tr¶o quû"  ] = 2,},
	{["Th¸i H­ HuyÒn Vâ KiÕm"] = 1, ["Th¸i H­ KiÕm t­îng"] = 2,},
	{["Th¸i H­ Nguy ChÊn Thiªn"  ] = 1, ["Th¸i H­ S¬n TÆc §Çu Môc"  ] = 2,},
	{["Th¸i H­ T¨ng ¸c"    ] = 1, ["Th¸i H­ MÉu D¹ Xoa"    ] = 2,},
	{["Th¸i H­ KiÕm Ma"    ] = 1, ["Th¸i H­ KiÕm Hån"      ] = 2,},
	{["Th¸i H­ L­u Quang"    ] = 1, ["Th¸i H­ Háa Kú L©n"    ] = 2,},
	{["Th¸i H­ HáaPhông hoµng"  ] = 1, ["Th¸i H­ Phông hoµng"      ] = 2,},
	{["Th¸i H­ Phong NhÊt Phµm"  ] = 1, ["Th¸i H­ KiÕm tiªn Tö"    ] = 2,},
	{["Th¸i H­ L©m Xung"    ] = 1, ["Th¸i H­ KiÕm Cuång"      ] = 2,},
	{["Th¸i H­ Ng­u §Çu Qu¸i"    ] = 1, ["Th¸i H­ Bß T©y T¹ng"      ] = 2,},
	{["Th¸i H­ Hoa Th¸nh"    ] = 1, ["Th¸i H­ Cao Phó So¸i"    ] = 2,},
	{["Th¸i H­ Tè Tiªn"    ] = 1, ["Th¸i H­ Hoa Si N÷"    ] = 2,},
	{["Th¸i H­ KhØ mËp"  ] = 1, ["Th¸i H­ Tæng qu¶n"      ] = 2,},
	{["Th¸i H­ NguyÖt Thè-C­êng"  ] = 1, ["Th¸i H­ Cù Thè-C­êng"    ] = 2,},
	{["Th¸i H­ HÇu V­¬ng-C­êng"  ] = 1, ["Th¸i H­ Cù Viªn-C­êng"      ] = 2,},
	{["Th¸i H­ B¹ch Hæ-C­êng"    ] = 1, ["Th¸i H­ M·nh hæ-C­êng"      ] = 2,},
	{["Th¸i H­ B¹ch §iªu-C­êng"    ] = 1, ["Th¸i H­ H¾c Nha-C­êng"      ] = 2,},
	{["Th¸i H­ H¹o KiÕm-C­êng"  ] = 1, ["Th¸i H­ KiÕm S¸t-C­êng"      ] = 2,},
	{["Th¸i H­ Thô Yªu-C­êng"    ] = 1, ["Th¸i H­ Thùc Hoa-C­êng"    ] = 2,},
	{["Th¸i H­ Háa Hå-C­êng"  ] = 1, ["Th¸i H­ B¹ch Hå-C­êng"    ] = 2,},
	{["Th¸i H­ ThÇn N÷-C­êng"    ] = 1, ["Th¸i H­ CÇm Tiªn-C­êng"    ] = 2,},
	{["Th¸i H­ Tr­ V­¬ng-C­êng"    ] = 1, ["Th¸i H­ TuyÕt Qu¸i-C­êng"      ] = 2,},
	{["Th¸i H­ Tr× §«ng-C­êng"    ] = 1, ["Th¸i H­ Th¶o KhÊu-C­êng"      ] = 2,},
	{["Th¸i H­ Du Hån-C­êng"    ] = 1, ["Th¸i H­ Lam §ao-C­êng"  ] = 2,},
	{["Th¸i H­ Oan Hån-C­êng"    ] = 1, ["Th¸i H­ Hång Xoa-C­êng"  ] = 2,},
	{["Th¸i H­ L·nh H­¬ng-C­êng"  ] = 1, ["Th¸i H­ Lam Tr¶o-C­êng"  ] = 2,},
	{["Th¸i H­ o KiÕm-C­êng"] = 1, ["Th¸i H­ KiÕm T­îng-C­êng"] = 2,},
	{["Th¸i H­ ChÊn Thiªn-C­êng"  ] = 1, ["Th¸i H­ TÆc LÜnh-C­êng"  ] = 2,},
	{["Th¸i H­ ¸c T¨ng-C­êng"    ] = 1, ["Th¸i H­ MÉu D¹ Xoa-C­êng"    ] = 2,},
	{["Th¸i H­ KiÕm Ma-C­êng"    ] = 1, ["Th¸i H­ KiÕm Hån-C­êng"      ] = 2,},
	{["Th¸i H­ L­u Quang-C­êng"    ] = 1, ["Th¸i H­ Háa Kú L©n-C­êng"    ] = 2,},
	{["Th¸i H­ Háa Phông-C­êng"  ] = 1, ["Th¸i H­ Phông Hoµng-C­êng"      ] = 2,},
	{["Th¸i H­ NhÊt Phµm-C­êng"  ] = 1, ["Th¸i H­ KiÕm Tiªn-C­êng"    ] = 2,},
	{["Th¸i H­ L©m Xung-C­êng"    ] = 1, ["Th¸i H­ KiÕm Cuång-C­êng"      ] = 2,},
	{["Th¸i H­ Ng­u Qu¸i-C­êng"    ] = 1, ["Th¸i H­ Mao Ng­u-C­êng"      ] = 2,},
	{["Th¸i H­ Hoa Th¸nh-C­êng"    ] = 1, ["Th¸i H­ Phó So¸i-C­êng"    ] = 2,},
	{["Th¸i H­ Tè Tiªn-C­êng"    ] = 1, ["Th¸i H­ Hoa N÷-C­êng"    ] = 2,},
	{["Th¸i H­ Cù HÇu-C­êng"  ] = 1, ["Th¸i H­ Tæng Qu¶n-C­êng"      ] = 2,},
	{["Th¸i H­ NguyÖt Thè-Tinh"  ] = 1, ["Th¸i H­ Cù Thè-Tinh"    ] = 2,},
	{["Th¸i H­ HÇu V­¬ng-Tinh"  ] = 1, ["Th¸i H­ Cù Viªn-Tinh"      ] = 2,},
	{["Th¸i H­ B¹ch Hæ-Tinh"    ] = 1, ["Th¸i H­ M·nh hæ-Tinh"      ] = 2,},
	{["Th¸i H­ B¹ch §iªu-Tinh"    ] = 1, ["Th¸i H­ H¾c Nha-Tinh"      ] = 2,},
	{["Th¸i H­ H¹o KiÕm-Tinh"  ] = 1, ["Th¸i H­ KiÕm S¸t-Tinh"      ] = 2,},
	{["Th¸i H­ Thô Yªu-Tinh"    ] = 1, ["Th¸i H­ Thùc Hoa-Tinh"    ] = 2,},
	{["Th¸i H­ Háa Hå-Tinh"  ] = 1, ["Th¸i H­ B¹ch Hå-Tinh"    ] = 2,},
	{["Th¸i H­ ThÇn N÷-Tinh"    ] = 1, ["Th¸i H­ CÇm Tiªn-Tinh"    ] = 2,},
	{["Th¸i H­ Tr­ V­¬ng-Tinh"    ] = 1, ["Th¸i H­ TuyÕt Qu¸i-Tinh"      ] = 2,},
	{["Th¸i H­ Tr× §«ng-Tinh"    ] = 1, ["Th¸i H­ Th¶o KhÊu-Tinh"      ] = 2,},
	{["Th¸i H­ Du Hån-Tinh"    ] = 1, ["Th¸i H­ Lam §ao-Tinh"  ] = 2,},
	{["Th¸i H­ Oan Hån-Tinh"    ] = 1, ["Th¸i H­ Hång Xoa-Tinh"  ] = 2,},
	{["Th¸i H­ L·nh H­¬ng-Tinh"  ] = 1, ["Th¸i H­ Lam Tr¶o-Tinh"  ] = 2,},
	{["Th¸i H­ o KiÕm-Tinh"] = 1, ["Th¸i H­ KiÕm T­îng-Tinh"] = 2,},
	{["Th¸i H­ ChÊn Thiªn-Tinh"  ] = 1, ["Th¸i H­ TÆc LÜnh-Tinh"  ] = 2,},
	{["Th¸i H­ ¸c T¨ng-Tinh"    ] = 1, ["Th¸i H­ MÉu D¹ Xoa-Tinh"    ] = 2,},
	{["Th¸i H­ KiÕm Ma-Tinh"    ] = 1, ["Th¸i H­ KiÕm Hån-Tinh"      ] = 2,},
	{["Th¸i H­ L­u Quang-Tinh"    ] = 1, ["Th¸i H­ Háa Kú L©n-Tinh"    ] = 2,},
	{["Th¸i H­ Háa Phông-Tinh"  ] = 1, ["Th¸i H­ Phông Hoµng-Tinh"      ] = 2,},
	{["Th¸i H­ NhÊt Phµm-Tinh"  ] = 1, ["Th¸i H­ KiÕm Tiªn-Tinh"    ] = 2,},
	{["Th¸i H­ L©m Xung-Tinh"    ] = 1, ["Th¸i H­ KiÕm Cuång-Tinh"      ] = 2,},
	{["Th¸i H­ Ng­u Qu¸i-Tinh"    ] = 1, ["Th¸i H­ Mao Ng­u-Tinh"      ] = 2,},
	{["Th¸i H­ Hoa Th¸nh-Tinh"    ] = 1, ["Th¸i H­ Phó So¸i-Tinh"    ] = 2,},
	{["Th¸i H­ Tè Tiªn-Tinh"    ] = 1, ["Th¸i H­ Hoa N÷-Tinh"    ] = 2,},
	{["Th¸i H­ Cù HÇu-Tinh"  ] = 1, ["Th¸i H­ Tæng Qu¶n-Tinh"      ] = 2,},
	{["Th¸i H­ NguyÖt Thè-Cùc"  ] = 1, ["Th¸i H­ Cù Thè-Cùc"    ] = 2,},
	{["Th¸i H­ HÇu V­¬ng-Cùc"  ] = 1, ["Th¸i H­ Cù Viªn-Cùc"      ] = 2,},
	{["Th¸i H­ B¹ch Hæ-Cùc"    ] = 1, ["Th¸i H­ M·nh hæ-Cùc"      ] = 2,},
	{["Th¸i H­ B¹ch §iªu-Cùc"    ] = 1, ["Th¸i H­ H¾c Nha-Cùc"      ] = 2,},
	{["Th¸i H­ H¹o KiÕm-Cùc"  ] = 1, ["Th¸i H­ KiÕm S¸t-Cùc"      ] = 2,},
	{["Th¸i H­ Thô Yªu-Cùc"    ] = 1, ["Th¸i H­ Thùc Hoa-Cùc"    ] = 2,},
	{["Th¸i H­ Háa Hå-Cùc"  ] = 1, ["Th¸i H­ B¹ch Hå-Cùc"    ] = 2,},
	{["Th¸i H­ ThÇn N÷-Cùc"    ] = 1, ["Th¸i H­ CÇm Tiªn-Cùc"    ] = 2,},
	{["Th¸i H­ Tr­ V­¬ng-Cùc"    ] = 1, ["Th¸i H­ TuyÕt Qu¸i-Cùc"      ] = 2,},
	{["Th¸i H­ Tr× §«ng-Cùc"    ] = 1, ["Th¸i H­ Th¶o KhÊu-Cùc"      ] = 2,},
	{["Th¸i H­ Du Hån-Cùc"    ] = 1, ["Th¸i H­ Lam §ao-Cùc"  ] = 2,},
	{["Th¸i H­ Oan Hån-Cùc"    ] = 1, ["Th¸i H­ Hång Xoa-Cùc"  ] = 2,},
	{["Th¸i H­ L·nh H­¬ng-Cùc"  ] = 1, ["Th¸i H­ Lam Tr¶o-Cùc"  ] = 2,},
	{["Th¸i H­ o KiÕm-Cùc"] = 1, ["Th¸i H­ KiÕm T­îng-Cùc"] = 2,},
	{["Th¸i H­ ChÊn Thiªn-Cùc"  ] = 1, ["Th¸i H­ TÆc LÜnh-Cùc"  ] = 2,},
	{["Th¸i H­ ¸c T¨ng-Cùc"    ] = 1, ["Th¸i H­ MÉu D¹ Xoa-Cùc"    ] = 2,},
	{["Th¸i H­ KiÕm Ma-Cùc"    ] = 1, ["Th¸i H­ KiÕm Hån-Cùc"      ] = 2,},
	{["Th¸i H­ L­u Quang-Cùc"    ] = 1, ["Th¸i H­ Háa Kú L©n-Cùc"    ] = 2,},
	{["Th¸i H­ Háa Phông-Cùc"  ] = 1, ["Th¸i H­ Phông Hoµng-Cùc"      ] = 2,},
	{["Th¸i H­ NhÊt Phµm-Cùc"  ] = 1, ["Th¸i H­ KiÕm Tiªn-Cùc"    ] = 2,},
	{["Th¸i H­ L©m Xung-Cùc"    ] = 1, ["Th¸i H­ KiÕm Cuång-Cùc"      ] = 2,},
	{["Th¸i H­ Ng­u Qu¸i-Cùc"    ] = 1, ["Th¸i H­ Mao Ng­u-Cùc"      ] = 2,},
	{["Th¸i H­ Hoa Th¸nh-Cùc"    ] = 1, ["Th¸i H­ Phó So¸i-Cùc"    ] = 2,},
	{["Th¸i H­ Tè Tiªn-Cùc"    ] = 1, ["Th¸i H­ Hoa N÷-Cùc"    ] = 2,},
	{["Th¸i H­ Thanh Thanh"  ] = 1, ["Th¸i H­ Th©n Nhi tö"      ] = 2,},
	}
	
tNPCTemplate = {
	{{"Th¸i H­ Bµn Thá"      ,"Th¸i H­ Bµn Thá"    ,80},{"Th¸i H­ NguyÖt L­îng Thè"  ,"Th¸i H­ NguyÖt L­îng Thè"  ,1},}, --[nStage] ={ {"Ğ¡ÔÓ±øÄ£°æ","name"£¬¸öÊı},{"¾«Ó¢Ä£°æ","name",¸öÊı},},
	{{"Th¸i H­ V­în to"        ,"Th¸i H­ V­în to"      ,80},{"Th¸i H­ Viªn Nh©n V­¬ng"  ,"Th¸i H­ Viªn Nh©n V­¬ng"  ,1},},-- ±¦Ïä¹ÖÄ£°æÊÇ·ñÃ¿Ò»¹Ø¶¼Ò»Ñù²¢ÇÒÒÔºóÒ»Ö±Ò»Ñù£¿
	{{"Th¸i H­ M·nh hæ"        ,"Th¸i H­ M·nh hæ"      ,80},{"Th¸i H­ Hæ tr¾ng"    ,"Th¸i H­ Hæ tr¾ng"    ,1},},
	{{"Th¸i H­ Qu¹ §en"        ,"Th¸i H­ Qu¹ §en"      ,80},{"Th¸i H­ B¹ch §iªu"    ,"Th¸i H­ B¹ch §iªu"    ,1},},
	{{"Th¸i H­ KiÕm S¸t"        ,"Th¸i H­ KiÕm S¸t"      ,80},{"Th¸i H­ H¹o Vò KiÕm"  ,"Th¸i H­ H¹o Vò KiÕm"  ,1},},
	{{"Th¸i H­ Thùc Nh©n hoa"      ,"Th¸i H­ Thùc Nh©n hoa"    ,80},{"Th¸i H­ Thô Yªu"    ,"Th¸i H­ Thô Yªu"    ,1},},
	{{"Th¸i H­ B¹ch Yªu Hå"      ,"Th¸i H­ B¹ch Yªu Hå"    ,80},{"Th¸i H­ HáaYªu Hå"  ,"Th¸i H­ HáaYªu Hå"  ,1},},
	{{"Th¸i H­ CÇm Tiªn Tö"      ,"Th¸i H­ CÇm Tiªn Tö"    ,80},{"Th¸i H­ ThÇn N÷"    ,"Th¸i H­ ThÇn N÷"    ,1},},
	{{"Th¸i H­ TuyÕt Qu¸i"        ,"Th¸i H­ TuyÕt Qu¸i"      ,80},{"Th¸i H­ Tr­ V­¬ng"    ,"Th¸i H­ Tr­ V­¬ng"    ,1},},
	{{"Th¸i H­ Th¶o KhÊu"        ,"Th¸i H­ Th¶o KhÊu"      ,80},{"Th¸i H­Tr× §«ng"    ,"Th¸i H­Tr× §«ng"    ,1},},
	{{"Th¸i H­ Lam TiÓu ®ao quû"    ,"Th¸i H­ Lam TiÓu ®ao quû"  ,80},{"Th¸i H­ Du Hån"    ,"Th¸i H­ Du Hån"    ,1},},
	{{"Th¸i H­ TiÓu Hång xoa quû"    ,"Th¸i H­ TiÓu Hång xoa quû"  ,80},{"Th¸i H­ Oan Hån"    ,"Th¸i H­ Oan Hån"    ,1},},
	{{"Th¸i H­ Lam Phi tr¶o quû"    ,"Th¸i H­ Lam Phi tr¶o quû"  ,80},{"Th¸i H­ L·nh H­¬ng Ng­ng"  ,"Th¸i H­ L·nh H­¬ng Ng­ng"  ,1},},
	{{"Th¸i H­ KiÕm t­îng"  ,"Th¸i H­ KiÕm t­îng",80},{"Th¸i H­ HuyÒn Vâ KiÕm","Th¸i H­ HuyÒn Vâ KiÕm",1},},
	{{"Th¸i H­ S¬n TÆc §Çu Môc"    ,"Th¸i H­ S¬n TÆc §Çu Môc"  ,80},{"Th¸i H­ Nguy ChÊn Thiªn"  ,"Th¸i H­ Nguy ChÊn Thiªn"  ,1},},
	{{"Th¸i H­ MÉu D¹ Xoa"      ,"Th¸i H­ MÉu D¹ Xoa"    ,80},{"Th¸i H­ T¨ng ¸c"    ,"Th¸i H­ T¨ng ¸c"    ,1},},
	{{"Th¸i H­ KiÕm Hån"        ,"Th¸i H­ KiÕm Hån"      ,80},{"Th¸i H­ KiÕm Ma"    ,"Th¸i H­ KiÕm Ma"    ,1},},
	{{"Th¸i H­ Háa Kú L©n"      ,"Th¸i H­ Háa Kú L©n"    ,80},{"Th¸i H­ L­u Quang"    ,"Th¸i H­ L­u Quang"    ,1},},
	{{"Th¸i H­ Phông hoµng"        ,"Th¸i H­ Phông hoµng"      ,80},{"Th¸i H­ HáaPhông hoµng"  ,"Th¸i H­ HáaPhông hoµng"  ,1},},
	{{"Th¸i H­ KiÕm tiªn Tö"      ,"Th¸i H­ KiÕm tiªn Tö"    ,80},{"Th¸i H­ Phong NhÊt Phµm"  ,"Th¸i H­ Phong NhÊt Phµm"  ,1},},
	{{"Th¸i H­ KiÕm Cuång"        ,"Th¸i H­ KiÕm Cuång"      ,80},{"Th¸i H­ L©m Xung"    ,"Th¸i H­ L©m Xung"    ,1},},
	{{"Th¸i H­ Bß T©y T¹ng"        ,"Th¸i H­ Bß T©y T¹ng"      ,80},{"Th¸i H­ Ng­u §Çu Qu¸i"    ,"Th¸i H­ Ng­u §Çu Qu¸i"    ,1},},
	{{"Th¸i H­ Cao Phó So¸i"      ,"Th¸i H­ Cao Phó So¸i"    ,80},{"Th¸i H­ Hoa Th¸nh"    ,"Th¸i H­ Hoa Th¸nh"    ,1},},
	{{"Th¸i H­ Hoa Si N÷"      ,"Th¸i H­ Hoa Si N÷"    ,80},{"Th¸i H­ Tè Tiªn"    ,"Th¸i H­ Tè Tiªn"    ,1},},
	{{"Th¸i H­ Tæng qu¶n"        ,"Th¸i H­ Tæng qu¶n"      ,80},{"Th¸i H­ KhØ mËp"  ,"Th¸i H­ KhØ mËp"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Bµn Thá"      ,"Th¸i H­ Cù Thè-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ NguyÖt L­îng Thè"  ,"Th¸i H­ NguyÖt Thè-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ V­în to"        ,"Th¸i H­ Cù Viªn-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ Viªn Nh©n V­¬ng"  ,"Th¸i H­ HÇu V­¬ng-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ M·nh hæ"        ,"Th¸i H­ M·nh hæ-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ Hæ tr¾ng"    ,"Th¸i H­ B¹ch Hæ-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Qu¹ §en"        ,"Th¸i H­ H¾c Nha-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ B¹ch §iªu"    ,"Th¸i H­ B¹ch §iªu-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ KiÕm S¸t"        ,"Th¸i H­ KiÕm S¸t-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ H¹o Vò KiÕm"  ,"Th¸i H­ H¹o KiÕm-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Thùc Nh©n hoa"      ,"Th¸i H­ Thùc Hoa-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ Thô Yªu"    ,"Th¸i H­ Thô Yªu-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ B¹ch Yªu Hå"      ,"Th¸i H­ B¹ch Hå-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ HáaYªu Hå"  ,"Th¸i H­ Háa Hå-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ CÇm Tiªn Tö"      ,"Th¸i H­ CÇm Tiªn-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ ThÇn N÷"    ,"Th¸i H­ ThÇn N÷-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ TuyÕt Qu¸i"        ,"Th¸i H­ TuyÕt Qu¸i-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ Tr­ V­¬ng"    ,"Th¸i H­ Tr­ V­¬ng-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Th¶o KhÊu"        ,"Th¸i H­ Th¶o KhÊu-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­Tr× §«ng"    ,"Th¸i H­ Tr× §«ng-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Lam TiÓu ®ao quû"    ,"Th¸i H­ Lam §ao-C­êng"  ,80},{"B¶n n©ng cÊp-Th¸i H­ Du Hån"    ,"Th¸i H­ Du Hån-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ TiÓu Hång xoa quû"    ,"Th¸i H­ Hång Xoa-C­êng"  ,80},{"B¶n n©ng cÊp-Th¸i H­ Oan Hån"    ,"Th¸i H­ Oan Hån-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Lam Phi tr¶o quû"    ,"Th¸i H­ Lam Tr¶o-C­êng"  ,80},{"B¶n n©ng cÊp-Th¸i H­ L·nh H­¬ng Ng­ng"  ,"Th¸i H­ L·nh H­¬ng-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ KiÕm t­îng"  ,"Th¸i H­ KiÕm T­îng-C­êng",80},{"B¶n n©ng cÊp-Th¸i H­ HuyÒn Vâ KiÕm","Th¸i H­ o KiÕm-C­êng",1},},
	{{"B¶n n©ng cÊp-Th¸i H­ S¬n TÆc §Çu Môc"    ,"Th¸i H­ TÆc LÜnh-C­êng"  ,80},{"B¶n n©ng cÊp-Th¸i H­ Nguy ChÊn Thiªn"  ,"Th¸i H­ ChÊn Thiªn-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ MÉu D¹ Xoa"      ,"Th¸i H­ MÉu D¹ Xoa-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ T¨ng ¸c"    ,"Th¸i H­ ¸c T¨ng-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ KiÕm Hån"        ,"Th¸i H­ KiÕm Hån-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ KiÕm Ma"    ,"Th¸i H­ KiÕm Ma-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Háa Kú L©n"      ,"Th¸i H­ Háa Kú L©n-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ L­u Quang"    ,"Th¸i H­ L­u Quang-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Phông hoµng"        ,"Th¸i H­ Phông Hoµng-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ HáaPhông hoµng"  ,"Th¸i H­ Háa Phông-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ KiÕm tiªn Tö"      ,"Th¸i H­ KiÕm Tiªn-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ Phong NhÊt Phµm"  ,"Th¸i H­ NhÊt Phµm-C­êng"  ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ KiÕm Cuång"        ,"Th¸i H­ KiÕm Cuång-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ L©m Xung"    ,"Th¸i H­ L©m Xung-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Bß T©y T¹ng"        ,"Th¸i H­ Mao Ng­u-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ Ng­u §Çu Qu¸i"    ,"Th¸i H­ Ng­u Qu¸i-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Cao Phó So¸i"      ,"Th¸i H­ Phó So¸i-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ Hoa Th¸nh"    ,"Th¸i H­ Hoa Th¸nh-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Hoa Si N÷"      ,"Th¸i H­ Hoa N÷-C­êng"    ,80},{"B¶n n©ng cÊp-Th¸i H­ Tè Tiªn"    ,"Th¸i H­ Tè Tiªn-C­êng"    ,1},},
	{{"B¶n n©ng cÊp-Th¸i H­ Tæng qu¶n"        ,"Th¸i H­ Tæng Qu¶n-C­êng"      ,80},{"B¶n n©ng cÊp-Th¸i H­ KhØ mËp"  ,"Th¸i H­ Cù HÇu-C­êng"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Bµn Thá"      ,"Th¸i H­ Cù Thè-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ NguyÖt L­îng Thè"  ,"Th¸i H­ NguyÖt Thè-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ V­în to"        ,"Th¸i H­ Cù Viªn-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ Viªn Nh©n V­¬ng"  ,"Th¸i H­ HÇu V­¬ng-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ M·nh hæ"        ,"Th¸i H­ M·nh hæ-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ Hæ tr¾ng"    ,"Th¸i H­ B¹ch Hæ-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Qu¹ §en"        ,"Th¸i H­ H¾c Nha-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ B¹ch §iªu"    ,"Th¸i H­ B¹ch §iªu-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ KiÕm S¸t"        ,"Th¸i H­ KiÕm S¸t-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ H¹o Vò KiÕm"  ,"Th¸i H­ H¹o KiÕm-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Thùc Nh©n hoa"      ,"Th¸i H­ Thùc Hoa-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ Thô Yªu"    ,"Th¸i H­ Thô Yªu-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ B¹ch Yªu Hå"      ,"Th¸i H­ B¹ch Hå-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ HáaYªu Hå"  ,"Th¸i H­ Háa Hå-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ CÇm Tiªn Tö"      ,"Th¸i H­ CÇm Tiªn-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ ThÇn N÷"    ,"Th¸i H­ ThÇn N÷-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ TuyÕt Qu¸i"        ,"Th¸i H­ TuyÕt Qu¸i-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ Tr­ V­¬ng"    ,"Th¸i H­ Tr­ V­¬ng-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Th¶o KhÊu"        ,"Th¸i H­ Th¶o KhÊu-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­Tr× §«ng"    ,"Th¸i H­ Tr× §«ng-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Lam TiÓu ®ao quû"    ,"Th¸i H­ Lam §ao-Tinh"  ,80},{"B¶n t¨ng c­êng-Th¸i H­ Du Hån"    ,"Th¸i H­ Du Hån-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ TiÓu Hång xoa quû"    ,"Th¸i H­ Hång Xoa-Tinh"  ,80},{"B¶n t¨ng c­êng-Th¸i H­ Oan Hån"    ,"Th¸i H­ Oan Hån-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Lam Phi tr¶o quû"    ,"Th¸i H­ Lam Tr¶o-Tinh"  ,80},{"B¶n t¨ng c­êng-Th¸i H­ L·nh H­¬ng Ng­ng"  ,"Th¸i H­ L·nh H­¬ng-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ KiÕm t­îng"  ,"Th¸i H­ KiÕm T­îng-Tinh",80},{"B¶n t¨ng c­êng-Th¸i H­HuyÒn Vâ KiÕm","Th¸i H­ o KiÕm-Tinh",1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ S¬n TÆc §Çu Môc"    ,"Th¸i H­ TÆc LÜnh-Tinh"  ,80},{"B¶n t¨ng c­êng-Th¸i H­ Nguy ChÊn Thiªn"  ,"Th¸i H­ ChÊn Thiªn-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ MÉu D¹ Xoa"      ,"Th¸i H­ MÉu D¹ Xoa-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ T¨ng ¸c"    ,"Th¸i H­ ¸c T¨ng-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ KiÕm Hån"        ,"Th¸i H­ KiÕm Hån-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ KiÕm Ma"    ,"Th¸i H­ KiÕm Ma-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Háa Kú L©n"      ,"Th¸i H­ Háa Kú L©n-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ L­u Quang"    ,"Th¸i H­ L­u Quang-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Phông hoµng"        ,"Th¸i H­ Phông Hoµng-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ HáaPhông hoµng"  ,"Th¸i H­ Háa Phông-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ KiÕm tiªn Tö"      ,"Th¸i H­ KiÕm Tiªn-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ Phong NhÊt Phµm"  ,"Th¸i H­ NhÊt Phµm-Tinh"  ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ KiÕm Cuång"        ,"Th¸i H­ KiÕm Cuång-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ L©m Xung"    ,"Th¸i H­ L©m Xung-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Bß T©y T¹ng"        ,"Th¸i H­ Mao Ng­u-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ Ng­u §Çu Qu¸i"    ,"Th¸i H­ Ng­u Qu¸i-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Cao Phó So¸i"      ,"Th¸i H­ Phó So¸i-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ Hoa Th¸nh"    ,"Th¸i H­ Hoa Th¸nh-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Hoa Si N÷"      ,"Th¸i H­ Hoa N÷-Tinh"    ,80},{"B¶n t¨ng c­êng-Th¸i H­ Tè Tiªn"    ,"Th¸i H­ Tè Tiªn-Tinh"    ,1},},
	{{"B¶n t¨ng c­êng-Th¸i H­ Tæng qu¶n"        ,"Th¸i H­ Tæng Qu¶n-Tinh"      ,80},{"B¶n t¨ng c­êng-Th¸i H­ KhØ mËp"  ,"Th¸i H­ Cù HÇu-Tinh"  ,1},},
	{{"B¶n cuèi-Th¸i H­ Bµn Thá"      ,"Th¸i H­ Cù Thè-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ NguyÖt L­îng Thè"  ,"Th¸i H­ NguyÖt Thè-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ V­în to"        ,"Th¸i H­ Cù Viªn-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ Viªn Nh©n V­¬ng"  ,"Th¸i H­ HÇu V­¬ng-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ M·nh hæ"        ,"Th¸i H­ M·nh hæ-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ Hæ tr¾ng"    ,"Th¸i H­ B¹ch Hæ-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Qu¹ §en"        ,"Th¸i H­ H¾c Nha-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ B¹ch §iªu"    ,"Th¸i H­ B¹ch §iªu-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ KiÕm S¸t"        ,"Th¸i H­ KiÕm S¸t-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ H¹o Vò KiÕm"  ,"Th¸i H­ H¹o KiÕm-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ Thùc Nh©n hoa"      ,"Th¸i H­ Thùc Hoa-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ Thô Yªu"    ,"Th¸i H­ Thô Yªu-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ B¹ch Yªu Hå"      ,"Th¸i H­ B¹ch Hå-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ HáaYªu Hå"  ,"Th¸i H­ Háa Hå-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ CÇm Tiªn Tö"      ,"Th¸i H­ CÇm Tiªn-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ ThÇn N÷"    ,"Th¸i H­ ThÇn N÷-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ TuyÕt Qu¸i"        ,"Th¸i H­ TuyÕt Qu¸i-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ Tr­ V­¬ng"    ,"Th¸i H­ Tr­ V­¬ng-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Th¶o KhÊu"        ,"Th¸i H­ Th¶o KhÊu-Cùc"      ,80},{"B¶n cuèi-Th¸i H­Tr× §«ng"    ,"Th¸i H­ Tr× §«ng-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Lam TiÓu ®ao quû"    ,"Th¸i H­ Lam §ao-Cùc"  ,80},{"B¶n cuèi-Th¸i H­ Du Hån"    ,"Th¸i H­ Du Hån-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ TiÓu Hång xoa quû"    ,"Th¸i H­ Hång Xoa-Cùc"  ,80},{"B¶n cuèi-Th¸i H­ Oan Hån"    ,"Th¸i H­ Oan Hån-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Lam Phi tr¶o quû"    ,"Th¸i H­ Lam Tr¶o-Cùc"  ,80},{"B¶n cuèi-Th¸i H­ L·nh H­¬ng Ng­ng"  ,"Th¸i H­ L·nh H­¬ng-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ KiÕm t­îng"  ,"Th¸i H­ KiÕm T­îng-Cùc",80},{"B¶n cuèi-Th¸i H­ HuyÒn Vâ KiÕm","Th¸i H­ o KiÕm-Cùc",1},},
	{{"B¶n cuèi-Th¸i H­ S¬n TÆc §Çu Môc"    ,"Th¸i H­ TÆc LÜnh-Cùc"  ,80},{"B¶n cuèi-Th¸i H­ Nguy ChÊn Thiªn"  ,"Th¸i H­ ChÊn Thiªn-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ MÉu D¹ Xoa"      ,"Th¸i H­ MÉu D¹ Xoa-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ T¨ng ¸c"    ,"Th¸i H­ ¸c T¨ng-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ KiÕm Hån"        ,"Th¸i H­ KiÕm Hån-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ KiÕm Ma"    ,"Th¸i H­ KiÕm Ma-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Háa Kú L©n"      ,"Th¸i H­ Háa Kú L©n-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ L­u Quang"    ,"Th¸i H­ L­u Quang-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Phông hoµng"        ,"Th¸i H­ Phông Hoµng-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ HáaPhông hoµng"  ,"Th¸i H­ Háa Phông-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ KiÕm tiªn Tö"      ,"Th¸i H­ KiÕm Tiªn-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ Phong NhÊt Phµm"  ,"Th¸i H­ NhÊt Phµm-Cùc"  ,1},},
	{{"B¶n cuèi-Th¸i H­ KiÕm Cuång"        ,"Th¸i H­ KiÕm Cuång-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ L©m Xung"    ,"Th¸i H­ L©m Xung-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Bß T©y T¹ng"        ,"Th¸i H­ Mao Ng­u-Cùc"      ,80},{"B¶n cuèi-Th¸i H­ Ng­u §Çu Qu¸i"    ,"Th¸i H­ Ng­u Qu¸i-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Cao Phó So¸i"      ,"Th¸i H­ Phó So¸i-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ Hoa Th¸nh"    ,"Th¸i H­ Hoa Th¸nh-Cùc"    ,1},},
	{{"B¶n cuèi-Th¸i H­ Hoa Si N÷"      ,"Th¸i H­ Hoa N÷-Cùc"    ,80},{"B¶n cuèi-Th¸i H­ Tè Tiªn"    ,"Th¸i H­ Tè Tiªn-Cùc"    ,1},},
	{{"Th¸i H­ Th©n Nhi tö"        ,"Th¸i H­ Th©n Nhi tö"      ,80},{"Th¸i H­ Thanh Thanh"  ,"Th¸i H­ Thanh Thanh"  ,1},},
	}
	
tBoxNpc = {"R­¬ng Qu¸i Th¸i H­","Qu¸i R­¬ng"} -- Ä£°æÃû×Ö£¬Ãû×Ö