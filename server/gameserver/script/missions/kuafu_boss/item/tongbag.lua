Import("\\script\\lib\\globalfunctions.lua")

KFB_TASKID_TONG_BAG_DAILYLIMIT = 3596

function OnUse(nItemIndex)
	local nCount = GetTask(KFB_TASKID_TONG_BAG_DAILYLIMIT)
	if nCount >= 50 then
		return Talk(1, "", "T�i Qu� Bang H�i m�i tu�n ���c m� 50 l�n.")
	end

	if CustomAwardCheckCondition("KFboss_libaojihe") ~= 1 then
		return
	end

	if gf_DelItemByIndex(nItemIndex, 1) == 1 then
		SetTask(KFB_TASKID_TONG_BAG_DAILYLIMIT, nCount + 1)
		CustomAwardGiveGroup("KFboss_libaojihe", 1) --���Ų���Ϊ�Ƿ����ȫ������,�������1	
		AddRuntimeStat(103, 1, 0, 1);
	end
end