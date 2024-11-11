Include("\\script\\isolate\\functions\\gtask\\handler.lua")
--���е�����ɱ�ֵ��䶼�����������ˣ������ٵ������ô�����֮��
Include("\\script\\task\\global_task\\runtime_data_stat.lua")

---------------------
--config
tNpcDeathCfg = {
	--nTaskId, nTaskName, {NpcInfo}, fn, {fnPara}
	{415, "L�y l�i v�t ph�m", {"Giang H� Ti�u Ti�u ��u M�c", 6300}, fn_award_items, {5,100,{ 
																		{"V�n s�c-��u m�t linh kh�",{2,1,31085,1,4},1,100}, 
																		{"V�n s�c-�o m�t linh kh�",{2,1,31086,1,4},1,100}, 
																		{"V�n s�c-Qu�n m�t linh kh�",{2,1,31087,1,4},1,100}, 
																		{"V�n s�c-Gi�i m�t linh kh�",{2,1,31088,1,4},1,100}, 
																		{"V�n s�c-B�i m�t linh kh�",{2,1,31089,1,4},1,100}, 
																	}
																} 
	},
	{418, "�o�t Kim Tinh", {"Kim Linh ", 321}, fn_award_items, {1,100,{  {"Kim Tinh",{2,1,31091,1,4},1,100},   }}		},
	{430, "Phong V�n Kinh Bi�n", {"Tinh hoa Thi�n D��ng Giao", 6400}, fn_award_items, {1,100,{  {"M�t th� Thi�n �m gi�o",{2,1,31098,1,4},10,100},   }}		},
	{436, "�o�t l�i B�a", {"T�n tr�m b� �n", 208}, fn_award_items, {1,100,{  {"B�a c�a M�c Nh�",{2,1,31102,1,4},1,100},   }}		},
	{446, "Di�t �c qu�", {"Vua �c Qu�", 306}, fn_award_items, {1,100,{  {"Kh�n Tay C�a Vua �c Qu�",{2,1,31106,1,4},1,100},   }}		},
	{450, "Th� th�ch c�a Th�a T��ng", {"��i �ao Quan Th�ng", 6007}, fn_award_items, {1,100,{  {"Th� ��u H�ng",{2,1,31108,1,4},1,50},   }}		},

--		ս�������ڶ�������
	{469, "Khi�u chi�n ���ng M�n L�o L�o (2)", {"Ti�u Nhi�m Nguy�t Thi�n �m Gi�o", 7118}, fn_award_items, {1,100,{{"B�n V� C� Quan", {2,1,31143,1,4}, 1, 100},}}},
	{475, "Khi�u chi�n C�i Bang Bang Ch� (2)", {"Nhai Th��ng S�n T�c", 6300}, fn_award_items, {1,100,{{"T�i S�n B� C��p", {2,1,31145,1,4}, 50, 50},}}},
	
}







--never modify below
----------------------------------------------------------------------------
function gtask_npc_death_main(npcIdx, sName)
	local tCfg = tNpcDeathMap[sName]
	if tCfg then
		local nMyMapId = GetWorldPos()--���һ�±�ɱ�������ڵĵ�ͼ�Ƿ�����Ҫ��
		if nMyMapId >= 65536 then--������ȡģ��ID
			local nMapIndex = SubWorldID2Idx(nMyMapId)
			nMyMapId = GetMapTemplate(nMapIndex)
		end
		for i=1,getn(tCfg) do
			local t = tCfg[i]
			local nMapId = t[3][2]
			if nMapId == -1 or nMapId == nMyMapId then
				gt_add_runtime_stat("kill_boss", t[1], 0, 1)
				_fn_task_dispatch(t)
			end
		end
	end
end

--npc death event
-------------------------------------------------------------------------
function fn_make_npc_death_map()
	if not tNpcDeathCfg then
		error("cannnot call fn_make_npc_death_map without tNpcDeathCfg")
		return
	end
	tNpcDeathMap = {}
	for i=1,getn(tNpcDeathCfg) do
		local t = tNpcDeathCfg[i]
		local szNpcName = t[3][1]
		local tCfg = tNpcDeathMap[szNpcName] or {}
		tinsert(tCfg, t)
		tNpcDeathMap[szNpcName] = tCfg
	end
end

tNpcDeathMap = nil
fn_make_npc_death_map()