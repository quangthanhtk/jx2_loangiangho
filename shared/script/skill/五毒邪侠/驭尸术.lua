--����: Ԧʬ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
		{ "skill_effect_persist_time", { { 1, 28800 }, { 6, 28800 } } },
		{ "skill_display_persist_time", { { 1, 28800 }, { 6, 28800 } } },
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
		{ "cost_mana_point", { { 1, 10 }, { 6, 20 }, { 16, 30 } } },
		{ "cost_spirit", { { 1, 300 }, { 16, 300 } } }
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
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
		{magic="imme_npc_corpse_revival",
	probability_factor_b={{1,20},{6,20}},
	probability_factor_x={{1,100},{6,100}},
	},
		{ magic = "imme_summon_life_add",
		  damage_factor_a = { { 1, 600 }, { 6, 600 } },
		  damage_factor_c = { { 1, 1000 }, { 6, 1000 } },
		  damage_factor_z = { { 1, 150 }, { 6, 400 } },
		},
		{ magic = "imme_summon_attack_add",
		  damage_factor_a = { { 1, 240 }, { 6, 240 } },
		  damage_factor_c = { { 1, 330 }, { 6, 330 } },
		  damage_factor_z = { { 1, 300 }, { 6, 600 } },
		  damage_factor_f = { { 1, 75 }, { 6, 75 } },
		},
		{ magic = "imme_summon_attack_rate_add",
		  damage_factor_a = { { 1, 150 }, { 6, 150 } },
		  damage_factor_c = { { 1, 180 }, { 6, 180 } },
		  damage_factor_z = { { 1, 150 }, { 6, 225 } },
		},
		{ magic = "imme_summon_dodge_add",
		  damage_factor_a = { { 1, 120 }, { 6, 120 } },
		  damage_factor_c = { { 1, 160 }, { 6, 160 } },
		  damage_factor_z = { { 1, 100 }, { 6, 300 } },
		},
		{magic="imme_summon_physical_defence_add",
	damage_factor_a={{1,15},{6,15}},
	damage_factor_c={{1,25},{6,25}},
	damage_factor_z={{1,50},{6,100}},
	},
		{magic="imme_summon_magic_defence_add",
	damage_factor_a={{1,15},{6,15}},
	damage_factor_c={{1,25},{6,25}},
	damage_factor_z={{1,50},{6,100}},
	},
	{magic="imme_element_all_defend_point_enhance",
	damage_factor_z={{1,70},{6,70}},
	},
	{magic="imme_def_critical_point_enhance",
	damage_factor_z={{1,70},{6,70}},
	},
	},
}
