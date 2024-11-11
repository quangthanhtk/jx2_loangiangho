--�ű����ƣ�
--�ű����ܣ�
--���ܲ߻�������
--���ܿ���������
--����ʱ�䣺2013-03-29
--�����޸ļ�¼

Import("\\script\\lib\\globalfunctions.lua");
Import("\\settings\\static_script\\lib\\item_define.lua")
Include("\\script\\lib\\message.lua");
Import("\\script\\lib\\define.lua");
Import("\\script\\global\\skill_app.lua")


--ע�⣺settings\·���µĽű����������޸ģ��������赽script\·���µĽű���
GEM_RELEASE_WORK = 1 --�������� 0:close 1:open


g_szLogCaption		= "C�m Nang �� K� N�ng";
g_szTitle			= "<color=green>C�m Nang �� K� N�ng<color>";
g_tCheckOutPlayer	= {};
g_tComposePlayer	= {};
g_tDecomposePlayer	= {};
g_nComposeNeedCount	= 3;
assert(0 < g_nComposeNeedCount);

g_tAchTaskId = {
	[1] = TASKID_JNS_SPE_ACH_TASK_1,
	[4] = TASKID_JNS_SPE_ACH_TASK_2,
	[7] = TASKID_JNS_SPE_ACH_TASK_3,
	[9] = TASKID_JNS_SPE_ACH_TASK_4,
	[10] = TASKID_JNS_SPE_ACH_TASK_5,
};

function OnUse_SKillAppBox()
	local szMsg	= format("%s: �� K� N�ng c� th� c�t v�o trong %s , b�n c� th� ��n ch� %s �� gh�p �� K� N�ng c�p cao h�n, ho�c t�ch �� K� N�ng c�p cao th�nh �� K� N�ng c�p th�p. ��ng th�i b�n c�ng c� th� t� C�m Nang �� K� N�ng r�t ra nh�ng �� K� N�ng �� c�t v�o, gh�p ho�c t�ch.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {
		"B� v�o t�t c� �� K� N�ng trong t�i	/CheckInAllSkillApp",
		"Ta mu�n r�t �� K� N�ng			/CheckOutSkillAppMenu",
		"Ta mu�n gh�p �� K� N�ng			/ComposeSkillAppMenu",
		"Ta mu�n t�ch �� K� N�ng			/DecomposeSkillAppMenu",
		"Ra kh�i	/nothing",
	};
	suSay(szMsg, getn(tMenu), tMenu);
	return 1;
end

function CheckInAllSkillApp()
	local tItemCountList	= {};
	local tItems = GetRoomItems(pos_equiproom)
	for i, item_idx in tItems do
		local nG, nD, nP	= GetItemInfoByIndex(item_idx);
		if nG == item_other and nD == enumOD_SKILL_APP  then
			local nLevel		= GetItemLevel(item_idx);
    		if 1 == DelItemByIndex(item_idx, -1) then
    			tItemCountList[nLevel]	= tItemCountList[nLevel] or 0;
    			tItemCountList[nLevel]	= tItemCountList[nLevel] + 1;
    			
    			WriteLog(format("[%s][CheckInAllSkillApp][%s][%s][DelItem][idx:%d][gdp:%d,%d,%d][lv:%d]",
    			g_szLogCaption, GetAccount(), GetName(), item_idx, nG, nD, nP, nLevel));
    		end
		end
	end
	
	for item_lv, item_count in tItemCountList do
		if MINNUM_SKILL_APP_LEVEL <= item_lv and MAXNUM_SKILL_APP_LEVEL >= item_lv then
			AddSkillAppCount(item_lv, item_count);
			
			------------------add by wangjing--------------------
			if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
				SetTask(TASKID_JNS_SPE_ACH_TASK_6, item_count);
				--OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
			end
			-----------------------------------------------------
		end
	end
	
	Talk(1, "", format("%s: Ch�ng trai tr�, t�t c� �� K� N�ng trong t�i �� b� v�o %s.", g_szTitle, g_szTitle));
end

