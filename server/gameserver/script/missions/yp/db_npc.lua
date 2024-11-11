Import("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\missions\\yp\\ywz\\define.lua")

function main()
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","§¹i hiÖp nhí khi nµo råi th× ®Õn th­êng xuyªn nhÐ.");
		return 0;
	end
	local tName2ShopID = {
		["Lý Nguyªn Hóc"] = 3073,
		["§oµn BÝch"] = 3073,
		["T¸n Phæ Kham Bè"] = 3073,
	}
	local nShopId = tName2ShopID[GetNpcName(GetTargetNpc())];
	if not nShopId then return 0; end
	show_equip_shop(3073);
end