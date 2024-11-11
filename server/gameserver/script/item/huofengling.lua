Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tShop = {
		[1] = {3056, 3058, 3060, 3062},
		[2] = {3057, 3059, 3061, 3063},
	}
	local nSex = GetSex();
	if not tShop[nSex] then return end
	local tSay = {
		format("Ti�m Trang B� T��ng Qu�n H�a Ph�ng /#show_equip_shop(%d)", tShop[nSex][1]),
		format("Ti�m H�a Ph�ng Nguy�n So�i/#show_equip_shop(%d)", tShop[nSex][2]),
		format("Ti�m Trang S�c T��ng Qu�n H�a Ph�ng/#show_equip_shop(%d)", tShop[nSex][3]),
		format("Ti�m Trang S�c H�a Ph�ng Nguy�n So�i/#show_equip_shop(%d)", tShop[nSex][4]),
		"\n r�t lui/nothing",
	}
	Say("H�y ch�n ti�m �� ��i:", getn(tSay), tSay);
end