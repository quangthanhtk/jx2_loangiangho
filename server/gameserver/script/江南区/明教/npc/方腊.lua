--½Å±¾¹¦ÄÜ£ºÃ÷½ÌÕÆÃÅ¶Ô»°º¯Êı
--¹¦ÄÜÉè¼Æ£ºÔøÇìÏé
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-13
--   (__)¡¡
--¡¡ /oo\\________
--¡¡ \¡¡/¡¡¡¡¡¡¡¡ \---\
 --¡¡ \/¡¡¡¡¡¡ /¡¡ \¡¡ \
 --¡¡¡¡¡¡\\_|___\\_|/¡¡¡¡*
 --¡¡¡¡¡¡  ||¡¡ YY|  
 --¡¡¡¡¡¡  ||¡¡¡¡||  ¡¡×îNBµÄ²ß»®ÄÜÒÔ×î²»ÕÛÌÚµÄ·½Ê½À´ºÏÀíµÄÊµÏÖ×Ô¼ºµÄ¹¦ÄÜ£¬ËùÒÔ²»ÒªÓÃÕÛÌÚÀ´±í´ïÄã×¨Òµ³Ì¶È¡£
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ÃÅÅÉÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")

Import("\\script\\task\\faction_task\\faction_task.lua")


NPC_NAME = "<color=green>Ph­¬ng L¹p<color>:"
PLAYER_NAME = "<color=green>Ng­êi ch¬i<color>: §­îc, ta ®i ngay!"
MING_FACTION_ID = 9
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
g_nFactionID = 9

Import("\\script\\ksgvn\\functions\\phutu_functions.lua")
g_szTalkHead = NPC_NAME

function main()
	local selTab = {
		"Nguån gèc Minh Gi¸o/say1_1",
		"Vâ c«ng Minh Gi¸o/say1_2",
		"§iÒu kiÖn nhËp m«n/say1_3",
		--"Phô tu m«n ph¸i/phutu_Main", --LongDaiKa: ®ãng tİnh n¨ng phô tu m«n ph¸i
		-- "ÎÒÒª¼ÓÈëÃ÷½Ì/say1_4",
		"Ta muèn lµm nhiÖm vô S­ M«n/#ftask_repeat_main(9)",
		"Liªn quan tu luyÖn./practice",
		"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­/#faction_graduate(9)",
		"B¸i kiÕn gi¸o chñ/end_dialog",
	}
	if FT_RELEASE_WORK == 1 then
		tinsert(selTab, 1, format("NhiÖm Vô S­ M«n Míi/#nft_talk(%d)", g_nFactionID));	
	end	
	Say(NPC_NAME.."Minh Gi¸o x­a nay lu«n t«n sïng ¸nh s¸ng vµ th¸nh háa, trõ gian diÖt ¸c. Tuy kh«ng hîp víi nh©n sÜ trung nguyªn nh­ng tÊm lßng thµnh khÈn th× nhËt nguyÖt chøng gi¸m.",
		getn(selTab),
		selTab
	)
end
--ÆğÔ´
function say1_1()
	Talk(2,"main",
		NPC_NAME.."Gi¸o ph¸i cña ta cã nguån gèc tõ Ma Ni Gi¸o ë Ba T­, gia nhËp vµo trung nguyªn tõ ®êi nhµ §­êng, sau ®ã dÇn dÇn ph¸t triÓn lªn. §Õn ®êi nhµ Tèng th× ®æi tªn thµnh 'Minh Gi¸o'. Minh Gi¸o x­a nay lu«n t«n sïng ¸nh s¸ng vµ th¸nh háa, cho r»ng thÕ giíi nµy ¸nh s¸ng vµ bãng tèi lu«n ®èi lËp víi nhau, ¸nh s¸ng cuèi cïng sÏ chiÕn th¾ng bãng tèi. HiÖn nay, gi¸o nghÜa cña bæn gi¸o quy n¹p thµnh 8 ch÷ 'Thanh tŞnh, quang minh, ®¹i lùc, trİ tuÖ'.",
		NPC_NAME.."Gi¸o chóng cña bæn gi¸o ®Õn tõ kh¾p mäi n¬i, kh«ng ph©n biÖt ngµnh nghÒ tõ n«ng d©n, tó tµi, lôc l©m h¶o h¸n, c­êng ®¹o, t¨ng l÷ hoÆc ®¹o sÜ ®Òu cã thÓ gia nhËp. Nh­ng bæn gi¸o x­a nay hµnh tung Èn dËt, chŞu sù nghi kş cña triÒu ®×nh vµ c¸c m«n ph¸i kh¸c, thËm chİ cßn bŞ xem lµ 'Ma gi¸o', x­a nay lu«n bŞ triÒu ®×nh vµ c¸c m«n ph¸i kh¸c khèng chÕ. Cho nªn ®· b¾t tay vµo x©y dùng Quang Minh §Ønh trªn nói C«n L«n, xem nh­ tæng ®µn míi cña Minh Gi¸o, ®Ó tr¸nh bŞ triÒu ®×nh diÖt gän."
		)
