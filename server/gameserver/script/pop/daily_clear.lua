Include("\\script\\task\\global_task\\gtask_head.lua");

function OnPopDailyClear(npc)
	local tTaskID = {
		849,850,851,852,853,854,855,856,857,908,
		944,945,946,947,948,949,1010,1011,1012,
	};

	for i = 1, getn(tTaskID) do
		if tGtCondition:check_taskid(tTaskID[i],1) then --�Ƿ����
			tGtTask:CloseTask(tTaskID[i])
		end
	end
	
	--�������� ֻ����СС
	SetTask(TASK_WXX_DAILY_TIME, 0);
--	SetTask(3376, 0);									--�������ظ������¼��ÿ�����20����,������ȡ����������ע����
	SetTask(TASK_POP_ZHECHONG_OOXX,0); --2012����Ƭ�۳������������¼��ÿ�����20����
end