-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC����Script
-- By StarryNight
-- 2007/06/26 PM 5:51

-- ������������¶�һ������ϰɣ�������԰������ĳ��С�

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main()	
	
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 5 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 6);
		Say("B�o ki�m l�u l�m kh�ng s� d�ng, h�y gi�p ta m�i ki�m, cho ��n khi n�o V�ng trong Ki�m t�a �nh h�o quang ng�.\n<color=gold> ti�u di�t 399 �� T� Minh Gi�o \n ti�u di�t 399 Gian T� Minh Gi�o <color>", 0);
		TaskTip("Ti�u di�t 399 �� T� Minh Gi�o");
		TaskTip("Ti�u di�t 399 Gian T� Minh Gi�o");
		return 
	end

	if g_akct_GetTaskStep(bTag) then
		return
	end
	
	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ���������֧1����09������ʹ----------------------------------
	
	--���ذκ����д�̽����������
	if nStep_XBTask_01 == 1 then
		task_009_02_0();
		return
	end
	
	--��û�Ͳ�˹���˶Ի�
	if nStep_XBTask_01 == 2 then
		task_009_02_1();
		return
	end
	
	---------------------------------- ������10��֧1_2δ�����----------------------------------
	
	--ȡ�û�δȡ�����Ѿ�
	if nStep_XBTask_01 == 3 then
		task_010_01_0();
		return
	end
	
	--ȡ�û�δȡ���������
	if nStep_XBTask_01 == 4 then
		task_010_02_0();
		return
	end
	
	--��ûɱ��30��ͽand����������
	if nStep_XBTask_01 == 5 then
		task_010_02_1();
		return
	end
	
	--�Ѿ�ɱ��30��ͽ
	if nStep_XBTask_01 == 6 then
		task_010_03_0();
		return
	end
	
	--��δ���ذκ�ػ�
	if nStep_XBTask_01 == 7 then
		task_010_03_1();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"G�n ��y c� nhi�u ng��i l�n l�t l�n Quang Minh ��nh, sao gi�u ���c ta?"},
		{"� ��t Ph�ng T��ng n�y, n�u l�y m� t�u trung nguy�n v�i R��u Nho Ba T� th� qu� l� thua xa."},
		{" Kh�i ���ng d� khang, �u t� nan vong, h� d� gi�i �u, duy h�u �� khang. Thi�n h� anh h�ng h�o kh�, th�y d� c�ng �m ��ng x��ng?"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
