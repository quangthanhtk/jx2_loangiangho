--Ů���ʿ������
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua");

--��һЩ�����ϵĶ������������� �������
g_tGTaskId = {1328,1342};  --�漰��������id �鿴gtask_main
g_tBossInfo = {
	{"Chu Gi�i Quang",	"Chu Gi�i Quang",	612,1922,4078	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
	{"Thi�n �m Gi�o-Chi Vi�n S�",	"Thi�n �m Gi�o-Chi Vi�n S�",	612,1922,4071	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
	{"Thi�n �m Gi�o-Chi Vi�n S�",	"Thi�n �m Gi�o-Chi Vi�n S�",	12,1926,4073	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
};

g_szNpcName = "<color=green>M�c L�u B�ch<color>: ";

g_szMsg = [[
	<color=green>Playername<color>��<color=green>������<color>���
	\p<color=green>������<color>��<sex>�����չ�������Ѱ�ҵģ���֪�����������ҵġ�
	\p<color=green>Playername<color>��������ô���£�
	\p<color=green>������<color>�������Ǹ��������������ʣ���ͽ�������⽫���������������������Ҫ�Ӻ��չ��ӡ�
	\p<color=green>������<color>��������ô�죬�������ˣ�
	\p<color=green>Playername<color>���������ã���ͽ�Ը�����ͽ���³���
]];


function create_boss()
	SetTask(TASKID_2013_NEW_TASK_PRISON, 1);
	gf_CreateNpcList(g_tBossInfo);
end

function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: Ti�c l� ta kh�ng bi�t ���c b� m�t th�t c�a b�n ph�n �� s�m h�n!");
		return 0;
	end
	
	if GetTask(TASKID_2013_NEW_TASK_PRISON) ~= 0 then
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: Ti�c l� ta kh�ng bi�t ���c b� m�t th�t c�a b�n ph�n �� s�m h�n!");
		return 0;
	end
	
	local szMsg = gsub(g_szMsg, "Playername", GetName());
	szMsg = gsub(szMsg, "<sex>", gf_GetPlayerSexName());
	suTalk("create_boss", szMsg, 1);
end

function OnDeath(nNpcIdx)
	RemoveNpc(nNpcIdx);
end