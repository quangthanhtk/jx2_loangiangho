--Ò©Íõ¹ÈtoÐËÇì
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\yp\\mm\\entrynpc.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 3 then
		Msg2Player("LÝnh g¸c cöa ®ang tËp trung nh×n vÒ ®©y, cã lÏ ®¹i hiÖp kh«ng ®­îc hoan nghªnh, hay lµ h·y l¸nh mÆt tr­íc!");
		return
	end
	if GetPKValue() >= 10 then
		Msg2Player("Ng­êi ch¬i pk10 kh«ng thÓ vµo H­ng Kh¸nh!");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","§¹i hiÖp h·y rêi ®éi råi quay l¹i!");
		return 0;
	end
	enter();
	SetPos(1532,2552);
	SetFightState(1);
end