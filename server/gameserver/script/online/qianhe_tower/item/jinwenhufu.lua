Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	if qht_check_condition(1) ~= 1 then
		return 0;
	end
	--���Ļ����̵�ʹ��task
	show_equip_shop(3024);
end