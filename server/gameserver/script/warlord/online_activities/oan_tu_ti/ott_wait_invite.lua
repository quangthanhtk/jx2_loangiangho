----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: ��y l� n�i dung ch�a h�p tho�i m�i ch�i
----------------------------------------------------------------------------------------------------
Include('\\script\\warlord\\online_activities\\oan_tu_ti\\main.lua');
----------------------------------------------------------------------------------------------------

-- H�m n�y ch�y tr�n ng��i ���c m�i, ch�c n�ng �� h�y l��t ch�i
function OnWant(nSourcePlayerIdx, nType)
	local nTargetPlayerIdx = PlayerIndex;
	local sSourcePlayerName = GetName(nSourcePlayerIdx);
	local sTargetPlayerName = GetName();
	local nMatchTokenPart1, nMatchTokenPart2 = OTT_CreateMatchToken(sSourcePlayerName..'_'..sTargetPlayerName..'_'..GetTime());
	if nType == 1 then
		local nPayType = 0;
		local nPayValue = 0;
		local nRetSourceState, sRetSourceStateStr = 0, '';
		
		-- Ch�y tr�n ng��i m�i
		PlayerIndex = nSourcePlayerIdx;
		nRetSourceState, sRetSourceStateStr = OTT_GetPlayerState();
		if nRetSourceState > 0 then
			if nRetSourceState ~= 3 then
				gf_Msg2Player('B�n �ang '..sRetSourceStateStr..' kh�ng th� ch�i!', 1);
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
		-- Tr� v� ng��i ���c m�i
		PlayerIndex = nTargetPlayerIdx;
		
		-- Ch�n state ng��i m�i
		if nRetSourceState > 0 then
			OTT_QuitGame(sSourcePlayerName..' �ang '..sRetSourceStateStr..' kh�ng th� tham gia!',
									sSourcePlayerName..' �ang '..sRetSourceStateStr..' kh�ng th� tham gia!',
									0);
			return 0;
		end
		
		-- Y�u c�u m� kh�a r��ng
		if IsBoxLocking() == 1 then
			OTT_QuitGame('B�n c�n t�o & m� kh�a r��ng th� kh� tr��c khi ch�i!',
									'B�n c�n t�o & m� kh�a r��ng th� kh� tr��c khi ch�i!',
									1);
			
			-- Ch�y tr�n ng��i m�i, th�ng b�o ch�a m� pass r��ng
			PlayerIndex = nSourcePlayerIdx;
			if nMatchToken ~= 0 and OTT_GetMatchToken() == nMatchToken then
				OTT_QuitGame(sTargetPlayerName..' ch�a m� kh�a r��ng, kh�ng th� ch�i ���c!',
										sTargetPlayerName..' ch�a m� kh�a r��ng, kh�ng th� ch�i ���c!',
										0);
			end
			-- Tr� v� ng��i ���c m�i
			PlayerIndex = nTargetPlayerIdx;
			return 0;
		end
		
		-- Ki�m tra v�ng, kim phi�u tr�n ng��i ���c m�i
		if OTT_CheckPay(nPayType, nPayValue) == 0 then
			OTT_QuitGame('B�n kh�ng c� �� <color=red>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong h�nh trang, kh�ng th� ch�i ���c!',
									'B�n kh�ng c� �� <color=red>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong h�nh trang, kh�ng th� ch�i ���c!',
									1);
			
			-- Ch�y tr�n ng��i m�i, th�ng b�o k �� ti�n, ��ng token m�i reset, tr�nh l�i �ang ch�i v�i ng��i kh�c b� reset
			PlayerIndex = nSourcePlayerIdx;
			if nMatchToken ~= 0 and OTT_GetMatchToken() == nMatchToken then
				OTT_QuitGame(sTargetPlayerName..' kh�ng c� �� <color=green>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong h�nh trang, kh�ng th� ch�i ���c!',
										sTargetPlayerName..' kh�ng c� �� <color=green>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong h�nh trang, kh�ng th� ch�i ���c!',
										0);
			end
			-- Tr� v� ng��i ���c m�i
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
		
		-- ��ng b� time ch�i
		local nCheckTime = GetTime();
		local bIsSameToken = 0;
		
		-- Ch�y tr�n ng��i m�i, th�ng b�o l��t ch�i b�t ��u
		PlayerIndex = nSourcePlayerIdx;
		if nMatchToken ~= 0 and OTT_GetMatchToken() == nMatchToken then
			OTT_ShowTitle(0);
			bIsSameToken = 1;
			Msg2Player(sTargetPlayerName..' �� tham gia!');
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			OTT_OpenTurnMenu(nTargetPlayerIdx);
			Accept1v1(nTargetPlayerIdx, 'C�ng '..sTargetPlayerName..' OTT '..nPayValue..' '..OTT.tPayType[nPayType]..' trong %ds, [��ng �] ch�n l��t, [H�y b�] ngh� ch�i!', OTT.nWaitSelectTime, OTT_WAIT_SELECT_FILE);
		end
		-- Tr� v� ng��i ���c m�i
		PlayerIndex = nTargetPlayerIdx;
		
		if bIsSameToken == 0 then
			OTT_QuitGame('��i ph��ng �� r�i kh�i!',
									'��i ph��ng �� r�i kh�i!',
									0);
		else
			OTT_ShowTitle(0);
			Msg2Player('�� ch�p nh�n l�i m�i c�a '..sSourcePlayerName..'!');
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			OTT_OpenTurnMenu(nSourcePlayerIdx);
			Accept1v1(nSourcePlayerIdx, 'C�ng '..sSourcePlayerName..' OTT '..nPayValue..' '..OTT.tPayType[nPayType]..' trong %ds, [��ng �] ch�n l��t, [H�y b�] ngh� ch�i!', OTT.nWaitSelectTime, OTT_WAIT_SELECT_FILE);		
		end
	else
		if OTT_GetPlayerState() ~= 3 then
			Msg2Player('B�n �� b� qua l�i m�i o�n t� t� c�a '..sSourcePlayerName..'!');
		end
		
		-- Ch�y tr�n ng��i m�i
		PlayerIndex = nSourcePlayerIdx;
		if OTT_GetPlayerState() ~= 3 then
			Msg2Player(sTargetPlayerName..' t� ch�i l�i m�i o�n t� t� c�a b�n!');
		end
		-- Tr� v� ng��i ���c m�i
		PlayerIndex = nTargetPlayerIdx;
	end
end
