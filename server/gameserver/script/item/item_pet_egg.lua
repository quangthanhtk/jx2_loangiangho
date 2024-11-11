Import("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\task\\global_task\\gtask_head.lua")
tCfg = {
	--[item_id] = {pet_id,name}
	[200130970] = {38, "B� V��ng Ng�c"},
}
function OnUse(nItem)
	local g,d,p = GetItemInfoByIndex(nItem)
	local nId = PackItemId(g,d,p)
	local t = tCfg[nId]
	if not t then return end
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch�a ho�n th�nh nhi�m v� ph�c sinh ��ng h�nh, t�m th�i kh�ng th� m�!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("S� l��ng b�n ��ng h�nh hi�n t�i v��t qu� 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1)==1 then
		AddPet(t[1])
		Talk(1,"",format("Nh�n ���c 1 ��ng h�nh %s", t[2]))
	end
end