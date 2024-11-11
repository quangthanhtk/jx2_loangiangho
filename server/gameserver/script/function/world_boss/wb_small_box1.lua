--´óÕ½±¦ºÐ
Include("\\script\\function\\world_boss\\wb_head.lua")

function main()
	if gf_CheckBaseCondition(g_WCFG_WORLDBOSS.nBigLevelReq) ~= 1 then --LongDaiKa: mod l¹i yªu cÇu cÊp ®é, mÆc ®Þnh 79
		return 0;
	end

	--LongDaiKa: mod thªm ®iÒu kiÖn yªu cÇu bËt PK
	if g_WCFG_WORLDBOSS.bPkReq == WEnv.TRUE and WPlayer:IsPKState() ~= WEnv.TRUE then
		WNpc:Talk("B¶o r­¬ng cÇn thªm s¸t khÝ, bËt chiÕn ®Êu míi cã thÓ më r­¬ng!", 1);
		return WEnv.RETCODE_ERROR;
	end

	local npcIndex = GetTargetNpc()
	if wb_GetSmallBoxFlag1() > 0 then
		Talk(1,"",format("§· nhËn phÇn th­ëng %s råi, kh«ng thÓ nhËn l¹i", GetNpcName(npcIndex)));
		return
	end
	local boss = wb_GetBossName()
	if not boss then
		Talk(1,"","ChØ cã ng­êi ch¬i tham gia tiªu diÖt BOSS míi cã thÓ më b¶o r­¬ng");
		return
	end
	if wb_SmallBoxAward() == 1 then
		wb_SetSmallBoxFlag1()
		SetNpcLifeTime(npcIndex, 0);
	end
end