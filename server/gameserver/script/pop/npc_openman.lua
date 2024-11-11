--�����ýű�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");

talkTable = {};

talkTable.msg = "Ch� d�ng �� m� danh v�ng, kh�ng c� t�c d�ng kh�c!";
talkTable.sel = {
--	{"��������Ժ����", "OpenGovPop",},
--	{"��������������", "OpenSixDoorPop"},
--	{"�����ھ���������", "OpenTranUnitPop"},
--	{"�����̻���������", "OpenBusinessUnitPop"},
--	{"������������������", "OpenLongSongPop"},
--	{"��������������", "OpenWuLinUnitPop"},
--	{"�ٻ��ű������", "CreatePopNpc",},
--	{"�ر���������", "ClearAllPop",},
	{"K�t th�c ��i tho�i", "nothing",}, 
};

function CreatePopNpc()
	local nNpcIdx = CreateNpc("Ch� qu�n H�a Kh� ph�ng", "Script nhi�m v� s� gi�", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_createnpc.lua");
end

function OpenGovPop()
	OpenPop(0);
end

function OpenSixDoorPop()
	OpenPop(1);
end

function OpenTranUnitPop()
	OpenPop(2);
end

function OpenBusinessUnitPop()
	OpenPop(3);
end

function OpenLongSongPop()
	OpenPop(4);
end

function OpenWuLinUnitPop()
	OpenPop(5);
end

function main()
	temp_Talk(talkTable);
end