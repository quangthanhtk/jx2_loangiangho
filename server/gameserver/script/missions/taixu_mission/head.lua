Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Import("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")

--Include("\\script\\class\\clause3.lua");
--Include("\\script\\lib\\itemfunctions.lua")
--Import("\\script\\lib\\val2str.lua");

TAIXU_TASKID_EXP_DRUG_TIME = 3536 -- ��¼̫��ר��exp�ӳɵ���ʱЧ
TAIXU_TASKID_EXP_DRUG_TYPE = 3538 -- ��¼̫��ר��exp�ӳɵ�������

tTxExpItem = {
	{1, "Th�i H� Th�n Du ��n", "T�t c� th��ng x2"},
	{2, "Th�i H� L��c �nh ��n", "Kinh nghi�m x2"},
}
tTxExpGDP2Item = {
    [PackItemId(2,1,31268)] = tTxExpItem[1],
    [PackItemId(2,1,31269)] = tTxExpItem[2],
}

g_MaxLevel = 30 ;--�ؿ�������
g_NeedLevel= 70 ;--�����Ҫ�ĵȼ�
tbTaiXu = {
	name = "Th�i H�",
	missionID = 90, --ΨһID���鿴���ñ�
	realMapID = 1010,
	dynamicMap = 1, -- ��̬��ͼ
	

--	timerTriggerID = 101,
--	costomerID = 101,
--����ΪmissionV����
--	mv1	= 1, --���NPC������ID
	mv2 = 2, --���������ӱ�����ͨ������ʱ����0��
	mv3 = 3, --����Ƿ������˾�Ӣ�֣�ͨ������ʱ����0��
	mv4 = 4, --����1������ѩ�أ�2���� 3���� 4嫺���ɳ
	mv5 = 5, --����Ƿ��Ѿ����˽����ˣ�ͨ������ʱ����0��
	mv6 = 6, --������ص�״̬(0û������ 1��41�ؿ�ʼ 2��61�ؿ�ʼ)
--����ΪmissionS����	
	ms1 = 1,  --Ԥ�� 
}
tbTaiXu = gf_CopyInherit(missionHead, tbTaiXu);
tbTaiXu = gf_CopyInherit(missionBase, tbTaiXu);



tEnterPos = {
	{1543,3297},
	{1625,3300},
	{1542,3458},
	{1625,3470},
	}
	
tExitPos = 
{
	[100] = {100, 1379, 2858},
	[200] = {200, 1151, 2850},
	[300] = {300, 1975, 3552},
	}
	
thisFile = "\\script\\missions\\taixu_mission\\mission.lua";


