Import("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\missions\\yp\\ywz\\define.lua")

function main()
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","��i hi�p nh� khi n�o r�i th� ��n th��ng xuy�n nh�.");
		return 0;
	end
	local tName2ShopID = {
		["L� Nguy�n H�c"] = 3073,
		["�o�n B�ch"] = 3073,
		["T�n Ph� Kham B�"] = 3073,
	}
	local nShopId = tName2ShopID[GetNpcName(GetTargetNpc())];
	if not nShopId then return 0; end
	show_equip_shop(3073);
end