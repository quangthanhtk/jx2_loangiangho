--�������޸ĵ�������д����
Include("\\script\\isolate\\online_activites\\every_month\\config.lua")
ENABLE_EXTEND_EVENT = 1

tStaticConfig  =  {
    --tExpPrize = {1000000, 1000000, 1500000},
	tProductsMaxUse = {2000, 2000, 2000}, --��Ʒ���ʹ�ô���
	tProductsExtAward = {200, 200, 200}, --ʹ�ô����ﵽ��ô�� �����������2
	nExtAwardBegin = 600,
	--tNormalRoomWeightCheck = {3, 100},
	--tFinalRoomWeightCheck = {5, 100},
	tProductPrize = {--ʹ�ò�Ʒ����
		[1] = {"act_2xu_free", "act_2xu_free2"},
		[2] = {"act_2xu_free", "act_2xu_free2"},
		[3] = {"act_2xu_ib", "act_2xu_ib2"},
	},
	tExtraPrize = {
		[1] = {
			--room, 
			[200] = {3, 
					{
						{"Thi�n Th�ch Tinh Th�ch", 2, 1, 1009, 1, 1, 7},
					},
				},
			[400] = {3,
					{
						{"C��ng h�a quy�n 13", 2, 1, 30425, 1, 1, 7},
					},
				},
		},
		[2] = {
			--room, award
			[200] = {3, 
					{
						{"Thi�n Th�ch Tinh Th�ch", 2, 1, 1009, 1, 1, 7},
					},
				},
			[400] = {3,
					{
						{"C��ng h�a quy�n 13", 2, 1, 30425, 1, 1, 7},
					},
				},
		},
		[3] = {
			--room, 
			[200] = {3, 
					{
						{"Thi�n Th�ch Tinh Th�ch", 2, 1, 1009, 1, 1, 7},
					},
				},
			[400] = {3,
					{
						{"C��ng h�a quy�n 15", 2, 1, 30427, 1, 1, 7},
					},
				},
		},
	},
}

