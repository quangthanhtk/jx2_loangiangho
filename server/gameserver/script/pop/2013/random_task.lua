Include("\\script\\lib\\floyd.lua"); --20130326���
Include("\\script\\task\\\\global_task\\gtask_head.lua")
Import("\\script\\lib\\define.lua")

g_tTv = {
	["Ho�n Nhan T�ng H�n"] = TASKID_2013_RANDOM_POP_TASK_FLAG1,
	["Nhan Hi Do�n"] = TASKID_2013_RANDOM_POP_TASK_FLAG2,
}

g_tTaskInfo = {
	["Ho�n Nhan T�ng H�n"] = {
		{1332,1,},
		{1333,2,},
		{1334,3,},
		{1335,4,},
		{1336,5,},
		{1337,6,},
		{1338,7,},
	},
	["Nhan Hi Do�n"] = {
		{1339,1,},
		{1340,2,},
		{1341,3,},
		{1342,4,},
		{1343,5,},
		{1344,6,},
		{1345,7,},
	},
}

function random_task()
	--�������������� ����ÿ�������
	local nDate = tonumber(date("%Y%m%d"));
	--�����������
	local szNpcName = GetTargetNpcName();
	if g_tTaskInfo[szNpcName] == nil or g_tTv[szNpcName] == nil then return 0; end
	local tTaskInfo = g_tTaskInfo[szNpcName];
	local nTv = g_tTv[szNpcName]
	for k, v in tTaskInfo do
		if tGtTask:check_cur_task(v[1]) == 1 then
			Talk(1, "tGtNpcMain:npc_main", "H�y ho�n th�nh nhi�m v� ng�y tr��c �� r�i h�y nh�n nhi�m v� ng�y h�m nay!");
			return 0;
		end
	end
	--��֮ǰ������״̬���
	for i = 1, getn(tTaskInfo) do
		if tGtCondition:check_taskid(tTaskInfo[i][1],1) then --�Ƿ����
			tGtTask:CloseTask(tTaskInfo[i][1]);
		end
	end
	randomseed(nDate);
	--�����n������
	local tRand = floyd_rm4n(getn(tTaskInfo), 3);
	for i = 1, getn(tRand) do
		gf_SetTaskBit(nTv, tTaskInfo[tRand[i]][2], 1);
	end
	
	tGtNpcMain:npc_main();
end

