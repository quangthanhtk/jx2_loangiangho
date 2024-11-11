Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\missions\\cangjianshanzhuang\\mission_award_hard.lua")

Include("\\script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")

tbNormalAward = 
{
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,5000000,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,7000000,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,8000000,1},
		},
	},
}

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--�����������ĸ���
	n_equip_group_rate = 0,--�����װ����ĸ���
	n_daibi_group_rate = 0,--�����������ĸ���
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"��ϼ�ؼ�",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        { {"����ʯ", {2,1,30368,1}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,2}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,3}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,4}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,5}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,6}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,7}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,8}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,9}, nil,nil, {1, 100}}, 800},
--        { {"����ʯ", {2,1,30368,10}, nil,nil, {1, 100}}, 500},
--        { {"����ʯ", {2,1,30368,15}, nil,nil, {1, 100}}, 300},
--        { {"����ʯ", {2,1,30368,20}, nil,nil, {1, 100}}, 200},
--        { {"����ʯ", {2,1,30368,30}, nil,nil, {1, 100}}, 100},
--        { {"����ʯ", {2,1,30368,40}, nil,nil, {1, 100}}, 100},
	},
	--------------------------------------------
	t_other_group = --������
	{
		--{{szItemName,{g,d,p,n,bind,...},expiretime(day),bMsg(1=yes),{room,weight}}, ����},
        {{"C�y B�t Nh� nh�",		{2, 0, 	 504, 	1, 1}, 7,	nil,	{1, 100}}, 600},
		{{"C�y B�t Nh�",		{2, 0, 	 398, 	1, 1}, 7,	nil,	{1, 100}}, 300},
		{{"C�y T� Linh",			{2, 1, 	 30269, 1, 1}, 7,	nil,	{1, 100}}, 400},
		{{"Tu Ch�n Y�u Quy�t",		{2, 0, 	 554, 	1, 1}, 7,	nil,	{1, 100}}, 400},
		{{"T� Linh Quy Nguy�n ��n",		{2, 1, 	 30352, 1, 1}, 7,	nil,	{1, 100}}, 500},
		{{"B�i Nguy�n ��n",			{2, 1, 	 30351, 1, 1}, 7,	nil,	{1, 100}}, 600},
		{{"B�ng Tinh Th�ch",			{2, 1, 	 30554, 1, 1}, nil,	nil,	{1, 100}}, 500},
		{{"B�ch C�u Ho�n",			{2, 1,	 270, 	1, 1}, 7,	nil,	{1, 100}}, 500},
		{{"T�y T�m Th�ch Kho�ng",		{2, 1, 	 30536, 1, 1}, nil,	nil,	{1, 100}}, 500},
		{{"Luy�n L� Thi�t Kho�ng",		{2, 1, 	 30537, 1, 1}, nil,	nil,	{1, 100}}, 500},
		{{"T�i ti�n",			{2, 1,	 30367, 1, 1}, nil,	nil,	{1, 100}}, 500},
		{{"Gi�y V�i Th�",			{0, 154, 1, 	1, 1}, nil,	nil,	{1, 100}}, 300},
		{{"Tinh Tr� B� H�i",		{0, 154, 2, 	1, 1}, nil,	nil,	{1, 100}}, 300},
		{{"B� Ch� Cao ��ng Ngoa",		{0, 154, 3, 	1, 1}, nil,	nil,	{1, 100}}, 300},
		{{"Chi�n H�i Kim Ch� ng� h�nh",		{0, 154, 4, 	1, 1}, nil,	nil,	{1, 100}}, 200},
		{{"Chi�n H�i M�c Ch� ng� h�nh",		{0, 154, 5, 	1, 1}, nil,	nil,	{1, 100}}, 200},
		{{"Chi�n H�i Th�y Ch� ng� h�nh",		{0, 154, 6,		1, 1}, nil,	nil,	{1, 100}}, 200},
		{{"Chi�n H�i H�a Ch� ng� h�nh",		{0, 154, 7,		1, 1}, nil,	nil,	{1, 100}}, 200},
		{{"Chi�n H�i Th� Ch� ng� h�nh",		{0, 154, 8,		1, 1}, nil,	nil,	{1, 100}}, 200},
		{{"Chi�n H�i �m Ch� ng� h�nh",		{0, 154, 9,		1, 1}, nil,	nil,	{1, 100}}, 200},
		{{"Tr��ng H�i Du Hi�p", 		{0, 154, 26, 	1, 1}, nil,	nil,	{1, 100}}, 30},
		{{"Chi�n H�i Thi�t Huy�t", 		{0, 154, 27, 	1, 1}, nil,	nil,	{1, 100}}, 30},
		{{"��o H�i V�n Du", 		{0, 154, 28, 	1, 1}, nil,	nil,	{1, 100}}, 30},
		{{"Hi�p C�t Tr��ng Ngoa", 		{0, 154, 29, 	1, 1}, nil,	1,		{1, 100}}, 5},
		{{"Q�y Ph� Chi�n Ngoa", 		{0, 154, 30, 	1, 1}, nil,	1,		{1, 100}}, 5},
		{{"��ng V�n ��o Ngoa", 		{0, 154, 31, 	1, 1}, nil,	1,		{1, 100}}, 5},
		{{"Nh�n S�m V�n N�m", 		{2, 1, 	 30071, 1, 1}, nil,	nil,	{1, 100}}, 1095},
		{{"T�i �� Qu� C�p 1", 		{2, 1, 	 30998, 1, 1}, nil,	nil,	{1, 100}}, 400},
		{{"T�i �� Qu� C�p 2", 		{2, 1, 	 30999, 1, 1}, nil,	nil,	{1, 100}}, 300},
		{{"T�i �� Qu� C�p 3", 		{2, 1, 	 31000, 1, 1}, nil,	nil,	{1, 100}}, 100},

		{{"Kinh M�ch Ng�n Nh�n",		{2, 1,	 30731, 1, 1}, nil,	nil,	{1,	100}}, 100},
		{{"M�nh Th� C��i",		{2, 1, 	 31386, 1, 1}, nil,	nil,	{1,	100}}, 200},
		{{"M�nh Gi�y Kim X� Lv6",	{2, 1, 	 31383, 1, 1}, nil,	nil,	{1,	100}}, 200},
		{{"M�nh Gi�y Kim X� Lv7",	{2, 1, 	 31397, 1, 1}, nil, nil,	{1,	100}}, 100},


	},
};
_t_free_award_stage =
{
--	[1] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 3000,--�����������ĸ���
--        	t_equip_group = --װ����
--        	{
--        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        	},
--		},
--	[2] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 4000,--�����������ĸ���
--        	t_equip_group = --װ����
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 9000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        	},
--		},
--	[3] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 5000,--�����������ĸ���
--        	t_equip_group = --װ����
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 3000},
--        	},
--		},
--	[4] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 5000,--�����������ĸ���
--        	t_equip_group = --װ����
--        	{
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 2000},
--        		{{MA_GiveLevel2WenShi, {1, nil, nil, 0, {1, 100}}}, 500},
--        		{{MA_GiveTongTianEquip, {1, nil, nil, 0, {1, 300}}}, 1500},
--        	},
--		},
	[4] = {},
}

_t_fix_award_stage =
{
	[1] =
		{
        	{MA_GiveExp, {600000}},
		},
	[2] =
		{
			{MA_GiveExp, {700000}},
		},
	[3] =
		{
			{MA_GiveExp, {800000}},
		},
	[4] =
		{
			{MA_GiveExp, {900000}},
		},
}

_t_ib_award_no_stage =
{
	t_cost = --����
	{
		--{"��ϼ�ؼ�",{0,107,65,1, 4}},
		{"Thi�n Ki�u L�nh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib����
	{
        {{"C�y B�t Nh� nh�",		{2, 0,	 504,	1,	1},	7,	 nil,	{1, 100}}, 600},
		{{"C�y B�t Nh�", 		{2, 0,	 398,	1,	1},	7,	 nil,	{1, 100}}, 200},
		{{"C�y T� Linh", 			{2, 1,	 30269,	1,	1},	7,	 nil,	{1, 100}}, 400},
		{{"B�ch C�u Ho�n", 			{2, 1,	 270,	1,	1},	7,	 nil,	{1, 100}}, 600},
		{{"��i B�ch C�u ho�n", 		{2, 1,	 1007,	1,	1},	7,	 nil,	{1, 100}}, 600},
		{{"B�ch C�u Ti�n ��n", 		{2, 1,	 1008,	1,	1},	7,	 nil,	{1, 100}}, 600},
		{{"��i Nh�n s�m", 		{2, 0,	 553,	1,	1},	7,	 nil,	{1, 100}}, 500},
		--{{"Ӣ��ѫ��", 		{2, 1,	 30499,	1,	1},	nil, nil,	{1, 100}}, 600},
		{{"Hu�n ch��ng anh h�ng", 		{2, 1,	 30499,	2,	1},	nil, nil,	{1, 100}}, 500},
		{{"Hu�n ch��ng anh h�ng", 		{2, 1,	 30499,	4,	1},	nil, nil,	{1, 100}}, 100},
		{{"Hu�n ch��ng anh h�ng", 		{2, 1,	 30499, 10,	1},	nil, nil,	{1, 100}}, 100},
		{{"Chi�n H�i Kim Ch� ng� h�nh", 	{0, 154, 4,		1,	1},	nil, nil,	{1, 100}}, 100},
		{{"Chi�n H�i M�c Ch� ng� h�nh", 	{0, 154, 5,		1,	1},	nil, nil,	{1, 100}}, 100},
		{{"Chi�n H�i Th�y Ch� ng� h�nh", 	{0, 154, 6,		1,	1},	nil, nil,	{1, 100}}, 100},
		{{"Chi�n H�i H�a Ch� ng� h�nh", 	{0, 154, 7,		1,	1},	nil, nil,	{1, 100}}, 100},
		{{"Chi�n H�i Th� Ch� ng� h�nh", 	{0, 154, 8,		1,	1},	nil, nil,	{1, 100}}, 100},
		{{"Chi�n H�i �m Ch� ng� h�nh", 	{0, 154, 9,		1,	1},	nil, nil,	{1, 100}}, 100},
		{{"M�nh Thi�n M�n", 		{2, 1,	 30410,	2,	1},	nil, nil,	{1, 100}}, 400},
		{{"M�nh Thi�n M�n", 		{2, 1,	 30410,	4,	1},	nil, nil,	{1, 100}}, 100},
		{{"M�nh Thi�n M�n", 		{2, 1,	 30410,	20,	1},	nil, 1,		{1, 100}}, 20},
		{{"Thi�n M�n Kim L�nh", 		{2, 1,	 30370, 1,	1},	nil, 1,		{1, 100}}, 1},
		-- {{"������ѥ", 		{0, 154, 26,	1,	1},	nil, nil,	{1, 100}}, 50},
		-- {{"��Ѫսѥ", 		{0, 154, 27,	1,	1},	nil, nil,	{1, 100}}, 50},
		-- {{"���ε�ѥ", 		{0, 154, 28,	1,	1},	nil, nil,	{1, 100}}, 50},
		{{"Ho�ng Kim ��i H�ng Bao (tr�ng)",	{2, 1,	 538,	1,	1},	15,	 nil,	{1, 100}}, 500},
		{{"B�ch Kim ��i H�ng Bao (kh�ng)", 	{2, 1,	 30228, 1,	1},	15,	 nil,	{1, 100}}, 40},
		{{"Hi�p C�t Tr��ng Ngoa", 		{0, 154, 29,	1,	1},	nil, 1,		{1, 100}}, 10},
		{{"Q�y Ph� Chi�n Ngoa", 		{0, 154, 30,	1,	1},	nil, 1,		{1, 100}}, 10},
		{{"��ng V�n ��o Ngoa", 		{0, 154, 31,	1,	1},	nil, 1,		{1, 100}}, 10},
		{{"Phi�u ��i Ngo�i Trang", 		{2, 1,	 31233,	1,	1},	nil, nil,	{1, 100}}, 500},
		{{"Nh�n S�m V�n N�m", 		{2, 1,	 30071,	5,	1},	nil, nil,	{1, 100}}, 654},
		{{"T�i �� Qu� C�p 1", 		{2, 1,	 30998,	1,	1},	nil, nil,	{1, 100}}, 300},
		{{"T�i �� Qu� C�p 2", 		{2, 1,	 30999,	1,	1},	nil, nil,	{1, 100}}, 300},
		{{"T�i �� Qu� C�p 3", 		{2, 1,	 31000,	1,	1},	nil, 1,		{1, 100}}, 200},

		{{"Kinh M�ch Ng�n Nh�n",		{2, 1,	 30731,	1,	1}, nil, nil,	{1,	100}}, 500},
		{{"M�nh Th� C��i",		{2, 1,	 31386,	1,	1}, nil, nil,	{1,	100}}, 500},
		{{"Linh Ngh�",			{0, 105, 201,	1,	1,-1,-1,-1,-1,-1,-1}, nil, 1,		{1,	100}}, 1},
		{{"Phong S��ng Ki�m",		{0, 105, 209,	1,	1,-1,-1,-1,-1,-1,-1}, nil, 1,		{1,	100}}, 1},
		{{"M�nh Gi�y Kim X� Lv6",	{2, 1,	 31383,	5,	1}, nil, nil,	{1,	100}}, 623},
		{{"M�nh Gi�y Kim X� Lv7",	{2, 1, 	 31397, 1, 	1}, nil, nil,	{1,	100}}, 500},

		{{"Hoan L�ng Ngoa",		{0, 154, 32,	1,	1}, nil, 1,		{1,	100}}, 10},
		{{"��ng Giao Ngoa",		{0, 154, 33,	1,	1}, nil, 1,		{1,	100}}, 10},
		{{"Kh�i Ph��ng Ngoa",		{0, 154, 34,	1,	1}, nil, 1,		{1,	100}}, 10},
	},
}

t_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu l�t b�i mi�n ph� V�n Ki�m Tr�ng",
		--����û�еõ�װ��ʱ�س�װ��
		t_equip_round = {},
		n_max_daibi_perday = 30,--һ������ö��ٴ���
		t_stage =
		{
--			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
--			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
--			[3] = inherit(_t_free_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "Ph�n th��ng c� ��nh �i V�n Ki�m Tr�ng",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu l�t b�i thu ph� V�n Ki�m Tr�ng",
		t_stage = 
		{
--			[1] = _t_ib_award_no_stage,
--			[2] = _t_ib_award_no_stage,
--			[3] = _t_ib_award_no_stage,
			[4] = _t_ib_award_no_stage,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage = nil
