--����ѵ��
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

g_debug = 0
g_tFeedPet = {
	nStartDate=20150515,
	nEndDate=20150531,
	g_this_file = "\\script\\online_activites\\201505feedpet\\head.lua",
	nActivityID = 158,
	--tbKillNpcDaily.tbOpenDate = {2015032300, 2015050100}����\script\online_activites\online_activites.txt������
	TASK_GROUP = TaskManager:Create(2, 20),
	--tbTaskGroupId = {2, 20},
	tKillNpc = {
		[115] = {--��ĸ������
			["T�n Ti�n T�"] = 1,
			["C�m Ti�n T�"] = 1,
		},
		[116] = {--��ĸ������
			["��ch ti�n T�"] = 1,
			["Ki�m ti�n T�"] = 1,
		},
		[506] = {--ɳĮ�Թ�
			["Sa M�c H�nh Nh�n"] = 1,
			["T�m B�o Nh�n"] = 1,
		},
	},
	
	nMaxUseFuDaiOneDay = 100,--ÿ��ʹ�ø�������
	nMaxUseDrinkOneDay = 10,--ÿ��ʹ�����Ѿ�����
	nMaxGetExpOneDay = 60,--ÿ�ջ�þ������
	nMaxFeedPetOneDay = 5,--��ȡѵ����������
	nFeedTargetPoint = 46,--��������ѵ����
	nMaxInitPetPoint = 6,--��ʼѵ���ȵ�������ֵ
	
	nTaskIdx_FuDaiCount=1,--����ʹ�ø�������
	nTaskIdx_NormalFeed=2,--��ͨѵ������ǰѵ��������������ȡѵ����������
	nTaskIdx_IBFeed=3,--IBѵ������ǰѵ��������������ȡѵ����������
	nTaskIdx_ExpGetCnt = 4,--�ɻ�þ���ʣ�����
	nTaskIdx_ExpGetMulti=5,--��þ��鱶��
	
	tFood = {--ѵ������ĵ���
		{1, "Th�t C� T��i", {2,1,30837,1}, "C� �� cho th� c�ng �n", "�� c��ng tr�ng +2"},
    	{2, "��i Heo Th�m Ngon", {2,1,30838,1}, "Th�t �� cho th� c�ng �n", "�� c��ng tr�ng +3"},
    	{3, "T� C�u", {2,1,30839,1}, "�� ch�i c�a th� c�ng", "�� c��ng tr�ng x2"},
    	{4, "Th�c �n H�t H�n", {2,1,30840,1}, "Th�c �n c�a th� c�ng nh�ng �� h�t h�n", "�� c��ng tr�ng -50%"},
    	{5, "Ti�n Qu�", {2,1,30842,1}, "Cho th� c�ng s� d�ng Ti�n Qu�", "Ho�n th�nh hu�n luy�n"},
	},
	tDrink = {"R��u Nho", {2,1,30841,1}},
	tToolItem={
		{1, "C�i Th� C�ng-Th��ng", {2,1,30836,1}},
		{2, "C�i Th� C�ng-Hi�m", {2,1,30843,1}},
	},
	tJiuXi = {--��ϯNPCList
		{"hd_yanxi", "M�m c�", 200,1376,2894, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 200,1358,2842, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 200,1407,2863, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 100,1452,2953, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 100,1408,2950, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 100,1408,2997, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 300,1789,3547, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 300,1772,3560, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M�m c�", 300,1758,3584, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
	},
	tMainAward = {
		[1] = {
			tAll = {
    			{38,5,1},--����
    			{1,"R��u Nho",{2,1,30841,1,4},0,1},
			},
			tRand = {
				{1, 50, "Thi�n Ki�u L�nh", {2, 97, 236, 1, 4}, 0},
				{1, 300, "C�p 3 T�y T�m Th�ch", {2, 1, 30523, 1, 4}, 0},
				{1, 300, "C�p 3 Luy�n L� Thi�t", {2, 1, 30529, 1, 4}, 0},
				{1, 300, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 1, 4}, 0},
				{1, 200, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 2, 4}, 0},
				{1, 10, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 5, 4}, 0, 0, 0, 1},
				{1, 600, "M�nh Thi�n Cang", {2, 1, 30390, 5, 4}, 0},
				{1, 600, "M�nh Thi�n M�n", {2, 1, 30410, 5, 4}, 0},
				{1, 800, "Thi�t Tinh c�p 1", {2, 1, 30533, 1, 4}, 0},
				{1, 300, "Thi�t Tinh c�p 2", {2, 1, 30534, 1, 4}, 0},
				{3,1000,10000},--gold
				{3,500,50000},--gold
				{2,1300,2000000},--exp
				{2,700,2500000},--exp
				{2,330,3000000},--exp
				{1, 200, "��i Nh�n s�m", {2, 0, 553, 1, 4}, 0},
                {1, 100, "V� Ti�u Y B�c", {2, 1, 30492, 1, 4}, 0},
                {1, 200, "V� Ti�u Y ��ng", {2, 1, 30493, 4, 4}, 0},
                {1, 200, "C�y B�t Nh� nh�", {2, 0, 504, 2, 4}, 0},
                {1, 100, "C�y B�t Nh�", {2, 0, 398, 1, 4}, 0},
                {1, 10, "C�y T� Linh", {2, 1, 30269, 1, 4}, 0},
                {1, 500, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1, 4}, 0},
                {27,1000,100},--��Ϊ
                {27,300,500},--��Ϊ
                {27,100,1000},--��Ϊ
        	},
		},
		[2] = {
			tAll = {
				{38,5,1},--����
    			{1,"R��u Nho",{2,1,30841,1,4},0,1},
			},
			tRand = {
				{1, 100, "Thi�n Ki�u L�nh", {2, 97, 236, 2, 4}, 0},
				{1, 10, "Thi�n Ki�u L�nh", {2, 97, 236, 6, 4}, 0},
				{1, 200, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 2, 4}, 0},
				{1, 50, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 6, 4}, 0},
				{1, 10, "Thi�n Cang L�nh", {2, 95, 204, 1, 4}, 0, 0, 0,  1},
				{1, 30, "Thi�n M�n Kim L�nh", {2, 1, 30370, 2, 4}, 0, 0, 0,  1},
				{1, 100, "Th�i Nh�t L�nh",{2,1,30687,2,4},0, 1},
				{1, 200, "Thi�t Tinh c�p 3", {2, 1, 30535, 2, 4}, 0},
				{1, 300, "V� Ti�u Y B�c", {2, 1, 30492, 2, 4}, 0},
				{1, 100, "V� Ti�u Y V�ng", {2, 1, 30491, 1, 4}, 0},
				{3,2000,100000},--gold
				{3,1000,200000},--gold
				{3,500,500000},--gold
				{3,100,1000000},--gold
				{2,2000,2000000},--exp
				{2,1000,4000000},--exp
				{2,750,6000000},--exp
				{2,500,8000000},--exp
				{2,100,10000000, 0, 0, 0, 1},--exp
				{1, 100, "C�p 3 T�y T�m Th�ch", {2, 1, 30523, 2,4}, 0},
				{1, 100, "T�y T�m Th�ch c�p 4", {2, 1, 30524, 1,4}, 0},
				{1, 300, "Ma �ao Th�ch c�p 3", {2, 1, 30430, 1,4}, 0},
				{1, 200, "Ma �ao Th�ch c�p 3", {2, 1, 30430, 3,4}, 0},
				{1, 50, "Ma �ao Th�ch c�p 3", {2, 1, 30430, 5,4}, 0, 0, 0, 1},
				{1, 100, "C�p 3 Luy�n L� Thi�t", {2, 1, 30529, 2,4}, 0},
				{1, 100, "Luy�n L� Thi�t c�p 4", {2, 1, 30530, 1,4}, 0},
			},
		},
	},
}

