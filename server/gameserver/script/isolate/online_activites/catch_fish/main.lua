--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\isolate\\online_activites\\catch_fish\\head.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "catchFish",
    szViewName 			= "Th��ng Nh�n H�i S�n",
    nTalkBeginDate		= 0,
    nBeginDate 			= g_tCatchFish.nStartDate,
    nEndDate 			= g_tCatchFish.nEndDate,
    nTaskGroup 			= 3,
    nTaskGroupVersion	= 30,
}

--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
    {id={"goldbuy", 4,}, clear="daily" }, --�����̵�ÿ�նһ�����
    {id={"freeAward", 5,}, clear="daily" }, --�����С����
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
	--isolate_watch_event("event_kill_npc", "__on_kill_npc", "����ˮ��", 103)   --�ڶ�������һɱ��
	--isolate_watch_event("event_kill_npc", "__on_kill_npc", "����ˮ��ʿ��", 103)   --�ڶ�������һɱ��
end
--function on_new_day(nToday) end

--function __on_kill_npc(data, para)
--	if random(1,100) <=10 then
--		AddItem(2,1,30816,1)
--	end
--end

function on_event_server_start()
	createNpcList({
		{"Ch� c�m �� T�y Nam", "Th��ng Nh�n H�i S�n", 100, 1517, 2875, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_seller.lua"},
		{"Ng� d�n", "Ng� Ph�", 103, 1817, 3350, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_fisher.lua"},
		{"Ti�u Hi�u Ph�o ��i", "Ng� D�n Th� Ph�o", 103, 1804, 3441, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti�u Hi�u Ph�o ��i", "Ng� D�n Th� Ph�o", 103, 1814, 3463, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti�u Hi�u Ph�o ��i", "Ng� D�n Th� Ph�o", 103, 1830, 3492, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti�u Hi�u Ph�o ��i", "Ng� D�n Th� Ph�o", 103, 1857, 3480, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti�u Hi�u Ph�o ��i", "Ng� D�n Th� Ph�o", 103, 1866, 3447, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
		{"Ti�u Hi�u Ph�o ��i", "Ng� D�n Th� Ph�o", 103, 1873, 3415, "\\script\\isolate\\online_activites\\catch_fish\\npc\\npc_bomb.lua"},
	});
	apply_server_counter()--���·�����������
end
function on_event_player_login(nExchangeComing)
	if gf_GetTransLevel() >= 890 then
		if get_task("freeAward") == 0 then
    		if 1 ~= gf_JudgeRoomWeight(1, 1, isolate_view_name()) then
    			return 0;
    		end
    		set_task("freeAward", 1)
    		AddItem(2, 1, 31204, 30, 4)--��Ѹ�30��С����
    		Msg2Player(format("B�n �� nh�n ���c %d %s t� ho�t ��ng %s", 30, "Ph�o Nh�", isolate_view_name()))
    	end
	end

end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate���ߺ��һ�ε�¼ʱ������



