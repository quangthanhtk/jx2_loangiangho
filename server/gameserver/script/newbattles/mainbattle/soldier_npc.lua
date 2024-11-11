Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

SZ_BF_CHEAT_OP_SCRIPT = "\\script\\newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Mäi ng­êi cÇn ra søc b¶o vÖ tæ quèc!");
	end;
	local selTab = {
				" Vµo hËu doanh/enter_back_camp",
				"Rêi khái chiÕn tr­êng/ask_reason",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	local nCamp = BT_GetCamp()
	if nCamp == SONG_ID and GetMissionV(MV_MID_TRAP_SONG) == 1 then
		tinsert(selTab,2," H·y ®­a ta ra chiÕn tr­êng/enter_mid_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_MID_TRAP_LIAO) == 1 then
		tinsert(selTab,2," H·y ®­a ta ra chiÕn tr­êng/enter_mid_camp");
	end;
	local nCamp = BT_GetCamp()
	local nRandPos = 0;
	if nCamp == SONG_ID and GetMissionV(MV_FRONT_TRAP_SONG) == 1 then
		tinsert(selTab,3," Vµo tiÒn doanh/enter_front_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_FRONT_TRAP_LIAO) == 1 then
		tinsert(selTab,3," Vµo tiÒn doanh/enter_front_camp");
	end;
	Say("T­íng sÜ phe ta kh«ng ph©n biÖt tuæi t¸c, chØ cÇn ®oµn kÕt ®¸nh ®uæi ngo¹i x©m lµ ®­îc!",getn(selTab),selTab);
end;

function ask_reason()
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;

function leave(sLeaveMsg)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nMissionID = 0;
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(tBTMSInfo[nBattleType][2]);
	nMissionID = tBTMSInfo[nBattleType][1];
	DelMSPlayer(nMissionID,0);
	Msg2MSAll(nMissionID,"Rêi khái ®Ó l¹i tin nh¾n:"..sLeaveMsg);
	SubWorld = OldSubWorld;
end;

function enter_back_camp()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nCurrentTimeRemain = (FIGHT_TIMER_LOOP+1) - (FIGHT_TIMER_LOOP-nLoop+1);
	local nTimeNotCaptcha = ((10*FRAME_PER_MIN/FIGHT_TIME)-1); -- 10 phót cuèi kh«ng cã captcha
	if nCurrentTimeRemain >= nTimeNotCaptcha
		and WPlayer:GetHonor() < g_WCFG_NEWBATTLES_MAIN.nHonorSkipCaptcha
		and g_WCFG_NEWBATTLES_MAIN.bEnableCaptchaEntry == WEnv.TRUE
	then
		WLib:OpenCaptcha({1, 3}, enter_back_camp_captcha_ok, {});
	else
		enter_back_camp_captcha_ok();
	end
end

function enter_back_camp_captcha_ok()
	local nCampPlace = BT_GetCamp()
	local nRandPos = 0;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = {tBackBornPlaceSong,tBackBornPlaceLiao};
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		nRandPos = random(1,getn(tPos[nCampPlace]));

		local szScript = format("pco_on_enter_battle_field(%d,%d)",tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
		SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
		SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	else
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!.");
	end;
end;

function enter_mid_camp()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nCurrentTimeRemain = (FIGHT_TIMER_LOOP+1) - (FIGHT_TIMER_LOOP-nLoop+1);
	local nTimeNotCaptcha = ((10*FRAME_PER_MIN/FIGHT_TIME)-1); -- 10 phót cuèi kh«ng cã captcha
	if nCurrentTimeRemain >= nTimeNotCaptcha 
		and WPlayer:GetHonor() < g_WCFG_NEWBATTLES_MAIN.nHonorSkipCaptcha 
		and g_WCFG_NEWBATTLES_MAIN.bEnableCaptchaEntry == WEnv.TRUE 
	then
		WLib:OpenCaptcha({1, 3}, enter_mid_camp_captcha_ok, {});
	else
		enter_mid_camp_captcha_ok();
	end
end

function enter_mid_camp_captcha_ok()
	local nCamp = BT_GetCamp()
	local nCampPlace = nCamp;
	local nRandPos = 0;
	local tPos = {tMidBornPlaceSong,tMidBornPlaceLiao};
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_MID_TRAP_SONG+nCamp-1) == 1 then
			nRandPos = random(1,getn(tPos[nCampPlace]));

			local szScript = format("pco_on_enter_battle_field(%d,%d)",tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
			SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
			SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		else
			Talk(1,"","TiÒn ph­¬ng ®ang giao tranh ¸c liÖt, chóng ta kh«ng thÓ tiÕn vµo qu©n doanh");
		end;
	else
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!.");
	end;
end;

function enter_front_camp()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nCurrentTimeRemain = (FIGHT_TIMER_LOOP+1) - (FIGHT_TIMER_LOOP-nLoop+1);
	local nTimeNotCaptcha = ((10*FRAME_PER_MIN/FIGHT_TIME)-1); -- 10 phót cuèi kh«ng cã captcha
	if nCurrentTimeRemain >= nTimeNotCaptcha
		and WPlayer:GetHonor() < g_WCFG_NEWBATTLES_MAIN.nHonorSkipCaptcha
		and g_WCFG_NEWBATTLES_MAIN.bEnableCaptchaEntry == WEnv.TRUE
	then
		WLib:OpenCaptcha({1, 3}, enter_front_camp_captcha_ok, {});
	else
		enter_front_camp_captcha_ok();
	end
end

function enter_front_camp_captcha_ok()
	local nCamp = BT_GetCamp()
	local nRandPos = random(1,getn(tFrontBornPlace));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_FRONT_TRAP_SONG+nCamp-1) == 1 then
			local szScript = format("pco_on_enter_battle_field(%d,%d)",tFrontBornPlace[nRandPos][1],tFrontBornPlace[nRandPos][2])
			SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
			SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		else
			Talk(1,"","TiÒn ph­¬ng ®ang giao tranh ¸c liÖt, chóng ta kh«ng thÓ tiÕn vµo qu©n doanh");
		end;
	else
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!.");
	end;
end;

function nothing()

end;
