--bossÀäÏãÁâ

Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nMapId, nX, nY = GetNpcWorldPos(npcIndex);
	SetNpcLifeTime(npcIndex,0);
	SetMissionV(MV_LENGXL_BOSS_NPXIDX, 0);
	
	-- BT_AddBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	local nPoint = BT_GetBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	BT_AddMissionPoint(BT_GetCamp(),nPoint);     -- ¹«¹²»ý·Ö

	CastState("state_destiny_attack_point_add", 200, 180*18, 1, 10001, 1);
	CastState("state_destiny_armor_point_add", 200, 180*18, 1, 10002, 1);
	SyncCustomState(1, 10001, 4, "L­u Ly-V« Cô");
	SyncCustomState(1, 10002, 7, "§é ¸ch-Ph¸ §Þch");
	Msg2Player(format("§· ®é hãa oan hån chiÕn tr­êng L·nh H­¬ng L¨ng, nhËn ®­îc %d ®iÓm V« Cô vµ %d ®iÓm Ph¸ §Þch", 200, 200));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),901,0,0)
	
	-- ÒÆ³ýÉ±Æø±¦Ïä
	-- for i=1, 4 do
	-- 	local nNpcIndex = CreateNpc("É³Ä®±¦Ïä","É±Æø±¦Ïä", nMapId, nX, nY, 6, 1, 1, 100);
	-- 	SetNpcScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\shaqi_box.lua");
	-- 	SetNpcLifeTime(nNpcIndex, 3 * 60);
	-- end;
end