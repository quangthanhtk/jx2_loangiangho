Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function OnUse(nItem)
	if tGtTask:check_cur_task(351) ~= 1 then
		DelItemByIndex(nItem, 1)
		return 0;
	end
	if GetWorldPos() ~= 6400 then
		Say("Kh�ng th� d�ng � b�n �� n�y!", 0);
		return 0
	end
	local nNpcIndex = CreateNpc("LSM_CTQF", "Kh�m Ph�m Tri�u ��nh", 6400, 1760, 3408);
	if nNpcIndex > 0 then
		BigDelItem(2,1,31045,1);
		SetNpcLifeTime(nNpcIndex, 15*60);
		SetNpcDeathScript(nNpcIndex, "\\script\\task\\item\\���.lua");
	end
end

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 0);
end