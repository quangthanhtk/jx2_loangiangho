Import("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")


--�һ�������ʹ�û���\script\online_activites\ini\VnOnlineMain.ini
--��VnOnlineMain.ini [154]����Ҫһ�£�ʵ�ʴ�VnOnlineMain.ini��ȡ��һЩ������Ϣ
--�������η�װ��ʹ֮����һЩ��

VET_201506_ID = 159
VET_201506_ACTIVITY_CONFIG = TB_VN_ACTIVITY_MAIN[VET_201506_ID]
if VET_201506_ACTIVITY_CONFIG then
	tbPrizeItem1Info = VET_201506_ACTIVITY_CONFIG.tbPrizeItemInfo[1]--
	tbPrizeItem2Info = VET_201506_ACTIVITY_CONFIG.tbPrizeItemInfo[2]--
	tbPrizeItem3Info = VET_201506_ACTIVITY_CONFIG.tbPrizeItemInfo[3]--
end

function VET_201506_Item1UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201506_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201506_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem1Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201506_Item2UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201506_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201506_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem2Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201506_Item3UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201506_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201506_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem3Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201506_GetItem1MaxUseTime()
	local nMaxTime = tbPrizeItem1Info.nItemUseTimesMax
	return nMaxTime
end

function VET_201506_GetItem2MaxUseTime()
	local nMaxTime = tbPrizeItem2Info.nItemUseTimesMax
	return nMaxTime
end

function VET_201506_GetItem3MaxUseTime()
	local nMaxTime = tbPrizeItem3Info.nItemUseTimesMax
	return nMaxTime
end