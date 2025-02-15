--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\isolate\\online_activites\\christmas\\2015_12\\handler.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "christmas",
    szViewName 			= "Trang tr� c﹜ th玭g",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20151223,
    nEndDate 			= 20160105,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 23,
}

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
	{id={"id_score", 1,}, }, --
    {id={"id_task_1", 2,}, clear="daily", byte_step=1, byte_task=2, }, --
    {id={"id_task_2", 3,}, clear="daily", byte_step=1, byte_task=2, }, --
    {id={"id_server_award", 4,}, },
    {id={"id_open_box1", 5,}, clear="daily"}, --普通包开启次数
}

--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
function on_add_watches()
	isolate_watch_npc_talk("Uy Nh� T鑞", 100, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi竜 s�", 200, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi竜 s�", 300, "handle_on_npc_talk")
	isolate_watch_item_talk(2,1,30971,"handle_on_use_item")
	isolate_watch_item_talk(2,1,30972,"handle_on_use_item")
	isolate_watch_npc_talk("C﹜ Noel-Thng", 100, "handle_on_tree1_talk")
	isolate_watch_npc_talk("C﹜ Noel-Thng", 200, "handle_on_tree1_talk")
	isolate_watch_npc_talk("C﹜ Noel-Thng", 300, "handle_on_tree1_talk")
	isolate_watch_npc_talk("C﹜ Noel-H祇 Hoa", 100, "handle_on_tree2_talk")
	isolate_watch_npc_talk("C﹜ Noel-H祇 Hoa", 200, "handle_on_tree2_talk")
	isolate_watch_npc_talk("C﹜ Noel-H祇 Hoa", 300, "handle_on_tree2_talk")
end
--function on_new_day(nToday) end

function on_event_server_start()
	local tTreeList = {
		{"hd_ptsds","C﹜ Noel-Thng", 100,1323,2928, ""},
		{"hd_ptsds","C﹜ Noel-Thng", 200,1319,2810, ""},
		{"hd_ptsds","C﹜ Noel-Thng", 300,1714,3552, ""},
		{"hd_hhsds","C﹜ Noel-H祇 Hoa", 100,1315,2920, ""},
		{"hd_hhsds","C﹜ Noel-H祇 Hoa", 200,1331,2798, ""},
		{"hd_hhsds","C﹜ Noel-H祇 Hoa", 300,1700,3539, ""},
	}
	_CreateNpcList(tTreeList)
end
function _CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			local idx = SubWorldID2Idx(tNpc[3])
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or "")
				WriteLogEx(szMsg)
				print(szMsg)
			end
		end
		
	end
end
function on_event_player_login(nExchangeComing)
	Msg2Player("Ho箃 ng trang tr� C﹜ Noel 產ng 頲 di詎 ra n竜 nhi謙, tin t鴆 c� th� m阨 甶 Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗ t譵 Gi竜 s�  t譵 hi觰")
end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end



