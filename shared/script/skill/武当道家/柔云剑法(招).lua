--����: ���ƽ���(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,2},{8,2}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_missle_num",{{1,1},{4,1},{5,2},{6,2},{7,3},{8,3}}},
	{"missle_vanish_after_collide",{{1,1},{8,1}}},
	{"missle_damage_interval",{{1,-1},{8,-1}}},
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
		  damage_factor_x = { { 1, 38 }, { 4, 75 }, { 5, 63 }, { 6, 68 }, { 7, 63 }, { 8, 68 } },
		  damage_factor_z = { { 1, 44 }, { 4, 82 }, { 5, 68 }, { 6, 75 }, { 7, 68 }, { 8, 75 } },
		}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_attack_speed_dec",
	damage_factor_z={{1,20},{8,20}},
	},
	{magic="state_burst_dec_rate",
	damage_factor_z={{1,20},{8,20}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
