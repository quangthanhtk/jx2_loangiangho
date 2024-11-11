--����: ���߹���

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
		{ "skill_burst_time", { { 1, 12 }, { 4, 12 }, { 5, 21 }, { 7, 21 } } },
		{ "skill_nextskill_wait_time", { { 1, 4 }, { 4, 4 }, { 5, 12 }, { 7, 12 } } },
		{ "skill_sub_skill1_probability", { { 1, 0 }, { 2, 0 }, { 3, 8 }, { 4, 9 }, { 5, 10 }, { 6, 12 }, { 7, 15 } } },
		{ "skill_sub_skill1_factor", { { 1, 0 }, { 2, 0 }, { 3, 10 }, { 4, 12 }, { 5, 15 }, { 6, 17 }, { 7, 20 } } },
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,3},{5,4},{7,4}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_missle_num",{{1,1},{5,2},{7,2}}},
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
		  damage_factor_c = { { 1, 66 }, { 7, 102 } },
		  damage_factor_e = { { 1, 54 }, { 7, 90 } },
		  damage_factor_x = { { 1, 80 }, { 4, 110 }, { 5, 90 }, { 7, 110 } },
		  damage_factor_f = { { 1, 100 }, { 7, 100 } },
		  probability_factor_b = { { 1, 20 }, { 7, 20 } },
		  probability_factor_x = { { 1, 100 }, { 7, 100 } },
		}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
