----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: §©y lµ néi dung chøa hép tho¹i ®îi ng­êi ch¬i chän
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
	local nWaitSelectTimeLeft = abs(GetTime() - (GetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME) + OTT.nWaitSelectTime));
	
	if nType ~= 1 then
		if nWaitSelectTimeLeft > 1 then
			OTT_QuitGame('B¹n ®· rót lui!',
									'B¹n ®· rót lui!',
									0);
									
			PlayerIndex = nOtherPlayerIdx;
			OTT_QuitGame(sCurrentPlayerName..' ®· rót lui!',
									sCurrentPlayerName..' ®· rót lui!',
									1);
			PlayerIndex = nCurrentPlayerIdx;
		else
			OTT_QuitGame('HÕt thêi gian chê!',
									'HÕt thêi gian chê!',
									0);
									
			PlayerIndex = nOtherPlayerIdx;
			OTT_QuitGame('HÕt thêi gian chê!',
									'HÕt thêi gian chê!',
									0);
			PlayerIndex = nCurrentPlayerIdx;
		end
	else
		local sOtherPlayerName = GetName(nOtherPlayerIdx);
		if nWaitSelectTimeLeft > 1 then
			if OTT_CheckMap() == 1 then
				OTT_OpenTurnMenu(nOtherPlayerIdx);
				Accept1v1(nOtherPlayerIdx, 'Cïng '..sOtherPlayerName..' OTT '..nPayValue..' '..OTT.tPayType[nPayType]..' trong %ds, [§ång ý] chän l­ît, [Hñy bá] nghØ ch¬i!', nWaitSelectTimeLeft, OTT_WAIT_SELECT_FILE);
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
		else
			OTT_QuitGame('HÕt thêi gian chê!',
									'HÕt thêi gian chê!',
									0);
		end
	end
end
