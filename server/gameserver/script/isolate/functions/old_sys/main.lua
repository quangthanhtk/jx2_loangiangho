--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

--WatchEvent(szEventId, isolate_main_script(), szFunc, ...) ������Ӹ�����¼�������

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\system_switch_config.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 		= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 		= "oldSys",
    szViewName 		= "",
    nTalkBeginDate 	= 0,
    nBeginDate 		=0,
    nEndDate 		= 0,
}

--ģ�����ʱ�ĳ�ʼ������
function on_add_watches()
	WatchEvent("event_server_start", "\\script\\function\\ornament\\npc_fenghuashizhe.lua", "on_server_start")
	WatchEvent("event_server_start", "\\script\\global\\autoexec.lua", "handle_event")
	WatchEvent("event_player_login", "\\script\\global\\playerloginin.lua", "handle_event")
	WatchEvent("event_player_logout", "\\script\\global\\playerlogout.lua", "handle_event")
	WatchEvent("event_player_start_offline_live", "\\script\\global\\offlinelive.lua", "handle_event")
	WatchEvent("event_player_death", "\\script\\global\\player_death_punish.lua", "handle_event", -1)
	
	WatchEvent("event_server_start", "\\script\\task\\huofengtask\\server_start.lua", "on_server_start")
	WatchEvent("event_player_login", "\\script\\gongcheng\\npc\\conf_res_protect.lua", "on_player_login")
	WatchEvent("event_daily_clear", "\\settings\\static_script\\item\\item_fushengdan_impl.lua", "on_daily_clear")
	WatchEvent("event_server_start", "\\script\\missions\\yp\\vn\\server_start.lua", "on_server_start")
	WatchEvent("event_player_login", "\\script\\missions\\yp\\vn\\player_login.lua", "on_player_login")
	WatchEvent("event_player_logout", "\\script\\missions\\yp\\vn\\player_login.lua", "on_player_logout")
	WatchEvent("event_weekly_clear", "\\script\\equip_shop\\equip_shop.lua", "on_weekly_clear")
	WatchEvent("event_player_taskvalue_recycle", "\\script\\item\\skill_app_box.lua", "on_task_recycle", 3346, -1, -1)
	
	--�¿������콾�����
	WatchEvent("event_ib_cost", "\\script\\function\\vip_card\\mission_task.lua", "_handler_event_cost_ib", PackItemId(2, 97, 236))
end

function pet_bug_fix_2019()
	local nPetCount,tbPetList = GetPetList()
	for i = 1, getn(tbPetList) do
		local nPetIndex = tbPetList[i]["nIndex"]
		local tPetSkills = GetPetSkillByIndex(nPetIndex)
		for k, v in tPetSkills do
			local nOldSkillIdx = v["nSkillIdx"]
			local nOldSkillID = v["nSkillID"]
			local nOldSkillLv = v["nSkillLevel"]
			if nOldSkillLv == 2 then
				-- 30180(��ԭʼ��ŭ)��30178(�������)�����2����˵���Ǵ����
				-- Ĭ����Ҫ�滻�ļ�������������һ���ģ���˲���Ҫ�������ʲ��������
				if nOldSkillID == 30180 then
					SetPetSkillByIndex(nPetIndex, nOldSkillIdx, 30221, 2)
				end
				if nOldSkillID == 30178 then
					SetPetSkillByIndex(nPetIndex, nOldSkillIdx, 30222, 2)
				end
			end
		end
	end
end

function on_event_player_login(nExchangeComing)
	if GetTask(3590) <= 0 then
		RefreshWorkingPet()
		SetTask(3590, 1)
	end
	if GetTask(3590) <= 1 then
		pet_bug_fix_2019()
		SetTask(3590, 2)
	end

	if GetPop(6) < 0 then
		OpenPop(6)
	end
	if IsExpSvrSystemOpen() == 1 then
    	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then --���ָ��
    		AddItem(2,1,30644,1)
    	end
	end
end

function on_enter_ggs_prepare_square()
	local _,atggs = GetRealmType()
	if atggs == 1 then
		ForbidChangePK(1);  -- ���ڿ��׼�����ؽ���PK
	end
end

function on_leave_ggs_prepare_square()
	local _,atggs = GetRealmType()
	if atggs == 1 then
		ForbidChangePK(0); 
	end
end

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
    {id={"id_jdyy_mission_join_cnt", 3465, 0}, clear="daily" }, 
    {id={"id_daily_pulish_jungong_limit", 771, 0}, clear="daily" }, 
}

t_isolate_user_batch_watch_list = {
	{"event_player_enter_map",{8899},on_enter_ggs_prepare_square,{ }},
	{"event_player_leave_map",{8899},on_leave_ggs_prepare_square,{ }},
}

--function on_server_start() end
--function on_player_logout() end
--function on_daily_clear(nLastDate,nCurDate) end
--function on_weekly_clear(nLastWeek,nCurWeek) end
--function on_monthly_clear(nLastMonth,nCurMonth) end