tBossType = 
{
	{["Th�i H� Nguy�t L��ng Th�"  ] = 1, ["Th�i H� B�n Th�"    ] = 2,},--[nStage] ={ ["NPC����"] =  1, ["NPC����"] =  2}, ע��1��ʾ��Ӣ�� ,2��ʾС�ӱ�
	{["Th�i H� Vi�n Nh�n V��ng"  ] = 1, ["Th�i H� V��n to"      ] = 2,},
	{["Th�i H� H� tr�ng"    ] = 1, ["Th�i H� M�nh h�"      ] = 2,},
	{["Th�i H� B�ch �i�u"    ] = 1, ["Th�i H� Qu� �en"      ] = 2,},
	{["Th�i H� H�o V� Ki�m"  ] = 1, ["Th�i H� Ki�m S�t"      ] = 2,},
	{["Th�i H� Th� Y�u"    ] = 1, ["Th�i H� Th�c Nh�n hoa"    ] = 2,},
	{["Th�i H� H�aY�u H�"  ] = 1, ["Th�i H� B�ch Y�u H�"    ] = 2,},
	{["Th�i H� Th�n N�"    ] = 1, ["Th�i H� C�m Ti�n T�"    ] = 2,},
	{["Th�i H� Tr� V��ng"    ] = 1, ["Th�i H� Tuy�t Qu�i"      ] = 2,},
	{["Th�i H�Tr� ��ng"    ] = 1, ["Th�i H� Th�o Kh�u"      ] = 2,},
	{["Th�i H� Du H�n"    ] = 1, ["Th�i H� Lam Ti�u �ao qu�"  ] = 2,},
	{["Th�i H� Oan H�n"    ] = 1, ["Th�i H� Ti�u H�ng xoa qu�"  ] = 2,},
	{["Th�i H� L�nh H��ng Ng�ng"  ] = 1, ["Th�i H� Lam Phi tr�o qu�"  ] = 2,},
	{["Th�i H� Huy�n V� Ki�m"] = 1, ["Th�i H� Ki�m t��ng"] = 2,},
	{["Th�i H� Nguy Ch�n Thi�n"  ] = 1, ["Th�i H� S�n T�c ��u M�c"  ] = 2,},
	{["Th�i H� T�ng �c"    ] = 1, ["Th�i H� M�u D� Xoa"    ] = 2,},
	{["Th�i H� Ki�m Ma"    ] = 1, ["Th�i H� Ki�m H�n"      ] = 2,},
	{["Th�i H� L�u Quang"    ] = 1, ["Th�i H� H�a K� L�n"    ] = 2,},
	{["Th�i H� H�aPh�ng ho�ng"  ] = 1, ["Th�i H� Ph�ng ho�ng"      ] = 2,},
	{["Th�i H� Phong Nh�t Ph�m"  ] = 1, ["Th�i H� Ki�m ti�n T�"    ] = 2,},
	{["Th�i H� L�m Xung"    ] = 1, ["Th�i H� Ki�m Cu�ng"      ] = 2,},
	{["Th�i H� Ng�u ��u Qu�i"    ] = 1, ["Th�i H� B� T�y T�ng"      ] = 2,},
	{["Th�i H� Hoa Th�nh"    ] = 1, ["Th�i H� Cao Ph� So�i"    ] = 2,},
	{["Th�i H� T� Ti�n"    ] = 1, ["Th�i H� Hoa Si N�"    ] = 2,},
	{["Th�i H� Kh� m�p"  ] = 1, ["Th�i H� T�ng qu�n"      ] = 2,},
	{["Th�i H� Nguy�t Th�-C��ng"  ] = 1, ["Th�i H� C� Th�-C��ng"    ] = 2,},
	{["Th�i H� H�u V��ng-C��ng"  ] = 1, ["Th�i H� C� Vi�n-C��ng"      ] = 2,},
	{["Th�i H� B�ch H�-C��ng"    ] = 1, ["Th�i H� M�nh h�-C��ng"      ] = 2,},
	{["Th�i H� B�ch �i�u-C��ng"    ] = 1, ["Th�i H� H�c Nha-C��ng"      ] = 2,},
	{["Th�i H� H�o Ki�m-C��ng"  ] = 1, ["Th�i H� Ki�m S�t-C��ng"      ] = 2,},
	{["Th�i H� Th� Y�u-C��ng"    ] = 1, ["Th�i H� Th�c Hoa-C��ng"    ] = 2,},
	{["Th�i H� H�a H�-C��ng"  ] = 1, ["Th�i H� B�ch H�-C��ng"    ] = 2,},
	{["Th�i H� Th�n N�-C��ng"    ] = 1, ["Th�i H� C�m Ti�n-C��ng"    ] = 2,},
	{["Th�i H� Tr� V��ng-C��ng"    ] = 1, ["Th�i H� Tuy�t Qu�i-C��ng"      ] = 2,},
	{["Th�i H� Tr� ��ng-C��ng"    ] = 1, ["Th�i H� Th�o Kh�u-C��ng"      ] = 2,},
	{["Th�i H� Du H�n-C��ng"    ] = 1, ["Th�i H� Lam �ao-C��ng"  ] = 2,},
	{["Th�i H� Oan H�n-C��ng"    ] = 1, ["Th�i H� H�ng Xoa-C��ng"  ] = 2,},
	{["Th�i H� L�nh H��ng-C��ng"  ] = 1, ["Th�i H� Lam Tr�o-C��ng"  ] = 2,},
	{["Th�i H� �o Ki�m-C��ng"] = 1, ["Th�i H� Ki�m T��ng-C��ng"] = 2,},
	{["Th�i H� Ch�n Thi�n-C��ng"  ] = 1, ["Th�i H� T�c L�nh-C��ng"  ] = 2,},
	{["Th�i H� �c T�ng-C��ng"    ] = 1, ["Th�i H� M�u D� Xoa-C��ng"    ] = 2,},
	{["Th�i H� Ki�m Ma-C��ng"    ] = 1, ["Th�i H� Ki�m H�n-C��ng"      ] = 2,},
	{["Th�i H� L�u Quang-C��ng"    ] = 1, ["Th�i H� H�a K� L�n-C��ng"    ] = 2,},
	{["Th�i H� H�a Ph�ng-C��ng"  ] = 1, ["Th�i H� Ph�ng Ho�ng-C��ng"      ] = 2,},
	{["Th�i H� Nh�t Ph�m-C��ng"  ] = 1, ["Th�i H� Ki�m Ti�n-C��ng"    ] = 2,},
	{["Th�i H� L�m Xung-C��ng"    ] = 1, ["Th�i H� Ki�m Cu�ng-C��ng"      ] = 2,},
	{["Th�i H� Ng�u Qu�i-C��ng"    ] = 1, ["Th�i H� Mao Ng�u-C��ng"      ] = 2,},
	{["Th�i H� Hoa Th�nh-C��ng"    ] = 1, ["Th�i H� Ph� So�i-C��ng"    ] = 2,},
	{["Th�i H� T� Ti�n-C��ng"    ] = 1, ["Th�i H� Hoa N�-C��ng"    ] = 2,},
	{["Th�i H� C� H�u-C��ng"  ] = 1, ["Th�i H� T�ng Qu�n-C��ng"      ] = 2,},
	{["Th�i H� Nguy�t Th�-Tinh"  ] = 1, ["Th�i H� C� Th�-Tinh"    ] = 2,},
	{["Th�i H� H�u V��ng-Tinh"  ] = 1, ["Th�i H� C� Vi�n-Tinh"      ] = 2,},
	{["Th�i H� B�ch H�-Tinh"    ] = 1, ["Th�i H� M�nh h�-Tinh"      ] = 2,},
	{["Th�i H� B�ch �i�u-Tinh"    ] = 1, ["Th�i H� H�c Nha-Tinh"      ] = 2,},
	{["Th�i H� H�o Ki�m-Tinh"  ] = 1, ["Th�i H� Ki�m S�t-Tinh"      ] = 2,},
	{["Th�i H� Th� Y�u-Tinh"    ] = 1, ["Th�i H� Th�c Hoa-Tinh"    ] = 2,},
	{["Th�i H� H�a H�-Tinh"  ] = 1, ["Th�i H� B�ch H�-Tinh"    ] = 2,},
	{["Th�i H� Th�n N�-Tinh"    ] = 1, ["Th�i H� C�m Ti�n-Tinh"    ] = 2,},
	{["Th�i H� Tr� V��ng-Tinh"    ] = 1, ["Th�i H� Tuy�t Qu�i-Tinh"      ] = 2,},
	{["Th�i H� Tr� ��ng-Tinh"    ] = 1, ["Th�i H� Th�o Kh�u-Tinh"      ] = 2,},
	{["Th�i H� Du H�n-Tinh"    ] = 1, ["Th�i H� Lam �ao-Tinh"  ] = 2,},
	{["Th�i H� Oan H�n-Tinh"    ] = 1, ["Th�i H� H�ng Xoa-Tinh"  ] = 2,},
	{["Th�i H� L�nh H��ng-Tinh"  ] = 1, ["Th�i H� Lam Tr�o-Tinh"  ] = 2,},
	{["Th�i H� �o Ki�m-Tinh"] = 1, ["Th�i H� Ki�m T��ng-Tinh"] = 2,},
	{["Th�i H� Ch�n Thi�n-Tinh"  ] = 1, ["Th�i H� T�c L�nh-Tinh"  ] = 2,},
	{["Th�i H� �c T�ng-Tinh"    ] = 1, ["Th�i H� M�u D� Xoa-Tinh"    ] = 2,},
	{["Th�i H� Ki�m Ma-Tinh"    ] = 1, ["Th�i H� Ki�m H�n-Tinh"      ] = 2,},
	{["Th�i H� L�u Quang-Tinh"    ] = 1, ["Th�i H� H�a K� L�n-Tinh"    ] = 2,},
	{["Th�i H� H�a Ph�ng-Tinh"  ] = 1, ["Th�i H� Ph�ng Ho�ng-Tinh"      ] = 2,},
	{["Th�i H� Nh�t Ph�m-Tinh"  ] = 1, ["Th�i H� Ki�m Ti�n-Tinh"    ] = 2,},
	{["Th�i H� L�m Xung-Tinh"    ] = 1, ["Th�i H� Ki�m Cu�ng-Tinh"      ] = 2,},
	{["Th�i H� Ng�u Qu�i-Tinh"    ] = 1, ["Th�i H� Mao Ng�u-Tinh"      ] = 2,},
	{["Th�i H� Hoa Th�nh-Tinh"    ] = 1, ["Th�i H� Ph� So�i-Tinh"    ] = 2,},
	{["Th�i H� T� Ti�n-Tinh"    ] = 1, ["Th�i H� Hoa N�-Tinh"    ] = 2,},
	{["Th�i H� C� H�u-Tinh"  ] = 1, ["Th�i H� T�ng Qu�n-Tinh"      ] = 2,},
	{["Th�i H� Nguy�t Th�-C�c"  ] = 1, ["Th�i H� C� Th�-C�c"    ] = 2,},
	{["Th�i H� H�u V��ng-C�c"  ] = 1, ["Th�i H� C� Vi�n-C�c"      ] = 2,},
	{["Th�i H� B�ch H�-C�c"    ] = 1, ["Th�i H� M�nh h�-C�c"      ] = 2,},
	{["Th�i H� B�ch �i�u-C�c"    ] = 1, ["Th�i H� H�c Nha-C�c"      ] = 2,},
	{["Th�i H� H�o Ki�m-C�c"  ] = 1, ["Th�i H� Ki�m S�t-C�c"      ] = 2,},
	{["Th�i H� Th� Y�u-C�c"    ] = 1, ["Th�i H� Th�c Hoa-C�c"    ] = 2,},
	{["Th�i H� H�a H�-C�c"  ] = 1, ["Th�i H� B�ch H�-C�c"    ] = 2,},
	{["Th�i H� Th�n N�-C�c"    ] = 1, ["Th�i H� C�m Ti�n-C�c"    ] = 2,},
	{["Th�i H� Tr� V��ng-C�c"    ] = 1, ["Th�i H� Tuy�t Qu�i-C�c"      ] = 2,},
	{["Th�i H� Tr� ��ng-C�c"    ] = 1, ["Th�i H� Th�o Kh�u-C�c"      ] = 2,},
	{["Th�i H� Du H�n-C�c"    ] = 1, ["Th�i H� Lam �ao-C�c"  ] = 2,},
	{["Th�i H� Oan H�n-C�c"    ] = 1, ["Th�i H� H�ng Xoa-C�c"  ] = 2,},
	{["Th�i H� L�nh H��ng-C�c"  ] = 1, ["Th�i H� Lam Tr�o-C�c"  ] = 2,},
	{["Th�i H� �o Ki�m-C�c"] = 1, ["Th�i H� Ki�m T��ng-C�c"] = 2,},
	{["Th�i H� Ch�n Thi�n-C�c"  ] = 1, ["Th�i H� T�c L�nh-C�c"  ] = 2,},
	{["Th�i H� �c T�ng-C�c"    ] = 1, ["Th�i H� M�u D� Xoa-C�c"    ] = 2,},
	{["Th�i H� Ki�m Ma-C�c"    ] = 1, ["Th�i H� Ki�m H�n-C�c"      ] = 2,},
	{["Th�i H� L�u Quang-C�c"    ] = 1, ["Th�i H� H�a K� L�n-C�c"    ] = 2,},
	{["Th�i H� H�a Ph�ng-C�c"  ] = 1, ["Th�i H� Ph�ng Ho�ng-C�c"      ] = 2,},
	{["Th�i H� Nh�t Ph�m-C�c"  ] = 1, ["Th�i H� Ki�m Ti�n-C�c"    ] = 2,},
	{["Th�i H� L�m Xung-C�c"    ] = 1, ["Th�i H� Ki�m Cu�ng-C�c"      ] = 2,},
	{["Th�i H� Ng�u Qu�i-C�c"    ] = 1, ["Th�i H� Mao Ng�u-C�c"      ] = 2,},
	{["Th�i H� Hoa Th�nh-C�c"    ] = 1, ["Th�i H� Ph� So�i-C�c"    ] = 2,},
	{["Th�i H� T� Ti�n-C�c"    ] = 1, ["Th�i H� Hoa N�-C�c"    ] = 2,},
	{["Th�i H� Thanh Thanh"  ] = 1, ["Th�i H� Th�n Nhi t�"      ] = 2,},
	}
	
