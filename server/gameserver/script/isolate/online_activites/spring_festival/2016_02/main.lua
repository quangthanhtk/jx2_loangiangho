--
-- Author: Zheng Jinke
-- Date: 2015-12-28 10:28:35
--
--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_cailu.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_caishen.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_lishi.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_jubao.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- ����ַ�����
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_introduce.lua")


t_isolate_base_cfg = { --����һ������������
    nPriority 				= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 				= "xinchunhuodong",
    szViewName 				= "Ho�t ��ng T�n Xu�n",
    nTalkBeginDate			= 0,
    nBeginDate 				= 20160328,
    nEndDate 				= 0,
    nTaskGroup 				= 5,
    nTaskGroupVersion		= 17,
}


tb_npc_jbp =  -- �۱���NPC���ñ�
{
	-- {1 npcidx,2 pos1,3 pos2,4 pos3,5 playername,6 state ,7 starttime,8 endtime , 9 place}
}
BOX_NPC_TABLE={-- ��������һ��������isolate�еļ�¼��������Ϣ�ı�
	idx = {},  -- ��������npc id
	trueid = 1,-- ������¼��ʵ�������ţ�����npcid�����ڸñ��е�������
}    


function _refresh_box(tEvent, data, para)
	handle_refresh_box(tEvent, data, para)
end
function handle_count_time( tEvent, data, para )
	check_jbp_state()
end


--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
   {id={"id_get_lishi", 1,} },                           -- �Ƿ���ȡ�������� 1 ��ʾ��ȡ
   {id={"id_caiji_count", 2,}, clear="daily" }, 		 --	���ղɼ��˶�����֦
   {id={"id_caiji_cd", 3,}, clear="daily" }, 			 -- �ɼ���ȴʱ�� ��
   {id={"id_putcoin_cnt", 4,}, clear="daily" }, 		 -- ����Ͷ�뼪���ҵ�����
   {id={"id_get_jbp_award_cd", 5,}, clear="daily" }, 	 -- �����ȡ�۱��轱����cd
   {id={"id_get_jbp_award_cnt", 6,}, clear="daily" }, 	 -- �����ȡ�۱��轱���Ĵ��� ����100
}


t_isolate_user_batch_watch_list = { 
	{"event_server_tick_minute",{1},    handle_count_time,{ }},
--	{"event_server_time", {12, 30}, _refresh_box,{ }  },
--	{"event_server_time", {16, 30}, _refresh_box,{ }  },
--	{"event_server_time", {20, 30}, _refresh_box,{ }  },
}

function on_add_watches() 
--	isolate_watch_npc_talk("���ʹ", 100, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("���ʹ", 200, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("���ʹ", 300, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("���ʹ", 350, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("��������", 100, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("��������", 200, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("��������", 300, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("��������", 350, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("����ү�ı���", 100, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("����ү�ı���", 200, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("����ү�ı���", 300, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("����ү�ı���", 350, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("�۱���", 100, "handle_on_npc_talk_jbp")
--	isolate_watch_npc_talk("�۱���", 200, "handle_on_npc_talk_jbp")
	isolate_watch_npc_talk("T� B�o B�n", 200, "handle_on_npc_talk_jbp")
--	isolate_watch_npc_talk("�۱���", 350, "handle_on_npc_talk_jbp")

--	isolate_watch_item_talk(2,1,31005, "handle_use_jixiangtaozhi")   --�ü�����֦
--	isolate_watch_item_talk(2,1,31006, "handle_use_xinnianlishi")    --����������
--	isolate_watch_item_talk(2,1,31008, "handle_use_ptwaizhuang")	 --��ͨ��װ���
--	isolate_watch_item_talk(2,1,31009, "handle_use_hhwaizhuang")	 --������װ���
--	isolate_watch_item_talk(2,1,31010, "handle_use_coin_clip")	 	 --�����Ƭ
--	isolate_watch_item_talk(2,1,31011, "handle_use_taozhilihe")	 	 --��֦�Ҽ����

end


function on_event_server_start()
	--refresh_taoshu()
	for i=1,getn(tb_jbp_refresh) do
		local pos = tb_jbp_refresh[i];
		local npcidx = CreateNpc("aoyunshenghuotai","T� B�o B�n",pos[1],pos[2],pos[3])
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




