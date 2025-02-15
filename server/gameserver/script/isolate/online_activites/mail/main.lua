--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\mail\\mail_lux.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "mail",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20170310,
    nEndDate 			= 20170325,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 26,
}

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
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
		, "Qu� i hi謕 th﹏ m課"
		, "    Xin ch祇!"
		, "    Nh籱 cung c蕄 d辌h v� game c祅g t鑤 v� c祅g ti謓 l頸 h琻, nay ch髇g t玦 ch輓h th鴆 ra m総 h� th鑞g th�."
		, "    Hi謓 t筰, h� th鑞g th� t筸 th阨 ch璦 cho ph衟 ngi ch琲 g鰅 v藅 ph萴 v� ti襫 cho nhau, Vui l遪g nh蕁 d蕌 ? � g鉩 tr猲 b猲 ph秈 giao di謓 th�  t譵 hi觰 hng d蒼 s� d鬾g th�. C竚 琻 c竎 b筺  lu玭 駈g h� VLTK 2. Ch骳 b筺 ch琲 game vui v�!"
		, "    Th﹏ 竔"
		, "        K輓h b髏!"
		, "            BH� V� L﹎ Truy襫 K� 2")
	sendScriptMail("BH� V� L﹎ Truy襫 K� 2", GetName(), "Ra m総 h� th鑞g th� ho祅 to祅 m韎", szContent, "", "")

	szContent = format("%s\n%s\n%s\n%s\n%s\n%s"
		, "Qu� i hi謕 th﹏ m課"
		, "    Xin ch祇!"
		, "    в ch骳 m鮪g h� th鑞g th� ch輓h th鴆 ra m総, ch髇g t玦 s� t苙g c竎 b筺 уng T� Chi Nguy謓*7  c竚 琻 s� 駈g h� c馻 b筺 d祅h cho VLTK2 trong su鑤 th阨 gian qua. Ch骳 b筺 ch琲 game vui v�!"
		, "    Th﹏ 竔"
		, "        K輓h b髏!"
		, "            BH� V� L﹎ Truy襫 K� 2")
	sendScriptMail("BH� V� L﹎ Truy襫 K� 2", GetName(), "Ra m総 h� th鑞g th� ho祅 to祅 m韎", szContent, "AddItem(2,1,30913,7,4)", "checkNormal")
	
	szContent = format("%s\n%s\n%s\n%s\n%s"
		, "Qu� i hi謕 th﹏ m課"
		, "    Xin ch祇!"
		, "    V� L﹎ Truy襫 K� 2 c藀 nh藅 phi猲 b秐 m韎 v韎 甶襲 ch豱h k� n╪g h� ph竔, Th� Code Thanh Long L謓h h� tr� th╪g c蕄 nhanh ch鉵g c飊g ph莕 thng h蕄 d蒼, a top server m韎 Thanh Long nh薾 trang b� chi課 trng m韎 Thanh Long, l� h祅h trang chu萵 b� cho gi秈 u Bang H閕 Tinh Anh 17 s緋 t韎."
		, "    Tr薾 tr鋘g k輓h m阨 qu� ng o c飊g tr秈 nghi謒 c竎 c藀 nh藅 m韎 v祇 ng祔 10/03/2017 c飊g V� L﹎ Truy襫 K� 2."
		, "    Th玭g tin chi ti誸 ho箃 ng ng o c� th� xem t筰 trang ch�.")
	sendScriptMail("BH� V� L﹎ Truy襫 K� 2", GetName(), "Phi猲 b秐 m韎 nh蕋 ra m総", szContent, "", "")
end

--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear(nLastLoginDate) --isolate上线后第一次登录时的清理 end 