end
--Îä¹¦
function say1_2()
	Talk(4,"main",
		NPC_NAME.."Gi¸o chóng Minh Gi¸o chia thµnh 3 hÖ <color=yellow>Th¸nh ChiÕn, HuyÕt Nh©n, TrËn Binh<color>.",
		NPC_NAME.."<color=yellow>Th¸nh ChiÕn<color> ®óc kÕt tõ ı nghÜa cña 'Quang minh', kh«ng sî h·i, dïng th©n m×nh ®Ó nghªnh chiÕn ®Şch tõ chİnh diÖn. Lùc chiÕn do t©m quyÕt ®Şnh, t©m cµng né th× søc cµng m¹nh, chØ cÇn cßn né ı th× kh«ng sî g× c¶. TrÊn ph¸i <color=red>Cµn Kh«n §¹i Na Di<color>, kü n¨ng cña <color=yellow>Th¸nh ChiÕn<color> do <color=green>Quang Minh Ph¸p V­¬ng-LÖ Thiªn NhuËn<color> truyÒn thô.",
		NPC_NAME.."<color=yellow>HuyÕt Nh©n<color> ®óc kÕt tõ ı nghÜa cña 'Thanh tŞnh', thanh tŞnh nh­ tr¨ng s¸ng. Khi chiÕn ®Êu víi hÖ nµy nÕu tróng ph¶i Ên kı thñ ph¸p ®éc m«n, lóc ®Çu sÏ kh«ng cã dÊu vÕt, nÕu dïng thñ ph¸p ®éc m«n ®Ó ph¸ Ên th× søc m¹nh bªn trong sÏ khiÕn kÎ ®Şch bŞ träng th­¬ng. T×m <color=green>Xİch DiÖm Ph¸p V­¬ng-T­ Hµnh Ph­¬ng<color> ®Ó häc <color=red>Hµn B¨ng Miªn Ch­ëng<color>.",
		NPC_NAME.."<color=yellow>TrËn Binh<color> ®óc kÕt tõ ı nghÜa cña 'Trİ tuÖ', dµnh cho ng­êi trİ tuÖ. HÖ nµy b¾t nguån tõ Ngò Hµnh Kú, thñ ph¸p bè trËn ®éc ®¸o, kÎ ®Şch khi lät vµo trËn sÏ bŞ khèng chÕ, bÊt kÓ hµnh ®éng hoÆc thi triÓn kü n¨ng ®Òu bŞ t©m ma khèng chÕ, g©y s¸t th­¬ng cho b¶n th©n. Khi ®ång ®éi trong trËn, sÏ c­êng hãa b¶n th©n, ®iÒu trŞ vÕt th­¬ng. TrÊn ph¸i <color=red>Quang Minh Ngò Hµnh TrËn<color>, vâ c«ng cña hÖ nµy do <color=green>§¹i V©n Ph¸p V­¬ng-V­¬ng DÇn<color> truyÒn thô."
	)
end
--Ìõ¼ş
function say1_3()
	Talk(1,"",NPC_NAME.."Kh«ng giíi h¹n nam n÷, ch­a cã m«n ph¸i vµ kh«ng ph¶i ph¶n ®å ®Òu cã thÓ gia nhËp. Gi¸o chóng cÇn ph¶i hµnh thiÖn trõ ¸c, nÕu cã tµi s¶n th× ph¶i cøu trî ng­êi nghÌo, t«n sïng minh t«n.")
