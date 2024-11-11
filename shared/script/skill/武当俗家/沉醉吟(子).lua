--¼¼ÄÜ: TrÇm Tóy Ng©m (Tö)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--¼¼ÄÜÊôÐÔ

	SKILL_LEVEL_BASE_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø»ù±¾ÊôÐÔ
	{
	{"skill_effect_persist_time",{{1,12},{1,12}}},
	{"skill_display_persist_time",{{1,12},{1,12}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹ØÏûºÄÊôÐÔ
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×Óµ¯ÊôÐÔ
	{
	},

	--Ä§·¨ÊôÐÔ

	--ÊôÐÔÖµ:	ÆÕÍ¨¹¥»÷Á¦ * X + (1 + ¼¼ÄÜµÈ¼¶ * Y) * (Á¦Á¿ * A + ¸ù¹Ç * B + Éí·¨ * C + ÄÚ¹¦ * D + ¶´²ì * E)
	--			+ ÎäÆ÷Íâ¹¦¹¥»÷µã * F + Z
	--			(ÆäÖÐ,A,B,C,D,E,F,X,Y,ZÎªÉËº¦ÒòËØ.³ýZÍâ,ÆäÓà¸÷ÉËº¦ÒòËØÎª°Ù·Ö±ÈÊý.)

	--³É¹¦¼¸ÂÊ:	(ÊôÐÔÖµ * A + (×ÔÉíµÈ¼¶ - ¶Ô·½µÈ¼¶) * B + ¼¼ÄÜµÈ¼¶ * C) * D + X
	--			(ÆäÖÐ,A,B,C,D,XÎª¼¸ÂÊÒòËØ.³ýXÍâ,ÆäÓà¸÷¼¸ÂÊÒòËØÎª°Ù·Ö±ÈÊý.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹ØÉËº¦Ä§·¨ÊôÐÔ
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×´Ì¬Ä§·¨ÊôÐÔ
	{
	{magic="state_attack_add_spec",
	damage_factor_z={{1,152240178},{1,152240178}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--¼¼ÄÜµÈ¼¶Ïà¹ØÁ¢¼´Ä§·¨ÊôÐÔ
	{
	},
}
