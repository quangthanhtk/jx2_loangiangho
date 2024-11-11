Import("\\script\\missions\\yp\\ywz\\head.lua")

function main()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local wDay = tonumber(date("%w"))
	if wDay < 1 or wDay > 5 then
		return 0;
	end
	local msg = "Di�n V� ��c S�t S� �� xu�t hi�n � Th�t L�c Nhai, c�c v� ��i hi�p c� th� ��n tham gia th� luy�n."
	local tPos = {
		{6300,1281,3373},
		{6300,1288,3114},
		{6300,1537,3215},
	}
	local index = random(getn(tPos));
	local npcIndex = CreateNpc("SFYWZ_YWDCS", "Di�n V� ��c S�t S�", tPos[index][1], tPos[index][2], tPos[index][3]);
	if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\missions\\yp\\ywz\\call_boss.lua");
		SetNpcLifeTime(npcIndex, 30*60);
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
	end
end

function OnDeath(id, f, x)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local tNpc2Shili = {
		[0] = "Th� L�c Trung L�p",
		[1] = "Th� L�c ��i L�",
		[2] = "Th� L�c Th� Ph�n",
		[3] = "Th� L�c T�y H�",
	}
	SetNpcLifeTime(id, 0);
	gf_AddItemEx2({2, 1, 30968, 1}, "R��ng X�y D�ng Th� L�c", "Th� L�c Ba Phe-Di�n V� Chi�n", "��nh b�i BOSS Trung L�p", 0, 1);
	local msg = format("Di�n V� ��c S�t S� �� b� %s ��nh b�i, h�t ho�ng b� ch�y.", tNpc2Shili[nCamp]);
	Msg2Global(msg);
	AddGlobalNews(msg, 1);
	if nCamp < 1 or nCamp > 3 then
		return 0;
	end
	local nMapID, nX, nY = GetWorldPos();
	local tPlayer = GetMapPlayer(nMapID);
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if GetTask(TASK_FIELD_PVP_CAMP) == nCamp then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	local npcIndex = CreateNpc("SFYWZ_JSBX", "R��ng X�y D�ng Th� L�c", nMapID, nX, nY);
	if npcIndex > 0 then
		SetNpcLifeTime(npcIndex, 10*60);
		SetNpcTempData(npcIndex, 1, nCount);
		SetNpcTempData(npcIndex, 2, nCamp);
		SetNpcScript(npcIndex, "\\script\\missions\\yp\\ywz\\npc_box.lua");
	end
end
