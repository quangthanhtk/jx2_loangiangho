--
-- Author: Zheng Jinke
-- Date: 2015-12-28 10:28:35
--
--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_cailu.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_caishen.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_lishi.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_jubao.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- 活动的字符串表
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_introduce.lua")


t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 				= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 				= "xinchunhuodong",
    szViewName 				= "Ho箃 чng T﹏ Xu﹏",
    nTalkBeginDate			= 0,
    nBeginDate 				= 20160328,
    nEndDate 				= 0,
    nTaskGroup 				= 5,
    nTaskGroupVersion		= 17,
}


tb_npc_jbp =  -- 聚宝盆NPC配置表
{
	-- {1 npcidx,2 pos1,3 pos2,4 pos3,5 playername,6 state ,7 starttime,8 endtime , 9 place}
}
BOX_NPC_TABLE={-- 用来定义一个保存在isolate中的记录财神宝箱信息的表
	idx = {},  -- 用来保存npc id
	trueid = 1,-- 用来记录真实宝箱的序号（不是npcid而是在该表中的索引）
}    


function _refresh_box(tEvent, data, para)
	handle_refresh_box(tEvent, data, para)
end
function handle_count_time( tEvent, data, para )
	check_jbp_state()
end


--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
   {id={"id_get_lishi", 1,} },                           -- 是否领取新年利是 1 表示领取
   {id={"id_caiji_count", 2,}, clear="daily" }, 		 --	当日采集了多少桃枝
   {id={"id_caiji_cd", 3,}, clear="daily" }, 			 -- 采集冷却时间 秒
   {id={"id_putcoin_cnt", 4,}, clear="daily" }, 		 -- 当日投入吉祥金币的数量
   {id={"id_get_jbp_award_cd", 5,}, clear="daily" }, 	 -- 玩家领取聚宝盆奖励的cd
   {id={"id_get_jbp_award_cnt", 6,}, clear="daily" }, 	 -- 玩家领取聚宝盆奖励的次数 上限100
}


t_isolate_user_batch_watch_list = { 
	{"event_server_tick_minute",{1},    handle_count_time,{ }},
--	{"event_server_time", {12, 30}, _refresh_box,{ }  },
--	{"event_server_time", {16, 30}, _refresh_box,{ }  },
--	{"event_server_time", {20, 30}, _refresh_box,{ }  },
}

function on_add_watches() 
--	isolate_watch_npc_talk("活动大使", 100, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("活动大使", 200, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("活动大使", 300, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("活动大使", 350, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("吉祥桃树", 100, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("吉祥桃树", 200, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("吉祥桃树", 300, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("吉祥桃树", 350, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("财神爷的宝箱", 100, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("财神爷的宝箱", 200, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("财神爷的宝箱", 300, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("财神爷的宝箱", 350, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("聚宝盆", 100, "handle_on_npc_talk_jbp")
--	isolate_watch_npc_talk("聚宝盆", 200, "handle_on_npc_talk_jbp")
	isolate_watch_npc_talk("T� B秓 B錸", 200, "handle_on_npc_talk_jbp")
--	isolate_watch_npc_talk("聚宝盆", 350, "handle_on_npc_talk_jbp")

--	isolate_watch_item_talk(2,1,31005, "handle_use_jixiangtaozhi")   --用吉祥桃枝
--	isolate_watch_item_talk(2,1,31006, "handle_use_xinnianlishi")    --用新年利是
--	isolate_watch_item_talk(2,1,31008, "handle_use_ptwaizhuang")	 --普通外装礼包
--	isolate_watch_item_talk(2,1,31009, "handle_use_hhwaizhuang")	 --豪华外装礼包
--	isolate_watch_item_talk(2,1,31010, "handle_use_coin_clip")	 	 --金币碎片
--	isolate_watch_item_talk(2,1,31011, "handle_use_taozhilihe")	 	 --桃枝挂件礼盒

end


function on_event_server_start()
	--refresh_taoshu()
	for i=1,getn(tb_jbp_refresh) do
		local pos = tb_jbp_refresh[i];
		local npcidx = CreateNpc("aoyunshenghuotai","T� B秓 B錸",pos[1],pos[2],pos[3])
		SetNpcTempData(npcidx,1,i)
		tb_npc_jbp[i]={npcidx,pos[1],pos[2],pos[3],nil,0,0,0,pos[4]}
--		print(npcidx,"jbp")
	end
end


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




