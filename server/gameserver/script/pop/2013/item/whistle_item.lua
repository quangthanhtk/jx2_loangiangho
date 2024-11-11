--��̽����
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--��Ҫȥ�ĵ�
sOtherMapMsg = "H�i ��ng Thanh nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, khu v�c n�y kh�ng c� t�nh b�o, b�o ng��i ��n <color=red>Ng�a Long ��ng 1<color>, <color=red>Ng�a Long ��ng 2<color>, <color=red>Ng�a Long ��ng 3<color> t�m th�."
sAllMapFindMsg = "T�t c� t�nh b�o ��u b� ph�t hi�n.";
g_tMapName = {" <color=red>Ng�a Long ��ng 1<color> "," <color=red>Ng�a Long ��ng 2<color> "," <color=red>Ng�a Long ��ng 3<color> "};

g_tGTaskId = {1325,1339};  --�漰��������id �鿴gtask_main

g_nMapId1 = 610;
g_nMapId2 = 611;
g_nMapId3 = 612;

tTreasureTable = {
	[g_nMapId1] = {			--������һ���鱨
		{610,2163,4244,},
		{610,2169,4204,},
		{610,2244,4354,},
		{610,1835,4317,},
		{610,2074,4065,},
	},
	[g_nMapId2] = {			--�����������鱨
		{611,2163,4244,},
		{611,2169,4204,},
		{611,2244,4354,},
		{611,1835,4317,},
		{611,2074,4065,},
	},
	[g_nMapId3] = {			--�����������鱨
		{612,2163,4244,},
		{612,2169,4204,},
		{612,2244,4354,},
		{612,1835,4317,},
		{612,2074,4065,},
	},
}
	
tBitIdx = {
	[g_nMapId1] = 1, [g_nMapId2] = 2,[g_nMapId3] = 3,
	}	
	
tAward = {
	[g_nMapId1] = {"T�nh B�o Ng�a Long ��ng 1", {2, 111,3,1}, },
	[g_nMapId2] = {"T�nh B�o Ng�a Long ��ng 2", {2, 111,4,1}, },
	[g_nMapId3] = {"T�nh B�o Ng�a Long ��ng 3", {2, 111,5,1}, },
};

--TASKID_2013_NEW_TASK_SEARCH  bit_1 bit_2 bit_3 ��¼3����ͼ�ı����Ƿ��ҵ���byte_2 ��¼�浽�ĵ�ͼ�����Idx
function OnUse(nItemIndex)
		--�ж���û�н�����
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		Talk(1, "", "<color=green>Nhan Th� T�n Ti�u<color>: Ng��i ch�a nh�n nhi�m v�!");
		return 0;
	end
	local nMapID, nMapX, nMapY = GetWorldPos();
	--��ͼ����
	local nIdx1 = gf_GetTaskByte(TASKID_2013_NEW_TASK_SEARCH,2);
	if nIdx1 == 0 then 
			nIdx1 = random(1,getn(tTreasureTable[g_nMapId1]));
			gf_SetTaskByte(TASKID_2013_NEW_TASK_SEARCH,2,nIdx1);
	end	
	if not tTreasureTable[nMapID] then
		Talk(1,"",sOtherMapMsg);
		return 0;
	end
	local sMapMsg = "H�i ��ng Thanh nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, khu v�c n�y kh�ng c� t�nh b�o, b�o ng��i ��n ";
--	local tMapNum = {"��Ѱ��","��Ѱ��"};
	if  gf_GetTaskBit(TASKID_2013_NEW_TASK_SEARCH,tBitIdx[nMapID]) == 1 then --�����ͼ���鱨�Ѿ��������ˡ�
		local nUnfindMap = 0;
		for i = 1,3 do
			if gf_GetTaskBit(TASKID_2013_NEW_TASK_SEARCH,i) == 0 then
				nUnfindMap = nUnfindMap + 1;
				sMapMsg = sMapMsg .. g_tMapName[i];
			end
		end
		if nUnfindMap == 0 then
			Talk(1,"",sAllMapFindMsg);
			return 0;
		else
			sMapMsg = sMapMsg .. " t�m th�.";
			Talk(1,"",sMapMsg);
			return 0;
		end
	end

	local tSet = tTreasureTable[nMapID][nIdx1];
	--�ڱ��ɹ�
	if nMapID == tSet[1] and nMapX > tSet[2] - 50 and nMapX < tSet[2] + 50 and nMapY > tSet[3] - 50 and nMapY < tSet[3] + 50 then
		if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
			return
		end
		gf_AddItemEx(tAward[nMapID][2], tAward[nMapID][1]);
		gf_SetTaskBit(TASKID_2013_NEW_TASK_SEARCH,tBitIdx[nMapID],1);
		Talk(1, "", "H�i ��ng Thanh nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, v�t n�y ch�c l� t�nh b�o r�i.");
		return 0;
	end

	--����
	if tSet[2] - nMapX > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "H�i ��ng Thanh nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a ��ng c�ch ng��i kh�ng xa.");
		return
	end

	--����
	if nMapX - tSet[2] > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "H�i ��ng Thanh nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a t�y c�ch ng��i kh�ng xa.");
		return
	end

	--����
	if nMapY - tSet[3] > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "H�i ��ng Thanh nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a b�c c�ch ng��i kh�ng xa.");
		return
	end

	--����
	if tSet[3] - nMapY > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "H�i ��ng Thanh nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a nam c�ch ng��i kh�ng xa.");
		return
	end
end
