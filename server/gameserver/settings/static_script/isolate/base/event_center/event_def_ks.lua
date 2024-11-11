--Include by \settings\static_script\isolate\event_center\event_impl.lua

--EventImpl:define_event(szEventId, szHelpInfo, nFilterKeyNum=0, data_convert_func=data_convert_func_no_convert, player_event_switch_type=PLAYER_EVENT_SWITCH_NONE)
--TeamEvent("event_mission_stage_finish")��ʾevent_mission_stage_finish����¼����Զ���Team���� ����ȥ��FireEventTeam�ӿ�


--define all events here
function EventImpl:define_all_events_ks()
	local NONE = self.player_event_switch_none
	local EVENT_LV = self.player_event_switch_event_level

	--system event
	self:define_event("event_server_start", "data={}")
	self:define_event("event_gdata_change", "data={szGdataName}", 1) --��vm��ȫ�ֽű������б��
	self:define_event("event_server_time", "data={nHour, nMin}", 2) --��ȡ��systemtimetask
	self:define_event("event_server_new_day", "data={nNewDate}", 1) --eg:20150831�����ڼ���һЩδ���ڹ��ܻ���һЩ���ڹ���ʧЧ
	self:define_event("event_server_new_week", "data={nNewWeek}", 1)--eg:201521 ��ʾ2015��21������1 0��
	self:define_event("event_server_new_month", "data={nNewMonth}", 1) --eg:201508
	self:define_event("event_server_new_year", "data={nNewYear}", 1) --eg:2015

	self:define_event("event_server_tick", "data={nTick}, para={nFreq}", 1)--������timer//201509dzj:һ����һ��Ƶ���Ը� Ŀǰû���õ���ʱ���Σ��Ժ��õ��ٴ�
	self:define_event("event_server_tick_minute", "data={nTick}, para={nFreq}", 1)--������timer
	self:define_event("event_server_tick_hour", "data={nTick}, para={nFreq}", 1)--������timer

	--self:define_event("event_npc_remove", "data={npcIndex}->{szName,nMap,nIndex}", 2, data_convert_func_npc)

	--player action event
	self:define_event("event_player_login", "data={bExchangeComing}")
	self:define_event("event_player_logout", "data={bExchangeServer}")
	self:define_event("event_daily_clear", "data={nCurDate, nLastDate}")
	self:define_event("event_weekly_clear", "data={nCurWeek, nLastWeek}")
	self:define_event("event_monthly_clear", "data={nCurMonth, nLastMonth}")
	self:define_event("event_player_new_day_check", "data={nNewDate, nPlayerDate}")--�����ˣ����һ���Ƿ���Ҫ����ʲô��

	--��Щ����Ƶ��player_event,����C++-Level player_event_switch
	--self:define_event("event_player_tick", "data={nTick}, para={nFreq}", 1, nil, EVENT_LV)--������timer//201509dzj:һ����һ��Ƶ���Ը� Ŀǰû���õ���ʱ���Σ��Ժ��õ��ٴ�
	self:define_event("event_player_taskvalue_change", "data={nTaskId, nOldVal, nNewVal}",3, nil, EVENT_LV)
	self:define_event("event_kill_npc", "data={npcIndex}->{szName,nMap,nIndex}", 2, data_convert_func_npc, EVENT_LV)
	--self:define_event("event_ib_buy", "data={g,d,p,n,cost}->{nItemPackId,n,cost}",1, data_convert_func_item_gdp, EVENT_LV)

	--	self:define_event("event_gain_item", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp, EVENT_LV)
	self:define_event("event_gain_item", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp)
	--{2,1,31239,1}, "���ǵ�"

	--	self:define_event("event_cost_item", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp, EVENT_LV)
	self:define_event("event_cost_item", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp)
	--{2,1,31170,n}, "������"
	--{2,1,30297,n}, "ʤ������"
	--{2,1,30154,n}, "Ů�ޱ���"
	--{2,1,30191,n}, "������"

	self:define_event("event_player_tick_minute", "data={nTick}, para={nFreq}", 1)--������timer
	self:define_event("event_player_tick_hour", "data={nTick}, para={nFreq}", 1)--������timer
	self:define_event("event_player_daily_online_minute", "data={nTick}, para={nFreq}", 1)--������timer

	self:define_event("event_player_start_offline_live", "data={nBaiju, nShennong, nZhenQi}") --��ʼ�����й�
	self:define_event("event_player_change_group_world", "data={nSourceSubWorldID, nTargetSubWorldID}", 2) --�������
	self:define_event("event_player_taskvalue_recycle", "data={nTaskId, nTaskNewVersion, nOldVersion}",3)

	self:define_event("event_npc_talk", "data={nIndex}->{szName,nMap,nIndex}",2, data_convert_func_npc)
	self:define_event("event_item_talk", "data={nItemIndex}->{nItemPackId,nItemIndex}",1,data_convert_func_item_index)
	self:define_event("event_ib_cost", "data={g,d,p,n}->{nItemPackId,n}",1, data_convert_func_item_gdp)

	self:define_event("event_player_enter_map", "data={mapid, bExchangeComing}",1)
	self:define_event("event_player_leave_map", "data={mapid, bLogout}",1)
	self:define_event("event_player_death", "data={nKillerIndex,DeathPunish, Enmity}->{mapid,nKillerIndex,DeathPunish, Enmity}", 1, data_convert_func_addmap)

	self:define_event("event_player_tong_operation", "data={szOperation, szTongName, nTongLv}", 1)
	--create	szTongName tongLv
	--join		szTongName tongLv
	--leave		szTongName tongLv
	--kick		szTongName tongLv
	--uplevel	szTongName newLevel

	--mission event
	self:define_event(TeamEvent("event_mission_stage_finish"), "TeamEvent, data={szMissionName, nStage}", 2)
	--liangshan 	1~8
	--wanjianzhong 	1~4
	--dixuangong 	1~7
	--taixu			1~8
	--taiyi			1~6
	--taiyihero		1~6
	--cangjian		1~4
	--jiandangyanyun 1~6
	--jiandangyanyunhero 1~6
	--new_taixu		1~30

	self:define_event("event_mission_task_award", "data={szMissionName, szTaskName, nPara}", 3)
	--wanjianzhong 	{"1daily_pass","2daily_fanpai","3weekly_pass","4weekly_fanpai"} index{1~4}
	--dixuangong 	{"1chutan", "2dapo", "3zhuixiong"} index{1~3}
	--liangshan 	{"1chuyan", "2zhongyong", "3duojun"}  index{1~3}
	--planttree		{"smalltreeprize","bigtreeprize","plantseedtree", "openseedbag"} 0 --С������, �������, ������, ������, �����Ӵ�
	--planttree		{"plant4lingtree", "plantbigtree"} nPlantCount

	--pvp 		toujingshu 	nStep{1~7}
	--pvp 		yunbiao 	nType{1~5}
	--pvp 		duobiao		nType{1~5}
	--pvp 		shangjin 	nType{1~4}
	--pvp 		yupo 		nType{1~4}
	--pvp 		shiliwabao 	nType{1~3}
	--pvp 		shengwu 	0
	--pvp 		killboss 	0
	--pvp 		plant		0
	--pvp 		touguoshi	0
	--pvp 		baozang		0


	self:define_event("event_mission_affairs", "data={szMissionName, szAfairName, nPara}", 3)
	--newbattle 		mainpoint200		4			--�μ����Ź�ս�����ִﵽ200��
	--newbattle			protectcitypoint100	3			--�����ǳ�ս������100��
	--newbattle 		killplayer 			nBattleType{1village,2resource,3protectcity,4main}--ɱ��
	--liangshan			killboss			npcIdx		--��ɽ��ɱboss
	--dixuangong		killboss			npcIdx		--��������ɱboss
	--dixuangong		flop				nType		--����������nType:1=���2=����
	--jiandangyanyun	flop				nType		--�������Ʒ���nType:1=���2=����
	--tianmenzhen		killflag			0
	--honortong			buildtong			nNum
	--worldboss			killboss			npcIndex 	--����boss
	--tongboss			killboss			npcIndex 	--���boss
	--3v3				finished			0			-- ���һ��3v3

	self:define_event("event_mission_box_award", "data={szMissionName, szBoxType, nIndex}", 2)
	--worldboss 	gold|small
	--wanjianzhong 	gold|silver|copper
	--dixuangong 	gold|silver|copper
	--liangshan 	gold|silver|copper
	--siling 		gold|silver|copper
	--taiyi			gold|silver|copper
	--taiyihero		gold|silver|copper

	self:define_event("event_mission_award", "data={szMissionName, nType, nPara1, nPara2}", 4)
	--newbattle		nType{0~4}  is_winner	nBattleType{1village,2resource,3protectcity,4main}  --ս��5���콱��ʽ
	--tianmenzhen	nType{0~3}  is_winner	0
	--honortong		nType{0~1 is_master}	0	0
	--kfbattle		nType{1~5}  nResult{2:win, 3:lose, 4:drawƽ��}	0
	--biwudahui		nType{0,1}ԭ��/���  is_winner 0
	--ziyuanzhan	nType{0~3}  is_winner	0 --��Խ�Ͻű�����

	self:define_event("event_task_award", "data={szTaskName, nId, nPara}", 2)
	--contributecountry 1~4		--��Ӧ�ι�ƽ����4��ѡ�� --from VNG
	--tong_daily_task 	nIdx 	--����ճ�����
	--daily_reg_accum 	nDay 	--�ۼ�ǩ������
	--jubaozhai 		nType 	--�۱�ի�齱 nType��1=��ʯ�齱 2=�콾�齱

	--��������
	self:define_event("event_player_interactive", "data={szInteractive}", 1)
	--    "share_ride",--0		-- ˫�˹���
	--    "share_hand",-- 1		-- ˫��Я��
	--    "share_back",-- 2		-- GG��MM
	--    "share_chest",-- 3	-- GG��MM
	--    "kiss",-- 4			-- ����
	--    "comfort",-- 5		-- ��ο
	--    "kotow",-- 6			-- ��
	--    "help",-- 7			-- ��æ
	--    "sorrow",-- 8			-- ����
	--    "ready_go",-- 9		-- ����
	--    "act_up",-- 10		-- ��Ƥ
	--    "crazy",-- 11			-- ����
	--    "knee_down",-- 12		-- ����
	--    "shy",-- 13			-- ����
	--    "bow",--14			-- �Ϲ�
	--    "claps",-- 15			-- ����
	--    "marriage",-- 16		-- ���
	--    "angry",-- 17			-- ����
	--    "victory",-- 18		-- ʤ��
	--    "cool",-- 19			-- ˣ��
	--    "lay_down",-- 20		-- ����
	--    "defy",-- 21			-- ����
	--    "puzzled",-- 22		-- �ɻ�
	--    "faint",-- 23			-- �ε�
	--    "byebye",-- 24 		-- ����
	--    "confidence",-- 25	-- ����
	--    "gentle",-- 26		-- ��Ҿ
	--    "sit",-- 27			-- ����
	self:define_event("event_finish_gtask","data={nTaskId}",1) -- �����ĳ��gtask
	self:define_event("event_jump_gtask","data={nTaskId}",1) -- ������ĳ��gtask

	self:define_event("event_equip_operation", "data={szOperation, nItemIndex, nPara1, nPara2, nPara3}", 4)
	--upgradebookapp 	nGrade 	 		nNewLv 	nColor 		nItemIdx 	--���������ؼ�
	--quench_lp			bSuccess 		nLpLv 	nQuenchNum  nItemIdx 	--�����׺�����
	--yunling			nEmbroideryLv 	nPart 	0						--��װ����

end

function data_convert_func_no_convert(data)
	return data
end

function data_convert_func_item_gdp(data)
	local g,d,p = data[1],data[2],data[3]
	local nItemPackId = PackItemId(g,d,p)
	local d = {nItemPackId}
	for i=4,getn(data) do
		tinsert(d, data[i])
	end
	return d
end

function data_convert_func_item_index(data)
	local nItemIndex = data[1]
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nItemPackId = PackItemId(g,d,p)
	local d = {nItemPackId}
	for i=1,getn(data) do
		tinsert(d, data[i])
	end
	return d
end

function data_convert_func_npc(data)
	local nNpcIndex = data[1]
	local szNpcName = GetNpcName(nNpcIndex)
	local nMapId = GetNpcWorldPos(nNpcIndex)
	if nMapId >= 65536 then--������ȡģ��ID
		local nMapIndex = SubWorldID2Idx(nMapId)
		nMapId = GetMapTemplate(nMapIndex)
	end
	local d = {szNpcName, nMapId}
	for i=1,getn(data) do
		tinsert(d, data[i])
	end
	return d
end

function data_convert_func_addmap(data)
	local nMap = GetWorldPos()
	local d = {nMap}
	for i=1,getn(data) do
		tinsert(d, data[i])
	end
	return d
end
