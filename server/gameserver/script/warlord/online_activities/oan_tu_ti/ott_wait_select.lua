----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: ��y l� n�i dung ch�a h�p tho�i ��i ng��i ch�i ch�n
----------------------------------------------------------------------------------------------------
Include('\\script\\warlord\\online_activities\\oan_tu_ti\\main.lua');
----------------------------------------------------------------------------------------------------

function OnAccept(nOtherPlayerIdx, nType)
	-- So s�nh token
	nOtherPlayerIdx = tonumber(nOtherPlayerIdx) or 0;
	local nCurrentPlayerIdx = PlayerIndex;
	local bIsSameToken = OTT_CheckMatchToken(nCurrentPlayerIdx, nOtherPlayerIdx);
	if bIsSameToken == 0 then
		-- OTT_QuitGame('��i ph��ng �� r�i kh�i!',
								-- '��i ph��ng �� r�i kh�i!',
								-- 0);
		return 0;
	end
	
	local sCurrentPlayerName = GetName();	
	local nPayType = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE);
	local nPayValue = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE);
	local nWaitSelectTimeLeft = abs(GetTime() - (GetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME) + OTT.nWaitSelectTime));
	
	if nType ~= 1 then
		if nWaitSelectTimeLeft > 1 then
			OTT_QuitGame('B�n �� r�t lui!',
									'B�n �� r�t lui!',
									0);
									
			PlayerIndex = nOtherPlayerIdx;
			OTT_QuitGame(sCurrentPlayerName..' �� r�t lui!',
									sCurrentPlayerName..' �� r�t lui!',
									1);
			PlayerIndex = nCurrentPlayerIdx;
		else
			OTT_QuitGame('H�t th�i gian ch�!',
									'H�t th�i gian ch�!',
									0);
									
			PlayerIndex = nOtherPlayerIdx;
			OTT_QuitGame('H�t th�i gian ch�!',
									'H�t th�i gian ch�!',
									0);
			PlayerIndex = nCurrentPlayerIdx;
		end
	else
		local sOtherPlayerName = GetName(nOtherPlayerIdx);
		if nWaitSelectTimeLeft > 1 then
			if OTT_CheckMap() == 1 then
				OTT_OpenTurnMenu(nOtherPlayerIdx);
				Accept1v1(nOtherPlayerIdx, 'C�ng '..sOtherPlayerName..' OTT '..nPayValue..' '..OTT.tPayType[nPayType]..' trong %ds, [��ng �] ch�n l��t, [H�y b�] ngh� ch�i!', nWaitSelectTimeLeft, OTT_WAIT_SELECT_FILE);
			else
				OTT_QuitGame('B�n �� r�i kh�i khu v�c ch�i!',
										'B�n �� r�i kh�i khu v�c ch�i!',
										0);
										
				PlayerIndex = nOtherPlayerIdx;
				OTT_QuitGame(sCurrentPlayerName..' �� r�i kh�i khu v�c ch�i!',
										sCurrentPlayerName..' �� r�i kh�i khu v�c ch�i!',
										1);
				PlayerIndex = nCurrentPlayerIdx;
			end
		else
			OTT_QuitGame('H�t th�i gian ch�!',
									'H�t th�i gian ch�!',
									0);
		end
	end
end
