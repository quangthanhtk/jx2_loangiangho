Include("\\script\\newbattles\\functions.lua");
--��³�ų�ս�����½���

--��ò������κζ����ܹ���ȡ�ľ�����
function get_dlgc_base_jungong()
	--�ܳ�����ƽ�ָ���900+300*����Ծֵ/100)
	--ʤ������1200+300*����Ծֵ/100)
	return BT_GetData(PT_JUNGONG_AWARD);
end

--�����ӳɻ���ֵ
--1Ϊ�⴫��0Ϊ�������2Ϊ�շ���
if _JX2WZ == 1 then
	g_nBonusJungong = 1050;
else
	g_nBonusJungong = 1000;
end
--ʤ����������
if _JX2WZ == 1 then
	g_tBaseJungong = {
		[0] = 900,
		[1] = 1000,
		[2] = 1200,
	}
else
	g_tBaseJungong = {
		[0] = 400,
		[1] = 600,
		[2] = 900,
	}
end

g_tActivityAward = {
	{150,  1,   300},
	{300,  1.2, 450},
	{501, 1.5,   550},
	{901, 1.8, 650},
	{1301, 2,   760},
	{2001, 2.5,   850},
	{2501, 3,   960},
};

--ʤ���������
g_tBaseExp = {
	[0] = 2,
	[1] = 3,
	[2] = 4,
}

g_tBaseDPL = {
	[0] = 5,
	[1] = 10,
	[2] = 25,
};

--�����»�vip�ӳ�ϵ��
g_tTicketRatio = {
	[0] = 1,
	[1] = 2,
	[2] = 5,
	[3] = 10,
	[4] = 1,  --vip��
	[5] = 1.5,  --vip��
	[6] = 3,  --vip��
	[7] = 1,  --vip��
	[8] = 1.5,--������ƿ�
	[9] = 1.5,--�����ƿ�
}

--ʹ�þ�����/vip��ȡ����
function get_dlgc_bonus_jungong(nType)
	return g_nBonusJungong * (g_tTicketRatio[nType] - 1);
end

--�����������ֵ
--1Ϊ�⴫��0Ϊ�������2Ϊ�շ���
if _JX2WZ == 1 then
	g_nBulingJungong = 1000;
else
	g_nBulingJungong = 700;
end

--ʹ�þ�����/vip�������
function get_dlgc_buling_jungong(nType)
	return g_nBulingJungong + get_dlgc_bonus_jungong(nType)
end

--����ʤ����������� 0:ƽ�� 1:�� 2:ʤ
function calculate_dlgc_jungong(nType)
	return g_tBaseJungong[nType] + 300 * (BT_GetData(PTNC_ACTIVITY) / 100);
end

--��ò������κζ����ܹ���ȡ�ľ���
function get_dlgc_base_exp()
	return BT_GetData(PT_EXP_AWARD);
end

--ʹ�þ�����/vip��ȡ����ľ���
function get_dlgc_bonus_exp(nType)
	local nLevel = GetLevel();
	return nLevel * nLevel * 10 * 30 * g_tTicketRatio[nType];
end

--���쾭��
function get_dlgc_buling_exp(nType)
	local nLevel = GetLevel();
	return nLevel * nLevel * 300 * 2 + get_dlgc_bonus_exp(nType);
end

--����ʤ�������㾭�� 0:ƽ�� 1:�� 2:ʤ
function calculate_dlgc_exp(nType)
	local nLevel = GetLevel();
	local nExp = nLevel * nLevel * 300 * g_tBaseExp[nType] + nLevel * nLevel * 300 * (BT_GetData(PTNC_ACTIVITY) / 100);
	if BT_GetData(PTNC_ACTIVITY) < 5 then
		nExp = 0;
	end
	return nExp;
end


