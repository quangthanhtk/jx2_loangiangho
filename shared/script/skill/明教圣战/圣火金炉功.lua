--����: ʥ���¯��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
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
	{magic="state_life_restore_per10s",
	damage_factor_z={{1,10},{10,100}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,8},{10,8}},
	},
	{magic="state_physical_parmor_per_add",
	damage_factor_z={{1,10},{10,10}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,20},{10,20}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="state_max_gas_limit",
	damage_factor_z={{1,10},{10,10}},
	},
	--{magic="state_life_max_point_add",
	--damage_factor_z={{1,0},{10,10000}},
	--},
	{magic="state_level_2_max_life_rate",
	damage_factor_z={{1,504},{10,504}},
	},	
	{magic="state_trans_2_max_life_rate",
	damage_factor_z={{1,5040},{10,5040}},
	},
	{magic="state_destiny_armor_point_add",
	damage_factor_z={{1,200},{10,200}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