function CheckOutSkillAppMenu()
	local szMsg	= format("%s: �� K� N�ng c� th� b� v�o %s , ng��i c� th� t� ch� %s gh�p �� K� N�ng c�p cao h�n, ��ng th�i c� th� r�t nh�ng �� K� N�ng �� c�t v�o v� gh�p.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		tinsert(tMenu, format("R�t ra �� K� N�ng C�p %2d (S� h�u %d c�i)	/#CheckOutSkillApp(%d,%d)",
		item_lv, item_count, 
		item_lv, item_count));
	end
	tinsert(tMenu, "Ra kh�i	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function CheckOutSkillApp(nItemLevel, nItemMaxCount)
	nItemMaxCount	= nItemMaxCount or GetSkillAppCount(nItemLevel);
	if not nItemMaxCount or 0 >= nItemMaxCount then
		Talk(1, "", format("%s: Ch�ng trai tr�, kh�ng c� g� th� ��ng nh�p lung tung.", g_szTitle));
		return
	end
	
	g_tCheckOutPlayer[GetName()] = nItemLevel;
	AskClientForNumber("CheckOutSkillAppCallBack", 0, nItemMaxCount, "Mu�n r�t bao nhi�u?");
end

function CheckOutSkillAppCallBack(nCount)
	if 0 >= nCount then return end
	local nItemLevel	= g_tCheckOutPlayer[GetName()];
	g_tCheckOutPlayer[GetName()] = nil;
	if not nItemLevel then return end
	if MINNUM_SKILL_APP_LEVEL > nItemLevel or MAXNUM_SKILL_APP_LEVEL < nItemLevel then return end
	if 1 ~= gf_JudgeRoomWeight(nCount, 0, g_szTitle) then return end
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelSkillAppCount(nItemLevel, nCount, 1) then
		gf_AddItemEx({item_other, enumOD_SKILL_APP, nItemLevel}, format("�� K� N�ng C�p %d", nItemLevel), nCount);
	end
	gf_SetLogCaption("");
end

function ComposeSkillAppMenu()
	local szMsg	= format("%s: �� K� N�ng c� th� b� v�o %s , ng��i c� th� t� ch� %s gh�p �� K� N�ng c�p cao h�n, ��ng th�i c� th� r�t nh�ng �� K� N�ng �� c�t v�o v� gh�p.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		if MAXNUM_SKILL_APP_LEVEL > item_lv then
			local nComposeCount	= floor(item_count / g_nComposeNeedCount);
			tinsert(tMenu, format("D�ng %d �� K� N�ng C�p %2d �� gh�p th�nh �� K� N�ng C�p %2d (C� th� gh�p %d c�i)	/#ComposeSkillApp(%d,%d)",
			g_nComposeNeedCount, item_lv, item_lv + 1, nComposeCount,
			item_lv, nComposeCount));
		end
	end
	tinsert(tMenu, "Ra kh�i	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function ComposeSkillApp(nItemSrcLevel, nComposeMaxCount)
	nComposeMaxCount = nComposeMaxCount or floor((GetSkillAppCount(nItemSrcLevel) or 0) / g_nComposeNeedCount);
	if not nComposeMaxCount or 0 >= nComposeMaxCount then
		Talk(1, "", format("%s: Ch�ng trai tr�, kh�ng c� g� th� ��ng nh�p lung tung.", g_szTitle));
		return
	end
	
	g_tComposePlayer[GetName()] = nItemSrcLevel;
	AskClientForNumber("ComposeSkillAppCallBack", 0, nComposeMaxCount, "Mu�n gh�p bao nhi�u?");
end

function ComposeSkillAppCallBack(nCount)
	if 0 >= nCount then return end
	local nItemSrcLevel = g_tComposePlayer[GetName()];
	g_tComposePlayer[GetName()] = nil;
	if not nItemSrcLevel then return end
	if MINNUM_SKILL_APP_LEVEL > nItemSrcLevel or MAXNUM_SKILL_APP_LEVEL <= nItemSrcLevel then return end
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelSkillAppCount(nItemSrcLevel, g_nComposeNeedCount * nCount, 1) then
		if 1 == AddSkillAppCount(nItemSrcLevel + 1, nCount) then
			Talk(1, "", format("%s: Ch�ng trai tr�, ng��i �� gh�p %d c�i �� K� N�ng C�p %d.", g_szTitle, nCount, nItemSrcLevel + 1));
			
			------------------add by wangjing-------------------
			if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
				SetTask(TASKID_JNS_SPE_ACH_TASK_6, nCount);
				OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
			end
			----------------------------------------------------
			local nNewLevel = nItemSrcLevel + 1;
			if g_tAchTaskId[nNewLevel] then
				if not (GetTask(g_tAchTaskId[nNewLevel]) >= 1) then
					SetTask(g_tAchTaskId[nNewLevel], 1);
					OnAchEvent(2, g_tAchTaskId[nNewLevel]);
				end
			end
		end
	end
	gf_SetLogCaption("");
end

function DecomposeSkillAppMenu()
	local szMsg	= format("%s: Ng��i c� th� ��n ch� %s d�ng �� K� N�ng c�p cao t�ch th�nh �� K� N�ng th�p h�n 1 c�p.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		if MAXNUM_SKILL_APP_LEVEL >= item_lv and item_lv > 1 then
			tinsert(tMenu, format("D�ng 1 �� K� N�ng C�p %d t�ch th�nh %d �� K� N�ng C�p %d (�� K� N�ng c� th� t�ch %d c�i)/#DecomposeSkillApp(%d, %d)",
				item_lv, g_nComposeNeedCount, item_lv - 1, item_count, item_lv, item_count));
		end
	end
	tinsert(tMenu, "Ra kh�i	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function DecomposeSkillApp(nItemSrcLevel, nItemCount)
	nItemCount = min(nItemCount, GetSkillAppCount(nItemSrcLevel));
	if nItemCount <= 0 then
		Talk(1, "", format("%s: Ch�ng trai tr�, kh�ng c� g� th� ��ng nh�p lung tung.", g_szTitle));
		return 0;
	end
	g_tDecomposePlayer[GetName()] = nItemSrcLevel;
	AskClientForNumber("DecomposeSkillAppCallBack", 0, nItemCount, "Mu�n t�ch bao nhi�u?");
end

function DecomposeSkillAppCallBack(nCount)
	if not g_tDecomposePlayer[GetName()] then
		return 0;
	end
	
	local nLevel = g_tDecomposePlayer[GetName()];
	if nLevel <= 1 then
		return 0;
	end
	local nItemCount = GetSkillAppCount(nLevel)
	if nItemCount < nCount then
		Talk(1, "", format("%s: Ch�ng trai tr�, kh�ng c� g� th� ��ng nh�p lung tung.", g_szTitle));
		return 0;
	end
	if DelSkillAppCount(nLevel, nCount) ~= 1 then
		Talk(1, "", format("%s: Ch�ng trai tr�, kh�ng c� g� th� ��ng nh�p lung tung.", g_szTitle));
		return 0;
	end
	
	if AddSkillAppCount(nLevel - 1, nCount * g_nComposeNeedCount) ~= 1 then
		WriteLog(format("[T�ch �� K� N�ng][acc:%s role:%s][T�ch �� K� N�ng C�p %d x%d][Th�m �� K� N�ng C�p %d th�t b�i]",
			GetAccount(), GetName(), nLevel, nCount, nLevel - 1));
		return 0;
	end
	
	WriteLog(format("[T�ch �� K� N�ng][acc:%s role:%s][T�ch �� K� N�ng C�p %dx%d][Th�m �� K� N�ng C�p %d x%d]",
		GetAccount(), GetName(), nLevel, nCount, nLevel - 1, nCount * g_nComposeNeedCount));
		
	Talk(1, "", format("%s: L�n n�y t�ch th�nh c�ng %d �� K� N�ng C�p %d, nh�n ���c %d �� K� N�ng C�p %d",
		g_szTitle, nCount, nLevel, nCount * g_nComposeNeedCount, nLevel - 1));
end

function on_task_recycle(data, para)
	local nTaskId, nNewVersion, nOldVersion = unpack(data)
	if nTaskId == 3346 and nOldVersion < 7 then
		bugfix_remove_skillapps_1507()
	end
end

function bugfix_remove_skillapps_1507()--ɾ�����м���ʯ
	--print(GetName(), "skill_app_removed")
	for i= 1,10 do
		BigDelItem(2,23,i,BigGetItemCount(2,23,i))
	end
end