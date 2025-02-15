--
-- Author: Zheng Jinke
-- Date: 2015-12-17 10:28:35
--
--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")			-- 活动的字符串表
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_meishipingjian.lua")	-- 美食品鉴会功能
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\award.lua")					-- 奖励功能
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_online.lua")			-- 在线计时功能
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_meishiqiyu.lua")			-- 在线计时功能
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\npc\\npc_material.lua")


t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "meishiqingdian",
    szViewName 			= "L� H閕 萴 Th鵦",
    nTalkBeginDate		= 20160119,
    nBeginDate 			= 20160119,
    nEndDate 			= 20160131,
    nTaskGroup 			= 3,
    nTaskGroupVersion	= 20,
}

function handle_refresh( tEvent, data, para )
	local h,m = unpack(data)
	local hm = h*100+m
	if hm >= 800 and hm <= 2300 then
		refresh_material(h,m)
	end
	if hm >= 1000 and hm <= 2300 and m == 0 then
		refresh_boss()
	end
end

function handle_count_time(tEvent, data, para)
	local round = get_task("id_online_time_round")
	if round >= getn(tb_online_task) then return 0 end
	local cnt = get_task("id_online_time_count")
	set_task("id_online_time_count",cnt+1)
end


--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
   {id={"id_online_time_round", 1,}, clear="daily" }, 
   {id={"id_online_time_count", 2,}, clear="daily" }, 
   {id={"id_task_limit", 3,}, clear="daily" }, -- 按十进制位存储任务完成数，最大不能超过9次。序号从右至左。
}
t_isolate_user_batch_watch_list = {
	{"event_player_tick_minute",{1},    handle_count_time,{ }},
}

function on_init()
	local t = {0, 15, 30, 45}
	for h = 8,23 do
		for j = 1, getn(t) do
			local m = t[j]
			local hm = h*100+m
			if hm >= 800 and hm <= 2300 then
				tinsert(t_isolate_user_batch_watch_list, {"event_server_time", {h, m},handle_refresh,{}})
			end
		end
	end
end

function on_add_watches() 
	isolate_watch_npc_talk("Nh蕋 Ph萴 Ng� Tr�", 100, "handle_on_npc_talk_ypyc")
	isolate_watch_npc_talk("Nh蕋 Ph萴 Ng� Tr�", 200, "handle_on_npc_talk_ypyc")
	isolate_watch_npc_talk("Nh蕋 Ph萴 Ng� Tr�", 300, "handle_on_npc_talk_ypyc")
	isolate_watch_item_talk(2,1,30982, "handle_on_use_ticket")  --普通美食抽奖卷
	isolate_watch_item_talk(2,1,30983, "handle_on_use_ticket")	--极品美食抽奖券
	isolate_watch_item_talk(2,1,31016, "handle_on_use_ticket")	--美食庆典礼包
	
	isolate_watch_event("event_player_death", "handle_player_death", 301)
	isolate_watch_event("event_player_death", "handle_player_death", 304)
	isolate_watch_event("event_player_death", "handle_player_death", 308)
end


function handle_on_npc_talk_ypyc(  )
	local Str_Main = format("<color=gold>Nh蕋 Ph萴 Ng� Tr�<color>: Nh籱 ch祇 m鮪g n╩ m韎, ho祅g thng h� chi誹 ch� m� L� H閕 耺 Th鵦, ta s� gi髉 c竎 v� i hi謕 l祄 ra c竎 m鉵 ngon.")
	Str_Main = format("%s\nЧi hi謕 t chuy觧 sinh %d c蕄 %d c� th� tham gia.", Str_Main, t_level[1], t_level[2])
	local tbSay = {}
	tinsert(tbSay,"Gi秈 th輈h ho箃 ng/show_detail")
	tinsert(tbSay,"L祄 m鉵 ngon/do_tast_food_activity")
	tinsert(tbSay,"Nhi謒 v� t輈h l騳 online h籲g ng祔/do_online_time_activity")
	tinsert(tbSay,"Kh玭g c� g�/nothing")
	Say(Str_Main,getn(tbSay),tbSay)
end

function show_detail(  )
	-- body
	local Str_Main = format("<color=gold>Nh蕋 Ph萴 Ng� Tr�<color>: Nh籱 ch祇 m鮪g n╩ m韎, ho祅g thng h� chi誹 ch� m� L� H閕 耺 Th鵦, do Nh蕋 Ph萴 Ng� Tr� l祄 c竎 m鉵 ngon  ti誴 i b� t竛h thi猲 h�. C竎 i hi謕 ch� c莕 thu th藀 nguy猲 li謚 tng 鴑g  giao cho Nh蕋 Ph萴 Ng� Tr�, s� c� th� thng th鴆 m鉵 ngon v� nh薾 ph莕 thng t鑤. T蕋 nhi猲 trong l� h閕 n祔 nh蕋 nh s� c� nh鱪g k� x蕌 mu鑞 cp 畂箃 m鉵 ngon c馻 ngi kh竎. V祇 th阨 甶觤 nh蕋 nh s� c� m閠 s� k� cp xu蕋 hi謓 � xung quanh th祅h ch輓h, n誹 c竎 i hi謕 t譵 th蕐 v� nh b筰 ch髇g s� nh薾 頲 ph莕 thng t鑤. уng th阨, c竎 i hi謕 c騨g c� th� t輈h l騳 th阨 gian online  nh薾 頲 ph莕 thng phong ph�.")
	local tbSay = {}
	tinsert(tbSay,"tr� l筰/handle_on_npc_talk_ypyc")
	Say(Str_Main,getn(tbSay),tbSay)
end

function on_event_player_login(nExchangeComing) 
	Msg2Player("Nh籱 ch祇 m鮪g n╩ m韎, ho祅g thng h� chi誹 ch� m� L� H閕 耺 Th鵦, do Nh蕋 Ph萴 Ng� Tr� l祄 c竎 m鉵 ngon  ti誴 i b� t竛h thi猲 h�. Ngi ch琲 c� th� n Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗ g苝 Nh蕋 Ph萴 Ng� Tr�  t譵 hi觰 chi ti誸 ho箃 ng.")
end

function on_event_server_start()
	local npcypyc_idx1 = CreateNpc("hd_1y_ypyc","Nh蕋 Ph萴 Ng� Tr�",200,1366,2866)--汴京（170,179）	
	local npcypyc_idx2 = CreateNpc("hd_1y_ypyc","Nh蕋 Ph萴 Ng� Tr�",300,1724,3525)--成都（215,220）	
	local npcypyc_idx3 = CreateNpc("hd_1y_ypyc","Nh蕋 Ph萴 Ng� Tr�",100,1416,2973)--泉州（177,185）	
end
-- function handle_refresh(  )
-- 	-- body
-- end



--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end

--function on_new_day(nToday) end

-- function on_event_player_login(nExchangeComing) 
-- end
-- function do_clear_task(  )
-- 	-- body
-- 	-- todo clear all task id
-- end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end




