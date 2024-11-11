function OnUse(nItem)
	local _, nMapId = SubWorldIdx2ID(SubWorld);
	if nMapId ~= 7119 then
		Talk(1,"","Ch� c� th� s� d�ng trong Di�n V� Chi�n")
		return 0;
	end
	local szItemName = GetItemName(nItem)
	local tName2Id = {
		["V�n Hoa ��n"] = {"state_critical_point_increase", 30, 300*18, 10031, 1},
		["Kh�ng Long T�n"] = {"state_critical_damage_increase", 50, 300*18, 10032, 2},
		["Ninh H� ��n"] = {"state_def_critical_point_increase", 20, 300*18, 10033, 3},
		["Tri�n Ph�ng T�n"] = {"state_def_critical_damage_increase", 50, 300*18, 10034, 4},
		["Ti�t C�t T�n"] = {"state_receive_half_damage", 15, 300*18, 10035, 5},
		["Ph� Qu�n ��n"] = {"state_destiny_attack_point_add", 300, 300*18, 10036, 6},
	}
	if not tName2Id[szItemName] then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	CastState(tName2Id[szItemName][1], tName2Id[szItemName][2], tName2Id[szItemName][3], 1, tName2Id[szItemName][4]);
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	Msg2Player(format("B�n �� d�ng d��c ph�m %s", szItemName));
	AddRuntimeStat(38, tName2Id[szItemName][5], 0, 1);
	return 1;
end