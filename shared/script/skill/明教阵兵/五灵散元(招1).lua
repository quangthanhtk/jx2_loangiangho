--����: ����ɢԪ(��1)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
		{"skill_effect_persist_time",{{1,2},{7,2}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
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
		{magic="damage_life",
		 damage_factor_x={{1,510},{9,850}},
		 damage_factor_a={{1,51},{9,255}},
		},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
		{magic="state_vertigo",
		 probability_factor_x={{1,35},{9,35}},
		},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
