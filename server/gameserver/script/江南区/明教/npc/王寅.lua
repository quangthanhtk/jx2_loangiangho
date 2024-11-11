--½Å±¾¹¦ÄÜ£ºÃ÷½ÌÕÆÃÅ¶Ô»°º¯Êı
--¹¦ÄÜÉè¼Æ£ºÔøÇìÏé
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-13
NPC_NAME = "<color=green>V­¬ng DÇn<color>:"
PLAYER_NAME = "<color=green>Ng­êi ch¬i<color>: §­îc, ta ®i ngay!"
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
--¼¼ÄÜÁĞ±í
SKILLS={
--Ã÷½ÌÕó±ø
--¹âÃ÷åĞÒ£¹¦ (¼¼ÄÜid=1083)
[1083]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={4,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬ÏûºÄ½ğÇ®£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--¹âÃ÷±Ê·¨ (¼¼ÄÜid=1084)
[1084]={
     levelless={3,1,0,1083,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={9,26,0,0},
     },
--½ğËøÕó (¼¼ÄÜid=1085)
[1085]={
     levelless={3,1,0,1083,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={7,28,0,0},
     },
--ÙÈÆìÁî (¼¼ÄÜid=1086)
[1086]={
     levelless={2,1,0,1085,1},
     [1]={1,10,1000,0},
     [2]={1,10,800,0},
     },
--ĞşË®Õó (¼¼ÄÜid=1087)
[1087]={
     levelless={4,2,0,1085,1,1084,1},
     [1]={1,10,8000,80},
     [2]={2,12,2500,80},
     [3]={3,15,0,80},
     [4]={7,27,0,80},
     },
--·â±øÁî (¼¼ÄÜid=1088)
[1088]={
     levelless={3,1,0,1086,1},
     [1]={1,20,8000,80},
     [2]={2,22,2500,80},
     [3]={8,34,0,80},
     },
--ÅÌÄ¾Õó (¼¼ÄÜid=1089)
[1089]={
     levelless={3,1,0,1087,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={7,38,0,80},
     },
--Ñ¸Ó°Áî (¼¼ÄÜid=1090)
[1090]={
     levelless={3,1,0,1088,1},
     [1]={1,20,27000,300},
     [2]={2,22,6000,300},
     [3]={8,34,0,300},
     },
--Ç¬À¤Äæ×ª (¼¼ÄÜid=1091)
[1091]={
     levelless={3,1,0,1090,1},
     [1]={1,30,90000,700},
     [2]={2,32,24000,700},
     [3]={7,42,0,700},
     },
--Òµ»ğÕó (¼¼ÄÜid=1092)
[1092]={
     levelless={3,1,0,1089,1},
     [1]={1,30,27000,300},
     [2]={2,33,6000,300},
     [3]={7,48,0,300},
     },
--ÎåÁé¹éÔª (¼¼ÄÜid=1095)
[1095]={
     levelless={3,1,0,1094,1},
     [1]={1,40,90000,700},
     [2]={2,43,24000,700},
     [3]={7,58,0,700},
     },
--ÎåÁéÉ¢Ôª (¼¼ÄÜid=1094)
[1094]={
     levelless={4,1,0,1084,1},
     [1]={1,40,27000,300},
     [2]={2,41,6000,300},
     [3]={3,43,0,300},
     [4]={9,55,0,300},
     },
--ÍÁÀÎÕó (¼¼ÄÜid=1093)
[1093]={
     levelless={5,2,1,1095,1,1092,1},
     [1]={1,50,90000,700},
     [2]={2,53,24000,700},
     [3]={5,62,0,700},
     [4]={6,66,0,700},
     [5]={7,70,0,700},
     },
--¹âÃ÷ÎåĞĞÕó (¼¼ÄÜid=1096)
[1096]={
     levelless={5,2,1,1093,7,1091,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetTask(1018) == 3 and BigGetItemCount(2,0,782) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh«ng cã Háa Chung lµm sao lÊy Háa Chñng, h·y t×m <color=green>Ph­¬ng ThÊt PhËt<color> (185/189) lÊy Háa Chung!")
		else
			Talk(4,"faction_task",
				NPC_NAME.."Ta ®ang uèng r­îu ngon lµnh, ®õng khiÕn cho ta mÊt høng.",
				PLAYER_NAME.."Gi¸o chñ b¶o ta ®Õn ®©y lÊy Háa Chñng.",
				NPC_NAME.."Háa Chñng g× chø, viÖc uèng r­îu cña ta quan träng h¬n, ®¸ng ghĞt, r­îu còng hÕt råi.",
				PLAYER_NAME.."Ta ®· chuÈn bŞ r­îu ngon råi, mêi dïng."
			)
		end
		return
     elseif GetTask(1018) == 4 then
          Talk(1,"",NPC_NAME.."<color=green>T­ Hµnh Ph­¬ng<color> (182/196) ë h­íng kh¸c, <color=yellow>§¹i Lùc Háa Chñng<color> ë trong ta cña «ng Êy, h·y mau ®i lÊy nµo.")
          return
	end

	MJZB_master_main(9,26)
end
--Ê¦ÃÅÈÎÎñ
function faction_task()
	if GetItemCount(2,0,786) == 0 then
		Talk(1,"",NPC_NAME.."R­îu ®©u?")
		return
	else
		DelItem(2,0,786,1)
		DelItem(2,0,780,1)
		AddItem(2,0,782,1)
		Talk(1,"",NPC_NAME.."R­îu ngon! Tèt l¾m! Nµo h·y ®Õn ®©y mang <color=yellow>Quang Minh Háa Chñng<color> ®i. §i h­íng kh¸c ®Ó t×m <color=green>T­ Hµnh Ph­¬ng<color> (182/196), <color=yellow>§¹i Lùc Háa Chñng<color> ë trong tay cña «ng Êy.")
		SetTask(1018,4)
		TaskTip("T×m T­ Hµnh Ph­¬ng lÊy §¹i Lùc Háa Chñng")
		Msg2Player("T×m T­ Hµnh Ph­¬ng (182/196) lÊy §¹i Lùc Háa Chñng")
	end
end


function MJZB_master_main(faction_seq,route_seq)
     local t_dia_sel = {
          "§Ö tö b¸i kiÕn s­ phô!/#MJZB_EnterRoute("..faction_seq..","..route_seq..")",
          "Häc"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."Vâ c«ng/#skilllearn("..route_seq..")",
          "Ta cã ®­îc tµn quyÓn mËt tŞch trÊn ph¸i cña bæn m«n./#MJZB_book_chg("..route_seq..")",
          "Chµo hái/end_dialog",
     }
     local t_dia_show = {}
     local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
     if GetPlayerFaction() == faction_seq then  --±¾ÃÅµÜ×Ó
          tinsert(t_dia_show,t_dia_sel[1])
          tinsert(t_dia_show,t_dia_sel[2])
          tinsert(t_dia_show,t_dia_sel[3])
          -- end
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

function MJZB_EnterRoute( faction_seq,route_seq )
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


function MJZB_book_chg( route_seq )
     if GetPlayerRoute() ~= route_seq then --Á÷ÅÉ¼ì²â
          Say(NPC_NAME.."Ng­¬i kh«ng ph¶i ®Ö tö cña ta, mËt tŞch trÊn ph¸i cña bæn m«n sau cã thÓ giao cho ng­¬i!", 0)
          return
     else
          book_chg(route_seq)
     end 
end


--¹âÃ÷ÎåĞĞÕó (¼¼ÄÜid=1096)
GREATE_SKILL_NAME = "Quang Minh Ngò Hµnh TrËn"
GREATE_SKILL_ID = 1096
ROUTE_SKILL_NAME = "Minh Gi¸o TrËn Binh"
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
     if id == GREATE_SKILL_ID then 
          if GetSkillLevel(GREATE_SKILL_NAME) <= 0 then
               return NPC_NAME.."\""..GREATE_SKILL_NAME.."? lµ <color=red>tuyÖt häc trÊn ph¸i<color> cña bæn m«n, kh«ng ph¶i ng­êi cã vâ ®øc cao trong bæn m«n, kh«ng ®­îc häc."
          end
     end
end

function afterlearnskill(id)
     if id == GREATE_SKILL_ID then 
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

