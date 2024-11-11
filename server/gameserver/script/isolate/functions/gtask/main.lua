--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\isolate\\functions\\gtask\\handler.lua")
Include("\\script\\isolate\\functions\\gtask\\talk_event_config.lua")
Include("\\script\\isolate\\functions\\gtask\\create_npc_list.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "gtask",
    szViewName 			= "NhiÖm vô ThÕ giíi",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
--t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
t_isolate_user_batch_watch_list = { --{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...},
	--{nTaskId, nRate, {name,g,d,p,n,s}, room, weight}
	--ÎÆÊÎÏµÁĞÈÎÎñ
	{"event_mission_task_award", {"pvp", "plant", -1}, fn_elem, {421, "Cã ®­îc Méc Tinh", nil, fn_award_items, {1,100,{{"H¹t Gièng ThÇn Méc",{2,1,31090,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"taiyi", 4}, fn_elem, {424, "C¸ch söa ch÷a 3", nil, fn_award_items, {1,100,{{"Thñy Tinh",{2,1,31093,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"taiyihero", 4}, fn_elem, {424, "C¸ch söa ch÷a 3", nil, fn_award_items, {1,100,{{"Thñy Tinh",{2,1,31093,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 1}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Háa Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Háa Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 1}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Háa Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Háa Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 3}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Thæ Tinh",{2,1,31095,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Thæ Tinh",{2,1,31095,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 3}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Thæ Tinh",{2,1,31095,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {426, "C¸ch söa ch÷a 4", nil, fn_award_items, {1,100,{{"Thæ Tinh",{2,1,31095,1,4},1,100}, }}} },
	
	--9×ªÏµÁĞÈÎÎñ
	{"event_mission_stage_finish", {"jiandangyanyun", 1}, fn_elem, {462, "Háa ThÇn Chóc Dung", nil, fn_award_items, {1,100,{{"U Háa Trôy",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 2}, fn_elem, {463, "ThuÊn ThÇn D¹ Oanh", nil, fn_award_items, {1,100,{{"Bİch Thñy Ch©u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 3}, fn_elem, {464, "NiÕt Bµn T«n Gi¶", nil, fn_award_items, {1,100,{{"Thiªn HuyÔn Thæ",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 4}, fn_elem, {465, "V« L­îng Minh V­¬ng", nil, fn_award_items, {1,100,{{"HuyÒn Träng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 5}, fn_elem, {466, "Thiªn ¢m rót lui", nil, fn_award_items, {1,100,{{"HuyÕt Méc Ên",{2,1,31116,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 1}, fn_elem, {462, "Háa ThÇn Chóc Dung", nil, fn_award_items, {1,100,{{"U Háa Trôy",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 2}, fn_elem, {463, "ThuÊn ThÇn D¹ Oanh", nil, fn_award_items, {1,100,{{"Bİch Thñy Ch©u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 3}, fn_elem, {464, "NiÕt Bµn T«n Gi¶", nil, fn_award_items, {1,100,{{"Thiªn HuyÔn Thæ",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 4}, fn_elem, {465, "V« L­îng Minh V­¬ng", nil, fn_award_items, {1,100,{{"HuyÒn Träng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 5}, fn_elem, {466, "Thiªn ¢m rót lui", nil, fn_award_items, {1,100,{{"HuyÕt Méc Ên",{2,1,31116,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {462, "Háa ThÇn Chóc Dung", nil, fn_award_items, {1,100,{{"U Háa Trôy",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {463, "ThuÊn ThÇn D¹ Oanh", nil, fn_award_items, {1,100,{{"Bİch Thñy Ch©u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {464, "NiÕt Bµn T«n Gi¶", nil, fn_award_items, {1,100,{{"Thiªn HuyÔn Thæ",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {465, "V« L­îng Minh V­¬ng", nil, fn_award_items, {1,100,{{"HuyÒn Träng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {466, "Thiªn ¢m rót lui", nil, fn_award_items, {1,100,{{"HuyÕt Méc Ên",{2,1,31116,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {462, "Háa ThÇn Chóc Dung", nil, fn_award_items, {1,100,{{"U Háa Trôy",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {463, "ThuÊn ThÇn D¹ Oanh", nil, fn_award_items, {1,100,{{"Bİch Thñy Ch©u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {464, "NiÕt Bµn T«n Gi¶", nil, fn_award_items, {1,100,{{"Thiªn HuyÔn Thæ",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {465, "V« L­îng Minh V­¬ng", nil, fn_award_items, {1,100,{{"HuyÒn Träng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {466, "Thiªn ¢m rót lui", nil, fn_award_items, {1,100,{{"HuyÕt Méc Ên",{2,1,31116,1,4},1,100}, }}} },

	--Õ½¿ñÉı¼¶ÈÎÎñµÚ¶şÆÚ
	{"event_mission_affairs", {"worldboss","killboss",-1}, fn_elem, {476, "BOSS ThÕ Giíi", nil, fn_award_items, {1,100,{{"Binh Khİ ThÇn Vâ",{2,1,31146,1,4},1,100}, }}} },
	{"event_mission_task_award", {"pvp","duobiao",5}, fn_elem, {470, "Tiªu Xa Hoµng Gia", nil, fn_award_items, {1,100,{{"VËt T­ Cøu Trî",{2,1,31144,1,4},1,100}, }}} },
	
	--ÔÂ¿¨´³¹ØÈÎÎñ£¬Ã¿´Î1¸ö×Ü¹²10¸ö
	{"event_mission_stage_finish", {"liangshan", 8}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"dixuangong", 7}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"wanjianzhong", 4}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"taiyi", 6}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"taiyihero", 6}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 5}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 5}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {487, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Tİn VËt V­ît ¶i",{2,1,31190,1,4},10,100}, }}} },

	--»¯¾³ÈÎÎñ
	{"event_mission_stage_finish", {"jiandangyanyunhero", 5}, fn_elem, {579, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"§Çu Gi¸o G·y",{2,1,31266,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {579, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"§Çu Gi¸o G·y",{2,1,31266,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"taiyihero", 6}, fn_elem, {579, "NhiÖm vô v­ît ¶i", nil, fn_award_items, {1,100,{{"Th­ Gi¸o chñ",{2,1,31267,1,4},10,100}, }}} },
}

function on_event_server_start()
	fn_call_npcs(tCreateNpcList, nil)
end
function on_add_watches()
	fn_reg_talk_events()
end

--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí



