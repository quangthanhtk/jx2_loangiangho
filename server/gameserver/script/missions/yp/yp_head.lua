--һЩ��������
Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\lib\\sdb.lua")
Import("\\script\\lib\\time.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalvalue.lua")

g_nDebugVersion = 0;   --debug�汾

FIELD_PVP_RELAY_KEY = "FIELD_PVP_CAMP_CHARM"; --����ֵ

--����������ͼID
tMainMapID = {{6000,"��i L� Thi�n Long T�"},{6100,"Th� Ph�n Qu�nh K�t"},{6200,"T�y H� H�ng Kh�nh"},{6300,"Th�t L�c Nhai"},{6400,"Thi�n �m Th�nh ��a"}};
--��Ӫ
CampOne = "yp_dali"; 		--��Ӫ1���ͣ�����npc
CampTwo = "yp_xx";  		--��Ӫ2���ͣ�����npc
CampThree = "yp_tubo";	--��Ӫ3���ͣ�����npc
CampNeutral = "yp_zhuli";		--����npc��Ӫ����
CampJiangYou = "yp_jiangyou"; --�����ţ������϶���ͬ��

tAllCamp = {
	[1] = CampOne,
	[2] = CampTwo,
	[3] = CampThree,
	[4] = CampNeutral,
	[5] = CampJiangYou,
};

--��ʱ������
tTempRev = {
	[1] = {
		[6000] = {6000,1588,2772},
		[6100] = {6300,1412,3624},
		[6200] = {6300,1412,3624},
		[6300] = {6300,1412,3624},
		[6400] = {6300,1412,3624},
	},
	[2] = {
		[6000] = {6300,1176,3277},
		[6100] = {6100,1671,3668},
		[6200] = {6300,1176,3277},
		[6300] = {6300,1176,3277},
		[6400] = {6300,1176,3277},
	},
	[3] = {
		[6000] = {6300,1364,2970},
		[6100] = {6300,1364,2970},
		[6200] = {6200,1483,2644},
		[6300] = {6300,1364,2970},
		[6400] = {6300,1364,2970},
	},
	[5] = {
		[6000] = {6000,1588,2772},
		[6100] = {6100,1671,3668},
		[6200] = {6200,1483,2644},
		[6300] = {6300,1412,3624},
		[6400] = {6300,1412,3624},
	},
};

tNpcs = {
	[6000] = {
		cdz1 = {"DaLi_CDZ", "��i L� Truy�n ��o 1", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz2 = {"DaLi_CDZ", "��i L� Truy�n ��o 2", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz3 = {"DaLi_CDZ", "��i L� Truy�n ��o 3", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz4 = {"DaLi_CDZ", "��i L� Truy�n ��o 4", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz5 = {"DaLi_CDZ", "��i L� Truy�n ��o 5", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz6 = {"DaLi_CDZ", "��i L� Truy�n ��o 6", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz7 = {"DaLi_CDZ", "��i L� Truy�n ��o 7", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz8 = {"DaLi_CDZ", "��i L� Truy�n ��o 8", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz9 = {"DaLi_CDZ", "��i L� Truy�n ��o 9", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		chd = {"�i�m C�i L�a", "�i�m C�i L�a", nil,910, CampPlayer, 0},
		army1 = {"Tr� Tr� Thi�n Long T�", "Tr� Tr� Thi�n Long T�", "\\script\\missions\\yp\\tls\\mission.lua", 900, CampOne, 0, "\\script\\missions\\yp\\tls\\mission.lua"},
		army2 = {"Ch�p S� Thi�n Long T� 1", "Ch�p S� Thi�n Long T�", "\\script\\missions\\yp\\army_npc.lua", 900, CampOne, 0},
		army3 = {"Ch�p S� Thi�n Long T� 2", "Ch�p S� Thi�n Long T�", "\\script\\missions\\yp\\army_npc.lua", 900, CampOne, 0},
				
		bt = {"Ti�u ��u Tr�n Vi�n Ti�u C�c","Ti�u ��u Tr�n Vi�n Ti�u C�c","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampOne,0},
--		qhys = {"�ຣ����","�ຣ����","\\script\\missions\\yp\\qhys_npc.lua",nil,CampOne,0},
			
		tree1 = {"Th�i H� C� Th� 1", "Th�i H� C� Th�", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		tree2 = {"Th�i H� C� Th� 2", "Th�i H� C� Th�", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		tree3 = {"Th�i H� C� Th� 3", "Th�i H� C� Th�", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		dqh = {"�o�n Khinh H�u","�o�n Khinh H�u","\\script\\missions\\yp\\dqh_npc.lua", nil, CampOne, 0},
		dqr = {"�o�n Khinh Nh�n", "�o�n Khinh Nh�n", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampOne, 0},
		dxy = {"�o�n T�m Di", "�o�n T�m Di", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampOne, 0},
		db = {"�o�n B�ch", "�o�n B�ch", "\\script\\missions\\yp\\db_npc.lua", nil, CampOne, 0},
		dhf = {"�o�n H�a Phong","�o�n H�a Phong","\\script\\missions\\yp\\dhf_npc.lua", nil, CampOne, 0},
		db = {"�o�n B�ch", "�o�n B�ch", "\\script\\missions\\yp\\db_npc.lua", nil, CampOne, 0},
		jy1 = {"Th�ng Qu�n Ho�ng T�c ��i L�", "Th�ng Qu�n Ho�ng T�c ��i L�", nil, nil, CampOne, 0},
		jy2 = {"�o�n Ng�c Nhi", "�o�n Ng�c Nhi", nil, nil, CampOne, 0},
		cnhw = {"H� V� Thi�n Long T�", "H� V� Th�nh N�i", nil, nil, CampOne, 0},
		cnhw2 = {"H� V� Thi�n Long T�", "H� V� Th�nh N�i", nil, nil, CampOne, 0},
		hrhw = {"H� V� Thi�n Long T�", "H� V� Th�nh Bi�n", nil, nil, CampOne, 0},
		bgy = {"R��ng �� Trung Nguy�n","Th� Kh�","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
		ydlb = {"Ch��ng d��c Trung Nguy�n","Ch� D��c �i�m","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
	},
	[6100] = {
		cdz1 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 1", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz2 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 2", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz3 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 3", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz4 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 4", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz5 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 5", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz6 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 6", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz7 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 7", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz8 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 8", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz9 = {"TuBo_CDZ", "Th� Ph�n Truy�n ��o 9", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		chd = {"�i�m C�i L�a", "�i�m C�i L�a", nil,910, CampPlayer, 0},
		army1 = {"Tr� Tr� H�a Sinh T�", "Tr� Tr� H�a Sinh T�", "\\script\\missions\\yp\\hss\\mission.lua", 900, CampTwo, 0, "\\script\\missions\\yp\\hss\\mission.lua"},
		army2 = {"Ch�p S� H�a Sinh T� 1", "Ch�p S� H�a Sinh T�", "\\script\\missions\\yp\\army_npc.lua", 900, CampTwo, 0},
		army3 = {"Ch�p S� H�a Sinh T� 2", "Ch�p S� H�a Sinh T�", "\\script\\missions\\yp\\army_npc.lua", 900, CampTwo, 0},
				
		bt = {"Ti�u ��u Tr�n Vi�n Ti�u C�c","Ti�u ��u Tr�n Vi�n Ti�u C�c","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampTwo,0},
--		qhys = {"�ຣ����","�ຣ����","\\script\\missions\\yp\\qhys_npc.lua",nil,CampTwo,0},
			
		tree1 = {"Th�i H� C� Th� 1", "Th�i H� C� Th�", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		tree2 = {"Th�i H� C� Th� 2", "Th�i H� C� Th�", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		tree3 = {"Th�i H� C� Th� 3", "Th�i H� C� Th�", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		dqh = {"��t T�y �ng T�c","��t T�y �ng T�c","\\script\\missions\\yp\\dqh_npc.lua", nil, CampTwo, 0},
		dqr = {"C�c B�n C�c Qu�", "C�c B�n C�c Qu�", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampTwo, 0},
		dxy = {"N�i ��ng Qu�ch Nhi�p", "N�i ��ng Qu�ch Nhi�p", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampTwo, 0},
		dhf = {"�� T�ng C�t Ng�a","�� T�ng C�t Ng�a","\\script\\missions\\yp\\dhf_npc.lua", nil, CampTwo, 0},
		db = {"T�n Ph� Kham B�", "T�n Ph� Kham B�", "\\script\\missions\\yp\\db_npc.lua", nil, CampTwo, 0},
		jy1 = {"L� Nguy�n Tr�n", "L� Nguy�n Tr�n", nil, nil, CampTwo, 0},
		jy2 = {"Sa Ca Ninh B�", "Sa Ca Ninh B�", nil, nil, CampTwo, 0},		
		cnhw = {"H� V� H�a Sinh T�", "H� V� Th�nh N�i", nil, nil, CampTwo, 0},
		cnhw2 = {"H� V� H�a Sinh T�", "H� V� Th�nh N�i", nil, nil, CampTwo, 0},
		hrhw = {"H� V� H�a Sinh T�", "H� V� Th�nh Bi�n", nil, nil, CampTwo, 0},
		bgy = {"R��ng �� Trung Nguy�n","Th� Kh�","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},
		ydlb = {"Ch��ng d��c Trung Nguy�n","Ch� D��c �i�m","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},		
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},
	},	
	[6200] = {
		cdz1 = {"Mm_CDZ", "T�y H� Truy�n ��o 1", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz2 = {"Mm_CDZ", "T�y H� Truy�n ��o 2", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz3 = {"Mm_CDZ", "T�y H� Truy�n ��o 3", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz4 = {"Mm_CDZ", "T�y H� Truy�n ��o 4", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz5 = {"Mm_CDZ", "T�y H� Truy�n ��o 5", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz6 = {"Mm_CDZ", "T�y H� Truy�n ��o 6", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz7 = {"Mm_CDZ", "T�y H� Truy�n ��o 7", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz8 = {"Mm_CDZ", "T�y H� Truy�n ��o 8", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz9 = {"Mm_CDZ", "T�y H� Truy�n ��o 9", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		chd = {"�i�m C�i L�a", "�i�m C�i L�a", nil,910, CampPlayer, 0},
		army1 = {"T�y H� Chinh Nam T��ng Qu�n", "T�y H� Chinh Nam T��ng Qu�n", "\\script\\missions\\yp\\mm\\mission.lua", 900, CampThree, 0, "\\script\\missions\\yp\\mm\\mission.lua"},
		army2 = {"T�y H� Chinh Nam Qu�n S� 1", "T�y H� Chinh Nam Qu�n S� ", "\\script\\missions\\yp\\army_npc.lua", 900, CampThree, 0},
		army3 = {"T�y H� Chinh Nam Qu�n S� 2", "T�y H� Chinh Nam Qu�n S� ", "\\script\\missions\\yp\\army_npc.lua", 900, CampThree, 0},
				
		bt = {"Ti�u ��u Tr�n Vi�n Ti�u C�c","Ti�u ��u Tr�n Vi�n Ti�u C�c","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampThree,0},
--		qhys = {"�ຣ����","�ຣ����","\\script\\missions\\yp\\qhys_npc.lua",nil,CampThree,0},
			
		tree1 = {"Th�i H� C� Th� 1", "Th�i H� C� Th�", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		tree2 = {"Th�i H� C� Th� 2", "Th�i H� C� Th�", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		tree3 = {"Th�i H� C� Th� 3", "Th�i H� C� Th�", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		dqh = {"L� ��c Kh�nh","L� ��c Kh�nh","\\script\\missions\\yp\\dqh_npc.lua", nil, CampThree, 0},
		dqr = {"L� ��c D�c", "L� ��c D�c", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampThree, 0},
		dxy = {"L� Nguy�n L��ng", "L� Nguy�n L��ng", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampThree, 0},
		dhf = {"L� K� Minh","L� K� Minh","\\script\\missions\\yp\\dhf_npc.lua", nil, CampThree, 0},
		db = {"L� Nguy�n H�c", "L� Nguy�n H�c", "\\script\\missions\\yp\\db_npc.lua", nil, CampThree, 0},
		jy1 = {"Thi�u M�n Ch�", "Thi�u M�n Ch�", nil, nil, CampThree, 0},
		cnhw = {"V� S� Minh M�n", "H� V� Th�nh N�i", nil, nil, CampThree, 0},
		cnhw2 = {"V� S� Minh M�n", "H� V� Th�nh N�i", nil, nil, CampThree, 0},
		hrhw = {"V� S� Minh M�n", "H� V� Th�nh Bi�n", nil, nil, CampThree, 0},
		bgy = {"R��ng �� Trung Nguy�n","Th� Kh�","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},
		ydlb = {"Ch��ng d��c Trung Nguy�n","Ch� D��c �i�m","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},					
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},
	},
	[6300] = {
		kmds = {"V� L�m Minh-Kh� M�c ��i S�","V� L�m Minh-Kh� M�c ��i S�","\\script\\missions\\yp\\kmds_npc.lua",nil,CampNeutral,0},
		qhys = {"Thanh H�i Di�m Th��ng","Thanh H�i Di�m Th��ng","\\script\\missions\\yp\\qhys_npc.lua",nil,CampNeutral,0},
		xbr = {"T�m B�o Nh�n","T�m B�o Nh�n","\\script\\missions\\yp\\qmy\\mission.lua",nil,CampNeutral,0},
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampNeutral, 0},
	},
}

tPos = {
	[6000] = {
		cdz1 = {{1380,2491}},
		cdz2 = {{1458,2537}},
		cdz3 = {{1560,2521}},
		cdz4 = {{1406,2675}},
		cdz5 = {{1495,2604}},
		cdz6 = {{1524,2740}},
		cdz7 = {{1310,2800}},
		cdz8 = {{1390,2940}},
		cdz9 = {{1519,2930}},
		bt = {{1628,2784}},
--		qhys = {{1538,3151}},
		chd = {
			{1382,2491},
			{1460,2537},
			{1562,2521},
			{1408,2675},
			{1497,2604},
			{1526,2740},
			{1312,2800},
			{1392,2940},
			{1521,2930},	
		},
		army = {{1380,2516}},	
		tree1 = {{1482,2815}},
		tree2 = {{1516,2642}},
		tree3 = {{1420,2627}},
		dqh = {{1576,2735}},
		dqr = {{1594,2795}},
		dxy = {{1570,2768}},
		dhf = {{1623,2805}},
		db = {{1592,2780}},
		jy1 = {{1555,2743}},
		jy2 = {{1613,2807}},
		cnhw = {{1569,2740}},
		cnhw2 = {{1579,2720}},
		hrhw = {{1563,2734}},
		bgy = {{1605,2821}},
		ydlb = {{1544,2753}},
		cf = {{1585,2723}},
	},
	[6100] = {
		cdz1 = {{1565,3244}},
		cdz2 = {{1781,3292}},
		cdz3 = {{1904,3316}},
		cdz4 = {{1601,3502}},
		cdz5 = {{1723,3461}},
		cdz6 = {{1902,3570}},
		cdz7 = {{1658,3799}},
		cdz8 = {{1760,3711}},
		cdz9 = {{1892,3884}},
		bt = {{1727,3629}},
--		qhys = {{1538,3151}},
		chd = {
			{1567,3244},
			{1783,3292},
			{1906,3316},
			{1603,3502},
			{1725,3461},
			{1904,3570},
			{1660,3799},
			{1762,3711},
			{1894,3884},	
		},
		army = {{1644,3191}},	
		tree1 = {{1763,3747}},
		tree2 = {{1773,3425}},
		tree3 = {{1653,3465}},
		dqh = {{1602,3657}},
		dqr = {{1695,3599}},
		dxy = {{1655,3602}},
		dhf = {{1680,3698}},
		db = {{1672,3640}},
		jy1 = {{1590,3667}},
		jy2 = {{1591,3681}},		
		cnhw = {{1603,3668}},
		cnhw2 = {{1647,3613}},
		hrhw = {{1629,3620}},
		bgy = {{1650,3668}},
		ydlb = {{1621,3698}},
		cf = {{1642,3730}},
	},		
	[6200] = {
		cdz1 = {{1167,2665}},
		cdz2 = {{1362,2727}},
		cdz3 = {{1528,2735}},
		cdz4 = {{1232,2918}},
		cdz5 = {{1360,2915}},
		cdz6 = {{1559,2920}},
		cdz7 = {{1179,3138}},
		cdz8 = {{1352,3140}},
		cdz9 = {{1424,3152}},
		bt = {{1467,2643}},
--		qhys = {{1538,3151}},
		chd = {
			{1169,2665},
			{1364,2727},
			{1530,2735},
			{1234,2918},
			{1362,2915},
			{1561,2920},
			{1181,3138},
			{1354,3140},
			{1426,3152},	
		},
		army = {{1274,3020}},	
		tree1 = {{1390,2935}},
		tree2 = {{1508,2872}},
		tree3 = {{1232,2861}},
		dqh = {{1465,2585}},
		dqr = {{1406,2645}},
		dxy = {{1523,2631}},
		dhf = {{1484,2587}},
		db = {{1417,2631}},
		jy1 = {{1160,2714}},		
		cnhw = {{1467,2694}},
		cnhw2 = {{1476,2587}},
		hrhw = {{1423,2685}},
		bgy = {{1462,2706}},
		ydlb = {{1434,2618}},
		cf = {{1486,2681}},
	},
	[6300] = {
		kmds = {{1389,3269}},
		qhys = {{1367,3271}},
		cf = {{1387,3248}},
		xbr = {{1462,3410}},
	},
} 

if g_nDebugVersion == 1 then
	tCreatTime = {--����ʱ��
		100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2300		
	};
else
	tCreatTime = {--����ʱ��
		1100,1700,2100,
	};
end

tBzPos = { --���ص������
	[6000] = {
		{1382,2499},{1391,2530},{1402,2500},{1403,2470},{1419,2445},{1456,2454},{1492,2447},{1520,2475},{1541,2451},{1555,2513},
		{1517,2537},{1488,2513},{1445,2432},{1413,2524},{1406,2560},{1438,2575},{1478,2570},{1473,2487},{1431,2615},{1421,2652},
		{1364,2591},{1370,2629},{1408,2670},{1445,2648},{1457,2633},{1453,2678},{1435,2693},{1468,2716},{1481,2681},{1503,2692},
		{1515,2726},{1532,2711},{1522,2674},{1504,2650},{1487,2630},{1498,2604},{1525,2590},{1541,2608},{1532,2642},{1566,2628},
		{1563,2591},{1579,2614},{1559,2668},{1569,2896},{1561,2925},{1539,2947},{1518,2966},{1500,2992},{1486,3015},{1466,2984},
		{1480,2967},{1502,2950},{1505,2923},{1526,2890},{1513,2869},{1491,2881},{1477,2907},{1462,2882},{1454,2915},{1438,2946},
		{1419,2972},{1402,2957},{1386,2942},{1391,2910},{1412,2892},{1469,2861},{1448,2833},{1474,2811},{1493,2818},{1446,2806},
		{1457,2770},{1436,2770},{1435,2782},{1413,2768},{1416,2723},{1392,2716},{1370,2706},{1343,2712},{1361,2738},{1338,2756},
		{1303,2745},{1311,2786},{1307,2807},{1348,2769},{1376,2774},{1387,2810},{1354,2877},{1332,2837},{1492,2685},{1426,2685},
		{1419,2558},{1470,2501},{1516,2478},{1541,2530},{1480,2564},{1521,2633},{1555,2628},{1530,2684},{1464,2783},{1420,2831},
	},
	[6100] = {
		{1570,3243},{1600,3259},{1602,3209},{1638,3173},{1641,3228},{1677,3179},{1710,3164},{1675,3133},{1578,3329},{1615,3348},
		{1636,3302},{1669,3285},{1721,3246},{1749,3197},{1783,3210},{1791,3249},{1842,3240},{1821,3293},{1869,3299},{1895,3322},
		{1883,3366},{1893,3425},{1849,3439},{1845,3385},{1837,3339},{1813,3304},{1753,3277},{1739,3322},{1692,3326},{1653,3361},
		{1632,3399},{1595,3411},{1617,3443},{1602,3493},{1634,3523},{1616,3549},{1592,3575},{1695,3494},{1690,3440},{1669,3472},
		{1649,3478},{1634,3447},{1644,3420},{1686,3385},{1708,3408},{1730,3356},{1778,3375},{1749,3456},{1739,3529},{1731,3572},
		{1780,3593},{1817,3564},{1843,3558},{1809,3521},{1786,3500},{1769,3447},{1775,3404},{1813,3411},{1832,3443},{1845,3481},
		{1829,3512},{1858,3505},{1883,3476},{1886,3532},{1900,3571},{1854,3595},{1835,3632},{1874,3652},{1904,3661},{1899,3720},
		{1881,3761},{1890,3818},{1875,3867},{1894,3885},{1844,3876},{1835,3856},{1815,3822},{1799,3796},{1825,3777},{1791,3742},
		{1765,3709},{1792,3684},{1829,3655},{1858,3655},{1868,3692},{1839,3719},{1815,3735},{1738,3798},{1720,3773},{1723,3735},
		{1678,3781},{1751,3759},{1762,3728},{1781,3826},{1768,3293},{1750,3328},{1891,3458},{1669,3182},{1808,3341},{1842,3402},
	},
	[6200] = {
		{1413,2757},{1453,2794},{1492,2772},{1527,2736},{1546,2787},{1536,2683},{1556,2728},{1520,2820},{1530,2858},{1521,2897},
		{1549,2896},{1523,2948},{1477,2928},{1486,2862},{1510,2871},{1465,2901},{1461,2865},{1448,2982},{1471,3017},{1479,3050},
		{1428,3065},{1436,3107},{1394,3131},{1384,3176},{1423,3156},{1369,3088},{1343,3063},{1322,3106},{1342,3138},{1335,3159},
		{1307,3166},{1296,3136},{1272,3174},{1236,3179},{1210,3150},{1178,3141},{1208,3117},{1214,3083},{1248,3080},{1279,3072},
		{1267,3030},{1269,2999},{1244,2962},{1215,2966},{1254,2926},{1253,2901},{1229,2918},{1296,2894},{1313,2853},{1337,2836},
		{1358,2781},{1361,2729},{1343,2697},{1307,2730},{1281,2787},{1262,2827},{1247,2865},{1227,2829},{1239,2695},{1264,2653},
		{1292,2628},{1251,2609},{1215,2626},{1236,2653},{1168,2668},{1141,2700},{1107,2728},{1134,2748},{1171,2764},{1176,2723},
		{1196,2703},{1406,2839},{1402,2803},{1421,2801},{1427,2835},{1439,2871},{1445,2913},{1420,2950},{1417,2996},{1384,3019},
		{1378,3050},{1348,3012},{1350,2973},{1321,2957},{1281,2962},{1338,2917},{1357,2894},{1383,2898},{1401,2936},{1373,2951},
		{1269,2762},{1348,2689},{1386,2774},{1528,2734},{1465,2964},{1450,3009},{1424,3096},{1343,3059},{1290,3046},{1249,2958},
	},
	[6300] = {
		{1506,3416},{1522,3428},{1534,3391},{1549,3362},{1557,3320},{1567,3291},{1572,3272},{1525,3260},{1547,3249},{1523,3226},
		{1541,3203},{1569,3219},{1597,3244},{1538,3172},{1518,3153},{1503,3124},{1495,3079},{1492,3031},{1463,3007},{1452,2962},
		{1424,2931},{1458,2957},{1356,2939},{1355,2976},{1328,2940},{1314,2902},{1279,2894},{1251,2927},{1277,2970},{1236,2969},
		{1217,3028},{1180,3063},{1163,3106},{1218,3116},{1260,3091},{1288,3048},{1334,3025},{1390,3012},{1429,2990},{1439,3067},
		{1405,3112},{1468,3133},{1490,3193},{1497,3262},{1459,3317},{1394,3342},{1469,3398},{1444,3442},{1452,3546},{1427,3603},
		{1381,3570},{1317,3522},{1259,3503},{1237,3426},{1203,3442},{1192,3384},{1240,3346},{1244,3388},{1277,3435},{1304,3408},
		{1349,3437},{1351,3348},{1324,3320},{1467,3473},{1348,3559},{1261,3479},{1433,3219},{1386,3177},{1330,3150},{1351,3121},
		{1299,3127},{1399,3169},{1432,3103},{1462,3186},{1444,3268},{1415,3348},{1320,3390},{1275,3398},{1218,3378},{1166,3366},
		{1227,3402},{1371,3533},{1433,3548},{1485,3466},{1434,3435},{1464,3375},{1487,3181},{1420,3037},{1398,3073},{1417,3122},
		{1219,3012},{1193,3050},{1193,3159},{1240,3142},{1312,3153},{1323,3234},{1273,3234},{1308,2901},{1444,2973},{1476,3076},
	},
	[6400] = {
		{1642,3196},{1695,3201},{1731,3193},{1786,3190},{1839,3217},{1836,3262},{1891,3259},{1875,3322},{1892,3366},{1839,3413},
		{1818,3353},{1765,3298},{1709,3370},{1636,3302},{1622,3394},{1638,3489},{1636,3445},{1696,3440},{1707,3508},{1756,3501},
		{1737,3558},{1786,3534},{1800,3494},{1845,3483},{1883,3508},{1844,3535},{1812,3581},{1765,3551},{1754,3592},{1788,3606},
		{1837,3610},{1847,3577},{1871,3593},{1873,3620},{1760,3434},{1777,3404},{1742,3296},{1673,3248},{1692,3331},{1640,3525},
		{1698,3611},{1650,3587},{1683,3544},{1826,3377},{1798,3302},{1731,3241},{1790,3222},{1885,3220},{1710,3342},{1670,3417},	
	},
}

tBCRand = {48,72,88,96,100}; --�ڳ�����

tBiaoChe = {
	{"Ti�u Xa 1","Ti�u Xa Th��ng"},
	{"Ti�u Xa 2","Ti�u Xa Quan Tr�ng"},
	{"Ti�u Xa 3","Ti�u Xa Qu�n D�ng"},
	{"Ti�u Xa 4","Ti�u Xa C� M�t"},
	{"Ti�u Xa 5","Ti�u Xa Ho�ng Gia"},
};

tSeedName = { --����
	--���� id Ʒ�������Χ ��ˮ����
	[1] = {{"V� Hoa T�_Lo�i 1",{2,95,908},{40,50}, "tree_bodhi1"},{"B� �� T�_Lo�i 1",{2,95,909},{40,50}, "tree_fig1"}},
	[2] = {{"T� ��n Ti�n Ch�ng_Lo�i 2",{2,95,904},{21,35},"tree_PurpleSandalwood2"},{"Ho�ng ��n Ti�n Ch�ng_Lo�i 2",{2,95,905},{21,35},"tree_YellowSandalwood2"},{"T� ��ng Ti�n Ch�ng_Lo�i 2",{2,95,906},{21,35},"tree_wisteria2"},{"Ng�n H�nh Ti�n Ch�ng_Lo�i 2",{2,95,907},{21,35}, "tree_ginkgo2"}},
	[3] = {{"H�t Gi�ng Anh ��o_Lo�i 3",{2,95,900},{11,30},"tree_cherry3"},{"H�t Gi�ng C�y ��o_Lo�i 3",{2,95,901},{11,30},"tree_peach3"},{"H�t Gi�ng Hoa Ti�u_Lo�i 3",{2,95,902},{11,30}, "tree_pepper3"},{"H�t Gi�ng Th�y Sam_Lo�i 3",{2,95,903},{11,30}, "tree_metasequoia3"}},
}

tYupoName = {
	{"H� Kh�ng Ng�c Ph�ch_��c bi�t",{2,95,913},32},
	{"M�c T� Ng�c Ph�ch_Nh�t ph�m",{2,95,912},21},
	{"T� Tr�ch Ng�c Ph�ch_Nh� ph�m",{2,95,911},17},
	{"B�ng T�m Ng�c Ph�ch_Tam ph�m",{2,95,910},0},
}

tPlantInfo = {}; --��ҵ�̫����info����

tPVPItemInfo = {
	{"Kim L�ng T�u",2,95,822},      --1
	{"T�ng Ki�m B� Truy�n T�m Kinh",2,95,823},--2
	{"B�ch Hi�u Sinh B� Ph�p",2,95,824},	--3
	{"Kim Cang Kinh",2,95,825},			--4
	{"V� L�m Minh T�n V�t",2,95,935},--5
	{"Th�i H� H�a H�nh ��n",2,95,914},	--6
	{"Ph�ng Tinh ��n",2,95,916},	--7
	{"T�ng B�o ��",2,95,917},	--8
	{"Tr�n Vi�n ��i Ti�u L�nh",2,95,918}, --9	
	{"Ti�u Xa Th��ng-Ti�u K�",2,95,919},	--10
	{"Ti�u Xa Quan Tr�ng-Ti�u K�",2,95,920},	--11
	{"Ti�u Xa Qu�n D�ng-Ti�u K�",2,95,921},	--12
	{"Ti�u Xa C� M�t-Ti�u K�",2,95,922},	--13
	{"Ti�u Xa Ho�ng Gia-Ti�u K�",2,95,923},	--14
	{"Huy Hi�u V� L�m Minh",2,95,924},	--15
	{"Ngh�a Kh� T�u",2,95,925},		--16
	{"T�ng B�o ��",	2,95,926},  --17
	{"X�ng Kho B�u",	2,95,927},	--18
	{"Ch�u B�u T�y H�",	2,95,928},  --19
	{"T� L�a ��i L�",	2,95,929},	--20
	{"Da L�ng Th� Ph�n",	2,95,930},	--21
	{"Kho B�u Tr�n Ph�m",	2,95,931},	--22
	{"Kho B�u T� H�u",	2,95,932},	--23
	{"Kho B�u Di V�t",	2,95,933},	--24
	{"Kho B�u Kinh Th�",	2,95,934},	--25
	{"V� L�m Minh Th� Bi�u D��ng",	2,95,936}, --26
	{"Kho B�u Minh M�n",	2,97,33},	--27
	{"Kho B�u Thi�n Long T�",	2,97,34},	--28
	{"Kho B�u Qu�nh K�t",	2,97,35},	--29	
	{"Ng�ng Tinh L�", 2,1,30804}, --30
};

tRewardTime = { --�ͽ�ʱ��
	{1600,1630},{2200,2230},
};

--�ͽ����Ч��
tRewardBox = {--ģ���� npc�� ״̬���� Ч������ ħ�������ַ��� ��ֵ ����ʱ��
	{"Gi� v� kh�_Ngo�i th�nh","Gi� v� kh�",1787,3508,"D�ng M�nh","t�ng l�c c�ng k�ch 100%, duy tr� 30 gi�y","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi� khi�n_Ngo�i th�nh","Gi� khi�n",1775,3411,"Hung h�n","T�ng l�c ph�ng ng� 100%, duy tr� 30 gi�y","state_receive_half_damage",100,30},
	{"L� th�o d��c_Ngo�i th�nh","L� th�o d��c",1775,3666,"Tr� th��ng","M�i gi�y h�i ph�c 10% sinh m�nh, duy tr� 30 gi�y","state_life_per_per8f",500,30},
	{"Gi�y gi�_Ngo�i th�nh","Gi�y gi�",1851,3527,"Ng�y b�","�n th�n, duy tr� 30 gi�y","state_illusion_latent",0,30},
};

-----------------------------------��������------------------------------------------
function yp_CreateMonster(npc, pos, way, nAiType)
	local model, name = npc[1], npc[2];
	local m = this.msPosition:getMapID();
	local newnpc = 0;
	if type(pos[1]) ~= "table" then
		pos = {pos};
	end
	for i = 1, getn(pos) do
		local x, y = pos[i][1], pos[i][2];
		newnpc = CreateNpc(model, name, m, x, y);
		if npc[3] then
			SetNpcScript(newnpc, npc[3]);
		end
		if npc[4] then
			SetNpcLifeTime(newnpc, npc[4]);
		end
		if npc[5] then
			SetCampToNpc(newnpc, npc[5]);
		end
		if npc[6] then
			SetNpcDir(newnpc, npc[6]);
		end
		if npc[7] then
			SetNpcRemoveScript(newnpc, npc[7]);
		end		
		SetNpcActivator(newnpc);
		if way then
			nAiType = nAiType or AT_SM_ATTACK;
			g_NpcAI:setAI(newnpc, nAiType);
			g_NpcAI:setWayPoint(newnpc, way);
		end
	end
	return newnpc;
end

function yp_fire_OnTimer()
--	Msg2Player("yp_fire_OnTimer");
	local nTime = tonumber(date("%H%M"));
	local m,x,y = GetWorldPos();
	if m ~= 6000 and m ~= 6100 and m ~= 6200 then
		return 0;
	end
	for i = 1,getn(tCreatTime) do
		if nTime >= tCreatTime[i] and nTime < tCreatTime[i]+15 and GetMissionV(12) == i then --15������
			local nMapID,nPosX,nPosY = GetWorldPos();
			local nDistance = 0;
			if tPos[nMapID] == nil then
				return 0;
			end
			for j = 1,getn(tPos[nMapID].chd) do
				local n = abs(nPosX-tPos[nMapID].chd[j][1])+abs(nPosY-tPos[nMapID].chd[j][2]);
				if nDistance == 0 or n < nDistance then
					nDistance = n;
				end
			end
			
--			Msg2Player("nDistance:"..nDistance)
			if nDistance > 32 then
				return 0;
			end
			--�ж��Ƿ����
			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
--			local nNpcState = GetNpcBehaveStatus(nPidxNpc);
--			if nNpcState ~= 13 and GetTime() - GetTask(TASK_FIELD_PVP_DRINK) > 20*60 then --����
--				return 0;
--			end
			local nTeamSize = GetTeamSize();
			local nExp = floor(GetLevel()*GetLevel()*2*(1+nTeamSize/10));
			local nMpExp = 36;
			if GetTime() - GetTask(TASK_FIELD_PVP_DRINK) < 20*60 and GetTask(TASK_FIELD_PVP_DRINK) ~= 0 then --20����
				local nRand = random(1,100);
				if nRand <= 90 then
					nExp = 3*nExp;
				else
					nExp = 5*nExp;
					SetCurrentNpcSFX(nPidxNpc,972,1,0);
				end
				nMpExp = 72;
			end
--			MP_MasterAddPoint(nMpExp);
			gf_Modify("Exp",nExp);
		end
	end	
end

function yp_ChooseArmy()
	local nRand = random(1,3);
	SetGlbValue(GLV_YP_CHOOSE_ARMY,nRand);
end

--1:���׶ȣ�2��pvp������3������ֵ��4���ޣ�5������������
function yp_setValue(nType,Value)
	yp_clearPlayerData();
	local tTaskID = {TASK_FIELD_PVP_GXD, TASK_FIELD_PVP_COUNT, 12345678};
	local strMsg = {"�� c�ng hi�n th� l�c","�i�m PVP","Tr� tinh l�c","Kinh nghi�m ��i chi�n ","Danh v�ng V� L�m Minh"};
	if nType == 5 then
		--����ӿ�
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if nCamp >=1 and nCamp <= 3 then
			AddPop(nCamp-1, Value);
		else
			print(GetName(),"yp_setValue",nType,Value,"error camp")
		end
		
	elseif nType == 3 then
		ModifyEnergy(Value, 1)
	else
		local nCurTask = tTaskID[nType];
		if nCurTask then
			if nType == 4 then
				SetTask(nCurTask,GetTask(nCurTask)+Value, 21);
			else
				SetTask(nCurTask,GetTask(nCurTask)+Value);
			end
			if Value > 0 then
				Msg2Player("Ng��i nh�n ���c ["..strMsg[nType].."]"..Value.." �i�m!");
			elseif Value < 0 then
				Msg2Player("Ng��i m�t �i ["..strMsg[nType].."]"..abs(Value).." �i�m!");
			end
		end
	end
end

function yp_getValue(nType)
	yp_clearPlayerData();
	local tTaskID = {TASK_FIELD_PVP_GXD, TASK_FIELD_PVP_COUNT, 12345678, TASK_BIWU_DUIZHAN_JINGYAN};
	if nType == 5 then
		--����ӿ�
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if nCamp >=1 and nCamp <= 3 then
			return GetPop(nCamp-1);
		else
			print("yp_setValue",nType,Value,"error camp")
		end
		return 0;
	elseif nType == 3 then
		local nCur, nMax = ModifyEnergy(0, 1)
		return nCur
	else
		local nCurTask = tTaskID[nType];
		if nCurTask then
			return GetTask(nCurTask);
		end
		return 0;
	end
end

function yp_clearPlayerData()
	local nCurWeek = tf_GetWeekSequence(1,0);
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_FIELD_PVP_CLEAR_TIME) < nDate then
		gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2,0); --����͵��������Ĵ���
		SetTask(TASK_FIELD_PVP_CLEAR_TIME,nDate);
	end
	if GetTask(TASK_FIELD_PVP_CLEAR_DATA) < nCurWeek then
		SetTask(TASK_FIELD_PVP_GXD,0);
		SetTask(TASK_FIELD_PVP_CLEAR_DATA,nCurWeek);
	end
end

function yp_addCharm(nType,nAddNum,nSpe)
	SetPlayerScript("\\script\\missions\\yp\\dhx_npc.lua");
	if nSpe then
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua",format("dhx_addCharm2(%d,%d)",nType,nAddNum));		
	else
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua",format("dhx_addCharm(%d,%d)",nType,nAddNum));		
	end
end

--�ͽ�ʱ��
function yp_checkRewardTime()
	local nCurTime = tonumber(date("%H%M"));
	for i = 1,getn(tRewardTime) do
		if nCurTime >= tRewardTime[i][1] and nCurTime <= tRewardTime[i][2] then
			return i;
		end
	end
	return 0;
end

--��ͼ������
g_nRectCostomerID = 3007*2;
g_nRectTriggerID = 3007;
function yp_onMapJoin()
--	print("yp_onMapJoin")
	yp_onLogin();
end

function yp_onEnterMap()
	SetPKFlag(0);
	ForbidChangePK(1);
end

function yp_onLeaveMap()
	ForbidChangePK(0);
end

--��½������
g_nLoginCostomerID = 3012*2;
g_nLoginTriggerID = 3012;
function yp_onLogin()
--	print("yp_onLogin")
	local m,x,y = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	yp_ProcessTrigger(m, nCamp);
	local nType = 0;	
	for i = 1,getn(tMainMapID) do
		if tMainMapID[i][1] == m then
			nType = i
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tScript = {
		"\\script\\missions\\yp\\tls\\mission.lua",
		"\\script\\missions\\yp\\hss\\mission.lua",
		"\\script\\missions\\yp\\mm\\mission.lua",
		"\\script\\missions\\yp\\qmy\\mission.lua",
		"\\script\\missions\\yp\\tysd\\mission.lua",
	}
	SetPlayerScript(tScript[nType]);
	SendScript2VM(tScript[nType],"this:onLogin("..nCamp..")");	
end

--����������ʾ��ؽ���
function yp_c2s_detail()
	local strtab = {
		"Truy�n ��o th� nghi�p/#yp_c2s_detail2(1)",
		"Th�t L�c Nhai-T�m b�o/#yp_c2s_detail2(2)",
		"Th�t L�c Nhai-�o�t th�/#yp_c2s_detail2(3)",
		"Th�n Du Ch�n Nh�n/#yp_c2s_detail2(4)",
		"Thi�n �m Th�m B�/#yp_c2s_detail2(5)",
		"K�t th�c ��i tho�i/nothing"	
	};
	Say("Trong th� l�c T�y V�c, ngo�i tr� cung c�p nhi�m v� th� l�c c�a m�nh, c�n s� ph�t sinh m�t s� s� ki�n ng�u nhi�n.",
		getn(strtab),
		strtab)
end

function yp_c2s_detail2(nType)
	local strMsg = {
			"    Th�i gian truy�n ��o c�a th� l�c l� 11:00-11:15, 17:00-17:15 v� 21:00-21:15 h�ng ng�y, trong kho�ng th�i gian n�y, c�c hi�p s� c� th� v�o th� l�c c�a m�nh t�m Ng��i Truy�n ��o, ng�i � xung quanh nghe truy�n ��o. Trong th�i gian truy�n ��o, s� nh�n ���c qu� c�a ch� th� l�c.",
			"    T�m B�o Nh�n � Th�t L�c Nhai �� t� b� k� ho�ch t�m kho b�u, 17:00 v� 21:00 h�ng ng�y, c�c thi�u hi�p h�y ��n Th�t L�c Nhai t�m anh �y l�y c�ng c� v� th� xem c� ph�t hi�n g� kh�ng.\n",
			"    V� mu�n gi�p �� c�c hi�p s� c�a V� L�m Minh, B�ch Hi�u Sinh �� l�nh cho Truy�n Gi�o S� v�o l�c 06:00, 12:00, 18:00 v� 24:00 h�ng ng�y, ��n Th�t L�c Nhai truy�n th� kinh th� t�m ph�p. Tam ph�p c� h�n, ng��i ��n tr��c s� ���c tr��c.",
			"    T��ng truy�n r�ng 14:00 v� 20:00 h�ng ng�y, Th�n Du Ch�n Nh�n s� ��n Th�t L�c Nhai du ngo�n. Ng��i c� duy�n s� nh�n ���c h�t gi�ng do Th�n Du Ch�n Nh�n ban t�ng, sau khi tr�ng s� nh�n ���c ph�n th��ng phong ph�.",
			"    Thi�n �m Th�nh ��a l� n�i truy�n gi�o c�a Thi�n �m Gi�o, h�ng ng�y v�o l�c 16:00-16:30 v� 22:00-22:30 m�i c� th� v�o. Thi�u hi�p c� th� �i th�m d� t�nh b�o m�i nh�t c�a Thi�n �m, ch� � ng��i �� c� mang theo Huy Hi�u V� L�m Minh hay kh�ng.",
		}
	Talk(1,"yp_c2s_detail",strMsg[nType]);
end

--��������������ֵ
function yp_c2s_getRqz()
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	tbPVPCharm:apply2(yp_c2s_getRqz_CallBack);
end

function yp_c2s_getRqz_CallBack(nCount, sdb)
	local nRqz = 0;
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 then
		nRqz = sdb[0][2+nCamp] or 0;
	end
	--gf_PrintTable(sdb)
	SendScript2Client(format("UpdateWindow('pvp',%d)",nRqz))
end

function yp_dailyClean()
	SetTask(TASK_FIELD_PVP_CAR_TASK, 0);
	SetTask(TASK_FIELD_PVP_CAR_BIAOLING, 0);
	SetTask(TASK_FIELD_PVP_CAR_DAILY_NUM, 0);
	SetTask(TASK_FIELD_PVP_FIREBOX_NUM, 0);
	SetTask(TASK_FIELD_PVP_PICKBOX, 0);
	SetTask(TASK_FIELD_PVP_TIEQIAO_NUM, 0);
	SetTask(TASK_FIELD_PVP_TAIXU, 0);
end

function yp_weeklyClean()
	SetTask(TASK_FIELD_PVP_GXD_WARD, 0);
end

function yp_get_camp()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	return nCamp
end
function yp_get_camp_name(nCamp)
	local tCamp = tMainMapID[nCamp]
	if tCamp then
		return tCamp[2]
	end
	return ""
end
function yp_get_camp_pop()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp >= 1 and nCamp <= 3 then
		return GetPop(nCamp-1)
	end
	return 0
end

function yp_ProcessTrigger(m, nCamp)
	local tWhiteList = {
		[425] = 1, [6100] = 1, [6200] = 1, [6300] = 1, 
		[6400] = 1, [7111] = 1, [7112] = 1, [7113] = 1, 
		[7114] = 1, [7115] = 1, [7116] = 1, [7117] = 1, 
		[7118] = 1, [7119] = 1,
	};
	if tWhiteList[m] then
		local tChannel = {
			[1] = "Th� L�c ��i L�",
			[2] = "Th� L�c Th� Ph�n",
			[3] = "Th� L�c T�y H�",
		}
		if not tChannel[nCamp] then
			return 0;
		end
		EnterChannel(tChannel[nCamp]);
	else
		LeaveChannel("Th� L�c ��i L�");
		LeaveChannel("Th� L�c Th� Ph�n");
		LeaveChannel("Th� L�c T�y H�");
	end
end