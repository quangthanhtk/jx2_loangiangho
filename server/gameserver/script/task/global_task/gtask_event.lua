Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 		= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 		= "gtask",
    szViewName 		= "",
    nTalkBeginDate 	= 0,
    nBeginDate 		=0,
    nEndDate 		= 0,
}

function handle_task_event(tEvent, data, para)
	local t = tEvent[4]
	if t.category then
		if tEvent[1] == "event_mission_task_award" and data[3] > 0 then
			t.category = data[3] --�¼����صĵ�����������Type
		end
	end
	return GtaskOnEvent(t)
end

t_isolate_user_batch_watch_list = {--{szEventId, {para...}, pfn_elem_handler(tEvent, data, para), ...}
	{"event_mission_task_award", {"pvp", "shengwu", -1}, 		handle_task_event,	{name="Thu th�p Ng� H�nh T�m H�n ��n", category=random(5)}  },
	{"event_mission_task_award", {"pvp", "toujingshu", -1},	 	handle_task_event,	{name="Thu th�p N�i C�ng T�m Kinh", category=-1}  },
	{"event_mission_task_award", {"pvp", "yunbiao", -1}, 		handle_task_event,	{name="T�ng qu�"}  },
	{"event_mission_task_award", {"pvp", "shangjin", -1}, 		handle_task_event,	{name="Thi�n �m L�nh B�i", category=-1}  },
	{"event_mission_task_award", {"pvp", "yupo", -1}, 			handle_task_event,	{name="Thu th�p Ti�n Ng�c Linh Ho�n", category=-1}  },
	{"event_mission_task_award", {"pvp", "shiliwabao", -1}, 	handle_task_event,	{name="Thu th�p Kim Hoa", category=-1}  },
	{"event_mission_affairs",    {"newbattle", "killplayer", -1}, handle_task_event,{name="Th� luy�n"}  },
}


--------------------------------------------------------------
--��������ֵֹ������������¼�ϵͳ����
Include("\\script\\task\\global_task\\gtask_head.lua")

function _gtask_check(TaskID)
	if tGtTask:check_cur_task(TaskID) ~= 1 then
		return 0;
	end
	if tGtTask:check_task_isfinish(TaskID) ~= 0 then
		return 0;
	end
	return 1;
end

function _gtask_rand_item(data, TaskID, tList, limit)
	if _gtask_check(TaskID) ~= 1 then
		return 0;
	end
	local tAward = tList[data.category];
	local tItem = tAward[2];
	local nCount = GetItemCount(tItem[1], tItem[2], tItem[3]);
	local nMax = min(limit - nCount, tItem[4]);
	if random(100) < tAward[1] then
		gf_AddItemEx2({tItem[1], tItem[2], tItem[3], nMax, tItem[5] or 0}, tAward[3], "GTASK", "Nhi�m v�", 0, 1);
	end
end

function Reborn3PlantTree(data)
	local tList = {
		[1] = {25, {2, 1, 30849, 1, 4}, "Ti�n Ng�c Linh Ho�n"},
		[2] = {50, {2, 1, 30849, 1, 4}, "Ti�n Ng�c Linh Ho�n"},
		[3] = {75, {2, 1, 30849, 2, 4}, "Ti�n Ng�c Linh Ho�n"},
		[4] = {100, {2, 1, 30849, 3, 4}, "Ti�n Ng�c Linh Ho�n"},
	};
	_gtask_rand_item(data, 316, tList, 10);
end

function Reborn3Collect(data)
	local tList = {
		[1] = {25, {2, 1, 30850, 1, 4}, "Kim Hoa"},
		[2] = {50, {2, 1, 30850, 2, 4}, "Kim Hoa"},
		[3] = {100, {2, 1, 30850, 3, 4}, "Kim Hoa"},
	};
	_gtask_rand_item(data, 321, tList, 9);
end

function Reborn3Book(data)
	local tList = {
		[0] = {100, {2, 1, 30851, 3, 4}, "N�i C�ng T�m Kinh"},
		[1] = {50, {2, 1, 30851, 2, 4}, "N�i C�ng T�m Kinh"},
		[2] = {50, {2, 1, 30851, 2, 4}, "N�i C�ng T�m Kinh"},
		[3] = {50, {2, 1, 30851, 2, 4}, "N�i C�ng T�m Kinh"},
		[4] = {25, {2, 1, 30851, 1, 4}, "N�i C�ng T�m Kinh"},
		[5] = {25, {2, 1, 30851, 1, 4}, "N�i C�ng T�m Kinh"},
		[6] = {25, {2, 1, 30851, 1, 4}, "N�i C�ng T�m Kinh"},
	};
	_gtask_rand_item(data, 325, tList, 6);
end

function Reborn3Yunbiao(data)
	if _gtask_check(329) ~= 1 then
		return 0;
	end
	if GetTask(3353) >= 3 then
		return 0;
	end
	SetTask(3353, GetTask(3353) + 1);
end

function Reborn3KillAmry(data)
	if _gtask_check(334) ~= 1 then
		return 0;
	end
	if GetTask(3354) >= 100 then
		return 0;
	end
	SetTask(3354, GetTask(3354) + 1);
end

function Reborn3Xinhundan(data)
	if _gtask_check(333) ~= 1 then
		return 0;
	end
	local tList = {
		{2, 1, 30856, 1, 4},
		{2, 1, 30857, 1, 4},
		{2, 1, 30858, 1, 4},
		{2, 1, 30859, 1, 4},
		{2, 1, 30860, 1, 4},
	}
	if random(100) <= 50 then
		local tItem = tList[data.category];
		if GetItemCount(tItem[1], tItem[2], tItem[3]) <= 0 then
			gf_AddItemEx2(tItem, GetItemName(tItem[1], tItem[2], tItem[3]), "GTASK", "Nhi�m v�", 0, 1);
		end
	end
end

function Reborn3Lingpai(data)
	if _gtask_check(335) ~= 1 then
		return 0;
	end
	local tList = {
		[1] = {25, {2, 1, 30861, 2, 4}, "Thi�n �m L�nh B�i"},
		[2] = {50, {2, 1, 30861, 2, 4}, "Thi�n �m L�nh B�i"},
		[3] = {75, {2, 1, 30861, 2, 4}, "Thi�n �m L�nh B�i"},
		[4] = {100, {2, 1, 30861, 1, 4}, "Thi�n �m L�nh B�i"},
	};
	_gtask_rand_item(data, 335, tList, 10);
end

EventList = {
	--["����"] = "��Ӧ����"
	["Thu th�p Ti�n Ng�c Linh Ho�n"] = Reborn3PlantTree,
	["Thu th�p Kim Hoa"] = Reborn3Collect,
	["Thu th�p N�i C�ng T�m Kinh"] = Reborn3Book,
	["T�ng qu�"] = Reborn3Yunbiao,
	["Thu th�p Ng� H�nh T�m H�n ��n"] = Reborn3Xinhundan,
	["Thi�n �m L�nh B�i"] = Reborn3Lingpai,
	["Th� luy�n"] = Reborn3KillAmry,
}

--data format
--data = {
--	name = "",
--	category = 0,
--}

function GtaskOnEvent(data)
	EventList[data.name](data);
end

--how to trigger gtask events
--Include("\\script\\global\\events.lua")
--EventOnTrigger(7, {name="�ռ���������", category=1})
