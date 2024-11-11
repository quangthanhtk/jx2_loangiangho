Include("\\script\\function\\honor_tong\\ht_head.lua")

function OnUse(nItem)
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= 108 then
		Talk(1,"","H�y ��n B�c Tuy�n Ch�u d�ng V� L�m Hi�u Tri�u L�nh tri�u h�i ��ng Ph��ng B�t B�i!");
		return 0;
	end
	if GetTongDuty() ~= 1 then
		Talk(1,"","Ch� c� bang ch� m�i c� th� d�ng V� L�m Hi�u Tri�u L�nh!");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc("��ng Ph��ng B�t B�i", "��ng Ph��ng B�t B�i", nMapId, nX, nY);
	if npcIndex <= 0 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 30*60);
	SetNpcDeathScript(npcIndex, "\\script\\function\\honor_tong\\ht_extend.lua");
	SetNpcTempData(npcIndex, 1, GetTongID()); --���ɹ���
	SetNpcTempData(npcIndex, 2, gf_GetTaskByte(HT_TASK_1, 2));  --�Ƿ��ǵ�һ������
	Msg2Tong(format("Bang ch� %s � B�c Tuy�n Ch�u d�ng V� L�m Hi�u Tri�u L�nh tri�u h�i BOSS ��ng Ph��ng B�t B�i, c�c v� h�y nhanh ch�ng �i khi�u chi�n BOSS �� nh�n ph�n th��ng phong ph� n�o!", GetName()));
end

function OnDeath(id, f, x)
	local nTargetTong = GetNpcTempData(id, 1);
	local bRankOne = GetNpcTempData(id, 2);
	local nMapID, nX, nY = GetNpcWorldPos(id);
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("jinbaoxiang", "R��ng V�ng Bang Ph�i", nMapID, nX, nY);
	SetNpcScript(npcIndex, "\\script\\function\\honor_tong\\ht_extend.lua");
	SetNpcLifeTime(npcIndex, 10*60);
	SetNpcTempData(npcIndex, 1, nTargetTong); --���ɹ���
	SetNpcTempData(npcIndex, 2, bRankOne);  --�Ƿ��ǵ�һ������
end

function main()
	if gf_GetTaskByte(HT_TASK_1, 3) ~= 0 then
		Talk(1,"",format("%s �� nh�n ph�n th��ng r��ng, kh�ng th� nh�n l�i!", gf_GetPlayerSexName()));
		return 0;
	end
	
	local nTargetNpc = GetTargetNpc();
	local nTargetTong = GetNpcTempData(nTargetNpc, 1);
	if nTargetTong ~= GetTongID() then
		Talk(1,"","Ch� c� th�nh vi�n c�a bang h�i m�i c� th� nh�n th��ng!");
		return 0;
	end
	local nJoinTime = GetJoinTongTime();
	if nJoinTime <= 0 or GetTime() - nJoinTime < 7 * 24 * 3600 then
		Talk(1,"",HT_NPC..format("%s ch�a gia nh�p bang h�i ho�c th�i gian gia nh�p kh�ng �� %d ng�y", gf_GetPlayerSexName(), 7));
		return 0;
	end
	
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	
	if gf_Check55HaveSkill() ~= 1 then
		Talk(1,"",HT_NPC.."C�c h� ch�a h�c skill 55. Kh�ng th� nh�n th��ng!")
		return 0;
	end
	
	local nRankone = GetNpcTempData(nTargetNpc, 2);
	local nTongDuty = GetTongDuty();
	if nTongDuty == 1 then --����
		if GetNpcTempData(nTargetNpc, 3) ~= 0 then
			Talk(1,"","Bang ch� �� nh�n th��ng r�i, kh�ng th� nh�n l�i!");
			return 0;
		end
		if gf_Judge_Room_Weight(15, 100,1) ~= 1 then
			Talk(1,"",szMsgHead.."H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!");
			return 0;
		end
		gf_SafeSetTaskByte(HT_TASK_1, 3, 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(10000000);
		gf_AddItemEx2({2, 1, 1210, 3}, "B�o r��ng T�i nguy�n", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 3600 * 24, 1);
		hte_RandBook();
		gf_AddItemEx2({2, 1, 30844, 1, 4}, "R��ng H�a Ph�ng", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
		if nRankone == 1 then --��������
			gf_AddItemEx2({0, 105, 10112, 1, 4, -1, -1, -1, -1, -1, -1}, "T� Ng�c Tr��ng Phong", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 7*24*3600, 1);
			gf_AddItemEx2({2, 1, 1210, 5}, "B�o r��ng T�i nguy�n", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
			for i = 1, 2 do
				hte_RandBook();
			end
			gf_AddItemEx2({2, 1, 30844, 2, 4}, "R��ng H�a Ph�ng", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
		end
		SetNpcTempData(nTargetNpc, 3, 1); --��ǰ�������
	else --����
		gf_SafeSetTaskByte(HT_TASK_1, 3, 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(10000000);
		gf_EventGiveCustomAward(5, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		gf_EventGiveCustomAward(9, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		gf_EventGiveCustomAward(12, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		if nRankone == 1 then --��������
			gf_ModifyExp(10000000);
			gf_EventGiveCustomAward(5, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
			gf_EventGiveCustomAward(9, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
			gf_EventGiveCustomAward(12, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		end
	end
end

function hte_RandBook()
	local tAward = {
		{0, 107, 30001, "Kim Cang B�t Nh� Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30002, "Ti�m Long T�c Di�t Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30003, "V� Tr�n B� �� Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30004, "Thi�n La Li�n Ch�u Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30005, "Nh� � Kim ��nh Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30006, "B�ch H�i Tuy�t �m Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30007, "H�n ��n Tr�n Nh�c Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30008, "Qu� Thi�n Du Long Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30009, "Huy�n �nh M� T�ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30010, "Qu�n T� ��i Phong Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30011, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30012, "Xuy�n V�n L�c H�ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30013, "Huy�n Minh Phong Ma Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30014, "Linh C� Huy�n T� Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30015, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30016, "H�ng Tr�n T�y M�ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30017, "Phong Hoa Thi�n Di�p Ch�n Quy�n (Cao c�p)"},
	}
	local nIndex = random(getn(tAward));
	gf_AddItemEx2({tAward[nIndex][1], tAward[nIndex][2], tAward[nIndex][3], 1}, tAward[nIndex][4], "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
end