--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\isolate\\online_activites\\catch_fish\\head.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "catchFish",
    szViewName 			= "Thng Nh﹏ H秈 S秐",
    nTalkBeginDate		= 0,
    nBeginDate 			= g_tCatchFish.nStartDate,
    nEndDate 			= g_tCatchFish.nEndDate,
    nTaskGroup 			= 3,
    nTaskGroupVersion	= 30,
}

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
    {id={"goldbuy", 4,}, clear="daily" }, --代币商店每日兑换次数
    {id={"freeAward", 5,}, clear="daily" }, --免费领小爆竹
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
	--isolate_watch_event("event_kill_npc", "__on_kill_npc", "东海水族", 103)   --在东海海滨一杀怪
	--isolate_watch_event("event_kill_npc", "__on_kill_npc", "东海水族士兵", 103)   --在东海海滨一杀怪
end
--function on_new_day(nToday) end

--function __on_kill_npc(data, para)
--	if random(1,100) <=10 then
--		AddItem(2,1,30816,1)
--	end
--end

function on_event_server_start()
	createNpcList({
		{"Ch� c莔  T﹜ Nam", "Thng Nh﹏ H秈 S秐", 100, 1517, 2875, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_seller.lua"},
		{"Ng� d﹏", "Ng� Ph�", 103, 1817, 3350, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_fisher.lua"},
		{"Ti觰 Hi謚 Ph竜 Уi", "Ng� D﹏ Th� Ph竜", 103, 1804, 3441, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti觰 Hi謚 Ph竜 Уi", "Ng� D﹏ Th� Ph竜", 103, 1814, 3463, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti觰 Hi謚 Ph竜 Уi", "Ng� D﹏ Th� Ph竜", 103, 1830, 3492, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti觰 Hi謚 Ph竜 Уi", "Ng� D﹏ Th� Ph竜", 103, 1857, 3480, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti觰 Hi謚 Ph竜 Уi", "Ng� D﹏ Th� Ph竜", 103, 1866, 3447, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti觰 Hi謚 Ph竜 Уi", "Ng� D﹏ Th� Ph竜", 103, 1873, 3415, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
	});
	apply_server_counter()--更新服务器计数器
end
function on_event_player_login(nExchangeComing)
	if gf_GetTransLevel() >= 890 then
		if get_task("freeAward") == 0 then
    		if 1 ~= gf_JudgeRoomWeight(1, 1, isolate_view_name()) then
    			return 0;
    		end
    		set_task("freeAward", 1)
    		AddItem(2, 1, 31204, 30, 4)--免费给30个小爆竹
    		Msg2Player(format("B筺  nh薾 頲 %d %s t� ho箃 ng %s", 30, "Ph竜 Nh�", isolate_view_name()))
    	end
	end

end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate上线后第一次登录时的清理



