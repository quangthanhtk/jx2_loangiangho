Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");

function OnLinCFTimer()
	local nIdx = CreateNpc("Thi�n �m Gi�o Cu�ng ��", "Thi�n �m Gi�o Cu�ng ��", GetWorldPos(), -1, 2);
	--ChangeNpcToFight(nIdx);
end