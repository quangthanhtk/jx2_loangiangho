--����: ����ɢԪ

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
		{"skill_sub_skill1_probability",{{1,0},{2,0},{3,9},{9,15}}},
		{"skill_sub_skill1_factor",{{1,0},{2,0},{3,8},{9,20}}},
		{"skill_sub_skill2_probability",{{1,0},{4,0},{5,1},{9,5}}},
		{"skill_sub_skill2_factor",{{1,0},{4,0},{5,8},{9,12}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
		{"cost_mana_point",{{1,20},{9,44}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
		{"missle_vanish_skill_id",{{1,1112},{9,1112}}},
		{"skill_param1",{{1,9},{9,9}}},
		{"skill_param2",{{1,0},{9,0}}},
		{"missle_vanish_after_collide",{{1,1},{9,1}}},
		{"missle_damage_interval",{{1,-1},{9,-1}}},
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
		  damage_factor_x = { { 1, 510 }, { 9, 850 } },
		  damage_factor_a = { { 1, 51 }, { 9, 255 } },
		  probability_factor_b = { { 1, 20 }, { 9, 20 } },
		  probability_factor_x = { { 1, 100 }, { 9, 100 } },
		}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
