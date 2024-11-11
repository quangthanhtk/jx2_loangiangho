Include("\\script\\lib\\talktmp.lua")

Import("\\script\\missions\\kuafu_boss\\yanmenguan\\mission_head.lua")

g_InfoHeader = "<color=green>".."Giíi thiÖu ho¹t ®éng".."<color>: ";

T={}
T1={}
T2={}
T3={}

T.msg = g_InfoHeader
T.sel = {
	{"H×nh nÒn hÖ thèng", T1},
	{"Giíi thiÖu c¸ch ch¬i", T2},
	{"Rêi khái ®©y", T3},
	{"KÕt thóc ®èi tho¹i", "nothing", }, 
}

T1.msg = g_InfoHeader.."Liªu Quèc vµ Thiªn ¢m Gi¸o l¹i ©m m­u x©m ph¹m Trung Nguyªn. T¶ Hé Ph¸p Thiªn ¢m Gi¸o Tiªu NhiÔm NguyÖt ®ang tËp hîp c¸c bé l¹c du môc ®Õn Bé L¹c V­¬ng Kú, chuÈn bŞ xua qu©n tiÕn c«ng! Vâ L©m Minh nhËn ®­îc tin b¸o, lËp tøc kªu gäi cao thñ c¸c bang héi Trung Nguyªn cïng ®Õn §¹i Th¶o Nguyªn, ng¨n chÆn Xe Ngùa TËp KÕt, tiªu diÖt T¶ Hé Ph¸p Thiªn ¢m Gi¸o Tiªu NhiÔm NguyÖt. §¹i qu©n Liªu Quèc s¾p ®Õn n¬i, thêi gian cã h¹n, mong c¸c hiÖp sÜ mau chãng ®Õn gióp, ®¹i th¾ng quay vÒ!"
T1.sel = {
	{"trë l¹i", T, }, 
	{"Ta biÕt råi", "nothing", }, 
}

T2.msg = g_InfoHeader..format("\n    %d giê tèi mçi T7 sÏ më BOSS Liªn Server, duy tr× %d phót. Ng­êi ch¬i ®· vµo bang, ®¹t cÊp ChuyÓn Sinh %d Lv%d trë lªn ®­îc tham dù\n    §Ó ®¶m b¶o ho¹t ®éng diÔn ra hiÖu qu¶, mçi khu vùc ®Òu giíi h¹n sè ng­êi, khi ®¹t tèi ®a sÏ kh«ng thÓ vµo n÷a\n   T¶ Hé Ph¸p Thiªn ¢m Gi¸o Tiªu NhiÔm NguyÖt sÏ ®ång thêi xuÊt hiÖn t¹i §¹i Th¶o Nguyªn 2, §¹i Th¶o Nguyªn 1, Bé L¹c V­¬ng §×nh, nh­ng chØ 1 chç lµ BOSS thËt. Ng­êi ch¬i kÕt liÔu BOSS thËt vµ bang cña ng­êi ®ã sÏ ®­îc nhËn th­ëng thªm\n    TÊn c«ng Xe Ngùa TËp KÕt vµ BOSS sÏ nhËn ®­îc ®iÓm theo tØ lÖ nhÊt ®Şnh. TÊt c¶ thµnh viªn bang tham chiÕn vµ bang héi ®¹t Top %d tæng ®iÓm sÏ ®­îc nhËn th­ëng h¹ng\n    Bang héi ch­a lät vµo BXH, nh­ng tæng s¸t th­¬ng ®¹t %d còng ®­îc nhËn th­ëng n¨ng ®éng\n    TÊt c¶ phÇn th­ëng ®Òu ®­îc nhËn t¹i Qu¶n Gia Bang Héi cña server m×nh\n    §iÓm Tİch Cùc C¸ Nh©n ®¹t %d míi ®­îc nhËn th­ëng c¸ nh©n\n    Ph¶i nhËn th­ëng tr­íc %d giê ngµy diÔn ra ho¹t ®éng, qu¸ h¹n xem nh­ bá th­ëng;",
	21,60,9,90,15,1000,20,24)

T2.sel = {
	{"trë l¹i", T, }, 
	{"KÕt thóc ®èi tho¹i", "nothing", }, 
}

T3.msg = g_InfoHeader
T3.sel = {
	{"Rêi khái chiÕn tr­êng", "leave_battle", }, 
	{"Ta sÏ kh«ng lµm ®µo binh!", "nothing", }, 
}

-- \nÃ¿ÖÜÁùÍíÉÏ%dµã¿ª·Å¿ç·şBOSSÍæ·¨£¬»î¶¯³ÖĞø%d·ÖÖÓ£¬ĞèÒª¼ÓÈë°ï»á²¢ÇÒµÈ¼¶´óÓÚ%d×ª%d¼¶µÄÍæ¼Ò²Å¿ÉÒÔ²ÎÓë;
-- \nÎª±£Ö¤»î¶¯Ğ§¹û£¬Ã¿ÕÅµØÍ¼ÓĞÈËÊıÉÏÏŞ£¬µ±´ïµ½ÈËÊıÉÏÏŞºó²»ÔÊĞí½øÈë;
-- \nÌìÒõ½Ì×ó»¤·¨ÏôÈ½ÔÂ»áÍ¬Ê±³öÏÖÔÚ´ó²İÔ­¶ş£¬´ó²İÔ­Ò»£¬ºÍÍõÍ¥²¿Âä£¬µ«ÊÇÆäÖĞÖ»ÓĞÒ»¸öÊÇÕæµÄ£¬ÆäËû¶¼ÊÇ¼ÙµÄ£¬¸øÓèÕæBOSS×îºóÒ»»÷µÄÍæ¼ÒºÍËùÊô°ï»á»á»ñµÃ¶îÍâ½±Àø; 
-- \nÍ¨¹ı¹¥»÷¼¯½áÂí³µºÍBOSS£¬»á°´±ÈÀı»ñµÃ²»Í¬µÄ»î¶¯»ı·Ö¡£°ï»áËùÓĞÍæ¼ÒµÄ»ı·Ö×ÜÁ¿ÅÅÃûÇ°%dµÄ°ï»áÓĞÅÅÃû½±Àø;
-- \nÎ´ÉÏ°ñµÄ°ï»á£¬ÉËº¦»ı·Ö´ïµ½%dÒ²ÄÜ»ñµÃ»îÔ¾½±Àø;
-- \nËùÓĞ½±ÀøĞèÒª»Øµ½Ô­·şºóÈ¥°ï»á¹Ü¼Ò´¦ÁìÈ¡;
-- \n¸öÈË½±ÀøĞèÒª¸öÈË»îÔ¾¶È´ïµ½%d·Ö²Å¿ÉÒÔÁìÈ¡;
-- \n½±ÀøĞèÒªÔÚ»î¶¯µ±ÈÕµÄ%dµãÖ®Ç°ÁìÈ¡£¬¹ıÆÚÊÓÎª·ÅÆú;

function main()
	temp_Talk(T);
end

function leave_battle()
	local nCamp = KFB_COMMON_PLAYER_CAMP;
	DelMSPlayer(Mission_Kfb.missionID, nCamp);
	Msg2MSAll(Mission_Kfb.missionID, GetName().."Rêi khái chiÕn tr­êng.");
end