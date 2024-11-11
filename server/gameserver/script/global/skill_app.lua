--�ű����ƣ�
--�ű����ܣ�
--���ܲ߻�������
--���ܿ���������
--����ʱ�䣺2013-03-29
--�����޸ļ�¼

MINNUM_SKILL_APP_LEVEL	= 1;
MAXNUM_SKILL_APP_LEVEL	= 10;
MINNUM_SKILL_APP_COUNT	= 0;
MAXNUM_SKILL_APP_COUNT	= 99999;
--������Щ�����������ԭ���ӵ���define.lua���� ����޸����޸�define.lua

Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua");

g_szLogCaption		= "�� K� N�ng";

function unequip_all_skill_app()
	local tItemList			= GetEquipedSkillAppList();
	local tItemCountList	= {};
	if not tItemList then return end
	if 0 ~= GetFightState() then
		Talk(1, "", "� tr�ng th�i chi�n ��u kh�ng th� th�o �� K� N�ng!");
		return
	end
	
	for _, skill_app in tItemList do
		local nLevel		= GetItemLevel(skill_app.ItemIndex);
		local nG, nD, nP	= GetItemInfoByIndex(skill_app.ItemIndex);
		if 1 == DelItemByIndex(skill_app.ItemIndex, -1) then
			tItemCountList[nLevel]	= tItemCountList[nLevel] or 0;
			tItemCountList[nLevel]	= tItemCountList[nLevel] + 1;
			
			WriteLog(format("[%s][unequip_all_skill_app][%s][%s][DelItem][idx:%d][gdp:%d,%d,%d][lv:%d]",
			g_szLogCaption, GetAccount(), GetName(), skill_app.ItemIndex, nG, nD, nP, nLevel));
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
	
	------------------add by wangjing--------------------
	SetTask(TASKID_JNS_SPE_ACH_TASK_7, 1);
	--OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_7);
	-----------------------------------------------------
	
	Talk(1, "", "�� K� N�ng c�a b�n �� ���c b� v�o trong t�i.");
end
