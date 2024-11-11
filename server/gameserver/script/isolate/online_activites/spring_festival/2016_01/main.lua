--
-- Author: Zheng Jinke
-- Date: 2015-12-17 10:28:35
--
--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")			-- ����ַ�����
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_meishipingjian.lua")	-- ��ʳƷ���Ṧ��
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\award.lua")					-- ��������
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_online.lua")			-- ���߼�ʱ����
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_meishiqiyu.lua")			-- ���߼�ʱ����
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\npc\\npc_material.lua")


t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "meishiqingdian",
    szViewName 			= "L� H�i �m Th�c",
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


--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
   {id={"id_online_time_round", 1,}, clear="daily" }, 
   {id={"id_online_time_count", 2,}, clear="daily" }, 
   {id={"id_task_limit", 3,}, clear="daily" }, -- ��ʮ����λ�洢���������������ܳ���9�Ρ���Ŵ�������
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
	isolate_watch_npc_talk("Nh�t Ph�m Ng� Tr�", 100, "handle_on_npc_talk_ypyc")
	isolate_watch_npc_talk("Nh�t Ph�m Ng� Tr�", 200, "handle_on_npc_talk_ypyc")
	isolate_watch_npc_talk("Nh�t Ph�m Ng� Tr�", 300, "handle_on_npc_talk_ypyc")
	isolate_watch_item_talk(2,1,30982, "handle_on_use_ticket")  --��ͨ��ʳ�齱��
	isolate_watch_item_talk(2,1,30983, "handle_on_use_ticket")	--��Ʒ��ʳ�齱ȯ
	isolate_watch_item_talk(2,1,31016, "handle_on_use_ticket")	--��ʳ������
	
	isolate_watch_event("event_player_death", "handle_player_death", 301)
	isolate_watch_event("event_player_death", "handle_player_death", 304)
	isolate_watch_event("event_player_death", "handle_player_death", 308)
end


function handle_on_npc_talk_ypyc(  )
	local Str_Main = format("<color=gold>Nh�t Ph�m Ng� Tr�<color>: Nh�m ch�o m�ng n�m m�i, ho�ng th��ng h� chi�u ch� m� L� H�i �m Th�c, ta s� gi�p c�c v� ��i hi�p l�m ra c�c m�n ngon.")
	Str_Main = format("%s\n��i hi�p ��t chuy�n sinh %d c�p %d c� th� tham gia.", Str_Main, t_level[1], t_level[2])
	local tbSay = {}
	tinsert(tbSay,"Gi�i th�ch ho�t ��ng/show_detail")
	tinsert(tbSay,"L�m m�n ngon/do_tast_food_activity")
	tinsert(tbSay,"Nhi�m v� t�ch l�y online h�ng ng�y/do_online_time_activity")
	tinsert(tbSay,"Kh�ng c� g�/nothing")
	Say(Str_Main,getn(tbSay),tbSay)
end

function show_detail(  )
	-- body
	local Str_Main = format("<color=gold>Nh�t Ph�m Ng� Tr�<color>: Nh�m ch�o m�ng n�m m�i, ho�ng th��ng h� chi�u ch� m� L� H�i �m Th�c, do Nh�t Ph�m Ng� Tr� l�m c�c m�n ngon �� ti�p ��i b� t�nh thi�n h�. C�c ��i hi�p ch� c�n thu th�p nguy�n li�u t��ng �ng �� giao cho Nh�t Ph�m Ng� Tr�, s� c� th� th��ng th�c m�n ngon v� nh�n ph�n th��ng t�t. T�t nhi�n trong l� h�i n�y nh�t ��nh s� c� nh�ng k� x�u mu�n c��p �o�t m�n ngon c�a ng��i kh�c. V�o th�i �i�m nh�t ��nh s� c� m�t s� k� c��p xu�t hi�n � xung quanh th�nh ch�nh, n�u c�c ��i hi�p t�m th�y v� ��nh b�i ch�ng s� nh�n ���c ph�n th��ng t�t. ��ng th�i, c�c ��i hi�p c�ng c� th� t�ch l�y th�i gian online �� nh�n ���c ph�n th��ng phong ph�.")
	local tbSay = {}
	tinsert(tbSay,"tr� l�i/handle_on_npc_talk_ypyc")
	Say(Str_Main,getn(tbSay),tbSay)
end

function on_event_player_login(nExchangeComing) 
	Msg2Player("Nh�m ch�o m�ng n�m m�i, ho�ng th��ng h� chi�u ch� m� L� H�i �m Th�c, do Nh�t Ph�m Ng� Tr� l�m c�c m�n ngon �� ti�p ��i b� t�nh thi�n h�. Ng��i ch�i c� th� ��n Bi�n Kinh, Th�nh ��, Tuy�n Ch�u g�p Nh�t Ph�m Ng� Tr� �� t�m hi�u chi ti�t ho�t ��ng.")
end

function on_event_server_start()
	local npcypyc_idx1 = CreateNpc("hd_1y_ypyc","Nh�t Ph�m Ng� Tr�",200,1366,2866)--�꾩��170,179��	
	local npcypyc_idx2 = CreateNpc("hd_1y_ypyc","Nh�t Ph�m Ng� Tr�",300,1724,3525)--�ɶ���215,220��	
	local npcypyc_idx3 = CreateNpc("hd_1y_ypyc","Nh�t Ph�m Ng� Tr�",100,1416,2973)--Ȫ�ݣ�177,185��	
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




