Import("\\script\\missions\\yp\\ywz\\head.lua")

function main()
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	if ywz_GetBoxAwardFlag() ~= 0 then
		Talk(1,"","M�i ng��i ch� ���c nh�n th��ng 1 l�n.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local tNpc2Shili = {
		[1] = "Th� L�c ��i L�",
		[2] = "Th� L�c Th� Ph�n",
		[3] = "Th� L�c T�y H�",
	}
	local npcIndex = GetTargetNpc();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if not tNpc2Shili[nCamp] then
		Talk(1,"","B�n ch�a gia nh�p th� l�c, kh�ng th� tham gia.")
		return 0;
	end
	if nCamp ~= GetNpcTempData(npcIndex, 2) then
		Talk(1,"",format("Ch� c� %s ��nh b�i BOSS m�i ���c nh�n th��ng.", tNpc2Shili[nCamp]));
		return 0;
	end
	ywz_SetBoxAwardFlag(1);
	local nCount = GetNpcTempData(npcIndex, 1);
	SetNpcTempData(npcIndex, 1, nCount - 1);
	if nCount <= 0 then
		SetNpcLifeTime(npcIndex, 0);
	end
	gf_AddItemEx2({2, 1, 30968, 1}, "R��ng X�y D�ng Th� L�c", "Th� L�c Ba Phe-Di�n V� Chi�n", "��nh b�i BOSS Trung L�p", 0, 1);
end