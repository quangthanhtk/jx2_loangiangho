YWZ_SYSTEM_SWITCH = 1;

--Task define------------------------
YWZ_TASK_1 = 3387;
YWZ_TASK_2 = 3388;

--Limit----
YWZ_WEEK_TASK_LIMIT = 50; --�ܳ���������
YWZ_EX_TASK_AWARD = 15; --�Ͻ��콾���ȡ���⽱������

--�ܳ������б�
YWZ_WEEK_TASK_TABLE = {
	{20, "Th�n ��n H� Ph�p", "Th�t L�c Nhai (174,222)"},
	{20, "Nh�t ��n h� ph�p", "Th�t L�c Nhai (191,200)"},
	{20, "Giang H� Ti�u Ti�u", "Th�t L�c Nhai (179,194)"},
	{20, "Hoa T�ng M�n Nh�n", "Th�t L�c Nhai (181,205)"},
	{20, "Nhai Th��ng S�n T�c", "Th�t L�c Nhai (160,209)"},
	{20, "Nguy�t ��n H� Ph�p", "Th�t L�c Nhai (149,202)"},
	{20, "Tinh ��n H� Ph�p", "Th�t L�c Nhai (172,183)"},
}

--RelayShareData---------------------
YWZ_SHARE_DATA = "_YWZ_DATA_";
-- 0, 0 [������ţ�����1����ެ2������3��] = �������׶�
-- 0, 1 [GetName()] = ���˻���(����)
-- 0, 2 [GetName()] = ���˻���(��ެ)
-- 0, 3 [GetName()] = ���˻���(����)
-- 1, 0 ["WeekFlag"] = gf_GetWeekly() --�������ñ��
