Import("\\script\\lib\\globalfunctions.lua")
function OnUse(nItem)
	if IsTitleExist(70, 1) <= 0 then
		if DelItemByIndex(nItem, 1) ~= 1 then
			return 0;
		end
		AddTitle(70, 1)
		SetTitleTime(70, 1, GetTime() + (7 * 24 * 3600));
		Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Ph� Qu�n"))
		Say(format("Nh�n ���c danh hi�u <color=gold>[%s]<color>", "Ph� Qu�n"), 0)
		gf_WriteLogEx("VIP Phong Th��ng L�nh (Ph� Qu�n)", "UseItem", "AddTitle(70, 1)");
	end
end