tNPCTemplate = {
	{{"Th�i H� B�n Th�"      ,"Th�i H� B�n Th�"    ,80},{"Th�i H� Nguy�t L��ng Th�"  ,"Th�i H� Nguy�t L��ng Th�"  ,1},}, --[nStage] ={ {"С�ӱ�ģ��","name"������},{"��Ӣģ��","name",����},},
	{{"Th�i H� V��n to"        ,"Th�i H� V��n to"      ,80},{"Th�i H� Vi�n Nh�n V��ng"  ,"Th�i H� Vi�n Nh�n V��ng"  ,1},},-- �����ģ���Ƿ�ÿһ�ض�һ�������Ժ�һֱһ����
	{{"Th�i H� M�nh h�"        ,"Th�i H� M�nh h�"      ,80},{"Th�i H� H� tr�ng"    ,"Th�i H� H� tr�ng"    ,1},},
	{{"Th�i H� Qu� �en"        ,"Th�i H� Qu� �en"      ,80},{"Th�i H� B�ch �i�u"    ,"Th�i H� B�ch �i�u"    ,1},},
	{{"Th�i H� Ki�m S�t"        ,"Th�i H� Ki�m S�t"      ,80},{"Th�i H� H�o V� Ki�m"  ,"Th�i H� H�o V� Ki�m"  ,1},},
	{{"Th�i H� Th�c Nh�n hoa"      ,"Th�i H� Th�c Nh�n hoa"    ,80},{"Th�i H� Th� Y�u"    ,"Th�i H� Th� Y�u"    ,1},},
	{{"Th�i H� B�ch Y�u H�"      ,"Th�i H� B�ch Y�u H�"    ,80},{"Th�i H� H�aY�u H�"  ,"Th�i H� H�aY�u H�"  ,1},},
	{{"Th�i H� C�m Ti�n T�"      ,"Th�i H� C�m Ti�n T�"    ,80},{"Th�i H� Th�n N�"    ,"Th�i H� Th�n N�"    ,1},},
	{{"Th�i H� Tuy�t Qu�i"        ,"Th�i H� Tuy�t Qu�i"      ,80},{"Th�i H� Tr� V��ng"    ,"Th�i H� Tr� V��ng"    ,1},},
	{{"Th�i H� Th�o Kh�u"        ,"Th�i H� Th�o Kh�u"      ,80},{"Th�i H�Tr� ��ng"    ,"Th�i H�Tr� ��ng"    ,1},},
	{{"Th�i H� Lam Ti�u �ao qu�"    ,"Th�i H� Lam Ti�u �ao qu�"  ,80},{"Th�i H� Du H�n"    ,"Th�i H� Du H�n"    ,1},},
	{{"Th�i H� Ti�u H�ng xoa qu�"    ,"Th�i H� Ti�u H�ng xoa qu�"  ,80},{"Th�i H� Oan H�n"    ,"Th�i H� Oan H�n"    ,1},},
	{{"Th�i H� Lam Phi tr�o qu�"    ,"Th�i H� Lam Phi tr�o qu�"  ,80},{"Th�i H� L�nh H��ng Ng�ng"  ,"Th�i H� L�nh H��ng Ng�ng"  ,1},},
	{{"Th�i H� Ki�m t��ng"  ,"Th�i H� Ki�m t��ng",80},{"Th�i H� Huy�n V� Ki�m","Th�i H� Huy�n V� Ki�m",1},},
	{{"Th�i H� S�n T�c ��u M�c"    ,"Th�i H� S�n T�c ��u M�c"  ,80},{"Th�i H� Nguy Ch�n Thi�n"  ,"Th�i H� Nguy Ch�n Thi�n"  ,1},},
	{{"Th�i H� M�u D� Xoa"      ,"Th�i H� M�u D� Xoa"    ,80},{"Th�i H� T�ng �c"    ,"Th�i H� T�ng �c"    ,1},},
	{{"Th�i H� Ki�m H�n"        ,"Th�i H� Ki�m H�n"      ,80},{"Th�i H� Ki�m Ma"    ,"Th�i H� Ki�m Ma"    ,1},},
	{{"Th�i H� H�a K� L�n"      ,"Th�i H� H�a K� L�n"    ,80},{"Th�i H� L�u Quang"    ,"Th�i H� L�u Quang"    ,1},},
	{{"Th�i H� Ph�ng ho�ng"        ,"Th�i H� Ph�ng ho�ng"      ,80},{"Th�i H� H�aPh�ng ho�ng"  ,"Th�i H� H�aPh�ng ho�ng"  ,1},},
	{{"Th�i H� Ki�m ti�n T�"      ,"Th�i H� Ki�m ti�n T�"    ,80},{"Th�i H� Phong Nh�t Ph�m"  ,"Th�i H� Phong Nh�t Ph�m"  ,1},},
	{{"Th�i H� Ki�m Cu�ng"        ,"Th�i H� Ki�m Cu�ng"      ,80},{"Th�i H� L�m Xung"    ,"Th�i H� L�m Xung"    ,1},},
	{{"Th�i H� B� T�y T�ng"        ,"Th�i H� B� T�y T�ng"      ,80},{"Th�i H� Ng�u ��u Qu�i"    ,"Th�i H� Ng�u ��u Qu�i"    ,1},},
	{{"Th�i H� Cao Ph� So�i"      ,"Th�i H� Cao Ph� So�i"    ,80},{"Th�i H� Hoa Th�nh"    ,"Th�i H� Hoa Th�nh"    ,1},},
	{{"Th�i H� Hoa Si N�"      ,"Th�i H� Hoa Si N�"    ,80},{"Th�i H� T� Ti�n"    ,"Th�i H� T� Ti�n"    ,1},},
	{{"Th�i H� T�ng qu�n"        ,"Th�i H� T�ng qu�n"      ,80},{"Th�i H� Kh� m�p"  ,"Th�i H� Kh� m�p"  ,1},},
	{{"B�n n�ng c�p-Th�i H� B�n Th�"      ,"Th�i H� C� Th�-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� Nguy�t L��ng Th�"  ,"Th�i H� Nguy�t Th�-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� V��n to"        ,"Th�i H� C� Vi�n-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� Vi�n Nh�n V��ng"  ,"Th�i H� H�u V��ng-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� M�nh h�"        ,"Th�i H� M�nh h�-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� H� tr�ng"    ,"Th�i H� B�ch H�-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Qu� �en"        ,"Th�i H� H�c Nha-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� B�ch �i�u"    ,"Th�i H� B�ch �i�u-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Ki�m S�t"        ,"Th�i H� Ki�m S�t-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� H�o V� Ki�m"  ,"Th�i H� H�o Ki�m-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� Th�c Nh�n hoa"      ,"Th�i H� Th�c Hoa-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� Th� Y�u"    ,"Th�i H� Th� Y�u-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� B�ch Y�u H�"      ,"Th�i H� B�ch H�-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� H�aY�u H�"  ,"Th�i H� H�a H�-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� C�m Ti�n T�"      ,"Th�i H� C�m Ti�n-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� Th�n N�"    ,"Th�i H� Th�n N�-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Tuy�t Qu�i"        ,"Th�i H� Tuy�t Qu�i-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� Tr� V��ng"    ,"Th�i H� Tr� V��ng-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Th�o Kh�u"        ,"Th�i H� Th�o Kh�u-C��ng"      ,80},{"B�n n�ng c�p-Th�i H�Tr� ��ng"    ,"Th�i H� Tr� ��ng-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Lam Ti�u �ao qu�"    ,"Th�i H� Lam �ao-C��ng"  ,80},{"B�n n�ng c�p-Th�i H� Du H�n"    ,"Th�i H� Du H�n-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Ti�u H�ng xoa qu�"    ,"Th�i H� H�ng Xoa-C��ng"  ,80},{"B�n n�ng c�p-Th�i H� Oan H�n"    ,"Th�i H� Oan H�n-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Lam Phi tr�o qu�"    ,"Th�i H� Lam Tr�o-C��ng"  ,80},{"B�n n�ng c�p-Th�i H� L�nh H��ng Ng�ng"  ,"Th�i H� L�nh H��ng-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� Ki�m t��ng"  ,"Th�i H� Ki�m T��ng-C��ng",80},{"B�n n�ng c�p-Th�i H� Huy�n V� Ki�m","Th�i H� �o Ki�m-C��ng",1},},
	{{"B�n n�ng c�p-Th�i H� S�n T�c ��u M�c"    ,"Th�i H� T�c L�nh-C��ng"  ,80},{"B�n n�ng c�p-Th�i H� Nguy Ch�n Thi�n"  ,"Th�i H� Ch�n Thi�n-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� M�u D� Xoa"      ,"Th�i H� M�u D� Xoa-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� T�ng �c"    ,"Th�i H� �c T�ng-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Ki�m H�n"        ,"Th�i H� Ki�m H�n-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� Ki�m Ma"    ,"Th�i H� Ki�m Ma-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� H�a K� L�n"      ,"Th�i H� H�a K� L�n-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� L�u Quang"    ,"Th�i H� L�u Quang-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Ph�ng ho�ng"        ,"Th�i H� Ph�ng Ho�ng-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� H�aPh�ng ho�ng"  ,"Th�i H� H�a Ph�ng-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� Ki�m ti�n T�"      ,"Th�i H� Ki�m Ti�n-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� Phong Nh�t Ph�m"  ,"Th�i H� Nh�t Ph�m-C��ng"  ,1},},
	{{"B�n n�ng c�p-Th�i H� Ki�m Cu�ng"        ,"Th�i H� Ki�m Cu�ng-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� L�m Xung"    ,"Th�i H� L�m Xung-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� B� T�y T�ng"        ,"Th�i H� Mao Ng�u-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� Ng�u ��u Qu�i"    ,"Th�i H� Ng�u Qu�i-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Cao Ph� So�i"      ,"Th�i H� Ph� So�i-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� Hoa Th�nh"    ,"Th�i H� Hoa Th�nh-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� Hoa Si N�"      ,"Th�i H� Hoa N�-C��ng"    ,80},{"B�n n�ng c�p-Th�i H� T� Ti�n"    ,"Th�i H� T� Ti�n-C��ng"    ,1},},
	{{"B�n n�ng c�p-Th�i H� T�ng qu�n"        ,"Th�i H� T�ng Qu�n-C��ng"      ,80},{"B�n n�ng c�p-Th�i H� Kh� m�p"  ,"Th�i H� C� H�u-C��ng"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� B�n Th�"      ,"Th�i H� C� Th�-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� Nguy�t L��ng Th�"  ,"Th�i H� Nguy�t Th�-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� V��n to"        ,"Th�i H� C� Vi�n-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� Vi�n Nh�n V��ng"  ,"Th�i H� H�u V��ng-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� M�nh h�"        ,"Th�i H� M�nh h�-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� H� tr�ng"    ,"Th�i H� B�ch H�-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Qu� �en"        ,"Th�i H� H�c Nha-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� B�ch �i�u"    ,"Th�i H� B�ch �i�u-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Ki�m S�t"        ,"Th�i H� Ki�m S�t-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� H�o V� Ki�m"  ,"Th�i H� H�o Ki�m-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� Th�c Nh�n hoa"      ,"Th�i H� Th�c Hoa-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� Th� Y�u"    ,"Th�i H� Th� Y�u-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� B�ch Y�u H�"      ,"Th�i H� B�ch H�-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� H�aY�u H�"  ,"Th�i H� H�a H�-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� C�m Ti�n T�"      ,"Th�i H� C�m Ti�n-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� Th�n N�"    ,"Th�i H� Th�n N�-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Tuy�t Qu�i"        ,"Th�i H� Tuy�t Qu�i-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� Tr� V��ng"    ,"Th�i H� Tr� V��ng-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Th�o Kh�u"        ,"Th�i H� Th�o Kh�u-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H�Tr� ��ng"    ,"Th�i H� Tr� ��ng-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Lam Ti�u �ao qu�"    ,"Th�i H� Lam �ao-Tinh"  ,80},{"B�n t�ng c��ng-Th�i H� Du H�n"    ,"Th�i H� Du H�n-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Ti�u H�ng xoa qu�"    ,"Th�i H� H�ng Xoa-Tinh"  ,80},{"B�n t�ng c��ng-Th�i H� Oan H�n"    ,"Th�i H� Oan H�n-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Lam Phi tr�o qu�"    ,"Th�i H� Lam Tr�o-Tinh"  ,80},{"B�n t�ng c��ng-Th�i H� L�nh H��ng Ng�ng"  ,"Th�i H� L�nh H��ng-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� Ki�m t��ng"  ,"Th�i H� Ki�m T��ng-Tinh",80},{"B�n t�ng c��ng-Th�i H�Huy�n V� Ki�m","Th�i H� �o Ki�m-Tinh",1},},
	{{"B�n t�ng c��ng-Th�i H� S�n T�c ��u M�c"    ,"Th�i H� T�c L�nh-Tinh"  ,80},{"B�n t�ng c��ng-Th�i H� Nguy Ch�n Thi�n"  ,"Th�i H� Ch�n Thi�n-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� M�u D� Xoa"      ,"Th�i H� M�u D� Xoa-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� T�ng �c"    ,"Th�i H� �c T�ng-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Ki�m H�n"        ,"Th�i H� Ki�m H�n-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� Ki�m Ma"    ,"Th�i H� Ki�m Ma-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� H�a K� L�n"      ,"Th�i H� H�a K� L�n-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� L�u Quang"    ,"Th�i H� L�u Quang-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Ph�ng ho�ng"        ,"Th�i H� Ph�ng Ho�ng-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� H�aPh�ng ho�ng"  ,"Th�i H� H�a Ph�ng-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� Ki�m ti�n T�"      ,"Th�i H� Ki�m Ti�n-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� Phong Nh�t Ph�m"  ,"Th�i H� Nh�t Ph�m-Tinh"  ,1},},
	{{"B�n t�ng c��ng-Th�i H� Ki�m Cu�ng"        ,"Th�i H� Ki�m Cu�ng-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� L�m Xung"    ,"Th�i H� L�m Xung-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� B� T�y T�ng"        ,"Th�i H� Mao Ng�u-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� Ng�u ��u Qu�i"    ,"Th�i H� Ng�u Qu�i-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Cao Ph� So�i"      ,"Th�i H� Ph� So�i-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� Hoa Th�nh"    ,"Th�i H� Hoa Th�nh-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� Hoa Si N�"      ,"Th�i H� Hoa N�-Tinh"    ,80},{"B�n t�ng c��ng-Th�i H� T� Ti�n"    ,"Th�i H� T� Ti�n-Tinh"    ,1},},
	{{"B�n t�ng c��ng-Th�i H� T�ng qu�n"        ,"Th�i H� T�ng Qu�n-Tinh"      ,80},{"B�n t�ng c��ng-Th�i H� Kh� m�p"  ,"Th�i H� C� H�u-Tinh"  ,1},},
	{{"B�n cu�i-Th�i H� B�n Th�"      ,"Th�i H� C� Th�-C�c"    ,80},{"B�n cu�i-Th�i H� Nguy�t L��ng Th�"  ,"Th�i H� Nguy�t Th�-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� V��n to"        ,"Th�i H� C� Vi�n-C�c"      ,80},{"B�n cu�i-Th�i H� Vi�n Nh�n V��ng"  ,"Th�i H� H�u V��ng-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� M�nh h�"        ,"Th�i H� M�nh h�-C�c"      ,80},{"B�n cu�i-Th�i H� H� tr�ng"    ,"Th�i H� B�ch H�-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Qu� �en"        ,"Th�i H� H�c Nha-C�c"      ,80},{"B�n cu�i-Th�i H� B�ch �i�u"    ,"Th�i H� B�ch �i�u-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Ki�m S�t"        ,"Th�i H� Ki�m S�t-C�c"      ,80},{"B�n cu�i-Th�i H� H�o V� Ki�m"  ,"Th�i H� H�o Ki�m-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� Th�c Nh�n hoa"      ,"Th�i H� Th�c Hoa-C�c"    ,80},{"B�n cu�i-Th�i H� Th� Y�u"    ,"Th�i H� Th� Y�u-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� B�ch Y�u H�"      ,"Th�i H� B�ch H�-C�c"    ,80},{"B�n cu�i-Th�i H� H�aY�u H�"  ,"Th�i H� H�a H�-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� C�m Ti�n T�"      ,"Th�i H� C�m Ti�n-C�c"    ,80},{"B�n cu�i-Th�i H� Th�n N�"    ,"Th�i H� Th�n N�-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Tuy�t Qu�i"        ,"Th�i H� Tuy�t Qu�i-C�c"      ,80},{"B�n cu�i-Th�i H� Tr� V��ng"    ,"Th�i H� Tr� V��ng-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Th�o Kh�u"        ,"Th�i H� Th�o Kh�u-C�c"      ,80},{"B�n cu�i-Th�i H�Tr� ��ng"    ,"Th�i H� Tr� ��ng-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Lam Ti�u �ao qu�"    ,"Th�i H� Lam �ao-C�c"  ,80},{"B�n cu�i-Th�i H� Du H�n"    ,"Th�i H� Du H�n-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Ti�u H�ng xoa qu�"    ,"Th�i H� H�ng Xoa-C�c"  ,80},{"B�n cu�i-Th�i H� Oan H�n"    ,"Th�i H� Oan H�n-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Lam Phi tr�o qu�"    ,"Th�i H� Lam Tr�o-C�c"  ,80},{"B�n cu�i-Th�i H� L�nh H��ng Ng�ng"  ,"Th�i H� L�nh H��ng-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� Ki�m t��ng"  ,"Th�i H� Ki�m T��ng-C�c",80},{"B�n cu�i-Th�i H� Huy�n V� Ki�m","Th�i H� �o Ki�m-C�c",1},},
	{{"B�n cu�i-Th�i H� S�n T�c ��u M�c"    ,"Th�i H� T�c L�nh-C�c"  ,80},{"B�n cu�i-Th�i H� Nguy Ch�n Thi�n"  ,"Th�i H� Ch�n Thi�n-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� M�u D� Xoa"      ,"Th�i H� M�u D� Xoa-C�c"    ,80},{"B�n cu�i-Th�i H� T�ng �c"    ,"Th�i H� �c T�ng-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Ki�m H�n"        ,"Th�i H� Ki�m H�n-C�c"      ,80},{"B�n cu�i-Th�i H� Ki�m Ma"    ,"Th�i H� Ki�m Ma-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� H�a K� L�n"      ,"Th�i H� H�a K� L�n-C�c"    ,80},{"B�n cu�i-Th�i H� L�u Quang"    ,"Th�i H� L�u Quang-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Ph�ng ho�ng"        ,"Th�i H� Ph�ng Ho�ng-C�c"      ,80},{"B�n cu�i-Th�i H� H�aPh�ng ho�ng"  ,"Th�i H� H�a Ph�ng-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� Ki�m ti�n T�"      ,"Th�i H� Ki�m Ti�n-C�c"    ,80},{"B�n cu�i-Th�i H� Phong Nh�t Ph�m"  ,"Th�i H� Nh�t Ph�m-C�c"  ,1},},
	{{"B�n cu�i-Th�i H� Ki�m Cu�ng"        ,"Th�i H� Ki�m Cu�ng-C�c"      ,80},{"B�n cu�i-Th�i H� L�m Xung"    ,"Th�i H� L�m Xung-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� B� T�y T�ng"        ,"Th�i H� Mao Ng�u-C�c"      ,80},{"B�n cu�i-Th�i H� Ng�u ��u Qu�i"    ,"Th�i H� Ng�u Qu�i-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Cao Ph� So�i"      ,"Th�i H� Ph� So�i-C�c"    ,80},{"B�n cu�i-Th�i H� Hoa Th�nh"    ,"Th�i H� Hoa Th�nh-C�c"    ,1},},
	{{"B�n cu�i-Th�i H� Hoa Si N�"      ,"Th�i H� Hoa N�-C�c"    ,80},{"B�n cu�i-Th�i H� T� Ti�n"    ,"Th�i H� T� Ti�n-C�c"    ,1},},
	{{"Th�i H� Th�n Nhi t�"        ,"Th�i H� Th�n Nhi t�"      ,80},{"Th�i H� Thanh Thanh"  ,"Th�i H� Thanh Thanh"  ,1},},
	}
	
tBoxNpc = {"R��ng Qu�i Th�i H�","Qu�i R��ng"} -- ģ�����֣�����