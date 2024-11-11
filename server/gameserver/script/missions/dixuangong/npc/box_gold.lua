Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\dixuangong\\mission.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_DXG_GOLD_BoxScript = {
	"\\script\\missions\\dixuangong\\npc\\box_gold1.lua",
	"\\script\\missions\\dixuangong\\npc\\box_gold2.lua",
}

T_GOLD_BOX_IDX = {}
function remove_box_gold()
	for i,v in T_GOLD_BOX_IDX do
		if GetNpcName(i) == "Kim R��ng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_GOLD_BOX_IDX = {}
end

function create_dxg_box_gold(nNpcIdx, nBoxId)
	if g_WCFG_DIAHUYENCUNG.bDisableDropBox == WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end

	if not T_DXG_GOLD_BoxScript[nBoxId] then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("jinbaoxiang", "Kim R��ng", m, x2, y2);
	if npc and npc > 0 then
		T_GOLD_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_DXG_GOLD_BoxScript[nBoxId]);
	else
		print("create dixuangong jinbaoxiang fail")
	end
end

function box_gold_create_ib_card_require()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2, 97, 236,1});
	end
	return tRequire;
end

function on_open_dxg_box_gold_card_stage1(nId)
	on_open_dxg_gold_box_card(1,nId)
end
function on_open_dxg_box_gold_card_stage2(nId)
	on_open_dxg_gold_box_card(2,nId)
end

function _stat_when_ib_consume(nConsume)
	SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + nConsume, TASK_ACCESS_CODE_DXG_MISSION);
	AddRuntimeStat(1,13,0,nConsume);
end

function on_open_dxg_gold_box_card(nStage, nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, t_dxg_card_award, nil);
	
	if nRet == 1 then
		if nId < 8 then
			--_stat_when_open_free_card()
			FireEvent("event_mission_affairs", "dixuangong", "flop", 1)
		else
			--_stat_when_ib_consume(1)
			FireEvent("event_mission_affairs", "dixuangong", "flop", 2)
  		end
	end
end

function on_open_dxg_box_gold(nStage)
	local szFunc = format("on_open_dxg_box_gold_card_stage%d", nStage)
	MA_Mission_OpenUI(MISSION_ID,0, T_DXG_GOLD_BoxScript[nStage], szFunc, box_gold_create_ib_card_require());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tDXGJinBox") --2XU�
	FireEvent("event_mission_box_award", "dixuangong", "gold", nStage)
