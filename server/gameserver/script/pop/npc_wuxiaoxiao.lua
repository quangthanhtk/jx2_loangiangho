--�����ýű�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

g_NpcName = "<color=green>L�c Phi�n M�n-Ph�n �� Ng� Ti�u Ti�u<color>: ";

TMain = {};
TMain.msg = g_NpcName.."H�m, t�i sao l�i l� ng��i? Ti�u Tinh kh�ng t� ��n ��y �� l�y thu�c gi�i sao?";
TMain.sel = {
	{"Ta kh�ng bi�t, h�n ch� nh� ta ��a th� cho ng��i, c�n l�i kh�ng n�i g� c�.", "Change"},
}

function main()
	--if tGtCondition:check_taskid(484, 2) ~= nil then
end

function OnDeath(nNpcIdx)
	--if BigGetItemCount(2, 96, 33) == 0 and DelItem(2,96,31,1) == 1 then
		--gf_AddItemEx({2, 96, 33, 1}, "�������ƽ�ҩ");
	--end

	SetNpcLifeTime(nNpcIdx,10);
end
