--����: ����ȭ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
		{ "skill_sub_skill1_probability", { { 1, 0 }, { 2, 0 }, { 3, 8 }, { 4, 10 }, { 5, 12 }, { 6, 15 } } },
		{ "skill_sub_skill1_factor", { { 1, 0 }, { 2, 0 }, { 3, 10 }, { 4, 13 }, { 5, 16 }, { 6, 20 } } },
		{ "skill_effect_persist_time", { { 1, 2 }, { 6, 2 } } }
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,5},{4,6},{6,6}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
		{ "missle_vanish_after_collide", { { 1, 1 }, { 16, 1 } } },
		{ "missle_damage_interval", { { 1, -1 }, { 16, -1 } } },
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
		{ magic = "damage_life",
		  damage_factor_x = { { 1, 432 }, { 6, 605 } },
		  probability_factor_b = { { 1, 20 }, { 6, 20 } },
		  probability_factor_x = { { 1, 100 }, { 6, 100 } },
		}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_vertigo",
	probability_factor_x={{1,30},{6,30}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