end

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--�����������ĸ���
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"��ϼ�ؼ�",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
	},
	--------------------------------------------
	t_equip_group = --������
	{
	},
};
_t_free_award_stage =
{
	[1] =
		{
			n_equip_group_rate = 0,--�����װ����ĸ���
			n_daibi_group_rate = 0,--�����������ĸ���
        	t_other_group = --װ����
        	{
        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
                {{"C�y B�t Nh� nh�", {2, 0, 504, 1, 1}, 7,nil,{1, 100}}, 400},
				{{"C�y B�t Nh�", {2, 0, 398, 1, 1}, 7,nil,{1, 100}}, 100},
				{{"C�y T� Linh", {2, 1, 30269, 1, 1}, 7,nil,{1, 100}}, 300},
				{{"Tu Ch�n Y�u Quy�t", {2, 0, 554, 1, 1}, 7,nil,{1, 100}}, 400},
				{{"T� Linh Quy Nguy�n ��n", {2, 1, 30352, 1, 1}, 7,nil,{1, 100}}, 500},
				{{"B�i Nguy�n ��n", {2, 1, 30351, 1, 1}, 7,nil,{1, 100}}, 600},
				{{"B�ng Tinh Th�ch", {2, 1, 30554, 1, 1}, nil,nil,{1, 100}}, 500},
				{{"B�ch C�u Ho�n", {2, 1, 270, 1, 1}, 7,nil,{1, 100}}, 500},
				{{"T�y T�m Th�ch Kho�ng", {2, 1, 30536, 1, 1}, nil,nil,{1, 100}}, 300},
				{{"Luy�n L� Thi�t Kho�ng", {2, 1, 30537, 1, 1}, nil,nil,{1, 100}}, 300},
				{{"T�i ti�n", {2, 1, 30367, 1, 1}, nil,nil,{1, 100}}, 500},
				{{"�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Du Hi�p", {0, 152, 26, 1, 1}, nil,nil,{1, 100}}, 50},
				{{"�o Cho�ng Thi�t Huy�t", {0, 152, 27, 1, 1}, nil,nil,{1, 100}}, 50},
				{{"�o Cho�ng V�n Du", {0, 152, 28, 1, 1}, nil,nil,{1, 100}}, 50},
				{{"�o kho�c Hi�p C�t", {0, 152, 29, 1, 1}, nil,1,{1, 100}}, 5},
				{{"�o kho�c Q�y Ph�", {0, 152, 30, 1, 1}, nil,1,{1, 100}}, 5},
				{{"�o kho�c ��ng V�n", {0, 152, 31, 1, 1}, nil,1,{1, 100}}, 5},
				{{"Nh�n S�m V�n N�m", {2, 1, 30071, 1, 1}, nil,nil,{1, 100}}, 1980},
				{{"T�i �� Qu� C�p 1", {2, 1, 30998, 1, 1}, nil,nil,{1, 100}}, 1400},
				{{"T�i �� Qu� C�p 2", {2, 1, 30999, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"T�i �� Qu� C�p 3", {2, 1, 31000, 1, 1}, nil,1,{1, 100}}, 135},

				{{"Kinh M�ch Ng�n Nh�n", {2, 1, 30731, 1, 1}, nil, nil, {1, 100}}, 100},
				{{"M�nh Th� C��i", {2, 1, 31386, 1, 1}, nil, nil, {1, 100}}, 200},
				{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 1, 1}, nil, nil, {1,100}}, 200},
				{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 1, 1}, nil, nil, {1,100}}, 20},
        	},
		},
	[2] =
		{
			n_equip_group_rate = 0,--�����װ����ĸ���
			n_daibi_group_rate = 0,--�����������ĸ���
        	t_other_group = --װ����
        	{
        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
				{{"C�y B�t Nh� nh�", {2, 0, 504, 1, 1}, 7,nil,{1, 100}}, 400},
				{{"C�y B�t Nh�", {2, 0, 398, 1, 1}, 7,nil,{1, 100}}, 100},
				{{"C�y T� Linh", {2, 1, 30269, 1, 1}, 7,nil,{1, 100}}, 300},
				{{"Tu Ch�n Y�u Quy�t", {2, 0, 554, 1, 1}, 7,nil,{1, 100}}, 400},
				{{"T� Linh Quy Nguy�n ��n", {2, 1, 30352, 1, 1}, 7,nil,{1, 100}}, 500},
				{{"B�i Nguy�n ��n", {2, 1, 30351, 1, 1}, 7,nil,{1, 100}}, 600},
				{{"B�ng Tinh Th�ch", {2, 1, 30554, 1, 1}, nil,nil,{1, 100}}, 500},
				{{"B�ch C�u Ho�n", {2, 1, 270, 1, 1}, 7,nil,{1, 100}}, 500},
				{{"T�y T�m Th�ch Kho�ng", {2, 1, 30536, 1, 1}, nil,nil,{1, 100}}, 300},
				{{"Luy�n L� Thi�t Kho�ng", {2, 1, 30537, 1, 1}, nil,nil,{1, 100}}, 300},
				{{"T�i ti�n", {2, 1, 30367, 1, 1}, nil,nil,{1, 100}}, 500},
				{{"�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"�o Cho�ng Du Hi�p", {0, 152, 26, 1, 1}, nil,nil,{1, 100}}, 50},
				{{"�o Cho�ng Thi�t Huy�t", {0, 152, 27, 1, 1}, nil,nil,{1, 100}}, 50},
				{{"�o Cho�ng V�n Du", {0, 152, 28, 1, 1}, nil,nil,{1, 100}}, 50},
				{{"�o kho�c Hi�p C�t", {0, 152, 29, 1, 1}, nil,1,{1, 100}}, 5},
				{{"�o kho�c Q�y Ph�", {0, 152, 30, 1, 1}, nil,1,{1, 100}}, 5},
				{{"�o kho�c ��ng V�n", {0, 152, 31, 1, 1}, nil,1,{1, 100}}, 5},
				{{"Nh�n S�m V�n N�m", {2, 1, 30071, 1, 1}, nil,nil,{1, 100}}, 1980},
				{{"T�i �� Qu� C�p 1", {2, 1, 30998, 1, 1}, nil,nil,{1, 100}}, 1400},
				{{"T�i �� Qu� C�p 2", {2, 1, 30999, 1, 1}, nil,nil,{1, 100}}, 200},
				{{"T�i �� Qu� C�p 3", {2, 1, 31000, 1, 1}, nil,1,{1, 100}}, 135},

				{{"Kinh M�ch Ng�n Nh�n", {2, 1, 30731, 1, 1}, nil, nil, {1, 100}}, 100},
				{{"M�nh Th� C��i", {2, 1, 31386, 1, 1}, nil, nil, {1, 100}}, 200},
				{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 1, 1}, nil, nil, {1,100}}, 200},
				{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 1, 1}, nil, nil, {1,100}}, 20},
				
        	},
		},
}

_t_fix_award_stage =
{
}

