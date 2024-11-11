Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

T_GOLD_BoxScript = {
	nil,
	nil,
	nil,
	"\\script\\missions\\liangshan\\npc\\box_gold4.lua",
	nil,
	nil,
	nil,
	"\\script\\missions\\liangshan\\npc\\box_gold8.lua",
}

T_GOLD_BOX_IDX = {}
function remove_gold_box()
	for i,v in T_GOLD_BOX_IDX do
		if GetNpcName(i) == "Kim R��ng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_GOLD_BOX_IDX = {}
end

function create_box_gold(m,x,y, nStage)
	if g_WCFG_LUONGSONBAC.bDisableDropBox == WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end

	if not T_GOLD_BoxScript[nStage] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("jinbaoxiang", "Kim R��ng", m, x2, y2);
	if npc and npc > 0 then
		T_GOLD_BOX_IDX[npc] = npc
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_GOLD_BoxScript[nStage]);
	else
		print("create jinbaoxiang fail")
	end
end

function box_gold_create_ib_card_require()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2, 97, 236,1});
	end
	return tRequire;
end

function on_open_box_gold_card_stage4(nId)
	on_open_gold_box_card(4,nId)
end
function on_open_box_gold_card_stage8(nId)
	on_open_gold_box_card(8,nId)
end

t_award = {
	[4] = {"LS_jin_free1", "LS_jin_IB1", "csm_1_tianjiaoling"},
	[8] = {"LS_jin_free2", "LS_jin_IB2", "csm_1_tianjiaoling"},
}
function on_open_gold_box_card(nStage, nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	
	if gf_Judge_Room_Weight(2, 20, "") ~= 1 then
		return 0;
	end
	
	local t = t_award[nStage]
	if not t then
		return
	end
	local szAwardFree = t[1]
	local szAwardIB = t[2]
	local szRequireIB = t[3]
	local g, d, p, n;
	if nId < 8 then
		local nAwardIndex = CustomAwardSelectOne(szAwardFree);
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex);
			MA_Team_SyncItem(nId, g, d, p, n, GetName());
		end
	else
		if 1 ~= CustomAwardCheckCondition(szAwardIB) then
			--Talk(1, "", "�����ռ���ز��㣬�����콱");
			return 0
		end
		if not szRequireIB or 1~=CustomAwardCheckAndConsumeGroup(szRequireIB,1) then
			return 0
		end
		--Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2, 97, 236, 1})
		FireEvent("event_ib_cost", 2,97,236,1)
--		if 21==box_id or 22==box_id then
--			AddRuntimeStat(18, 5, GetMissionV(2)-1, 2);
--		end
--		local tItem = MA_GetRequire(id);
--		if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
--			Talk(1, "", "�����ϵ�"..SLT_OPEN_NEED[1].."������");
--			return 0;
--		end		
		local nAwardIndex = CustomAwardSelectOne(szAwardIB)
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex)
			MA_Team_SyncItem(nId, g, d, p, n, GetName())
		end
	end
	
	
--	local nRet = MissionAward_RandAward(nStage, nId, t_card_award, nil);
--	if nRet == 1 then
--		if nId < 8 then
--		--_stat_when_open_free_card()
--	else
--		--_stat_when_open_ib_card()
--		--_gold_box_stat_when_ib_consume(1)--IB����ͳ��
--  	end
--	end
end

function on_open_box_gold(nStage)
	local szFunc = format("on_open_box_gold_card_stage%d", nStage)
	MA_Mission_OpenUI(MISSION_ID,0, T_GOLD_BoxScript[nStage], szFunc, box_gold_create_ib_card_require());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tLiangShanJinBox") --2XU�
	FireEvent("event_mission_box_award", "liangshan", "gold", nStage)
end

