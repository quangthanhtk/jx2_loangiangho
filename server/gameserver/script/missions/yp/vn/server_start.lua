function on_server_start()
	Add_Channel()
	Add_PopNpc()
	AddPVPNpc()
	SendScript2VM("\\script\\missions\\yp\\ywz\\head.lua", "ywz_CreateNpc()")
end

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		if npc > 0 then
			SetNpcScript(npc, tNpc[6] or "");
		else
			local idx = SubWorldID2Idx(tNpc[3])
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or "")
				WriteLog(szMsg)
				print(szMsg)
			end
		end		
	end
end

function Add_Channel()
	local tChannel =
	{	--Ƶ��������ID
		[1] = {"Th� L�c ��i L�", 42},
		[2] = {"Th� L�c Th� Ph�n", 43},
		[3] = {"Th� L�c T�y H�", 44},
	}
	for i=1, getn(tChannel) do
		CreateChannel(tChannel[i][1], tChannel[i][2], 0, 10000);
	end;
end

function Add_PopNpc()		--����npc
	CreateNpcList({
		{"men6_fengyun_tayun", "��p v�n-L�c Phi�n M�n", 6300, 1413, 3252},
		{"zongbiaotou_yuntianqi", "Thi�n Kh�i-Ti�u ��u", 6300, 1349, 3258},
		--{"linjiacheng", "�̻ḻ���ּγ�", 6300, 1386, 3296},
		{"Tri�u ��nh m�t th�m Th�m Trung", "Tri�u ��nh m�t th�m Th�m Trung", 6400, 1722, 3275},
		--{"qianfuwren", "���Ǯׯ�ϰ�Ǯ����", 6300, 1372, 3297},
		{"�o�n T� Ki�t", "Danh V�ng Th��ng Nh�n-�o�n T� Ki�t", 6000, 1604, 2776},
		{"L� Ng�o Thi�n", "Danh V�ng Th��ng Nh�n-L� Ng�o Thi�n", 6200, 1443, 2597},
		{"T�t Gi� Minh Ph�", "Danh V�ng Th��ng Nh�n-T�t Gi� Minh Ph�", 6100, 1594, 3683},
		{"TXBJ_TYET", "Thi�n �m �c ��", 6400, 1831, 3392},
		{"FENGXINZI", "Phong T�n T� n� r�", 6300, 1407, 3128, "\\script\\task\\npc\\ʢ���ķ�����.lua"},
		--{"Zhuxiaobai", "��С��", 6400, 1860, 3509},
		{"tongmaguan", "��ng M� Qu�n", 6400, 1632, 3180},
		{"guojingan", "Qu�ch T�nh An", 6400, 1840, 3212},
		{"yuantongdashi", "Vi�n Th�ng ��i S�", 6400, 1640, 3518},
	});

	local nNpcIdx = CreateNpc("Linh T� Ki�m Di�c Kh� L�ng","Linh T� Ki�m Di�c Kh� L�ng",6300,1475,3228)
	SetNpcScript(nNpcIdx,"\\script\\pop\\npc_yikelin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Ph� H�n �ao L�m Phong", "Ph� H�n �ao L�m Phong", 6300, 1358, 3385)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Qu� �nh B�t L� Ch� Ki�t", "Qu� �nh B�t L� Ch� Ki�t", 6300, 1283, 3236)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("V� T�nh Tr�o Ti�u Thanh", "V� T�nh Tr�o Ti�u Thanh", 6300, 1462, 3382)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Ti�u c�c gian t� L� Tr�n Phong", "Ti�u c�c gian t� L� Tr�n Phong", 6400, 1780, 3173)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lichenfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6);
	
	local tPos = {
		{1860,3493}, {1865,6496}, {1865,3504}, {1859,3508}, {1851,3501},
		{1851,3488}, {1845,3481}, {1840,3485}, {1841,3473}, {1850,3482},
	}
	for _,v in tPos do
		nNpcIdx = CreateNpc("BIANLEI", "Bi�n L�i", 6400, v[1], v[2]);
		SetNpcScript(nNpcIdx, "\\script\\task\\npc\\�q��.lua");
	end
end

function AddPVPNpc()
	CreateNpcList({
		{"�o�n H�a Huy�n", "�o�n H�a Huy�n", 425,1762,3205, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"C�t Kh�m X�ch Ba", "C�t Kh�m X�ch Ba", 425,1740,3175, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"L� K� Tinh", "L� K� Tinh", 425,1763,3184, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"Xa phu", "Xa Phu T�y V�c", 425, 1744, 3204, "\\script\\missions\\yp\\cf_npc.lua"},
		{"Xa phu Trung Nguy�n","Xa Phu V� L�m Minh",425,1741,3232,"\\script\\tong\\npc_chehu.lua"},
		{"Xa phu Trung Nguy�n","Xa phu",429,1667,2872,"\\script\\������\\˪����\\npc\\npc_chefu.lua"},
		{"Ch�n T� ��n h�o hoa", "T�p k�ch h�nh ��ng ", 6300, 1353, 3276, "\\script\\missions\\yp\\slymg\\npc_award.lua"},
	});
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\slymg\\entrynpc.lua","gameStart()");
end
