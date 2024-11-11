----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: §©y lµ néi dung chøa hép tho¹i tr¶ kÕt qu¶
----------------------------------------------------------------------------------------------------
Include('\\script\\warlord\\online_activities\\oan_tu_ti\\main.lua');
----------------------------------------------------------------------------------------------------

function OnAccept(nOtherPlayerIdx, nType)
	-- So s¸nh token
	nOtherPlayerIdx = tonumber(nOtherPlayerIdx) or 0;
	local nCurrentPlayerIdx = PlayerIndex;
	local bIsSameToken = OTT_CheckMatchToken(nCurrentPlayerIdx, nOtherPlayerIdx);
	if bIsSameToken == 0 then
		-- OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
								-- '§èi ph­¬ng ®· rêi khái!',
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
		gf_Msg2Player('B¹n ra {g'..OTT.tTurnType[nCurrentTurn]..'}, {r'..sOtherPlayerName..' ra ???}. KÕt qu¶ sÏ cã sau {y'..nWaitResultTimeLeft..' gi©y} n÷a.\n{rChó ý: Cã thÓ {g[KÕt thóc ®èi tho¹i]} ®Ó t¹m Èn lùa chän vµ bËt l¹i b»ng nót {g[§ång ý]} ë hép tho¹i d­íi. NÕu kh«ng muèn ch¬i n÷a, nhanh tay Ên {g[Hñy bá]} tr­íc khi hÕt thêi gian ®îi kÕt qu¶!}', 3);
		Accept1v1(nOtherPlayerIdx, 'B¹n ra '..OTT.tTurnType[nCurrentTurn]..', '..sOtherPlayerName..' ra ???. KÕt qu¶ sau %ds n÷a. [§ång ý] xem l¹i, [Hñy bá] nghØ ch¬i!', nWaitResultTimeLeft, OTT_WAIT_RESULT_FILE);
		return 0;
	end
	
	if OTT_CheckMap() == 1 then
		if nWaitResultTimeLeft > 1 then -- ®Ó lín h¬n 1 trõ tr­êng hîp bÞ svr bÞ delay dÉn tíi bÞ hñy ch¬i
			OTT_QuitGame('B¹n ®· rót lui!',
									'B¹n ®· rót lui!',
									0);
									
			-- Hñy lu«n, tr¸nh bÞ loop khi gäi tiÕp Accept1v1
			PlayerIndex = nOtherPlayerIdx;
			OTT_QuitGame(sCurrentPlayerName..' ®· rót lui!',
									sCurrentPlayerName..' ®· rót lui!',
									1);
			PlayerIndex = nCurrentPlayerIdx;
		else
			if nCurrentPlayerIdx == GetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1) then
				OTT_ShowResult(nCurrentPlayerIdx, nOtherPlayerIdx);
			end
		end
	else
		OTT_QuitGame('B¹n ®· rêi khái khu vùc ch¬i!',
								'B¹n ®· rêi khái khu vùc ch¬i!',
								0);
								
		PlayerIndex = nOtherPlayerIdx;
		OTT_QuitGame(sCurrentPlayerName..' ®· rêi khái khu vùc ch¬i!',
								sCurrentPlayerName..' ®· rêi khái khu vùc ch¬i!',
								1);
		PlayerIndex = nCurrentPlayerIdx;
	end
end