function get_task(nIndex)
	local TASK_GROUP = g_tFeedPet.TASK_GROUP
	return TASK_GROUP:GetTask(nIndex)
end

function set_task(nIndex,nValue)
	local TASK_GROUP = g_tFeedPet.TASK_GROUP
	return TASK_GROUP:SetTask(nIndex,nValue)
end

--���С���ദ��
function rand_follower()
	if GetFollower()>0 then
		Talk(1,"","�� c� 1 th� c�ng r�i")
		return
	end
	local nRand = random(1,100)
	local szName,szTemp = "",""
	if nRand <= 30 then
		szName,szTemp = "Heo B�ng", "hd_xiaohuazhu"
	elseif nRand <= 65 then
		szName,szTemp = "D� V�ng", "hd_xiaohuangyang"
	else
		szName,szTemp = "G�u X�m", "hd_xiaohuixiong"
	end
	SummonNpc(szTemp, szName)
end

function remove_follower()
	local nNpcIdx = GetFollower()
	if nNpcIdx > 0 then
		local szName = GetNpcName(nNpcIdx)
		if szName=="Heo B�ng" or szName=="D� V�ng" or szName=="G�u X�m" then
			KillFollower()
		end
	end
end

function is_in_activity_date()
	if g_debug==1 then
		return 1
	end
	local today = tonumber(date("%Y%m%d"));
	if today >= g_tFeedPet.nStartDate and today <= g_tFeedPet.nEndDate then
		return 1
	end
	return 0
end

function check_player_condition()
	if is_in_activity_date() ~= 1 then
		return 0
	end
	if get_trans_level() < 80 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","C�p 80 tr� l�n, �� gia nh�p l�u ph�i v� h�c 1 b� k� n�ng c�p 55 m�i ���c tham gia ho�t ��ng.")
		return 0;
	end
	return 1
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end

function get_cur_point(nLevel)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 1
	local val = SafeGetByte(nTaskVal, nByte)
	if 0 == val then--���һ�³�ʼֵ
		local nMax = g_tFeedPet.nMaxInitPetPoint
		val = random(1,nMax)
		set_cur_point(nLevel, val)
	end
	return val
end

function set_cur_point(nLevel,nValue)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 1
	local val = SafeSetByte(nTaskVal, nByte,nValue)
	return set_task(nTaskIdx, val)
end

function get_next_point(nLevel, nType)
	local nCur = get_cur_point(nLevel)
	local nNew = nCur
	if nType == 1 then
		nNew = nCur + 2
	elseif nType==2 then
		nNew = nCur + 3
	elseif nType==3 then
		nNew = nCur * 2
	elseif nType==4 then
		nNew = max(floor(nCur/2), 1)--��С��1
	elseif nType==5 then
		nNew = g_tFeedPet.nFeedTargetPoint
	end
	if nCur >= g_tFeedPet.nFeedTargetPoint*2 and nNew > nCur then--̫����
		nNew = nCur
	end
	return nNew
end

function get_award_count(nLevel)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 2
	local val = SafeGetByte(nTaskVal, nByte)
	return val
end

function set_award_count(nLevel,nValue)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 2
	local val = SafeSetByte(nTaskVal, nByte, nValue)
	return set_task(nTaskIdx, val)
end