--_t_free_award_no_stage =
--{
--	n_other_group_rate = 10000,--�����������ĸ���
--	t_daibi_group =
--	{
--		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
--        --{{"��ϼ�ؼ�",{0,107,65,1, 4}, 720, bGblMsg}, 150},
--        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
--        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--	},
--	--------------------------------------------
--	t_equip_group = --������
--	{
--	},
--};
--_t_free_award_stage =
--{
--	[4] =
--		{
--			n_equip_group_rate = 0,--�����װ����ĸ���
--			n_daibi_group_rate = 0,--�����������ĸ���
--        	t_other_group = --װ����
--        	{
--        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
--                { {"С��������", {2,0,504,1,4}, 7,nil, {1, 100}}, 600},
--                { {"��������", {2,0,398,1,4}, 7,nil, {1, 100}}, 600},
--                { {"������", {2,1,30269,1,4}, 7,nil, {1, 100}}, 600},
--                { {"������", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},
--                { {"����Ҫ��", {2,0,554,1,4}, 7,nil, {1, 100}}, 600},
--                { {"ǧ�ﴫ����ֽ", {2,1,3508,1,4}, nil,nil, {1, 100}}, 300},
--                { {"�����Ԫ��", {2,1,30352,1,4}, 7,nil, {1, 100}}, 500},
--                { {"��Ԫ��", {2,1,30351,1,4}, 7,nil, {1, 100}}, 600},
--                { {"����ʯ", {2,1,30554,1,4}, nil,nil, {1, 100}}, 500},
--                { {"�׾���", {2,1,270,1,4}, 7,nil, {1, 100}}, 500},
--                { {"ϴ��ʯ��", {2,1,30536,1}, nil,nil, {1, 100}}, 300},
--                { {"��¯����", {2,1,30537,1}, nil,nil, {1, 100}}, 300},
--                { {"��ɽ�ز�", {2,1,30310,1,4}, nil,nil, {1, 100}}, 500},
--                { {"1������", {2,1,30533,1,4}, nil,nil, {1, 100}}, 500},
--                { {"2������", {2,1,30534,1,4}, nil,nil, {1, 100}}, 550},
--                { {"3������", {2,1,30535,1,4}, nil,nil, {1, 100}}, 347},
--                { {"ͭ�ƻ���", {0,153,1,1}, nil,nil, {1, 100}}, 600},
--                { {"���ƻ���", {0,153,2,1}, nil,nil, {1, 100}}, 600},
--                { {"���ƻ���", {0,153,3,1}, nil,nil, {1, 100}}, 600},
--                { {"���н��ʻ���", {0,153,4,1}, nil,nil, {1, 100}}, 50},
--                { {"����ľ�ʻ���", {0,153,5,1}, nil,nil, {1, 100}}, 50},
--                { {"����ˮ�ʻ���", {0,153,6,1}, nil,nil, {1, 100}}, 50},
--                { {"���л��ʻ���", {0,153,7,1}, nil,nil, {1, 100}}, 50},
--                { {"�������ʻ���", {0,153,8,1}, nil,nil, {1, 100}}, 50},
--                { {"�������ʻ���", {0,153,9,1}, nil,nil, {1, 100}}, 50},
--                { {"��������", {0,153,26,1}, nil,1, {1, 100}}, 1},
--                { {"��Ѫ����", {0,153,27,1}, nil,1, {1, 100}}, 1},
--                { {"���λ���", {0,153,28,1}, nil,1, {1, 100}}, 1},
--        	},
--		},
--	[8] =
--		{
--			n_equip_group_rate = 0,--�����װ����ĸ���
--			n_daibi_group_rate = 0,--�����������ĸ���
--        	t_other_group = --װ����
--        	{
--                { {"С��������", {2,0,504,1,4}, 7,nil, {1, 100}}, 600},
--                { {"��������", {2,0,398,1,4}, 7,nil, {1, 100}}, 600},
--                { {"������", {2,1,30269,1,4}, 7,nil, {1, 100}}, 600},
--                { {"������", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},
--                { {"����Ҫ��", {2,0,554,1,4}, 7,nil, {1, 100}}, 600},
--                { {"ǧ�ﴫ����ֽ", {2,1,3508,1,4}, nil,nil, {1, 100}}, 300},
--                { {"�����Ԫ��", {2,1,30352,1,4}, 7,nil, {1, 100}}, 500},
--                { {"��Ԫ��", {2,1,30351,1,4}, 7,nil, {1, 100}}, 600},
--                { {"����ʯ", {2,1,30554,1,4}, nil,nil, {1, 100}}, 500},
--                { {"�׾���", {2,1,270,1,4}, 7,nil, {1, 100}}, 500},
--                { {"ϴ��ʯ��", {2,1,30536,1,4}, nil,nil, {1, 100}}, 300},
--                { {"��¯����", {2,1,30537,1}, nil,nil, {1, 100}}, 300},
--                { {"��ɽ�ز�", {2,1,30310,1}, nil,nil, {1, 100}}, 500},
--                { {"1������", {2,1,30533,1,4}, nil,nil, {1, 100}}, 500},
--                { {"2������", {2,1,30534,1,4}, nil,nil, {1, 100}}, 1000},
--                { {"3������", {2,1,30535,1,4}, nil,nil, {1, 100}}, 347},
--                { {"ͭ�ƻ���", {0,153,1,1}, nil,nil, {1, 100}}, 500},
--                { {"���ƻ���", {0,153,2,1}, nil,nil, {1, 100}}, 500},
--                { {"���ƻ���", {0,153,3,1}, nil,nil, {1, 100}}, 500},
--                { {"���н��ʻ���", {0,153,4,1}, nil,nil, {1, 100}}, 25},
--                { {"����ľ�ʻ���", {0,153,5,1}, nil,nil, {1, 100}}, 25},
--                { {"����ˮ�ʻ���", {0,153,6,1}, nil,nil, {1, 100}}, 25},
--                { {"���л��ʻ���", {0,153,7,1}, nil,nil, {1, 100}}, 25},
--                { {"�������ʻ���", {0,153,8,1}, nil,nil, {1, 100}}, 25},
--                { {"�������ʻ���", {0,153,9,1}, nil,nil, {1, 100}}, 25},
--                { {"��������", {0,153,26,1}, nil,1, {1, 100}}, 1},
--                { {"��Ѫ����", {0,153,27,1}, nil,1, {1, 100}}, 1},
--                { {"���λ���", {0,153,28,1}, nil,1, {1, 100}}, 1},
--        	},
--		},
--}
--
--_t_fix_award_stage =
--{
--}

function _gold_box_stat_when_ib_consume(nConsume)
	--SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + nConsume, TASK_ACCESS_CODE_DXG_MISSION);
	gf_ModifyTask(VET_MS_TASKID_JUYILING, nConsume);
	_stat_when_ib_consume(nConsume)
	--AddRunTimeStat(3,10,0,nConsume)
end

--_t_ib_award_no_stage4 =
--{
--	t_cost = --����
--	{
--		--{"��ϼ�ؼ�",{0,107,65,1, 4}},
--		{"�콾��",{2, 97, 236,1},_gold_box_stat_when_ib_consume},
--		
--	},
--	t_ib_award =--ib����
--	{
--                { {"С��������", {2,0,504,1}, 7,nil, {1, 100}}, 600},
--                { {"��������", {2,0,398,1}, 7,nil, {1, 100}}, 600},
--                { {"������", {2,1,30269,1}, 7,nil, {1, 100}}, 600},
--                { {"�׾���", {2,1,270,1}, 7,nil, {1, 100}}, 600},
--                { {"��׾���", {2,1,1007,1}, 7,nil, {1, 100}}, 800},
--                { {"�׾��ɵ�", {2,1,1008,1}, 7,nil, {1, 100}}, 600},
--                { {"���˲ι�", {2,0,553,1}, 7,nil, {1, 100}}, 500},
--                { {"Ӣ��ѫ��", {2,1,30499,1,4}, nil,nil, {1, 100}}, 1500},
--                { {"Ӣ��ѫ��", {2,1,30499,2,4}, nil,nil, {1, 100}}, 600},
--                { {"Ӣ��ѫ��", {2,1,30499,4,4}, nil,nil, {1, 100}}, 200},
--                { {"Ӣ��ѫ��", {2,1,30499,10,4}, nil,nil, {1, 100}}, 50},
--                { {"�����Ƭ", {2,1,30390,10}, nil,nil, {1, 100}}, 1200},
--                { {"�����Ƭ", {2,1,30390,20}, nil,nil, {1, 100}}, 391},
--                { {"�����Ƭ", {2,1,30390,100}, nil,nil, {1, 100}}, 40},
--                { {"�����", {2,95,204,1}, nil,1, {1, 100}}, 10},
--                { {"ͭ�ƻ���", {0,153,1,1}, nil,nil, {1, 100}}, 400},
--                { {"���ƻ���", {0,153,2,1}, nil,nil, {1, 100}}, 400},
--                { {"���ƻ���", {0,153,3,1}, nil,nil, {1, 100}}, 306},
--                { {"���н��ʻ���", {0,153,4,1}, nil,nil, {1, 100}}, 100},
--                { {"����ľ�ʻ���", {0,153,5,1}, nil,nil, {1, 100}}, 100},
--                { {"����ˮ�ʻ���", {0,153,6,1}, nil,nil, {1, 100}}, 100},
--                { {"���л��ʻ���", {0,153,7,1}, nil,nil, {1, 100}}, 100},
--                { {"�������ʻ���", {0,153,8,1}, nil,nil, {1, 100}}, 100},
--                { {"�������ʻ���", {0,153,9,1}, nil,nil, {1, 100}}, 100},
--                { {"��������", {0,153,26,1}, nil,1, {1, 100}}, 1},
--                { {"��Ѫ����", {0,153,27,1}, nil,1, {1, 100}}, 1},
--                { {"���λ���", {0,153,28,1}, nil,1, {1, 100}}, 1},
--	},
--}
--
--_t_ib_award_no_stage8 =
--{
--	t_cost = --����
--	{
--		--{"��ϼ�ؼ�",{0,107,65,1, 4}},
--		{"�콾��",{2, 97, 236,1},_gold_box_stat_when_ib_consume},
--		
--	},
--	t_ib_award =--ib����
--	{
--                { {"С��������", {2,0,504,1}, 7,nil, {1, 100}}, 600},
--                { {"��������", {2,0,398,1}, 7,nil, {1, 100}}, 600},
--                { {"������", {2,1,30269,1}, 7,nil, {1, 100}}, 600},
--                { {"�׾���", {2,1,270,1}, 7,nil, {1, 100}}, 600},
--                { {"��׾���", {2,1,1007,1}, 7,nil, {1, 100}}, 800},
--                { {"�׾��ɵ�", {2,1,1008,1}, 7,nil, {1, 100}}, 600},
--                { {"���˲ι�", {2,0,553,1}, 7,nil, {1, 100}}, 500},
--                { {"Ӣ��ѫ��", {2,1,30499,1,4}, nil,nil, {1, 100}}, 1500},
--                { {"Ӣ��ѫ��", {2,1,30499,2,4}, nil,nil, {1, 100}}, 600},
--                { {"Ӣ��ѫ��", {2,1,30499,4,4}, nil,nil, {1, 100}}, 200},
--                { {"Ӣ��ѫ��", {2,1,30499,10,4}, nil,nil, {1, 100}}, 50},
--                { {"�����Ƭ", {2,1,30390,10}, nil,nil, {1, 100}}, 1200},
--                { {"�����Ƭ", {2,1,30390,20}, nil,nil, {1, 100}}, 391},
--                { {"�����Ƭ", {2,1,30390,100}, nil,nil, {1, 100}}, 40},
--                { {"�����", {2,95,204,1}, nil,1, {1, 100}}, 10},
--                { {"ͭ�ƻ���", {0,153,1,1}, nil,nil, {1, 100}}, 400},
--                { {"���ƻ���", {0,153,2,1}, nil,nil, {1, 100}}, 400},
--                { {"���ƻ���", {0,153,3,1}, nil,nil, {1, 100}}, 306},
--                { {"���н��ʻ���", {0,153,4,1}, nil,nil, {1, 100}}, 100},
--                { {"����ľ�ʻ���", {0,153,5,1}, nil,nil, {1, 100}}, 100},
--                { {"����ˮ�ʻ���", {0,153,6,1}, nil,nil, {1, 100}}, 100},
--                { {"���л��ʻ���", {0,153,7,1}, nil,nil, {1, 100}}, 100},
--                { {"�������ʻ���", {0,153,8,1}, nil,nil, {1, 100}}, 100},
--                { {"�������ʻ���", {0,153,9,1}, nil,nil, {1, 100}}, 100},
--                { {"��������", {0,153,26,1}, nil,1, {1, 100}}, 1},
--                { {"��Ѫ����", {0,153,27,1}, nil,1, {1, 100}}, 1},
--                { {"���λ���", {0,153,28,1}, nil,1, {1, 100}}, 1},
--	},
--}
--
--t_card_award = 
--{
--	--------------------------------------------
--	t_free_award = 
--	{
--		sz_award_title = "��ɽȺӢ����ѷ�����",
--		--����û�еõ�װ��ʱ�س�װ��
--		t_equip_round = {},
--		n_max_daibi_perday = 30,--һ������ö��ٴ���
--		t_stage =
--		{
--			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
--			[8] = inherit(_t_free_award_no_stage, _t_free_award_stage[8]),
--		},
--	},
--	
--	t_fix_award = 
--	{
--		sz_award_title = "��ɽȺӢ��ؿ��̶�����",
--		t_stage = _t_fix_award_stage,
--	},
--	--------------------------------------------
--	t_ib_award = 
--	{
--		sz_award_title = "��ɽȺӢ���շѷ�����",
--		t_stage = 
--		{
--			[4] = _t_ib_award_no_stage4,
--			[8] = _t_ib_award_no_stage8,
--		},
--	},
--}
--
--_t_free_award_no_stage = nil
--_t_free_award_stage = nil
--_t_fix_award_stage = nil
--_t_ib_award_no_stage1 = nil
--_t_ib_award_no_stage2 = nil
