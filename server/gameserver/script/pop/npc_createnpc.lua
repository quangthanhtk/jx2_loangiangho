--�����ýű�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

talkTable = {};

talkTable.msg = "Ch� d�ng �� ch�n NPC, kh�ng c� t�c d�ng kh�c!";
talkTable.sel = {
	{"Linh T� Ki�m Di�c Kh� L�ng", "nxj_ykl",},
	{"Ph� H�n �ao L�m Phong", "phd_lf"},
	{"Qu� �nh B�t L� Ch� Ki�t", "gyb_lzj"},
	{"V� T�nh Tr�o Ti�u Thanh", "wqz_xq"},
	{"S� d�ng ph�o hoa", "OnUse"},
	{"K�t th�c ��i tho�i", "nothing",}, 
};

function nxj_ykl()
	local nNpcIdx = CreateNpc("Ch� qu�n H�a Kh� ph�ng", "Linh T� Ki�m Di�c Kh� L�ng", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_yikelin.lua");
end

function phd_lf()
	local nNpcIdx = CreateNpc("Ch� qu�n H�a Kh� ph�ng", "Ph� H�n �ao L�m Phong", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua");
end	

function gyb_lzj()
	local nNpcIdx = CreateNpc("Ch� qu�n H�a Kh� ph�ng", "Qu� �nh B�t L� Ch� Ki�t", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua");
end

function wqz_xq()
	local nNpcIdx = CreateNpc("Ch� qu�n H�a Kh� ph�ng", "V� T�nh Tr�o Ti�u Thanh", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua");
end

function main()
	temp_Talk(talkTable);
end