--Ö÷»î¶¯npc¶Ô»°Ñ¡Ïî
Include("\\script\\online_activites\\201506cn\\head.lua")
Include("\\script\\online_activites\\201506cn\\main.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\script\\lib\\globalfunctions.lua")

m_szNpcName ="§¹i Sø ho¹t ®éng"
SZ_SHOP_NPC_NAME="Chñ töu lÇu"
SZ_NPC_TITLE_1506="Mét tin ®ån lan truyÒn kh¾p BiÖn Kinh: Thiªn ¢m Gi¸o sau khi b¹i trËn ë HuyÕt B¹c LÜnh ®· rót vÒ T©y Vùc, ph¸ ho¹i 3 n­íc T©y H¹, Thæ Phån vµ §¹i Lý, do Thiªn ¢m Gi¸o vâ c«ng cao c­êng nªn ba n­íc ®µnh ph¶i nhÉn nhÞn; khi mïa hÌ ®Õn, nh©n dÞp TÕt §oan Ngäc¶ ba n­íc viÖn cí ®Õn trung nguyªn nép cèng phÈm, bÝ mËt ph¸i sø gi¶ ®Õn Vâ L©m Minh cÇu cøu, kh«ng ngê gi÷a ®­êng ®· bÞ Thiªn ¢m Gi¸o ngôy trang thµnh s¬n tÆc c­íp mÊt th­."
T_MAIN_DIALOG_1506={
	format("%s/act_1", "Ho¹t ®éng Mïa hÌ nãng báng"),
	format("%s/act_2", "Ho¹t ®éng b¸nh ch­ng th¬m ngon"),
}

tExchange = {
	gtNormalExchange:new(),--·½ôÕ×Ó
	gtNormalExchange:new(),--Ô²ôÕ×Ó
	gtNormalExchange:new(),--Î÷Óò¹±Æ·
	gtNormalExchange:new(),--Î÷ÓòÃÜÐÅ
}
tExchange[1].tConsume ={
	{"Cèng PhÈm T©y Vùc", 2, 1, 30871, 10},
	{"Vµng", -1, -1, -1, 2},
}
tExchange[1].tAward ={
	{"Hép Quµ B¸nh Vu«ng", 2, 1, 30872, 1},
}
tExchange[1].do_exchange_callback = function()
	gf_WriteLogEx("HoatDongKS_Thang6", "®æi thµnh c«ng", 1, "1 Hép Quµ B¸nh Vu«ng")
end

tExchange[2].tConsume ={
	{"Cèng PhÈm T©y Vùc", 2, 1, 30871, 1},
	{"H­¬ng LiÖu T©y Vùc", 2, 1, 30874, 1},
}
tExchange[2].tAward ={
	{"Hép Quµ B¸nh Trßn", 2, 1, 30873, 1},
}
tExchange[3].tConsume ={
	{"Vµng", -1, -1, -1, 1},
}
tExchange[3].tAward ={
	{"Cèng PhÈm T©y Vùc", 2, 1, 30871, 1},
}
tExchange[4].tConsume ={
	{"MËt Th­ T©y Vùc", 2, 1, 30870, 1},
}
tExchange[4].tAward ={
	{"M¶nh Thiªn Cang", 2, 1, 30390, 25},
	{"Cèng PhÈm T©y Vùc", 2, 1, 30871, 100},
	{"LuyÖn", -2, 0, 0, 1000},
}
tExchange[4].tRoomWeight = {2,100}

--¾ÆÂ¥ÀÏ°å¶Ô»°Èë¿Ú
function npc_talk_shop_1506()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", SZ_SHOP_NPC_NAME, "Tay nghÒ cña bæn tiÖm næi tiÕng kh¾p thµnh nµy, chØ cÇn ®¹i hiÖp cung cÊp nguyªn liÖu th× bæn tiÖm cã thÓ lµm ra c¸c lo¹i b¸nh ch­ng th¬m ngon")
	local tbSay = {}
	tinsert(tbSay, format("%s/#do_exchange(%d)", "ChÕ t¹o Hép Quµ B¸nh Vu«ng", 1))
	tinsert(tbSay, format("%s/#do_exchange(%d)", "ChÕ t¹o Hép Quµ B¸nh Trßn", 2))
	tinsert(tbSay, format("%s/#do_exchange(%d)", "Mua Cèng PhÈm T©y Vùc", 3))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	Say(szTitle, getn(tbSay), tbSay)
