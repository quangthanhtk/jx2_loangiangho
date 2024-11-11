--���ְ���
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tLv1KeBan = {
	{ "Kh�c B�n V� C�p 1 (��u)", 2, 1, 31068, },
    { "Kh�c B�n V� C�p 1 (�o)", 2, 1, 31069, },
    { "Kh�c B�n V� C�p 1 (Qu�n)", 2, 1, 31070, },
    { "Kh�c B�n V� C�p 1 (Nh�n)", 2, 1, 31071, },
    { "Kh�c B�n V� C�p 1 (Ng�c B�i)", 2, 1, 31072, },
}
tLv2KeBan = {
    { "Kh�c B�n V� C�p 2 (��u)", 2, 1, 31078,  },
    { "Kh�c B�n V� C�p 2 (�o)", 2, 1, 31079, },
    { "Kh�c B�n V� C�p 2 (Qu�n)", 2, 1, 31080, },
    { "Kh�c B�n V� C�p 2 (Nh�n)", 2, 1, 31081, },
    { "Kh�c B�n V� C�p 2 (Ng�c B�i)", 2, 1, 31082, },
}
tLv5PetBook = {
    {"Ch�n Kh� H� Th� C�p 5", 2, 150, 67},
    {"�ch Th� Di�n D��ng C�p 5", 2, 150, 68},
    {"C��ng Th�n B� Th� C�p 5", 2, 150, 69},
    {"�m Phong Th�c C�t C�p 5", 2, 150, 70},
    {"Huy�n V� V� Song C�p 5", 2, 150, 71},
    {"V� H�nh V� T��ng C�p 5", 2, 150, 72},
    {"Kim Linh Ph� Th� C�p 5", 2, 150, 73},
    {"M�c Linh Ph� Th� C�p 5", 2, 150, 74},
    {"Thu� Linh Ph� Th� C�p 5", 2, 150, 75},
    {"Ho� Linh Ph� Th� C�p 5", 2, 150, 76},
    {"Th� Linh Ph� Th� C�p 5", 2, 150, 77},
    {"Ph� Kh�ng Tr�m �nh C�p 5", 2, 150, 78},
    {"S�t Th��ng Gia N�ng C�p 5", 2, 150, 79},
    {"Khinh Linh T�n T�t C�p 5", 2, 150, 80},
    {"V� H�nh Chi C� C�p 5", 2, 150, 81},
    {"Linh Quang Nh�t Thi�m C�p 1", 2, 150, 82},
    {"Ng�ng Th�n Quy�t C�p 1", 2, 150, 83},
    {"Kinh ��o Quy�t C�p 1", 2, 150, 84},
    {"Nguy�n Th�y B�o N� C�p 1", 2, 150, 85},
    {"Thi�t B� Sam C�p 1", 2, 150, 86},

}
g_tBoxPack = { -- ����
    [200131202] = { "T�i kh�c b�n c�p 1", "Kh�c b�n c�p 1", tLv1KeBan, 1, 4},
    [200131203] = { "T�i kh�c b�n c�p 2", "Kh�c b�n c�p 2", tLv2KeBan, 1, 4},
    [200131201] = { "T�i s�ch k� n�ng lv5", "S�ch K� N�ng Th� C�ng C�p 5", tLv5PetBook, 1, 4},
}

function OnUse(idx)
	local nItemIndex	= tonumber(idx);
	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	local nId = PackItemId(nG, nD, nP)
	local tItem		= g_tBoxPack[nId];

	if not tItem then
		return 0;
	end
	
	if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
		return 0;
	end
	
	if 1 ~= DelItemByIndex(nItemIndex, 1) then
		return 0;
	end
	
	local tList = tItem[3]
	local t = tList[random(1, getn(tList))]
	AddItem(t[2], t[3], t[4], tItem[4], tItem[5])
end