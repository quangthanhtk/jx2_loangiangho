--�����̻�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Import("\\script\\lib\\npccmdhead.lua")

--һ����Ҫ���Ŷ�������������
TASK_ID_ESCORT_LYH	3378
TASK_ID_ESCORT_LL1	3379
TASK_ID_ESCORT_LL2	3380
TASK_ID_ESCORT_LL3	3381
TASK_ID_ESCORT_LL4	3382
TASK_ID_ESCORT_LLTM	3383
TASK_ID_ESCORT_DEATH 3384

function BeginEscort()
	if tGtCondition:check_taskid(591, 2) ~= nil then
		local nNpcIdx = CreateNpc("H� tr�ng", "Ti�u S� L�m Nguy�n H�o", GetWorldPos());
		SetTask(TASK_ID_ESCORT_LYH, nNpcIdx);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		g_NpcAI:setWayPoint(nNpcIdx,{{1751, 3552}});
		
		--�������򴥷���
		CreateTrigger(2, 1815);
	end
end

function RectTrigger()		--���괥����
	RemoveTrigger(GetRunningTrigger());

	for i =1, 4 do
		local nIdx = CreateNpc("H� tr�ng", "Thi�n �m Gi�o-L�u La C��p Ti�u", GetWorldPos());
		SetNpcScript(nIdx, "\\script\\pop\\escort.lua");
		SetTask(TASK_ID_ESCORT_LYH + i, nIdx);
	end
	
	local nIdx = CreateNpc("H� tr�ng", "Thi�n �m C��p Ti�u ��u M�c", GetWorldPos());
	SetNpcScript(nIdx, "\\script\\pop\\escort.lua");
	SetTask(TASK_ID_ESCORT_LLTM, nIdx);
	
	Talk(1, "", "N�y anh em, l�i c� ng��i t� nguy�n d�ng hi�n r�i! H�y c�ng nhau l�n cho ta!");
end

--function DeathTrigger()		--OnDeath Ҳ����
function OnDeath()		--����XX
	--ȫ������
	SetTask(TASK_ID_ESCORT_DEATH, GetTask(TASK_ID_ESCORT_DEATH) + 1);
	
	if mod(GetTask(TASK_ID_ESCORT_DEATH), 5) ~= 0 then --����
		return;
	end
	
	--���¿�ʼ�߶�
	local nNpcIdx = GetTask(TASK_ID_ESCORT_LYH);
	g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
	--���ݵ�ǰ�ĵ㴦����һ�����ƶ�
	local nMapID, nMapX, nMapY = GetWorldPos();
	if nMapX == 1726 and nMapY == 3472 then	-- �������
		SetNpcLiftTime(nNpcIdx, 0);
	end
	g_NpcAI:setWayPoint(nNpcIdx,{{1726, 3472}});
end

function Fail()
	--1���Ѽ�¼��Ԫ�NPCID�����������Ϊ0
		--1�����䣺����NPCIDҲ����Ϊ0
	--2����Ҫ����Ԫ����������Ϊδ�ӡ����������Ϳ����ؽ���
	if tGtCondition:check_taskid(591, 2) ~= nil then
		for i = TASK_ID_ESCORT_LYH, TASK_ID_ESCORT_DEATH do
			SetTask(i, 0);
		end
		
		tGtTask:set_task(3, 591);	--ȡ������
		Talk(1, "", "Nhi�m v� h� t�ng �� th�t b�i, ��i hi�p h�y ti�p t�c c� g�ng n�o!");
	end
end