end
--¼ÓÈëÀ¥ÂØ
function say1_4()
	--µÈ¼¶ÅĞ¶Ï
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."CÊp kh«ng ®ñ, ®¹t cÊp <color=yellow>10<color> råi quay l¹i.")
		return
	end
	--±¾ÃÅÅĞ¶Ï
	if GetPlayerFaction() == 9 then
		Talk(1,"",NPC_NAME.."Ng­¬i ®· lµ ng­êi cña Minh Gi¸o, cßn t×m ta lµm g×!")
		return
	end
	--Á÷ÅÉÅĞ¶Ï
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."ThiÕu hiÖp ®· cã m«n ph¸i, ta kh«ng thÓ nhËn.")
		return
	end
	local faction_task_step = without_other_factask(MING_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."§· nhËn nhiÖm vô cña ph¸i kh¸c, kh«ng thÓ gia nhËp bæn ph¸i.")
		return
	elseif faction_task_step == 7 then
		Talk(3,"",
			NPC_NAME.."<color=green>§Æng Nguyªn Gi¸c<color> ®· th«ng b¸o víi ta, ng­¬i ®· giao 4 Háa Chñng cho «ng Êy. Ng­¬i lµm tèt l¾m, hiÖn t¹i cã thÓ gia nhËp gi¸o ph¸i. Nh­ng h·y nhí lÊy, sau khi vµo gi¸o th× ph¶i hµnh thiÖn trõ ¸c, nÕu cã tµi s¶n th× ph¶i cøu trî ng­êi nghÌo, t«n sïng minh t«n.",
			PLAYER_NAME.."§Ö tö ghi nhí.",
			NPC_NAME.."Gi¸o chóng Minh Gi¸o chia thµnh 3 hÖ <color=green>TrËn Binh, Th¸nh ChiÕn, HuyÕt Nh©n<color>. Ng­¬i cã thÓ ®i t×m <color=green>§¹i V©n Ph¸p V­¬ng-V­¬ng DÇn<color> häc kü n¨ng <color=yellow>TrËn Binh<color>, nÕu høng thó víi <color=yellow>Th¸nh ChiÕn<color> th× ph¶i t×m <color=green>Quang Minh Ph¸p V­¬ng-LÖ Thiªn NhuËn<color>, cßn høng thó víi <color=yellow>HuyÕt Nh©n<color> th× h·y ®i t×m <color=green>Xİch DiÖm Ph¸p V­¬ng-T­ Hµnh Ph­¬ng<color>."
		)
		TaskTip("Ta ®· thuËn lîi gia nhËp Minh Gi¸o")
		SetPlayerFaction(9)
		SetPlayerRoute(24)
		SetTask(TB_FACTION_TASKID_LIST[MING_FACTION_ID],8)
		return
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[MING_FACTION_ID],1)
			TaskTip("T×m Ph­¬ng ThÊt PhËt lÊy Háa Chung")
			Msg2Player("T×m Ph­¬ng ThÊt PhËt (185/189) lÊy Háa Chung")
			Talk(3,"",
				NPC_NAME.."<color=yellow>Th¸nh háa hõng hùc, thiªu ®èt th©n ta, sèng cã g× vui, chÕt cã g× buån<color>. Gi¸o quy nghiªm ngÆt, kh«ng ph¶i tïy tiÖn cã thÓ gia nhËp vµo gi¸o, nh­ng nÓ t×nh ng­¬i tõ xa ®Õn ®©y, nÕu cã thÓ gióp <color=yellow>Th¸nh Háa §µn<color> hé ph¸p <color=green>§Æng Nguyªn Gi¸c<color> mang vÒ 4 Háa Chñng, ta sÏ cho ng­¬i gia nhËp.",
				PLAYER_NAME.."Ta ph¶i lµm sao.",
				NPC_NAME.."4 Háa Chñng: Thanh TŞnh, Quang Minh, §¹i Lùc, Trİ TuÖ cña Minh Gi¸o do 4 ng­êi <color=green>Quang Minh H÷u Sø-HÇu §«n, §¹i V©n Ph¸p V­¬ng-V­¬ng DÇn, Xİch DiÖm Ph¸p V­¬ng-T­ Hµnh Ph­¬ng, Quang Minh Ph¸p V­¬ng-LÖ Thiªn NhuËn<color> n¾m gi÷, ng­¬i ph¶i chuÈn bŞ 4 Háa Chung ®Ó bá Háa Chñng, t×m <color=green>Ph­¬ng ThÊt PhËt<color> (185/189) ®Ó lÊy nhĞ."
			)
		else
			Talk(1,"",NPC_NAME..GetPlayerSex().."Kh«ng thÊy <color=green>Ph­¬ng ThÊt PhËt<color> sao?  ¤ng Êy ë c¸ch ®©y kh«ng xa, h·y ®i t×m ®Ó lÊy <color=green>4 Háa Chung<color>.")
		end
		
	end
end
--½áÊø¶Ô»°
function end_dialog()
	
end
--´¦Àíº¯Êı
--´¦Àíº¯Êı
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end

-- ±Õ¹ØĞŞÁ¶
function practice()
    if GetPlayerFaction() ~= MING_FACTION_ID then
       Talk(1,"",NPC_NAME.."Ng­¬i kh«ng ph¶i lµ ®Ö tö Minh Gi¸o, kh«ng thÓ ®Õn ®©y tu luyÖn.");
    else
        if GetItemCount(2,0,788) >= 1 then  --Ê¦ÃÅÁîÅÆ
            Say(NPC_NAME.."B­íc vµo tu luyÖn kh«ng?",2,"§óng/practice_start","Sai/no");
        else
            Talk(1,"",NPC_NAME.."Ng­¬i kh«ng cã <color=yellow>Minh Gi¸o S­ M«n LÖnh<color>, kh«ng thÓ tiÕn hµnh bÕ quan tu luyÖn.");
        end;
    end;
end;