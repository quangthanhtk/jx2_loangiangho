--�ű����ƣ�
--�ű����ܣ�
--���ܲ߻�������
--���ܿ���������
--����ʱ�䣺2013-03-29
--�����޸ļ�¼

Import("\\script\\lib\\define.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\item_define.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\global\\skill_app.lua");
--Include("\\script\\misc\\observer\\observer_head.lua");

g_szLogCaption				= "M�nh �� K� N�ng";
g_szTitle					= "<color=green>M�nh �� K� N�ng<color>";
g_tComposeStuff				= {2, 1, 10011};
g_nComposeNeedCount			= 100;
g_nComposeLevel				= 1;
g_nComposeIncreaseTimes		= 10;
g_nComposeIncreaseBeginTime	= MkTime(2013,7,17);
assert(0 < g_nComposeNeedCount);

g_tTaskIDs = {
	[1] = TASKID_JNS_SPE_ACH_TASK_1,
	[4] = TASKID_JNS_SPE_ACH_TASK_2,
	[7] = TASKID_JNS_SPE_ACH_TASK_3,
	[9] = TASKID_JNS_SPE_ACH_TASK_4,
	[10] = TASKID_JNS_SPE_ACH_TASK_5,
};
	
function OnUse()
	local nMaxStuffCount	= GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
	local nMaxComposeCount	= floor(nMaxStuffCount / g_nComposeNeedCount);
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
	local szMsg	= format("%s: D�ng %d m�nh gh�p th�nh 1 �� K� N�ng C�p %d v� tr�c ti�p b� v�o C�m Nang �� K� N�ng.\nHi�n t�i c� %d m�nh, c� th� gh�p ���c %d �� K� N�ng C�p %d.\nS� l�n gh�p c�n l�i l� %d l�n.",
	g_szTitle, g_nComposeNeedCount, g_nComposeLevel, nMaxStuffCount, nMaxComposeCount, g_nComposeLevel, nCanComposeTimes - nHasComposeTimes);
	local tMenu	= {
		"Ta mu�n gh�p �� K� N�ng			/ComposeSkillApp",
		"Ra kh�i	/nothing",
	};
	suSay(szMsg, getn(tMenu), tMenu);
	return 1;
end

function ComposeSkillApp()
	local nMaxStuffCount	= GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
	local nMaxComposeCount	= floor(nMaxStuffCount / g_nComposeNeedCount);
	
	if 0 >= nMaxComposeCount then
		Talk(1, "", format("%s: Ch�ng trai tr�, kh�ng c� g� th� ��ng nh�p lung tung.", g_szTitle));
		return
	end
	
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
	
	if nHasComposeTimes >= nCanComposeTimes then
		Talk(1, "", format("%s: Ch�ng trai tr�, h�m nay �� d�ng h�t s� l�n gh�p, ng�y mai h�y quay l�i nh�.", g_szTitle));
		return
	end
	
	nMaxComposeCount		= min(nMaxComposeCount, nCanComposeTimes - nHasComposeTimes);
	
	AskClientForNumber("ComposeSkillAppCallBack", 0, nMaxComposeCount, "Mu�n gh�p bao nhi�u?");
end

function OnAchivement(nCount)
	if g_tTaskIDs[g_nComposeLevel] then
		SetTask(g_tTaskIDs[g_nComposeLevel], 1);
		OnAchEvent(2, g_tTaskIDs[g_nComposeLevel]);
	end
	
	if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
		SetTask(TASKID_JNS_SPE_ACH_TASK_6, nCount);
		OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
	end
end

function ComposeSkillAppCallBack(nCount)
	if 0 >= nCount then return end
	
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
		
	if nHasComposeTimes >= nCanComposeTimes then
		Talk(1, "", format("%s: Ch�ng trai tr�, h�m nay �� d�ng h�t s� l�n gh�p, ng�y mai h�y quay l�i nh�.", g_szTitle));
		return
	end
	
	nCount		= min(nCount, nCanComposeTimes - nHasComposeTimes);
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelItem(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3], nCount * g_nComposeNeedCount) then
		if 1 == AddSkillAppCount(g_nComposeLevel, nCount) then
			nHasComposeTimes = nHasComposeTimes + nCount;
			SetTask(TASKID_COMPOSE_SKILL_APP_TIMES, nHasComposeTimes);
			Talk(1, "", format("%s: Ch�ng trai tr� �� gh�p %d �� K� N�ng C�p %d.\n          Ng��i c�n ���c gh�p %d l�n.", g_szTitle, nCount, g_nComposeLevel, nCanComposeTimes - nHasComposeTimes));
			---------------add by wangjign--------------
			--OnAchivement(nCount);
			--------------------------------------------
			---------------add by suzengwei--------------
--			for i = 1, nCount do
--				Observer:onEvent(OE_COMPOSE_SKILL_STONE, {1});
--			end
			--------------------------------------------
		end
	end
	gf_SetLogCaption("");
end

function GetCanComposeTimes()
	local nCurTime		= MkTime(date("%Y"),date("%m"),date("%d"));
	local nBaseTimes	= ((nCurTime - g_nComposeIncreaseBeginTime) / (24 * 60 * 60)) * g_nComposeIncreaseTimes;
	local nAwardTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES_AWARD);
	return nBaseTimes + nAwardTimes;
end
