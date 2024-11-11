Import("\\script\\lib\\define.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--��һЩ�����ϵĶ������������� �������
g_tGTaskId = {1322,1338};  --�漰��������id �鿴gtask_main
--��Ҫ�Ի���npc
g_tNpcName = {["Ng�n Thu�t Kh�"] = 1, ["A Li"] = 2, ["Ho�n Nhan L�u Th�t"] = 3,};
g_szModelName = "Ho�n Nhan T�ng H�n";

g_tNpcMsg = {
	[[
	<color=green>������<color>���ں��������ϴ�ץ�����ɹ���̽�����̱ƹ�������ʱ�ղ����ˡ�Ҫ��Ҫʹ�õ�ǳ��ֶΣ�
	\p<color=green>Playername<color>��������������
	\p<color=green>������<color>���������������ں���������������Ҳ����������˳������ġ�
	]],
	[[
	<color=green>����<color>�����࡭����������
	\p<color=green>����<color>��˭�������ں�������
	\p<color=green>Playername<color>��������������
	\p<color=green>����<color>���������������ң���ֻ��һʱ���������������´�һ�������ٷ��ˡ�
	\p<color=green>Playername<color>��������������
	\p<color=green>����<color>�������׵ģ��������۾�����ְ��Ӧ����ʮ����������ȥ���������
	\p<color=green>Playername<color>��������������������Ů���Ӫ����˾���������
	]],
	[[
	<color=green>����¦��<color>�������������ѱϡ�
	\p<color=green>Playername<color>��������������
	\p<color=green>����¦��<color>��������������
	\p<color=green>Playername<color>��������������
	\p<color=green>����¦��<color>��������
	\p<color=green>Playername<color>��������������������¦�ҿ���Ҳ�Ǹ���Ĭ���Ե��ˣ��һ����뿪�ɡ���
	\p<color=green>����¦��<color>�����ͽ�����
	]],
}

g_tNpcNormalMsg = {
	"<color=green>Ng�n Thu�t Kh�<color>: Li�u Qu�c �c hi�p t�c N� Ch�n c�a ta, hi�n t�i ch�a Li�u hoang d�m v� ��, ��y ch�nh l� th�i c� �� ph�n c�ng!",
	"<color=green>A Li<color>: Hu Hu",
	"<color=green>Ho�n Nhan L�u Th�t<color>: ������",
}

function main()
	local nNpcIdx = GetTargetNpc()
	local szNpcName = GetNpcName(nNpcIdx);
	if g_tNpcName[szNpcName] == nil then return 0; end
	
	local nBitFlag = g_tNpcName[szNpcName]
	
	
	--�ж���û�н�����
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		talk_normal(nBitFlag);
		return 0;
	end

	--�ж��ǲ����Ѿ�˵������
	local nHasTalked = gf_GetTaskBit(TASKID_2013_NEW_TASK_LURK, nBitFlag);
	if nHasTalked == 1 then
		talk_normal(nBitFlag);
		return 0;
	end
	
	--�ж��ǲ��Ǵ��ڱ���״̬
	local nRet, szModelName = IsChangeModel();
	print(nRet, szModelName);
	if nRet ~= 1 or szModelName ~= g_szModelName then
		talk_normal(nBitFlag)
		return 0;
	end
	
	--���ڿ���˵����
	success_get_message(nBitFlag)
end

function talk_normal(nBitFlag)
	Talk(1, "", g_tNpcNormalMsg[nBitFlag]);
end

function success_get_message(nIdx)
	gf_SetTaskBit(TASKID_2013_NEW_TASK_LURK, nIdx, 1);
	local szMsg = gsub(g_tNpcMsg[nIdx], "Playername", GetName());
	suTalk("nothing", szMsg, 1);
end

function change_model_OnTimer()
	RemoveTrigger(GetTrigger(TRIGGER_TASK_GBMZ_ID));
	ChangeModel();
	UnLimitSkill(20);
end