Include("\\settings\\static_script\\kf_newbattles\\head.lua");
Include("\\script\\system_switch_config.lua")

function main()
	if IsKfNewBattleOpen() ~= 1 then
		return 0;
	end
	local _,at_ggs = GetRealmType()
	if at_ggs ~= 1 then
		--return 0;
	end
	AddGlobalNews("Nh�n M�n Quan Li�n Server s�p m�, h�y ��n tham gia ngay.");
	Msg2Global("Nh�n M�n Quan Li�n Server s�p m�, h�y ��n tham gia ngay.");
end;