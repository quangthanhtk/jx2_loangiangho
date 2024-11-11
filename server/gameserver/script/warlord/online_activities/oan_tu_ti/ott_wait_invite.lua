----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: §©y lµ néi dung chøa hép tho¹i mêi ch¬i
----------------------------------------------------------------------------------------------------
Include('\\script\\warlord\\online_activities\\oan_tu_ti\\main.lua');
----------------------------------------------------------------------------------------------------

-- Hµm nµy ch¹y trªn ng­êi ®­îc mêi, chøc n¨ng ®Ó hñy l­ît ch¬i
function OnWant(nSourcePlayerIdx, nType)
	local nTargetPlayerIdx = PlayerIndex;
	local sSourcePlayerName = GetName(nSourcePlayerIdx);
	local sTargetPlayerName = GetName();
	local nMatchTokenPart1, nMatchTokenPart2 = OTT_CreateMatchToken(sSourcePlayerName..'_'..sTargetPlayerName..'_'..GetTime());
	if nType == 1 then
		local nPayType = 0;
		local nPayValue = 0;
		local nRetSourceState, sRetSourceStateStr = 0, '';
		
		-- Ch¹y trªn ng­êi mêi
		PlayerIndex = nSourcePlayerIdx;
		nRetSourceState, sRetSourceStateStr = OTT_GetPlayerState();
		if nRetSourceState > 0 then
			if nRetSourceState ~= 3 then
				gf_Msg2Player('B¹n ®ang '..sRetSourceStateStr..' kh«ng thÓ ch¬i!', 1);
			end
		else
			nPayType = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE);
			nPayValue = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE);
			SetTaskTemp(WARLORD_TMPTASK_OTT_ON_GAME, 1);
			SetTaskTemp(WARLORD_TMPTASK_OTT_STATUS, 0);
			SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT, 0);
			SetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1, nSourcePlayerIdx);
			SetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID2, nTargetPlayerIdx);
			SetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART1, nMatchTokenPart1);
			SetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART2, nMatchTokenPart2);
			nMatchToken = OTT_GetMatchToken(); -- update
		end
		-- Tr¶ vÒ ng­êi ®­îc mêi
		PlayerIndex = nTargetPlayerIdx;
		
		-- ChÆn state ng­êi mêi
		if nRetSourceState > 0 then
			OTT_QuitGame(sSourcePlayerName..' ®ang '..sRetSourceStateStr..' kh«ng thÓ tham gia!',
									sSourcePlayerName..' ®ang '..sRetSourceStateStr..' kh«ng thÓ tham gia!',
									0);
			return 0;
		end
		
		-- Yªu cÇu më khãa r­¬ng
		if IsBoxLocking() == 1 then
			OTT_QuitGame('B¹n cÇn t¹o & më khãa r­¬ng thñ khè tr­íc khi ch¬i!',
									'B¹n cÇn t¹o & më khãa r­¬ng thñ khè tr­íc khi ch¬i!',
									1);
			
			-- Ch¹y trªn ng­êi mêi, th«ng b¸o ch­a më pass r­¬ng
			PlayerIndex = nSourcePlayerIdx;
			if nMatchToken ~= 0 and OTT_GetMatchToken() == nMatchToken then
				OTT_QuitGame(sTargetPlayerName..' ch­a më khãa r­¬ng, kh«ng thÓ ch¬i ®­îc!',
										sTargetPlayerName..' ch­a më khãa r­¬ng, kh«ng thÓ ch¬i ®­îc!',
										0);
			end
			-- Tr¶ vÒ ng­êi ®­îc mêi
			PlayerIndex = nTargetPlayerIdx;
			return 0;
		end
		
		-- KiÓm tra vµng, kim phiÕu trªn ng­êi ®­îc mêi
		if OTT_CheckPay(nPayType, nPayValue) == 0 then
			OTT_QuitGame('B¹n kh«ng cã ®ñ <color=red>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong hµnh trang, kh«ng thÓ ch¬i ®­îc!',
									'B¹n kh«ng cã ®ñ <color=red>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong hµnh trang, kh«ng thÓ ch¬i ®­îc!',
									1);
			
			-- Ch¹y trªn ng­êi mêi, th«ng b¸o k ®ñ tiÒn, ®óng token míi reset, tr¸nh lçi ®ang ch¬i víi ng­êi kh¸c bÞ reset
			PlayerIndex = nSourcePlayerIdx;
			if nMatchToken ~= 0 and OTT_GetMatchToken() == nMatchToken then
				OTT_QuitGame(sTargetPlayerName..' kh«ng cã ®ñ <color=green>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong hµnh trang, kh«ng thÓ ch¬i ®­îc!',
										sTargetPlayerName..' kh«ng cã ®ñ <color=green>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong hµnh trang, kh«ng thÓ ch¬i ®­îc!',
										0);
			end
			-- Tr¶ vÒ ng­êi ®­îc mêi
			PlayerIndex = nTargetPlayerIdx;
			return 0;
		end
		
		-- OK
		SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE, nPayType);
		SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE, nPayValue);
		SetTaskTemp(WARLORD_TMPTASK_OTT_ON_GAME, 1);
		SetTaskTemp(WARLORD_TMPTASK_OTT_STATUS, 0);
		SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT, 0);
		SetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1, nSourcePlayerIdx);
		SetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID2, nTargetPlayerIdx);
		SetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART1, nMatchTokenPart1);
		SetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART2, nMatchTokenPart2);
		
		-- §ång bé time ch¬i
		local nCheckTime = GetTime();
		local bIsSameToken = 0;
		
		-- Ch¹y trªn ng­êi mêi, th«ng b¸o l­ît ch¬i b¾t ®Çu
		PlayerIndex = nSourcePlayerIdx;
		if nMatchToken ~= 0 and OTT_GetMatchToken() == nMatchToken then
			OTT_ShowTitle(0);
			bIsSameToken = 1;
			Msg2Player(sTargetPlayerName..' ®· tham gia!');
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			OTT_OpenTurnMenu(nTargetPlayerIdx);
			Accept1v1(nTargetPlayerIdx, 'Cïng '..sTargetPlayerName..' OTT '..nPayValue..' '..OTT.tPayType[nPayType]..' trong %ds, [§ång ý] chän l­ît, [Hñy bá] nghØ ch¬i!', OTT.nWaitSelectTime, OTT_WAIT_SELECT_FILE);
		end
		-- Tr¶ vÒ ng­êi ®­îc mêi
		PlayerIndex = nTargetPlayerIdx;
		
		if bIsSameToken == 0 then
			OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
									'§èi ph­¬ng ®· rêi khái!',
									0);
		else
			OTT_ShowTitle(0);
			Msg2Player('§· chÊp nhËn lêi mêi cña '..sSourcePlayerName..'!');
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			OTT_OpenTurnMenu(nSourcePlayerIdx);
			Accept1v1(nSourcePlayerIdx, 'Cïng '..sSourcePlayerName..' OTT '..nPayValue..' '..OTT.tPayType[nPayType]..' trong %ds, [§ång ý] chän l­ît, [Hñy bá] nghØ ch¬i!', OTT.nWaitSelectTime, OTT_WAIT_SELECT_FILE);		
		end
	else
		if OTT_GetPlayerState() ~= 3 then
			Msg2Player('B¹n ®· bá qua lêi mêi o¼n tï t× cña '..sSourcePlayerName..'!');
		end
		
		-- Ch¹y trªn ng­êi mêi
		PlayerIndex = nSourcePlayerIdx;
		if OTT_GetPlayerState() ~= 3 then
			Msg2Player(sTargetPlayerName..' tõ chèi lêi mêi o¼n tï t× cña b¹n!');
		end
		-- Tr¶ vÒ ng­êi ®­îc mêi
		PlayerIndex = nTargetPlayerIdx;
	end
end