end
--ÖÆ×÷ôÕ×Ó
function do_exchange(nType)
	tExchange[nType]:npc_talk_main(SZ_SHOP_NPC_NAME, nType)
end

function npc_talk_main_1506()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", m_szNpcName, "Mét tin ®ån lan truyÒn kh¾p BiÖn Kinh: Thiªn ¢m Gi¸o sau khi b¹i trËn ë HuyÕt B¹c LÜnh ®· rót vÒ T©y Vùc, ph¸ ho¹i 3 n­íc T©y H¹, Thæ Phån vµ §¹i Lý, do Thiªn ¢m Gi¸o vâ c«ng cao c­êng nªn ba n­íc ®µnh ph¶i nhÉn nhÞn; khi mïa hÌ ®Õn, nh©n dÞp TÕt §oan Ngäc¶ ba n­íc viÖn cí ®Õn trung nguyªn nép cèng phÈm, bÝ mËt ph¸i sø gi¶ ®Õn Vâ L©m Minh cÇu cøu, kh«ng ngê gi÷a ®­êng ®· bÞ Thiªn ¢m Gi¸o ngôy trang thµnh s¬n tÆc c­íp mÊt th­.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1", "Ho¹t ®éng Mïa hÌ nãng báng"))
	tinsert(tbSay, format("%s/act_2", "Ho¹t ®éng b¸nh ch­ng th¬m ngon"))
	
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function act_1()
	local szTitle = format("%s:%s", m_szNpcName, "GÇn ®©y §iÓm Th­¬ng S¬n, Thanh Thµnh S¬n vµ D­îc V­¬ng Cèc cã rÊt nhiÒu nh©n vËt thÇn bÝ ngôy trang thµnh ng­êi b¶n ®Þa, Vâ L©m Minh nghi ngê do Thiªn ¢m Gi¸o §å ngôy trang thµnh, cã liªn quan ®Õn viÖc c­íp vËt phÈm, ®Æc biÖt th«ng b¸o cho §¹i Sø Ho¹t §éng triÖu tËp c¸c hiÖp kh¸ch ®i tiªu diÖt, nÕu ph¸t hiÖn MËt Th­ T©y Vùc h·y mang vÒ cho §¹i Sø Ho¹t §éng ®Ó nhËn phÇn th­ëng, khi truy ®uæi Ng­êi ThÇn BÝ nhËn ®­îc c¸c cèng phÈm ®Òu thuéc vÒ c¸c hiÖp kh¸ch.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1_award", "Nép MËt Th­ T©y Vùc"))
	tinsert(tbSay, format("%s/npc_talk_main_1506", "VÒ trang tr­íc"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function act_1_award()
	local nResult = tExchange[4]:do_exchange(1, 1)
	if 1 == nResult then
		Talk(1, "", "§¹i hiÖp qu¶ thËt gan d¹, chØ trong thêi gian ng¾n ®· lÊy ®­îc MËt Th­ T©y Vùc.")
	end
end

function act_2()
	local szTitle = format("%s:%s", m_szNpcName, "Cèng PhÈm T©y Vùc mµ c¸c ®¹i hiÖp ®o¹t vÒ ®· bÞ hao hôt mÊt mét Ýt, nh­ng còng kh«ng lµm khã ®­îc Chñ Töu LÇu, h·y ®i t×m «ng Êy ®Ó nhê lµm ra b¸nh ch­ng §oan Ngä th¬m ngon. NÕu ®¹i hiÖp cã thªm nguyªn liÖu th× Chñ Töu LÇu sÏ lµm ra b¸nh ch­ng ngon h¬n n÷a. Trong tói ®¹i hiÖp kh«ng cã cèng phÈm ­? H×nh nh­ Chñ Töu LÇu còng cã b¸n, h·y ®Õn ®ã mua råi lµm b¸nh còng ®­îc.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1_award", "Nép MËt Th­ T©y Vùc"))
	tinsert(tbSay, format("%s/npc_talk_main_1506", "VÒ trang tr­íc"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end
