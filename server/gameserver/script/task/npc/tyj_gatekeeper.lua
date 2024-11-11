Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\task\\global_task\\task_id.lua")

NPC_TYSMR = "<color=green>Thi�n �m Gi�o Th� M�n Nh�n<color>:"

function main()
	local mapID = GetWorldPos();
	local tFunc = {
		["425"] = EnterTysmd,
		["8012"] = LeaveTysmd,
	};
	tFunc[tostring(mapID)]();
end

function EnterTysmd()
	Say(NPC_TYSMR..format("Ta ch� bi�t Thi�n �m L�nh B�i, kh�ng bi�t ng��i n�o", gf_GetPlayerSexName()),
		3,
		"Th� n�o m�i ���c �i v�o Thi�n �m Th�n B� C� ��a/EnterTysmdHow",
		"�i v�o Thi�n �m Th�n B� C� ��a/EnterTysmdEnsure",
		"T�i h� ch� xem qua th�i/nothing");	
end

function EnterTysmdHow()
	Say(NPC_TYSMR.."Nh�n v�t tham gia nhi�m v� ph�c sinh 3 v� thu t�p 10 Thi�n �m L�nh B�i m�i ���c �i v�o Thi�n �m Th�n B� C� ��a.L�n ��u �i v�o c�n n�p 10 Thi�n �m L�nh B�i, l�n sau �i v�o kh�ng c�n n�p th�m.",
		2,
		"tr� l�i/EnterTysmd",
		"K�t th�c ��i tho�i/nothing")
end

function EnterTysmdEnsure()
	--�����337����û�����335����Ķ����ܽ���
	if tGtTask:check_task_isfinish(337) == 1 or tGtTask:check_task_isfinish(335) ~= 1 then
		Talk(1,"",NPC_TYSMR.."���ng �i ph�a tr��c kh�ng th�ng!");
		return 0;
	end
	if GetTeamSize() > 1 then
		Talk(1,"","Thi�n �m Th�n B� C� ��a kh�ng th� t� ��i �i v�o ");
		return 0;
	end
	if GetTask(Task_id_018) == 0 then
		if BigGetItemCount(2, 1, 30861) < 10 then
			Talk(1,"","");
			return 0;
		end
		if BigDelItem(2, 1, 30861, BigGetItemCount(2, 1, 30861)) ~= 1 then
			return 0;
		end
		SetTask(Task_id_018, 1);
	end
	NewWorld(8012,1593,3222);
	SetFightState(1);
end

function LeaveTysmd()
	Say(NPC_TYSMR..format("%s c� mu�n r�i kh�i Thi�n �m Th�n B� C� ��a kh�ng?", gf_GetPlayerSexName()),
		2,
		"R�i kh�i/LeaveTysmdEnsure",
		"T�i h� ch� xem qua th�i/nothing");	
end

function LeaveTysmdEnsure()
	NewWorld(425,1802,3378);
end
	