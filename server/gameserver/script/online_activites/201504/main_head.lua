Import("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")


--�һ�������ʹ�û���\script\online_activites\ini\VnOnlineMain.ini
--��VnOnlineMain.ini [154]����Ҫһ�£�ʵ�ʴ�VnOnlineMain.ini��ȡ��һЩ������Ϣ
--�������η�װ��ʹ֮����һЩ��

VET_201504_ID = 154
VET_201504_ACTIVITY_CONFIG = TB_VN_ACTIVITY_MAIN[VET_201504_ID]
tbShengliPrizeItemInfo = VET_201504_ACTIVITY_CONFIG.tbPrizeItemInfo[1]--ʤ������
tbHuiHuangPrizeItemInfo = VET_201504_ACTIVITY_CONFIG.tbPrizeItemInfo[2]--�Իͱ���
tbRongYuPrizeItemInfo = VET_201504_ACTIVITY_CONFIG.tbPrizeItemInfo[3]--��������

function VET_201504_GetShengLiUseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201504_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201504_ACTIVITY_CONFIG.tbTaskGroup[2], tbShengliPrizeItemInfo.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201504_GetHuiHuangUseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201504_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201504_ACTIVITY_CONFIG.tbTaskGroup[2], tbHuiHuangPrizeItemInfo.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201504_GetRongYuUseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201504_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201504_ACTIVITY_CONFIG.tbTaskGroup[2], tbRongYuPrizeItemInfo.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201504_GetShengLiMaxUseTime()
	local nMaxTime = tbShengliPrizeItemInfo.nItemUseTimesMax
	return nMaxTime
end

function VET_201504_GetHuiHuangMaxUseTime()
	local nMaxTime = tbHuiHuangPrizeItemInfo.nItemUseTimesMax
	return nMaxTime
end

function VET_201504_GetRongYuMaxUseTime()
	local nMaxTime = tbRongYuPrizeItemInfo.nItemUseTimesMax
	return nMaxTime
end