--����: ���ս����(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
		{ "skill_effect_persist_time", { { 1, 300 }, { 6, 300 } } },
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
		{ magic = "state_knockback_immune",
		  damage_factor_z = { { 1, 25 }, { 6, 95 } },
		  damage_factor_m = { { 1, 95 }, { 6, 95 } },
		},
		{ magic = "state_knockdown_immune",
		  damage_factor_z = { { 1, 35 }, { 6, 100 } },
		  damage_factor_m = { { 1, 100 }, { 6, 100 } },
		},
		{ magic = "state_accuracy_point_increase",
		  damage_factor_z = { { 1, 15 }, { 6, 50 } },
		  damage_factor_b = { { 1, 40 }, { 6, 40 } },
		},
		{ magic = "state_o_defence_point_add",
		  damage_factor_z = { { 1, 100 }, { 6, 200 } },
		},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}