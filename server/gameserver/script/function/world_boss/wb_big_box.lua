--¥Û’ΩΩ±¶œ‰
Include("\\script\\function\\world_boss\\wb_head.lua")

function main()
	if gf_CheckBaseCondition(g_WCFG_WORLDBOSS.nBigLevelReq) ~= 1 then --LongDaiKa: mod lπi y™u c«u c p ÆÈ, m∆c Æﬁnh 79
		return 0;
	end

	--LongDaiKa: mod th™m Æi“u ki÷n y™u c«u bÀt PK
	if g_WCFG_WORLDBOSS.bPkReq == WEnv.TRUE and WPlayer:IsPKState() ~= WEnv.TRUE then
		WNpc:Talk("B∂o r≠¨ng c«n th™m s∏t kh›, bÀt chi’n Æ u mÌi c„ th” mÎ r≠¨ng!", 1);
		return WEnv.RETCODE_ERROR;
	end

	if wb_GetBigBoxFlag() > 0 then
		Talk(1,"",format("MÁi ngµy chÿ Æ≠Óc nhÀn 1 l«n ph«n th≠Îng %s", GetNpcName(GetTargetNpc())));
		return
	end
	local boss = wb_GetBossName()
	if not boss then
		Talk(1,"","Chÿ c„ ng≠Íi ch¨i tham gia ti™u di÷t BOSS mÌi c„ th” mÎ b∂o r≠¨ng");
		return
	end
	wb_SetBigBoxIndex(GetTargetNpc())
	UseScrollEnable(0);
	SetDeathScript("\\script\\function\\world_boss\\wb_player_death.lua")
	CastState("state_fetter", 100, 18*16, 1, 9999);
	ProgressSlot(15 * 18, "wb_BigBoxAward")
end