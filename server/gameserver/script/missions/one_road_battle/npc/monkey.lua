Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")

function main()
	local szNpcName = GetTargetNpcName();
	
	local nMonkeyIdx = GetFollower();
	if nMonkeyIdx ~= 0 then
		Talk(1, "",  "<color=green>" .. szNpcName .. "<color>: Ch�t ch�t... Ch�t ch�t...");
		return 0;
	end
	local szMsg = format("<color=green>%s<color>: Ch�t ch�t...", szNpcName)
	local tSel = {
		"B�t Kh� �n Tr�m/get_monkey",
		"K�t th�c ��i tho�i/nothing",
	}
	Say(szMsg, getn(tSel), tSel);
end

function get_monkey()
	if GetFollower() ~= 0 then
		return 0;
	end
	SummonNpc(MONKEY_NPC[1],MONKEY_NPC[2]);
	RemoveNpc(GetTargetNpc());
end