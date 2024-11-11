----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: ��y l� n�i dung ch�a h�p tho�i tr� k�t qu�
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
	local nWaitResultTimeLeft = abs(GetTime() - (GetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME) + OTT.nWaitResultTime));
	local sOtherPlayerName = GetName(nOtherPlayerIdx);
	
	if nType == 1 and nWaitResultTimeLeft > 1 then
		local nCurrentTurn = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT);
		gf_Msg2Player('B�n ra {g'..OTT.tTurnType[nCurrentTurn]..'}, {r'..sOtherPlayerName..' ra ???}. K�t qu� s� c� sau {y'..nWaitResultTimeLeft..' gi�y} n�a.\n{rCh� �: C� th� {g[K�t th�c ��i tho�i]} �� t�m �n l�a ch�n v� b�t l�i b�ng n�t {g[��ng �]} � h�p tho�i d��i. N�u kh�ng mu�n ch�i n�a, nhanh tay �n {g[H�y b�]} tr��c khi h�t th�i gian ��i k�t qu�!}', 3);
		Accept1v1(nOtherPlayerIdx, 'B�n ra '..OTT.tTurnType[nCurrentTurn]..', '..sOtherPlayerName..' ra ???. K�t qu� sau %ds n�a. [��ng �] xem l�i, [H�y b�] ngh� ch�i!', nWaitResultTimeLeft, OTT_WAIT_RESULT_FILE);
		return 0;
	end
	
	if OTT_CheckMap() == 1 then
		if nWaitResultTimeLeft > 1 then -- �� l�n h�n 1 tr� tr��ng h�p b� svr b� delay d�n t�i b� h�y ch�i
			OTT_QuitGame('B�n �� r�t lui!',
									'B�n �� r�t lui!',
									0);
									
			-- H�y lu�n, tr�nh b� loop khi g�i ti�p Accept1v1
			PlayerIndex = nOtherPlayerIdx;
			OTT_QuitGame(sCurrentPlayerName..' �� r�t lui!',
									sCurrentPlayerName..' �� r�t lui!',
									1);
			PlayerIndex = nCurrentPlayerIdx;
		else
			if nCurrentPlayerIdx == GetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1) then
				OTT_ShowResult(nCurrentPlayerIdx, nOtherPlayerIdx);
			end
		end
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
end
