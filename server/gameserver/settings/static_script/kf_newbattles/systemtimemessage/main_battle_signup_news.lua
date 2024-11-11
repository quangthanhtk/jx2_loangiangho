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
	AddGlobalNews("Nh¹n M«n Quan Liªn Server s¾p më, h·y ®Õn tham gia ngay.");
	Msg2Global("Nh¹n M«n Quan Liªn Server s¾p më, h·y ®Õn tham gia ngay.");
end;