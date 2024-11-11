--¼¼ÄÜ: SËu Vò (Tö chiªu)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--¼¼ÄÜÊôÐÔ

	SKILL_LEVEL_BASE_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø»ù±¾ÊôÐÔ
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹ØÏûºÄÊôÐÔ
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×Óµ¯ÊôÐÔ
	{
	{"missle_collide_npc_missle",{{1,0},{1,0}}},
	},

	--Ä§·¨ÊôÐÔ

	--ÊôÐÔÖµ:	ÆÕÍ¨¹¥»÷Á¦ * X + (1 + ¼¼ÄÜµÈ¼¶ * Y) * (Á¦Á¿ * A + ¸ù¹Ç * B + Éí·¨ * C + ÄÚ¹¦ * D + ¶´²ì * E)
	--			+ ÎäÆ÷Íâ¹¦¹¥»÷µã * F + Z
	--			(ÆäÖÐ,A,B,C,D,E,F,X,Y,ZÎªÉËº¦ÒòËØ.³ýZÍâ,ÆäÓà¸÷ÉËº¦ÒòËØÎª°Ù·Ö±ÈÊý.)

	--³É¹¦¼¸ÂÊ:	(ÊôÐÔÖµ * A + (×ÔÉíµÈ¼¶ - ¶Ô·½µÈ¼¶) * B + ¼¼ÄÜµÈ¼¶ * C) * D + X
	--			(ÆäÖÐ,A,B,C,D,XÎª¼¸ÂÊÒòËØ.³ýXÍâ,ÆäÓà¸÷¼¸ÂÊÒòËØÎª°Ù·Ö±ÈÊý.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹ØÉËº¦Ä§·¨ÊôÐÔ
	{
	{magic="damage_life_monster",
	damage_factor_a={{1,975},{1,975}},
	damage_factor_b={{1,975},{1,975}},
	damage_factor_c={{1,975},{1,975}},
	damage_factor_d={{1,975},{1,975}},
	damage_factor_e={{1,975},{1,975}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×´Ì¬Ä§·¨ÊôÐÔ
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--¼¼ÄÜµÈ¼¶Ïà¹ØÁ¢¼´Ä§·¨ÊôÐÔ
	{
	},
}
