Import("\\script\\lib\\globalfunctions.lua");

tItem = {
	[200130832] = {
		--pet id,pet name
		{40, "Th� C�ng Gi�o Ch�ng Tinh ��n (Th�y)"},
		{43, "Th� C�ng Gi�o Ch�ng Tinh ��n (Th�)"},
	},
	[200130833] = {
		{41, "Th� C�ng Gi�o Ch�ng Nguy�t ��n (Th�y)"},
		{44, "Th� C�ng Gi�o Ch�ng Nguy�t ��n (Th�)"},
	},
	[200130834] = {
		{42, "Th� C�ng Gi�o Ch�ng Th�n ��n (Th�y)"},
		{45, "Th� C�ng Gi�o Ch�ng Th�n ��n (Th�)"},
	},
}

function OnUse(ItemIdx)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch�a ho�n th�nh nhi�m v� ph�c sinh ��ng h�nh, t�m th�i kh�ng th� m�!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	
	local g,d,p = GetItemInfoByIndex(ItemIdx)
	local id = p+d*100000+g*100000*1000
	local t = tItem[id]
	if t then
    	local tSay = {}
    	local szTitle = format("H�y ch�n b�n ��ng h�nh c�n:")
    	for i, tt in t do
    		tinsert(tSay, format("%s/#add_pet(%d, %d, \'%s\')", tt[2], ItemIdx, tt[1], tt[2]))
    	end
    	tinsert(tSay, format("%s/nothing", "T�i h� ch� xem qua th�i"))
    	Say(szTitle, getn(tSay), tSay)
	end
end

function add_pet(ItemIdx,id,name)
	if GetPetCount() >= 5 then
		Talk(1, "", "B�n ��ng h�nh �� �� 5")
		return
	end
	if DelItemByIndex(ItemIdx, 1)== 1 then
		AddPet(id)
		Msg2Player(format("Ch�c m�ng, nh�n ���c %s",name))
	end
end