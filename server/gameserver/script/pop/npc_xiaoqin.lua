Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")

g_NpcName = "<color=green>V� T�nh Tr�o Ti�u Thanh<color>: ";

TMAIN = {};
TMAIN_Action = {};
TMAIN_Death = {};

TMAIN.msg = g_NpcName.."R�t cu�c ng��i l� ai?";
TMAIN.sel = {
	{"Ta ch� �i ngang qua ��y th�i... ....", "nothing"},
};

TMAIN_Action.msg = g_NpcName.."Thi�u hi�p s�t kh� n�ng n�, e r�ng s�p c� chuy�n l�n r�i.";
TMAIN_Action.sel = {
	{"H�m, xem nh� ng��i c�ng c� hi�u bi�t, ra tay n�o!", "Action"},
};

TMAIN_Death.msg = g_NpcName.."L�c Phi�n M�n v� ng��i kh�ng th� kh�ng o�n, t�i sao ng��i l�i l�m v�y ch�?";
TMAIN_Death.sel = {
	{"H�y cho h�n u�ng t�y b�n ti�n", "GiveKG"},
};

function CheckTaskAction()
	if tGtCondition:check_taskid(481, 2) ~= nil or tGtCondition:check_taskid(850, 2) ~= nil then
		if BigGetItemCount(2, 96, 28) == 0 then
			return 1
		end
	end

	return 0
end

function main()
	if CheckTaskAction() == 1 then
		temp_Talk(TMAIN_Action);
	else
		temp_Talk(TMAIN);
	end
end

--ת��Ϊս��npc
function Action()
	local nNpcIdx = GetTargetNpc();
	ChangeNpcToFight(nNpcIdx);

	SetNpcLifeTime(nNpcIdx, 5 * 60);
end

function OnDeath(npc)
	if CheckTaskAction() == 1 then
		temp_Talk(TMAIN_Death);
	end

	SetNpcLifeTime(tonumber(npc), 10);
end

function OnRemove(nRemoveIdx)
	SetNpcRemoveScript(nRemoveIdx,"");
	local nNpcIdx = CreateNpc("V� T�nh Tr�o Ti�u Thanh", "V� T�nh Tr�o Ti�u Thanh", 6300, 1462, 3382)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua")
	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua");
	ChangeNpcToFight(nNpcIdx, 0, 6)
end

function GiveKG()
	gf_AddItemEx({2, 96, 28, 1}, "Kh�u cung c�a Ti�u Tinh");  --��ÿڹ�
	Msg2Player("Nh�n ���c kh�u cung");
	Talk(1, "", "Nh�n ���c kh�u cung");
end