_t_ib_award_no_stage1 =
{
	t_cost = --����
	{
		--{"��ϼ�ؼ�",{0,107,65,1, 4}},
		{"Thi�n Ki�u L�nh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib����
	{
        {{"C�y B�t Nh� nh�", {2, 0, 504, 1, 1}, 7,nil,{1, 100}}, 500},
		{{"C�y B�t Nh�", {2, 0, 398, 1, 1}, 7,nil,{1, 100}}, 200},
		{{"C�y T� Linh", {2, 1, 30269, 1, 1}, 7,nil,{1, 100}}, 500},
		{{"B�ch C�u Ho�n", {2, 1, 270, 1, 1}, 7,nil,{1, 100}}, 700},
		{{"��i B�ch C�u ho�n", {2, 1, 1007, 1, 1}, 7,nil,{1, 100}}, 700},
		{{"B�ch C�u Ti�n ��n", {2, 1, 1008, 1, 1}, 7,nil,{1, 100}}, 600},
		{{"��i Nh�n s�m", {2, 0, 553, 1, 1}, 7,nil,{1, 100}}, 500},
		--{{"Ӣ��ѫ��", {2, 1, 30499, 1, 1}, nil,nil,{1, 100}}, 800},
		{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 2, 1}, nil,nil,{1, 100}}, 600},
		{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 4, 1}, nil,nil,{1, 100}}, 200},
		{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 10, 1}, nil,nil,{1, 100}}, 50},
		{{"M�nh Thi�n M�n", {2, 1, 30410, 2, 1}, nil,nil,{1, 100}}, 400},
		{{"M�nh Thi�n M�n", {2, 1, 30410, 4, 1}, nil,nil,{1, 100}}, 100},
		{{"M�nh Thi�n M�n", {2, 1, 30410, 20, 1}, nil,1,{1, 100}}, 20},
		{{"Thi�n M�n Kim L�nh", {2, 1, 30370, 1, 1}, nil,1,{1, 100}}, 1},
		-- {{"��������", {0, 152, 26, 1, 1}, nil,nil,{1, 100}}, 50},
		-- {{"��Ѫ����", {0, 152, 27, 1, 1}, nil,nil,{1, 100}}, 50},
		-- {{"���ι���", {0, 152, 28, 1, 1}, nil,nil,{1, 100}}, 50},
		{{"Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1, 1}, 15,nil,{1, 100}}, 500},
		{{"B�ch Kim ��i H�ng Bao (kh�ng)", {2, 1, 30228, 1, 1}, 15,nil,{1, 100}}, 100},
		{{"�o kho�c Hi�p C�t", {0, 152, 29, 1, 1}, nil,1,{1, 100}}, 30},
		{{"�o kho�c Q�y Ph�", {0, 152, 30, 1, 1}, nil,1,{1, 100}}, 30},
		{{"�o kho�c ��ng V�n", {0, 152, 31, 1, 1}, nil,1,{1, 100}}, 30},
		{{"Phi�u ��i Ngo�i Trang", {2, 1, 31233, 1, 1}, nil,nil,{1, 100}}, 500},
		{{"Nh�n S�m V�n N�m", {2, 1, 30071, 5, 1}, nil,1,{1, 100}}, 784},
		{{"T�i �� Qu� C�p 1", {2, 1, 30998, 1, 1}, nil,nil,{1, 100}}, 400},
		{{"T�i �� Qu� C�p 2", {2, 1, 30999, 1, 1}, nil,nil,{1, 100}}, 300},
		{{"T�i �� Qu� C�p 3", {2, 1, 31000, 1, 1}, nil,1,{1, 100}}, 100},

		{{"Kinh M�ch Ng�n Nh�n", {2, 1, 30731, 1, 1}, nil, nil, {1,100}}, 500},
		{{"M�nh Th� C��i", {2, 1, 31386, 1, 1}, nil, nil, {1,100}}, 500},
		{{"Linh Ngh�", 	 {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, nil, 1, {1,100}}, 1},
		{{"Phong S��ng Ki�m", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, nil, 1, {1,100}}, 1},
		{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 5, 1}, nil, nil, {1,100}}, 638},
		{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 1, 1}, nil, nil, {1,100}}, 500},
		{{"Hoan L�ng Phi Phong", {0, 152, 32, 1, 1}, nil, 1, {1,100}}, 5},
		{{"��ng Giao Phi Phong", {0, 152, 33, 1, 1}, nil, 1, {1,100}}, 5},
		{{"Kh�i Ph��ng Phi Phong", {0, 152, 34, 1, 1}, nil, 1, {1,100}}, 5},
	},
}

