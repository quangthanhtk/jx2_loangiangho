--½Å±¾¹¦ÄÜ£ºÃ÷½ÌÕÆÃÅ¶Ô»°º¯Êı
--¹¦ÄÜÉè¼Æ£ºÔøÇìÏé
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-13
NPC_NAME = "<color=green>LÖ Thiªn NhuËn<color>:"
PLAYER_NAME = "<color=green>Ng­êi ch¬i<color>: §­îc, ta ®i ngay!"
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
--¼¼ÄÜÁĞ±í
SKILLS={
--Ã÷½ÌÊ¥Õ½
--Ê¥»ğ½ğÂ¯¹¦ (¼¼ÄÜid=1053)
[1053]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={4,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬ÏûºÄ½ğÇ®£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--Ê¥»ğµ¶·¨ (¼¼ÄÜid=1054)
[1054]={
     levelless={3,1,0,1053,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={9,26,0,0},
     },
--½ğÂ¯»¤Ìå (¼¼ÄÜid=1055)
[1055]={
     levelless={3,1,0,1053,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={9,26,0,0},
     },
--ÁÒì¾Õ¶ (¼¼ÄÜid=1056)
[1056]={
     levelless={3,1,0,1054,1},
     [1]={1,10,1000,0},
     [2]={2,13,200,0},
     [3]={7,28,0,0},
     },
--³ãÑ×»÷ (¼¼ÄÜid=1057)
[1057]={
     levelless={4,1,0,1054,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={3,15,0,0},
     [4]={7,27,0,0},
     },
--Ìì½Ù·Ù (¼¼ÄÜid=1058)
[1058]={
     levelless={3,2,0,1056,1,1057,1},
     [1]={1,20,8000,80},
     [2]={2,22,2500,80},
     [3]={8,34,0,80},
     },
--Äı»ğèµ (¼¼ÄÜid=1059)
[1059]={
     levelless={3,1,0,1055,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={7,38,0,80},
     },
--¿ñÑæ±¼ (¼¼ÄÜid=1060)
[1060]={
     levelless={4,1,0,1059,1},
     [1]={1,20,27000,300},
     [2]={2,21,6000,300},
     [3]={3,23,0,300},
     [4]={9,35,0,300},
     },
--ÖË·çĞı (¼¼ÄÜid=1061)
[1061]={
     levelless={3,1,0,1058,1},
     [1]={1,30,27000,300},
     [2]={2,32,6000,300},
     [3]={7,42,0,300},
     },
--°Ô»Í¶Ï (¼¼ÄÜid=1062)
[1062]={
     levelless={4,1,0,1058,1},
     [1]={1,30,27000,300},
     [2]={2,31,6000,300},
     [3]={3,33,0,300},
     [4]={7,41,0,300},
     },
--Æø»¯ÓÎÁú (¼¼ÄÜid=1063)
[1063]={
     levelless={3,1,0,1060,1},
     [1]={1,40,90000,700},
     [2]={2,42,24000,700},
     [3]={7,52,0,700},
     },
--ÑôÑ×±¬ (¼¼ÄÜid=1064)
[1064]={
     levelless={4,1,0,1061,1},
     [1]={1,40,90000,700},
     [2]={2,41,24000,700},
     [3]={3,43,0,700},
     [4]={9,55,0,700},
     },
--±©É±¾¢ (¼¼ÄÜid=1065)
[1065]={
     levelless={5,1,0,1062,1},
     [1]={1,50,90000,700},
     [2]={2,53,24000,700},
     [3]={5,62,0,700},
     [4]={6,66,0,700},
     [5]={7,70,0,700},
     },
--Ç¬À¤´óÅ²ÒÆ (¼¼ÄÜid=1066)
[1066]={
     levelless={5,3,1,1065,7,1064,9,1063,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetTask(1018) == 5 and BigGetItemCount(2,0,784) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh«ng cã Háa Chung lµm sao lÊy Háa Chñng, h·y t×m <color=green>Ph­¬ng ThÊt PhËt<color> (185/189) lÊy Háa Chung!")
		else
			Talk(1,"faction_task",	PLAYER_NAME.."B¸i kiÕn LÖ Ph¸p V­¬ng, gi¸o chñ b¶o ta ®Õn lÊy Háa Chñng.")
		end
		return
     elseif GetTask(1018) == 6 then
          Talk(1,"",NPC_NAME.."<color=green>§Æng Nguyªn Gİ¸c<color> (161/172) ë Minh Gi¸o HËu S¬n tr«ng gi÷ Th¸nh Háa §µn, ng­¬i lÊy ®ñ Háa Chñng mau ®­a cho y.")
          return
	end

	MJSZ_master_main(9,25)
end
--Ê¦ÃÅÈÎÎñ
function faction_task()
	Say(PLAYER_NAME.."Ta hái ng­¬i, <color=yellow>Minh Gi¸o<color> ThËp Lôc Tù Ch©n Ng«n lµ g×?",
	2,
	"Th¸nh háa ch¸y rùc, ®èt ch¸y th©n x¸c, sèng cã g× vui, chÕt cã g× khæ./task_right",
	"Thanh TŞnh an ninh, Quang Minh tr­îng nghÜa, §¹i Lùc uy chÊn, Trİ TuÖ khæ h¶i./task_wrong"
	)
end
function task_right()
		Talk(1,"",NPC_NAME.."§· lÊy ®ñ Háa Chñng, mau giao cho <color=green>Th¸nh Háa §µn<color> Hé Ph¸p <color=green>§Æng Nguyªn Gİ¸c<color> (161/172). Nhí b¶o vÖ tèt Háa Chñng, t¾t råi ta kh«ng chŞu tr¸ch nhiÖm.")
		DelItem(2,0,780,1)
		AddItem(2,0,784,1)
		SetTask(1018,6)
		TaskTip("CÇm 4 Háa Chñng ®Õn gÆp §Æng Nguyªn Gİ¸c")
		Msg2Player("CÇm 4 Háa Chñng ®Õn gÆp §Æng Nguyªn Gİ¸c (161/172)")
end
function task_wrong()
	Talk(1,"",PLAYER_NAME.."C¶ ThËp Lôc Tù Ch©n Ng«n cña Minh Gi¸o cßn kh«ng biÕt, Háa Chñng nµy ta kh«ng thÓ giao cho ng­¬i.")
	return
end

function MJSZ_master_main(faction_seq,route_seq)
     local t_dia_sel = {
          "§Ö tö b¸i kiÕn s­ phô!/#MJSZ_EnterRoute("..faction_seq..","..route_seq..")",
          "Häc"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."Vâ c«ng/#skilllearn("..route_seq..")",
          "Ta cã ®­îc tµn quyÓn mËt tŞch trÊn ph¸i cña bæn m«n./#MJSZ_book_chg("..route_seq..")",
          "Chµo hái/end_dialog",
     }
     local t_dia_show = {}
     local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
     if GetPlayerFaction() == faction_seq then  --±¾ÃÅµÜ×Ó
          tinsert(t_dia_show,t_dia_sel[1])
          tinsert(t_dia_show,t_dia_sel[2])
          tinsert(t_dia_show,t_dia_sel[3])
     end
     if getn(t_dia_show) == 1 then
          Talk(1,"",s_dia_main)
     else
          Say(s_dia_main,
               getn(t_dia_show),
               t_dia_show
          )
     end
end
function MJSZ_EnterRoute( faction_seq,route_seq )
     if GetPlayerFaction() ~= faction_seq then
          Say(NPC_NAME.."ThiÕu hiÖp ph¶i ®­îc gi¸o chñ ®ång ı cho gia nhËp Minh Gi¸o, sau ®ã míi cã thÓ ®Õn b¸i s­ häc nghÖ.",0)
     elseif GetPlayerRoute()  == route_seq then -- ±¾ÅÉµÜ×Ó
          Say(NPC_NAME.."Mau ®i luyÖn c«ng, kh«ng ®­îc lµm biÕng.",0)
     elseif GetPlayerRoute()  == 24 then        -- ±¾ÃÅÎŞÅÉµÜ×Ó
          get_in_route(faction_seq,route_seq)
     else                                       -- ±¾ÃÅ±ğÅÉµÜ×Ó
          Say(NPC_NAME.."Ta kh«ng ph¶i s­ phô cña ng­¬i, ng­¬i nªn gäi ta lµ s­ thóc!",0)
     end
end
function MJSZ_book_chg( route_seq )
     if GetPlayerRoute() ~= route_seq then --Á÷ÅÉ¼ì²â
          Say(NPC_NAME.."Ng­¬i kh«ng ph¶i ®Ö tö cña ta, mËt tŞch trÊn ph¸i cña bæn m«n sau cã thÓ giao cho ng­¬i!", 0)
          return
     else
          book_chg(route_seq)
     end 
end

GREATE_SKILL_NAME = "Cµn Kh«n §¹i Na Di"
GREATE_SKILL_ID = 1066
ROUTE_SKILL_NAME = "Minh Gi¸o Th¸nh ChiÕn"

function showlimit(n)    --Ê¦ÃÅËµ»°
     if n==2 then
          Say(NPC_NAME.."CÊp kh«ng ®ñ ®Ó häc vâ c«ng míi, h·y th¨ng cÊp tr­íc?",0)
     elseif n==3 then
          Say(NPC_NAME.."Kinh nghiÖm kh«ng ®ñ häc vâ c«ng míi, h·y luyÖn tËp tr­íc?",0)
     elseif n==4 then
          Say(NPC_NAME.."Danh väng cña ng­¬i kh«ng ®ñ ®Ó häc vâ c«ng míi, h·y lµm nhiÖm vô ®Ó tİch lòy thªm danh väng.",0)
     elseif n==5 then
          Say(NPC_NAME.."Vâ c«ng tr­íc vÉn ch­a häc xong, kh«ng thÓ häc vâ c«ng míi!",0)
     elseif n==6 then
          Say(NPC_NAME.."Ng©n l­îng cña ng­¬i kh«ng ®ñ, t×m ®ñ råi h·y quay l¹i nhĞ!",0)
     else
     end
end;

function skilllearn(route_seq)         --Ñ§Ï°¼¼ÄÜ
     if GetPlayerRoute() ~= route_seq then --ÃÅÅÉ¼ì²â
          Say(NPC_NAME.."Kh«ng ph¶i ®Ö tö, kh«ng thÓ häc"..ROUTE_SKILL_NAME.."Vâ c«ng.",0)
     else
          Say(NPC_NAME.."Gãc ph¶i phİa d­êi biÓu t­îng vâ c«ng xuÊt hiÖn dÊu mòi tªn biÓu thŞ cã thÓ häc vâ c«ng nµy, nhÊn chuét ®Ó t¨ng cÊp.",0)
          AllowLearnSkill()
     end
end;




function beforelearnskill(id)
     if id == GREATE_SKILL_ID then  --ÍòÏàÉñ¹¦
          if GetSkillLevel(GREATE_SKILL_NAME) <= 0 then
               return NPC_NAME.."\""..GREATE_SKILL_NAME.."? lµ <color=red>tuyÖt häc trÊn ph¸i<color> cña bæn m«n, kh«ng ph¶i ng­êi cã vâ ®øc cao trong bæn m«n, kh«ng ®­îc häc."
          end
     end
end

function afterlearnskill(id)
     if id == GREATE_SKILL_ID then  --ÍòÏàÉñ¹¦
          if GetSkillLevel(GREATE_SKILL_NAME) == 1 then
               Say(NPC_NAME.."ThiÕu hiÖp qu¶ t­ chÊt h¬n ng­êi, ®· s¬ bé l·nh ngé ®­îc ?"..GREATE_SKILL_NAME.."?, thËt hiÕm cã!<enter><color=green>Ng­êi ch¬i<color>:  Nh­ng s­ phô, t¹i sao khi con xuÊt chiªu ?"..GREATE_SKILL_NAME.."?, c¶m thÊy néi khİ kh«ng tËp trung khã lßng thi triÓn? Tõ tr­íc ®· nghe nãi Lôc M¹ch ThÇn KiÕm cña §¹i Lı §o¹n ThŞ, muèn thi triÓn nh­ng kh«ng ®­îc.<enter>"..NPC_NAME.."ThiÕu hiÖp cã ®iÒu ch­a biÕt, ?"..GREATE_SKILL_NAME.."? dï cã biÕt nh­ng muèn ®iÒu khiÓn nã thËt kh«ng ph¶i chuyÖn dÔ. Tinh khİ trong c¬ thÓ kh«ng néi tô thµnh ?S¸t khİ? (®iÓm s¸t khİ) sÏ kh«ng thÓ thi triÓn. Muèn thi triÓn cÇn tèn ?S¸t khİ?. ?S¸t khi? tæng 10 phÇn, trong c«ng thñ tö th­¬ng cã thÓ t¨ng, ®ång thêi còng sÏ tù tô tËp.", 1, "§ång ı/GiveMomentum")
          elseif GetSkillLevel(GREATE_SKILL_NAME) == 5 then
               Say(NPC_NAME.."ThiÕu hiÖp qu¶ t­ chÊt th«ng minh, ?"..GREATE_SKILL_NAME.."? ®· l·nh ngé ®­îc 5 phÇn. Vâ c«ng nµy tæng cã 20 cÊp, 5 cÊp tiÕp theo thiÕu hiÖp ph¶i siªng n¨ng tu luyÖn, ®Õn ®é thuÇn thôc nhÊt ®Şnh míi cã thÓ ®ét ph¸. Cßn 10 cÊp sau cïng ph¶i tham ngé mËt tŞch trÊn ph¸i cña bæn m«n míi cã thÓ l·nh ngé ra.", 0)
          end
     end
end

function GiveMomentum()
     Say(NPC_NAME.."§­îc, giê ta sÏ vËn c«ng ®Ó s¸t khİ trong c¬ thÓ ng­¬i néi tô 10 phÇn, gióp ng­¬i xuÊt chiªu?"..GREATE_SKILL_NAME.."?.<enter><enter>RÊt l©u...<enter><enter>"..NPC_NAME.."Xong råi, s¸t khİ trong c¬ thÓ thiÕu hiÖp ®· h×nh thµnh, giê cã thÓ thö xuÊt chiªu ?"..GREATE_SKILL_NAME.."? råi. TuyÖt häc trÊn ph¸i bæn m«n uy lùc ®¸ng sî, chØ ®­îc dïng ®Ó gióp ®ì mäi ng­êi, thay trêi hµnh ®¹o, kh«ng ®­îc lµm h¹i ng­êi v« téi, nhí ®ã...", 0)
     SetMomentum(10)
     RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

