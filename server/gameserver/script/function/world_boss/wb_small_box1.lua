--��ս����
Include("\\script\\function\\world_boss\\wb_head.lua")

function main()
	if gf_CheckBaseCondition(g_WCFG_WORLDBOSS.nBigLevelReq) ~= 1 then --LongDaiKa: mod l�i y�u c�u c�p ��, m�c ��nh 79
		return 0;
	end

	--LongDaiKa: mod th�m �i�u ki�n y�u c�u b�t PK
	if g_WCFG_WORLDBOSS.bPkReq == WEnv.TRUE and WPlayer:IsPKState() ~= WEnv.TRUE then
		WNpc:Talk("B�o r��ng c�n th�m s�t kh�, b�t chi�n ��u m�i c� th� m� r��ng!", 1);
		return WEnv.RETCODE_ERROR;
	end

	local npcIndex = GetTargetNpc()
	if wb_GetSmallBoxFlag1() > 0 then
		Talk(1,"",format("�� nh�n ph�n th��ng %s r�i, kh�ng th� nh�n l�i", GetNpcName(npcIndex)));
		return
	end
	local boss = wb_GetBossName()
	if not boss then
		Talk(1,"","Ch� c� ng��i ch�i tham gia ti�u di�t BOSS m�i c� th� m� b�o r��ng");
		return
	end
	if wb_SmallBoxAward() == 1 then
		wb_SetSmallBoxFlag1()
		SetNpcLifeTime(npcIndex, 0);
	end
end