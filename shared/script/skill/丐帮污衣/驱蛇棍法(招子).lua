--����: ���߹���(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB = --���ܵȼ���ػ�������
	{
	},

	SKILL_LEVEL_COST_ATTRIB = --���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB = --���ܵȼ�����ӵ�����
	{
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB = --���ܵȼ�����˺�ħ������
	{
		{ magic = "damage_life",
		  damage_factor_c = { { 1, 90 }, { 4, 113 }, { 5, 166 }, { 7, 196 } },
		  damage_factor_e = { { 1, 76 }, { 4, 98 }, { 5, 136 }, { 7, 166 } },
		  damage_factor_x = { { 1, 100 }, { 4, 138 }, { 5, 150 }, { 7, 200 } },
		  damage_factor_f = { { 1, 125 }, { 7, 125 } },
		},
		{ magic = "damage_knockback",
		  damage_factor_z = { { 1, 2 }, { 7, 2 } },
		},
	},

	SKILL_MAGIC_STATE_ATTRIB = --���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB = --���ܵȼ��������ħ������
	{
	},
}
