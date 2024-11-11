--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\every_month\\handler.lua")
Include("\\script\\isolate\\online_activites\\every_month\\sub.lua")--ɱ���ӻ,ע�͵����У��ӻ�Ϳ��Բ�������

t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "evenyMonthMain",
    szViewName 			= "Event Tu�i H�c Tr�",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20200701,
    nEndDate 			= 20200731,
    nTaskGroup 			= 1,
    nTaskGroupVersion	= 34,
}

t_isolate_task_list = {--�õ��������������������
	--main
	{ id={"task_use_item1_count", 1} },
	{ id={"task_use_item2_count", 2} },
	{ id={"task_use_item3_count", 3} },
	{ id={"task_get_final_award", 4}, bit_award1=1, bit_award2=2, bit_award3=3, },
	--sub 6~10
}

--��ҪWatch���¼��б����Զ�ע����Щ�¼��������¼��ص�������pfn_elem_handler(tEvent, data, para)
t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
	{"event_mission_task_award", {"wanjianzhong", "", -1}, 			handle_add_material,	{1, 200}  }, 	--��ڣ���� 200 ����1
	{TeamEvent("event_mission_box_award"), {"wanjianzhong", "gold"}, 		handle_add_material,	{1, 50}  }, 	--��ڣ���� 100 ����1
	{"event_mission_box_award", {"wanjianzhong", "silver"},		handle_add_material,	{1, 100}  }, 	--��ڣ������ 50 ����1
	{TeamEvent("event_mission_box_award"), {"wanjianzhong", "copper"}, 	handle_add_material,	{1, 20}  },		--��ڣͭ���� 20 ����1
	{"event_mission_task_award", {"dixuangong", "", -1}, 			handle_add_material,	{1, 200}  }, 	--���������� 200 ����1
	{TeamEvent("event_mission_box_award"), {"dixuangong", "gold"}, 		handle_add_material,	{1, 50}  }, 	--���������� 100 ����1
	{"event_mission_box_award", {"dixuangong", "silver"}, 		handle_add_material,	{1, 100}  }, 	--������������ 50 ����1
	{TeamEvent("event_mission_box_award"), {"dixuangong", "copper"}, 		handle_add_material,	{1, 20}  },		--������ͭ���� 20 ����1
	{"event_task_award", 		{"contributecountry", -1}, 		handle_add_material,	{1, 200}  },	--�ι�ƽ���� 200 ����1
	{"event_mission_task_award",{"planttree", "smalltreeprize", -1},handle_add_material,	{1, 75}  },		--��С������ 25����1
	{"event_mission_task_award",{"planttree", "plantseedtree", -1},	handle_add_material,	{1, 75}  },		--�������� 50����1
--	{"event_mission_task_award",{"planttree", "bigtreeprize", -1},	handle_add_material,	{1, 100}  },	--�ִ������ 100����1
	{"event_mission_task_award",{"planttree", "plant4lingtree", -1},handle_add_material,	{1, 100}  },	--�������� 100����1
	{"event_mission_task_award",{"liangshan", "", -1}, 				handle_add_material,	{2, 200}  }, 	--��ɽ���� 200 ����2
	{TeamEvent("event_mission_box_award"), {"liangshan", "gold"}, 			handle_add_material,	{2, 50}  }, 	---��ɽ���� 100 ����2
	{"event_mission_box_award", {"liangshan", "silver"},		handle_add_material,	{2, 100}  }, 	---��ɽ������ 50 ����2
	{TeamEvent("event_mission_box_award"), {"liangshan", "copper"}, 		handle_add_material,	{2, 20}  },		---��ɽͭ���� 20 ����2
	{"event_mission_stage_finish", {"taixu", -1}, 				handle_add_material,	{2, 50}  },		---���1��̫��þ� 10 ����2
--	{"event_mission_task_award",{"taiyi", "", -1}, 					handle_add_material,	{2, 200}  }, 	--��̫ͨһ���� 200 ����2
	{TeamEvent("event_mission_box_award"), {"taiyi", "gold"}, 				handle_add_material,	{2, 50}  }, 	---��̫ͨһ���� 100 ����2
	{"event_mission_box_award", {"taiyi", "silver"},			handle_add_material,	{2, 100}  }, 	---��̫ͨһ������ 50 ����2
	{TeamEvent("event_mission_box_award"), {"taiyi", "copper"}, 			handle_add_material,	{2, 20}  },		---��̫ͨһͭ���� 20 ����2
	{"event_mission_award", {"newbattle", 0, -1, -1},  			handle_add_material,	{2, 20}  },		---ս���콱-��ʹ�þ��� 20 ����2
	{"event_mission_award", {"newbattle", 1, -1, -1}, 			handle_add_material,	{2, 50}  },		---ս���콱-ʹ�þ����� 50 ����2
	{"event_mission_award", {"newbattle", 2, -1, -1}, 			handle_add_material,	{2, 100}  },	---ս���콱-ʹ�ô������ 100 ����2
	{"event_mission_award", {"newbattle", 3, -1, -1}, 			handle_add_material,	{2, 250}  },	---ս���콱-ʹ�þ����Ի� 250 ����2
	{"event_mission_award", {"newbattle", 4, -1, -1}, 			handle_add_material,	{2, 500}  },	---ս���콱-VIP 500 ����2
	{TeamEvent("event_mission_box_award"), {"taiyihero", "gold"}, 			handle_add_material,	{3, 50}  }, 	---Ӣ��̫һ���� 100 ����3
	{"event_mission_box_award", {"taiyihero", "silver"},		handle_add_material,	{3, 50}  }, 	---Ӣ��̫һ������ 100 ����3
	--{TeamEvent("event_mission_box_award"), {"siling", "gold"}, 			handle_add_material,	{3, 50}  }, 	---������������ 100 ����3
	--{"event_mission_box_award", {"siling", "silver"},			handle_add_material,	{3, 50}  }, 	---�������������� 100 ����3
	{"event_mission_box_award", {"worldboss", "gold"}, 			handle_add_material,	{3, 100}  }, 	---����BOSS���� 100 ����3
	{"event_mission_box_award", {"worldboss", "small"},			handle_add_material,	{3, 100}  }, 	---����BOSS���� 100 ����3
	{"event_mission_task_award",{"planttree", "plant4lingtree", 16},handle_add_material,	{3, 100}  },	--�ֵ�16�������� 50����3
	{"event_mission_task_award",{"planttree", "plantbigtree", -1},handle_add_material,	{3, 30}  },	--	�ɹ������������ֻ��10 ����3
	{"event_mission_stage_finish", {"liangshan", 8}, 			handle_add_material,	{3, 100}  },	---��ɽͨ�����һ�� 100 ����3
	{"event_mission_stage_finish", {"wanjianzhong", 4}, 		handle_add_material,	{3, 50}  },	---��ڣͨ�����һ�� 100 ����3
	{"event_mission_stage_finish", {"dixuangong", 7}, 			handle_add_material,	{3, 100}  },	---������ͨ�����һ�� 100 ����3
	{"event_mission_stage_finish", {"taixu", 8}, 				handle_add_material,	{3, 100}  },	---̫������ͨ�����һ�� 100 ����3
	{"event_mission_stage_finish", {"taiyi", 6}, 				handle_add_material,	{3, 100}  },	---̫һ��ͨ�����һ�� 100 ����3
	{"event_mission_stage_finish", {"taiyihero", 6}, 			handle_add_material,	{3, 100}  },	---Ӣ��̫һ��ͨ�����һ�� 200 ����3
}

--�ӻ��һЩ��������
function call_if_exists(fn, ...)
	if fn then
		return fn(unpack(arg))
	end
end

function on_init()
	call_if_exists(on_sub_init)
end
function on_new_day(nToday)
	call_if_exists(on_sub_new_day, nToday)
end
function on_event_player_login(nExchangeComing)
	call_if_exists(sub_on_event_player_login, nExchangeComing)
end

--ģ�����ʱ�ĳ�ʼ������
function on_add_watches()
	isolate_watch_item_talk(2, 1, 30045, "handle_on_item_talk_jingnangdashijian")--���Ҵ��¼��Ի�
	local _Products = tConfig.tProducts
	for i = 1,getn(_Products) do
		isolate_watch_item_talk(_Products[i][2][1], _Products[i][2][2], _Products[i][2][3], format("handle_on_prduct%d_talk",i))
	end
	call_if_exists(on_sub_add_watches)
end

--��һ�����ߣ�ɾ�����п����Ѿ����ڵľɻ����
function on_first_login_clear()
	local t = {
		tMainActivityMaterials,
		tMainActivityProducts,
	}
	for i,v in t do
		for j,v2 in v do
			local g,d,p = unpack(v2[2])
			local n = BigGetItemCount(g,d,p)
        	if n > 0 then
        		BigDelItem(g,d,p,n)
        	end
		end
	end
end
