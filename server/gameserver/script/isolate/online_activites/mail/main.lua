--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\mail\\mail_lux.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "mail",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20170310,
    nEndDate 			= 20170325,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 26,
}

--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
    {id={"id_award", 1,} }, 
}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end

--function on_event_server_start() end

function on_event_player_login(nExchangeComing)
	if get_task("id_award") ~= 0 then
		return
	end
	
	set_task("id_award", tonumber(date("%Y%m%d")))
	
	local szContent = format("%s\n%s\n%s\n%s\n%s\n%s\n%s"
		, "Quı ®¹i hiÖp th©n mÕn"
		, "    Xin chµo!"
		, "    Nh»m cung cÊp dŞch vô game cµng tèt vµ cµng tiÖn lîi h¬n, nay chóng t«i chİnh thøc ra m¾t hÖ thèng th­."
		, "    HiÖn t¹i, hÖ thèng th­ t¹m thêi ch­a cho phĞp ng­êi ch¬i göi vËt phÈm vµ tiÒn cho nhau, Vui lßng nhÊn dÊu ? ë gãc trªn bªn ph¶i giao diÖn th­ ®Ó t×m hiÓu h­íng dÉn sö dông th­. C¸m ¬n c¸c b¹n ®· lu«n ñng hé VLTK 2. Chóc b¹n ch¬i game vui vÎ!"
		, "    Th©n ¸i"
		, "        Kİnh bót!"
		, "            BH§ Vâ L©m TruyÒn Kú 2")
	sendScriptMail("BH§ Vâ L©m TruyÒn Kú 2", GetName(), "Ra m¾t hÖ thèng th­ hoµn toµn míi", szContent, "", "")

	szContent = format("%s\n%s\n%s\n%s\n%s\n%s"
		, "Quı ®¹i hiÖp th©n mÕn"
		, "    Xin chµo!"
		, "    §Ó chóc mõng hÖ thèng th­ chİnh thøc ra m¾t, chóng t«i sÏ tÆng c¸c b¹n §ång TÕ Chi NguyÖn*7 ®Ó c¸m ¬n sù ñng hé cña b¹n dµnh cho VLTK2 trong suèt thêi gian qua. Chóc b¹n ch¬i game vui vÎ!"
		, "    Th©n ¸i"
		, "        Kİnh bót!"
		, "            BH§ Vâ L©m TruyÒn Kú 2")
	sendScriptMail("BH§ Vâ L©m TruyÒn Kú 2", GetName(), "Ra m¾t hÖ thèng th­ hoµn toµn míi", szContent, "AddItem(2,1,30913,7,4)", "checkNormal")
	
	szContent = format("%s\n%s\n%s\n%s\n%s"
		, "Quı ®¹i hiÖp th©n mÕn"
		, "    Xin chµo!"
		, "    Vâ L©m TruyÒn Kú 2 cËp nhËt phiªn b¶n míi víi ®iÒu chØnh kü n¨ng hÖ ph¸i, ThÎ Code Thanh Long LÖnh hç trî th¨ng cÊp nhanh chãng cïng phÇn th­ëng hÊp dÉn, §ua top server míi Thanh Long nhËn trang bŞ chiÕn tr­êng míi Thanh Long, lµ hµnh trang chuÈn bŞ cho gi¶i ®Êu Bang Héi Tinh Anh 17 s¾p tíi."
		, "    TrËn träng kİnh mêi quı ®ång ®¹o cïng tr¶i nghiÖm c¸c cËp nhËt míi vµo ngµy 10/03/2017 cïng Vâ L©m TruyÒn Kú 2."
		, "    Th«ng tin chi tiÕt ho¹t ®éng ®ång ®¹o cã thÓ xem t¹i trang chñ.")
	sendScriptMail("BH§ Vâ L©m TruyÒn Kú 2", GetName(), "Phiªn b¶n míi nhÊt ra m¾t", szContent, "", "")
end

--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear(nLastLoginDate) --isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí end 



