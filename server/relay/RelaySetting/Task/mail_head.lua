--�ű����ƣ��ʼ���ض���
--�ű����ܣ�
--���ܲ߻���
--���ܿ���������
--����ʱ�䣺2010-09-29
--�����޸ļ�¼

-- �ʼ����ȼ�
eMAIL_PRI_LOW					= 0;	-- ��
eMAIL_PRI_MIDDLE				= 1;    -- ��
eMAIL_PRI_HIGH					= 2;    -- ��
eMAIL_PRI_SUPER					= 3;    -- ��


-- �ʼ���������
eMAIL_ATTACHMENT_T_NONE			= 0;	-- ��
eMAIL_ATTACHMENT_T_TEXT			= 1;	-- �ı�
eMAIL_ATTACHMENT_T_ITEM			= 2;	-- ����
eMAIL_ATTACHMENT_T_SCRIPT		= 3;	-- �ű�
eMAIL_ATTACHMENT_T_COIN			= 4;	-- ��Ϸ��
eMAIL_ATTACHMENT_T_GOLD_TICKET	= 5;	-- ��ȯ

-- �ʼ���������
eMAIL_CONDIFION_T_NONE			= 0;	-- ��
eMAIL_CONDIFION_T_RECEIVE		= 1;	-- �Ƿ���Խ����ʼ������� --������Ⱥ�ʼ�
eMAIL_CONDIFION_T_TAKEOUT		= 2;	-- �Ƿ����ȡ������������

-- �ʼ�������������
MAXNUM_MAIL_ATTACHMENT			= 5;

-- �ʼ�����
tMAIL_DATA = {
	szTo		= "",
	szFrom		= "",
	szTitle		= "",
    byPRI		= eMAIL_PRI_LOW,
};

-- �ʼ�����Ԫ������
tMAIL_ATTACHMENT_ELEM_DATA = {
	nType		= eMAIL_ATTACHMENT_T_NONE,
	szContent	= "",
};

-- �ʼ�����Ԫ������
tMAIL_CONDITION_ELEM_DATA = {
	nType		= eMAIL_CONDIFION_T_NONE,
	szContent	= "",
};
