Import("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")


--�һ�������ʹ�û���\script\online_activites\ini\VnOnlineMain.ini
--��VnOnlineMain.ini [154]����Ҫһ�£�ʵ�ʴ�VnOnlineMain.ini��ȡ��һЩ������Ϣ
--�������η�װ��ʹ֮����һЩ��

VET_201505_ID = 155
VET_201505_ACTIVITY_CONFIG = TB_VN_ACTIVITY_MAIN[VET_201505_ID]
if VET_201505_ACTIVITY_CONFIG then
	tbPrizeItem1Info = VET_201505_ACTIVITY_CONFIG.tbPrizeItemInfo[1]--��ݮ�����
	tbPrizeItem2Info = VET_201505_ACTIVITY_CONFIG.tbPrizeItemInfo[2]--�̲�����
	tbPrizeItem3Info = VET_201505_ACTIVITY_CONFIG.tbPrizeItemInfo[3]--ˮ���ǽ�
end

function VET_201505_Item1UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201505_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201505_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem1Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201505_Item2UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201505_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201505_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem2Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201505_Item3UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201505_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201505_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem3Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201505_GetItem1MaxUseTime()
	local nMaxTime = tbPrizeItem1Info.nItemUseTimesMax
	return nMaxTime
end

function VET_201505_GetItem2MaxUseTime()
	local nMaxTime = tbPrizeItem2Info.nItemUseTimesMax
	return nMaxTime
end

function VET_201505_GetItem3MaxUseTime()
	local nMaxTime = tbPrizeItem3Info.nItemUseTimesMax
	return nMaxTime
end