--����: ������(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
		{ "skill_effect_persist_time", { { 1, 300 }, { 10, 300 } } },
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
		{ magic = "state_destiny_armor_point_add",
		  damage_factor_z = { { 1, 15 }, { 10, 80 } },
		},
		{ magic = "state_o_defence_point_add",
		  damage_factor_b = { { 1, 25 }, { 10, 70 } },
		  damage_factor_z = { { 1, 50 }, { 10, 50 } },
		},
		{ magic = "state_damage_to_mana",
		  damage_factor_z = { { 1, 1 }, { 10, 1 } },
		},
		{ magic = "state_fast_recovery",
		  damage_factor_z = { { 1, 32 }, { 10, 200 } },
		  damage_factor_m = { { 1, 200 }, { 10, 200 } },
		},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
