-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC�����Script
-- By StarryNight
-- 2007/08/07 PM 7:45

-- ���������ܣ�������ϼӰ�~~~~

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main()
	-- if g_akct_GetTaskStep(bTag) then
	-- 	return
	-- end
	
	-- if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 2 then
	-- 	VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 3);
	-- 	Say("�����þ�ûʹ�û���,������ĥ������ʹ���ϻƽ𷢳���ɫ��ʡ�\n<color=gold>����333��ɳĮ����\n����555��Ѱ����<color>", 0);
	-- 	TaskTip("����333��ɳĮ����");
	-- 	TaskTip("����555��Ѱ����");
	-- 	return 
	-- end
	
	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ������23��֧1_14��ɳ��Ļ----------------------------------
	
	--�Ѿ���ȡ���񵫻�δȡ�÷����������ɶԻ�
	if nStep_XBTask_01 == 62 then
		task_023_02_1();
		return
	end
	
	--ˢ������
	if nStep_XBTask_01 == 64 then
		task_023_02_0();
		return
	end
	
	--�������͸������
	if nStep_XBTask_01 == 65 then
		task_023_03_0();
		return
	end
	
	--�Ѿ�ɱ�����󣬹ؿ��ӿڿ���
	if nStep_XBTask_01 == 66 then
		task_023_02_2();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Ng��i l�...ng�n l�a trong sa m�c �!",
		}
	
	TalkEx("",strTalk);
	return

end;