_t_ib_award_no_stage2 =
{
	t_cost = --����
	{
		--{"��ϼ�ؼ�",{0,107,65,1, 4}},
		{"Thi�n Ki�u L�nh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib����
	{
        {{"C�y B�t Nh� nh�", {2, 0, 504, 1, 1}, 7,nil,{1, 100}}, 500},
		{{"C�y B�t Nh�", {2, 0, 398, 1, 1}, 7,nil,{1, 100}}, 200},
		{{"C�y T� Linh", {2, 1, 30269, 1, 1}, 7,nil,{1, 100}}, 500},
		{{"B�ch C�u Ho�n", {2, 1, 270, 1, 1}, 7,nil,{1, 100}}, 700},
		{{"��i B�ch C�u ho�n", {2, 1, 1007, 1, 1}, 7,nil,{1, 100}}, 700},
		{{"B�ch C�u Ti�n ��n", {2, 1, 1008, 1, 1}, 7,nil,{1, 100}}, 600},
		{{"��i Nh�n s�m", {2, 0, 553, 1, 1}, 7,nil,{1, 100}}, 500},
		--{{"Ӣ��ѫ��", {2, 1, 30499, 1, 1}, nil,nil,{1, 100}}, 800},
		{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 2, 1}, nil,nil,{1, 100}}, 600},
		{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 4, 1}, nil,nil,{1, 100}}, 200},
		{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 10, 1}, nil,nil,{1, 100}}, 50},
		{{"M�nh Thi�n M�n", {2, 1, 30410, 2, 1}, nil,nil,{1, 100}}, 400},
		{{"M�nh Thi�n M�n", {2, 1, 30410, 4, 1}, nil,nil,{1, 100}}, 100},
		{{"M�nh Thi�n M�n", {2, 1, 30410, 20, 1}, nil,1,{1, 100}}, 20},
		{{"Thi�n M�n Kim L�nh", {2, 1, 30370, 1, 1}, nil,1,{1, 100}}, 1},
		-- {{"��������", {0, 152, 26, 1, 1}, nil,nil,{1, 100}}, 50},
		-- {{"��Ѫ����", {0, 152, 27, 1, 1}, nil,nil,{1, 100}}, 50},
		-- {{"���ι���", {0, 152, 28, 1, 1}, nil,nil,{1, 100}}, 50},
		{{"Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1, 1}, 15,nil,{1, 100}}, 500},
		{{"B�ch Kim ��i H�ng Bao (kh�ng)", {2, 1, 30228, 1, 1}, 15,nil,{1, 100}}, 100},
		{{"�o kho�c Hi�p C�t", {0, 152, 29, 1, 1}, nil,1,{1, 100}}, 30},
		{{"�o kho�c Q�y Ph�", {0, 152, 30, 1, 1}, nil,1,{1, 100}}, 30},
		{{"�o kho�c ��ng V�n", {0, 152, 31, 1, 1}, nil,1,{1, 100}}, 30},
		{{"Phi�u ��i Ngo�i Trang", {2, 1, 31233, 1, 1}, nil,nil,{1, 100}}, 500},
		{{"Nh�n S�m V�n N�m", {2, 1, 30071, 5, 1}, nil,1,{1, 100}}, 784},
		{{"T�i �� Qu� C�p 1", {2, 1, 30998, 1, 1}, nil,nil,{1, 100}}, 400},
		{{"T�i �� Qu� C�p 2", {2, 1, 30999, 1, 1}, nil,nil,{1, 100}}, 300},
		{{"T�i �� Qu� C�p 3", {2, 1, 31000, 1, 1}, nil,1,{1, 100}}, 100},

		{{"Kinh M�ch Ng�n Nh�n", {2, 1, 30731, 1, 1}, nil, nil, {1,100}}, 500},
		{{"M�nh Th� C��i", {2, 1, 31386, 1, 1}, nil, nil, {1,100}}, 500},
		{{"Linh Ngh�", 	 {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, nil, 1, {1,100}}, 1},
		{{"Phong S��ng Ki�m", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, nil, 1, {1,100}}, 1},
		{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 5, 1}, nil, nil, {1,100}}, 638},
		{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 1, 1}, nil, nil, {1,100}}, 500},
		{{"Hoan L�ng Phi Phong", {0, 152, 32, 1, 1}, nil, 1, {1,100}}, 5},
		{{"��ng Giao Phi Phong", {0, 152, 33, 1, 1}, nil, 1, {1,100}}, 5},
		{{"Kh�i Ph��ng Phi Phong", {0, 152, 34, 1, 1}, nil, 1, {1,100}}, 5},
	},
}

t_dxg_card_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu l�t th� mi�n ph� ��a Huy�n Cung",
		--����û�еõ�װ��ʱ�س�װ��
		t_equip_round = {},
		n_max_daibi_perday = 30,--һ������ö��ٴ���
		t_stage =
		{
			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "Ph�n th��ng c� ��nh �i ��a Huy�n Cung",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu l�t th� thu ph� ��a Huy�n Cung",
		t_stage = 
		{
			[1] = _t_ib_award_no_stage1,
			[2] = _t_ib_award_no_stage2,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage1 = nil
_t_ib_award_no_stage2 = nil
