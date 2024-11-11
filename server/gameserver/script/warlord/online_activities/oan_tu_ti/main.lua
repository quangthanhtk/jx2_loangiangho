----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-27
-- Description: ��y l� n�i dung ch�a nh�ng h�m static
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\oan_tu_ti\\head.lua");
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
--Include("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\warlord\\tmp_task_id_def.lua");
----------------------------------------------------------------------------------------------------

function OTT_InviteGame(nTargetPlayerIdx, sTargetPlayerName, bNewGame)
	-- Ch�n kh�ng cho ch�i
	Msg2Player('T�nh n�ng �ang t�m ��ng, th�i gian m� l�i s� ���c c�ng b� sau!');
	do return 0; end
	
	if PlayerIndex <= 0 then return 0; end
	
	-- Ch�n c�c gi� �i chi�n tr��ng
	local nH = tonumber(date("%H"));
	if (nH >= 14 and nH < 16) or (nH >= 19 and nH < 21) then
		Say('Trong gi� chi�n tr��ng kh�ng th� ch�i o�n t� t�!', 0);
		return 0;
	end
	
	-- Ki�m tra map h�p l�
	if OTT_CheckMap() ~= 1 then
		gf_Msg2Player('H�y ��n '..gf_Join(OTT.tAllowMap, ', ')..' c�ng ch�i v�i ng��i ch�i kh�c nh�!', 13);
		return 0;
	end
	
	-- Ki�m tra kh�a r��ng tr��c khi ch�i
	if IsBoxLocking() == 1 then
		gf_Msg2Player('B�n c�n t�o & m� kh�a r��ng th� kh� tr��c khi ch�i!', 13);
		return 0;
	end
	
	-- ��nh ngh�a ng��i ch�i
	-- Source = ng��i m�i
	-- Target = ng��i ���c m�i
	local nSourcePlayerIdx = PlayerIndex;
	local sSourcePlayerName = GetName();

	-- Ki�m tra tr�ng th�i ng��i ch�i, n�u �ang ch�i th� hi�n th�ng b�o h�i x�c nh�n v�n m�i
	local nRetSourceState, sRetSourceStateStr = OTT_GetPlayerState();
	if nRetSourceState > 0 then
		if nRetSourceState == 3 then
			local tSay = { 'B�n �ang ch�i c�ng v�i ng��i kh�c, c� mu�n ch�i v�n m�i kh�ng?',
				'C�, ta mu�n ch�i v�n m�i v�i '..sTargetPlayerName..'!/#OTT_InviteGame_NewGame('..nTargetPlayerIdx..', "'..sTargetPlayerName..'")',
			};
			gf_Say(tSay, -1, '*');
			return 0;
		end
		
		Msg2Player('B�n �ang '..sRetSourceStateStr..' kh�ng th� m�i ch�i!');
		return 0;
	end
	
	-- Ki�m tra ng��i ch�i c� trong map kh�ng b�ng nTargetPlayerIdx v� so s�nh b�ng t�n nh�n v�t
	-- N�u ng��i ch�i qua th�nh kh�c, quay v� l�i trong t�ch t�c s� sinh l�i thao t�c v�i nh�n v�t sai
	-- n�n s� t�m l�i ng��i ch�i b�ng t�n nh�n v�t v� c�p nh�p l�i nTargetPlayerIdx
	if GetName(nTargetPlayerIdx) ~= sTargetPlayerName then
		local tPlayerInMap = GetMapPlayer(GetWorldPos());
		local nTotalPlayerInMap = getn(tPlayerInMap);
		if nTotalPlayerInMap <= 1 then
			Msg2Player('Kh�ng t�m th�y ��i th�!');
			return 0;
		end
		for i1 = 1, nTotalPlayerInMap do
			local nOtherPlayerIdx = tPlayerInMap[i1];
			if GetName(nOtherPlayerIdx) == sTargetPlayerName then
				nTargetPlayerIdx = nOtherPlayerIdx;
				break;
			end
		end
	end
	nTargetPlayerIdx = tonumber(nTargetPlayerIdx) or 0;
	if nTargetPlayerIdx <= 0 then
		Msg2Player('Ng��i ch�i �� r�i kh�i!');
		return 0;
	end
	
	-- Ki�m tra v� tr�, � g�n nhau m�i cho ch�i
	if gf_GetPlayerDistance(PlayerIndex, nTargetPlayerIdx) >= OTT.nMaxDistance then
		Msg2Player('Kho�ng c�ch v�i '..sTargetPlayerName..' qu� xa!');
		return 0;
	end
	
	-- Ki�m tra tr�ng th�i c�a ng��i ���c m�i
	local nRetTargetState, sRetTargetStateStr = 0, '';
	
	-- Ch�y tr�n ng��i ���c m�i xem c� �ang ch�i c�ng ng��i kh�c kh�ng
	PlayerIndex = nTargetPlayerIdx;
	nRetTargetState, sRetTargetStateStr = OTT_GetPlayerState();
	-- Tr� v� ng��i m�i
	PlayerIndex = nSourcePlayerIdx;
	
	-- N�u �ang ch�i c�ng ng��i kh�c th� k cho m�i
	if nRetTargetState > 0 then
		Msg2Player(sTargetPlayerName..' �ang '..sRetTargetStateStr..' kh�ng th� tham gia!');
		return 0;
	end
	
	-- C�ch ch�i
	local tSay = { 'H�y ch�n c�ch th�c ch�i o�n t� t� v�i {y'..sTargetPlayerName..'}\nN�u l� c� thua kh�ng qu�o nh� <pic=7><pic=35><pic=25>\n<color=red>Ch� �: <sex> n�n ��c h��ng d�n v� hi�u r� lu�t tr��c khi ch�i!<color>',
		'Ch�i b�ng V�ng/#OTT_InviteGame_1('..nTargetPlayerIdx..')',
		'Ch�i b�ng Kim Phi�u/#OTT_InviteGame_2('..nTargetPlayerIdx..')',
		'Xem h��ng d�n v� lu�t ch�i/OTT_Guide',
	};
	
	-- G�n th�m l�i tho�i b�n test
	if OTT.bTestMode == 1 then
		tSay[1] = tSay[1]..OTT.sTestDescription;
	else
		tSay[1] = tSay[1]..OTT.sOpenDescription;
	end
	
	-- Hi�n l�a ch�n c�ch ch�i
	gf_Say(tSay, -1, 'n');
end

function OTT_Guide()
	Say('<color=green>H��ng d�n ch�i: \n* B�n c�n ph�i c� m� r��ng v� m� kh�a r��ng m�i c� th� tham gia!\n* Ng��i ch�i d�ng c�c l�a ch�n K�o-B�a-Bao �� x�c ��nh th�ng thua. Quy t�c ��n gi�n: K�o thua B�a, B�a thua Bao, Bao thua K�o. N�u 2 ng��i ra gi�ng nhau th� h�a.<color>\n<color=red>Quy t�c ch�i:\n* Tr� ch�i t�o ra nh�m m�c ��ch gi�i tr� v� gi�p t�ng t��ng t�c gi�a ng��i ch�i v�i nhau, ch�ng t�i kh�ng thu ��i v�t ph�m th�ng ���c t� tr� ch�i n�y th�nh ti�n m�t. Ch�ng t�i t� ch�i tr�ch nhi�m ��i v�i h�nh vi l�m d�ng tr� ch�i tr�i ph�p lu�t!\n* C�c t�i kho�n c� h�nh vi l�m d�ng tr�i ph�p lu�t, gian l�n, bug tr�c l�i s� b� kh�a v�nh vi�n!<color>', 0)
end

function OTT_InviteGame_NewGame(nTargetPlayerIdx, sTargetPlayerName)
	local nPlayerIdx1 = GetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1);
	local nPlayerIdx2 = GetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID2);
	local nCurrentPlayerIdx = 0;
	local nOtherPlayerIdx = 0;
	local nOldPlayerIdx = PlayerIndex;
	if PlayerIndex == nPlayerIdx1 then
		nCurrentPlayerIdx = nPlayerIdx1;
		nOtherPlayerIdx = nPlayerIdx2;
	elseif PlayerIndex == nPlayerIdx2 then
		nCurrentPlayerIdx = nPlayerIdx2;
		nOtherPlayerIdx = nPlayerIdx1;
	end
	
	-- G�i th�ng b�o h�y ch�i v�i ng��i ch�i c�
	if OTT_CheckMatchToken(nPlayerIdx1, nPlayerIdx2) == 1 then
		PlayerIndex = nOtherPlayerIdx;
		local sOtherPlayerName = GetName(nCurrentPlayerIdx);
		OTT_QuitGame(sOtherPlayerName..' �� ch�i v�i ng��i kh�c, l��t ch�i n�y b� h�y!',
								sOtherPlayerName..' �� ch�i v�i ng��i kh�c, l��t ch�i n�y b� h�y!',
								1);
		PlayerIndex = nOldPlayerIdx;
	end
	
	-- Nh�c nh� �� h�y ch�i v�i ng��i ch�i c�
	local sOtherPlayerName = GetName(nOtherPlayerIdx);
	OTT_QuitGame('B�n �� h�y ch�i v�i '..sOtherPlayerName..'!',
							'B�n �� h�y ch�i v�i '..sOtherPlayerName..'!',
							0);
							
	-- G�i l�i m�i t�i ng��i ch�i m�i
	OTT_InviteGame(nTargetPlayerIdx, sTargetPlayerName, 1);
end

-- Ch�i game b�ng v�ng
function OTT_InviteGame_1(nTargetPlayerIdx)
	local tSay = {};
	if OTT.bTestMode == 1 then
		tSay = { '{gCh�n m�c V�ng (t�i h�nh trang) mu�n ch�i, ng��i th�ng s� ch�u '..OTT.nWinFee..'% ph�!}'..OTT.sTestDescription,
			'Ch�i 10 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 10)',
			'Ch�i 100 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 100)',
			'Ch�i 500 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 500)',
			'Ch�i 1000 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 1000)',
			'Ch�i 2000 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 2000)',
		};
	else
		tSay = { '{gCh�n m�c V�ng (t�i h�nh trang) mu�n ch�i, ng��i th�ng s� ch�u '..OTT.nWinFee..'% ph�!}'..OTT.sOpenDescription,
			'Ch�i 100 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 100)',
			'Ch�i 500 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 500)',
			'Ch�i 1000 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 1000)',
			--'Ch�i 2000 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 2000)',
			--'Ch�i 4000 V�ng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 4000)',
		};
	end
	
	gf_Say(tSay, -1, 'n');
end

-- Ch�i game b�ng kim phi�u
function OTT_InviteGame_2(nTargetPlayerIdx)
	local tSay = {};
	if OTT.bTestMode == 1 then
		tSay = { '{gCh�n m�c Kim Phi�u (t�i h�nh trang) mu�n ch�i, ng��i th�ng s� ch�u '..OTT.nWinFee..'% ph�!}'..OTT.sTestDescription,
			'Ch�i 10 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 10)',
			'Ch�i 50 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 50)',
			'Ch�i 100 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 100)',
			'Ch�i 200 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 200)',
			'Ch�i 1000 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 1000)',
			'Ch�i 2000 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 2000)',
		};
	else
		tSay = { '{gCh�n m�c Kim Phi�u (t�i h�nh trang) mu�n ch�i, ng��i th�ng s� ch�u '..OTT.nWinFee..'% ph�!}'..OTT.sOpenDescription,
			'Ch�i 100 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 100)',
			'Ch�i 500 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 500)',
			'Ch�i 1000 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 1000)',
			--'Ch�i 2000 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 2000)',
			--'Ch�i 4000 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 4000)',
			--'Ch�i 5000 Kim Phi�u/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 5000)',
		};
	end
	
	gf_Say(tSay, -1, 'n');
end

-- H�m n�y ch�y tr�n ng��i m�i, ch�c n�ng �� m�i ch�i
function OTT_InviteGameSend(nTargetPlayerIdx, nPayType, nPayValue)
	nTargetPlayerIdx = tonumber(nTargetPlayerIdx) or 0;
	if nTargetPlayerIdx <= 0 then return 0; end

	if OTT_CheckPay(nPayType, nPayValue) ~= 1 then
		gf_Msg2Player('B�n kh�ng c� �� <color=red>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong h�nh trang, kh�ng th� m�i ng��i kh�c ch�i ���c!', 13);
		return 0;
	end

	local nSourcePlayerIdx = PlayerIndex;
	local sSourcePlayerName = GetName();
	local sTargetPlayerName = GetName(nTargetPlayerIdx);
	
	-- Ch�y tr�n ng��i ���c m�i
	PlayerIndex = nTargetPlayerIdx;
	Msg2Player('B�n nh�n ���c l�i m�i o�n t� t� t� '..sSourcePlayerName..'!');
	WantTo1v1(nSourcePlayerIdx, sSourcePlayerName..' m�i b�n o�n t� t� '..nPayValue..' '..OTT.tPayType[nPayType]..', trong %ds kh�ng [��ng �] th� l�i m�i s� t� h�y!', OTT.nWaitInviteTime, OTT_WAIT_INVITE_FILE);
	-- Tr� v� ng��i m�i
	PlayerIndex = nSourcePlayerIdx;
	
	-- L�u th�ng tin ��t c��c
	OTT_ShowTitle(random(4,6));
	SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE, nPayType);
	SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE, nPayValue);
	Msg2Player('�� m�i '..sTargetPlayerName..' ch�i o�n t� t�, ��i ��i ph��ng ��ng �...');
end

-- Hi�n th� l�a ch�n k�o b�a bao
function OTT_OpenTurnMenu(nOtherPlayerIdx)
	-- So s�nh token
	nOtherPlayerIdx = tonumber(nOtherPlayerIdx) or 0;
	local nCurrentPlayerIdx = PlayerIndex;
	local bIsSameToken = OTT_CheckMatchToken(nCurrentPlayerIdx, nOtherPlayerIdx);
	if bIsSameToken == 0 then
		OTT_QuitGame('��i ph��ng �� r�i kh�i!',
								'��i ph��ng �� r�i kh�i!',
								0);
		return 0;
	end
	
	local sCurrentPlayerName = GetName();
	local sOtherPlayerName = GetName(nOtherPlayerIdx);
	local nCurrentTurn = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT);
	local nRetCurrentAllowMap = OTT_CheckMap();
	-- Ki�m tra ��i ph��ng �� ch�n ch�a
	PlayerIndex = nOtherPlayerIdx;
	local nOtherTurn = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT);
	local nRetOtherAllowMap = OTT_CheckMap();
	PlayerIndex = nCurrentPlayerIdx;
	
	-- Ki�m tra c� 2 c� � trong map cho ph�p ch�i kh�ng
	if nRetCurrentAllowMap ~= 1 then
		OTT_QuitGame('B�n �� r�i kh�i khu v�c ch�i!', 
								'B�n �� r�i kh�i khu v�c ch�i!', 
								0);
		
		PlayerIndex = nOtherPlayerIdx;
		if nRetCurrentAllowMap ~= 1 then
			OTT_QuitGame(sCurrentPlayerName..' �� r�i kh�i khu v�c ch�i!', 
									sCurrentPlayerName..' �� r�i kh�i khu v�c ch�i!', 
									1);
		end
		PlayerIndex = nCurrentPlayerIdx;
		return 0;
	end
	if nRetOtherAllowMap ~= 1 then
		OTT_QuitGame(sOtherPlayerName..' �� r�i kh�i khu v�c ch�i!', 
								sOtherPlayerName..' �� r�i kh�i khu v�c ch�i!', 
								1);
		return 0;
	end

	-- Ki�m tra nh�n v�t �� ch�n r�i m� ��i ph��ng ch�a ch�n
	if nCurrentTurn ~= 0 and nOtherTurn == 0 then
		gf_Msg2Player('B�n �� ch�n <color=green>'..OTT.tTurnType[nCurrentTurn]..'!<color>\n��i <color=yellow>'..sOtherPlayerName..'<color> suy ngh� t� n�o! <pic=25>\n{rCh� �: C� th� {g[K�t th�c ��i tho�i]} �� t�m �n l�a ch�n v� b�t l�i b�ng n�t {g[��ng �]} � h�p tho�i d��i. N�u kh�ng mu�n ch�i n�a, nhanh tay �n {g[H�y b�]} tr��c khi ��i ph��ng ch�n xong!}', 13);
		
		PlayerIndex = nOtherPlayerIdx;
		Msg2Player(sCurrentPlayerName..' �� kh�a l�a ch�n!');
		PlayerIndex = nCurrentPlayerIdx;
		return 0;
	end
	
	-- N�u c� 2 ��u �� ch�n th� show k�t qu�
	local bReportCurrentCheater = 0; -- ng��i ch�n sau s� l� current
	local bReportOtherCheater = 0;
	if nCurrentTurn ~= 0 and nOtherTurn ~= 0 then
		local nCheckTime = GetTime();
		
		if nCurrentTurn < 1 or nCurrentTurn > 3 then
			if OTT.bCheatMode == 1 and (tonumber(OTT.tAccountCheat[GetAccount()]) or 0) == 1 then
				if nOtherTurn == 1 then -- k�o
					nCurrentTurn = 2;
				elseif nOtherTurn == 2 then -- b�a
					nCurrentTurn = 3;
				elseif nOtherTurn == 3 then -- bao
					nCurrentTurn = 1;
				else
					nCurrentTurn = random(1,3);
				end
				SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT, nCurrentTurn);
				SetTaskTemp(WARLORD_TMPTASK_OTT_WIN_BY_CHEAT, 1);
			else
				bReportCurrentCheater = 1;
			end
		end
		
		PlayerIndex = nOtherPlayerIdx;
		if nOtherTurn < 1 or nOtherTurn > 3 then
			if OTT.bCheatMode == 1 and (tonumber(OTT.tAccountCheat[GetAccount()]) or 0) == 1 then
				if nCurrentTurn == 1 then -- k�o
					nOtherTurn = 2;
				elseif nCurrentTurn == 2 then -- b�a
					nOtherTurn = 3;
				elseif nCurrentTurn == 3 then -- bao
					nOtherTurn = 1;
				else
					nOtherTurn = random(1,3);
				end
				SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT, nOtherTurn);
				SetTaskTemp(WARLORD_TMPTASK_OTT_WIN_BY_CHEAT, 1);
			else
				bReportOtherCheater = 1;
			end
		end
		PlayerIndex = nCurrentPlayerIdx;
		
		-- X� l� c� cheat
		if bReportCurrentCheater == 0 and bReportOtherCheater == 0 then
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_CHECK, nCurrentTurn*OTT.nTurnCheckSalt);
			Msg2Player('K�t qu� s� c� sau '..OTT.nWaitResultTime..' gi�y n�a, �n [��ng �] �� xem l�i l�a ch�n, �n [H�y b�] �� h�y ch�i!');
			Accept1v1(nOtherPlayerIdx, 'B�n ra '..OTT.tTurnType[nCurrentTurn]..', '..sOtherPlayerName..' ra ???. K�t qu� sau %ds n�a. [��ng �] xem l�i, [H�y b�] ngh� ch�i!', OTT.nWaitResultTime, OTT_WAIT_RESULT_FILE);
			
			PlayerIndex = nOtherPlayerIdx;
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_CHECK, nOtherTurn*OTT.nTurnCheckSalt);
			Msg2Player('K�t qu� s� c� sau '..OTT.nWaitResultTime..' gi�y n�a. �n [��ng �] �� xem l�i l�a ch�n, �n [H�y b�] �� h�y ch�i!');
			Accept1v1(nCurrentPlayerIdx, 'B�n ra '..OTT.tTurnType[nOtherTurn]..', '..sCurrentPlayerName..' ra ???. K�t qu� sau %ds n�a. [��ng �] xem l�i, [H�y b�] ngh� ch�i!', OTT.nWaitResultTime, OTT_WAIT_RESULT_FILE);
			PlayerIndex = nCurrentPlayerIdx;
			
			return 1;
		else
			if bReportCurrentCheater ~= 0 then
				gf_WriteLog(OTT.sModuleName, 
									gf_Join({
										'Ph�t hi�n ng��i ch�i '..sCurrentPlayerName..' gian l�n!',
										'Cheat',
										OTT_GetMatchToken() or '', --'Token='..
										sCurrentPlayerName..' ', --'CheaterName='..
										nCurrentTurn, --'CheaterTurn='..
										sOtherPlayerName..' ', --'Name='..
										nOtherTurn, --'Turn='..
										OTT.tPayType[GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE)] or '', --'PayType='..
										GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE), --'nPayValue='..
										OTT.nLoseFee or '0', --'nLoseFee='..
										OTT.nWinFee or '0', --'nWinFee='..
										'0', --'nRetPayLose='..
										'0', --'nRetPayWin='..
										'0', --'nGiaTriTru='..
										'0', --'nGiaTriCong='..
									}, '\t'), PlayerIndex);
				OTT_QuitGame('H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
											'H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
											1);
				
				PlayerIndex = nOtherPlayerIdx;
				--OTT_QuitGame('H� th�ng ph�t hi�n '..sCurrentPlayerName..' gian l�n, l��t ch�i n�y b� h�y!',
				--							'H� th�ng ph�t hi�n '..sCurrentPlayerName..' gian l�n, l��t ch�i n�y b� h�y!',
				--							1);
				OTT_QuitGame('��i ph��ng �� r�i kh�i!',
											'��i ph��ng �� r�i kh�i!',
											1);
				PlayerIndex = nCurrentPlayerIdx;
				
				return 0;
			end
			
			if bReportOtherCheater ~= 0 then
				-- OTT_QuitGame('H� th�ng ph�t hi�n '..sOtherPlayerName..' gian l�n, l��t ch�i n�y b� h�y!',
				--							'H� th�ng ph�t hi�n '..sOtherPlayerName..' gian l�n, l��t ch�i n�y b� h�y!',
				--							1);
				OTT_QuitGame('��i ph��ng �� r�i kh�i!',
											'��i ph��ng �� r�i kh�i!',
											1);
											
				PlayerIndex = nOtherPlayerIdx;
				gf_WriteLog(OTT.sModuleName, 
									gf_Join({
										'Ph�t hi�n ng��i ch�i '..sOtherPlayerName..' gian l�n!',
										'Cheat',
										OTT_GetMatchToken() or '', --'Token='..
										sOtherPlayerName..' ', --'CheaterName='..
										nOtherTurn, --'CheaterTurn='..
										sCurrentPlayerName..' ', --'Name='..
										nCurrentTurn, --'Turn='..
										OTT.tPayType[GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE)] or '', --'PayType='..
										GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE), --'nPayValue='..
										OTT.nLoseFee or '0', --'nLoseFee='..
										OTT.nWinFee or '0', --'nWinFee='..
										'0', --'nRetPayLose='..
										'0', --'nRetPayWin='..
										'0', --'nGiaTriTru='..
										'0', --'nGiaTriCong='..
									}, '\t'), PlayerIndex);
				OTT_QuitGame('H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
											'H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
											1);
				PlayerIndex = nCurrentPlayerIdx;
				
				return 0;
			end
		end
	end

	-- N�u ch�a ch�n th� ��a ra l�a ch�n
	local nWaitTimeLeft = abs(GetTime() - (GetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME) + OTT.nWaitSelectTime));
	local nPayType = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE);
	local nPayValue = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE);
	Msg2Player('B�n c� '..OTT.nWaitSelectTime..' gi�y �� kh�a l�a ch�n. Sau khi ch�n xong c� �n [��ng �] �� xem l�i, n�u mu�n h�y l��t ch�i �n [H�y b�] � h�p tho�i d��i!');
	local tSay = { 'C�n {g'..nWaitTimeLeft..'} gi�y �� h�t {g'..nPayValue..' '..OTT.tPayType[nPayType]..'} c�a <color=yellow>'..sOtherPlayerName..'<color>, K�o B�a Bao b�n ch�n c�i n�o?\n{rCh� �: Thao t�c n�y ch� ch�n 1 l�n, h�y ch�c ch�n tr��c khi ch�n!\nC� th� {g[K�t th�c ��i tho�i]} �� t�m �n l�a ch�n v� b�t l�i b�ng n�t {g[��ng �]} � h�p tho�i d��i. N�u kh�ng mu�n ch�i n�a, nhanh tay �n {g[H�y b�]} tr��c khi ��i ph��ng ch�n xong!}' };
	for nSelectIdx = 1, 3 do
		tinsert(tSay, 'Ch�n '..OTT.tTurnType[nSelectIdx]..'/#OTT_PlayerTurn('..nOtherPlayerIdx..', '..nSelectIdx..')');
	end
	
	-- Cheat
	if OTT.bCheatMode == 1 and (tonumber(OTT.tAccountCheat[GetAccount()]) or 0) == 1 then
		tinsert(tSay, 'Ch�n '..OTT.tTurnType[-1]..'/#OTT_PlayerTurn('..nOtherPlayerIdx..', -1)');
	end
	
	gf_Say(tSay, -1, 'n');
	return 1;
end

function OTT_PlayerTurn(nOtherPlayerIdx, nSelectIdx)
	-- So s�nh token
	nOtherPlayerIdx = tonumber(nOtherPlayerIdx) or 0;
	local nCurrentPlayerIdx = PlayerIndex;
	local bIsSameToken = OTT_CheckMatchToken(nCurrentPlayerIdx, nOtherPlayerIdx);
	if bIsSameToken == 0 then
		OTT_QuitGame('��i ph��ng �� r�i kh�i!',
								'��i ph��ng �� r�i kh�i!',
								0);
		return 0;
	end
	
	-- Ki�m tra ��i ph��ng c� trong map kh�ng
	local nOldPlayerIdx = PlayerIndex;
	local nRetOtherAllowMap = 0;
	PlayerIndex = nOtherPlayerIdx;
	nRetOtherAllowMap = OTT_CheckMap();
	PlayerIndex = nOldPlayerIdx;
	if nRetOtherAllowMap ~= 1 then
		local sOtherPlayerName = GetName(nOtherPlayerIdx);
		OTT_QuitGame(sOtherPlayerName..' �� r�i kh�i khu v�c ch�i!', 
								sOtherPlayerName..' �� r�i kh�i khu v�c ch�i!', 
								1);
		return 0;
	end
	
	if OTT_GetPlayerState() == 3 then
		SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT, nSelectIdx);
		OTT_OpenTurnMenu(nOtherPlayerIdx);
	end
end

function OTT_ShowTitle(nTurnType)
	local tTitleData = OTT.tTurnType2PlayerTile[nTurnType];
	if tTitleData == nil then return 0; end
	
	if IsTitleExist(tTitleData[1], tTitleData[2]) == 1 then
		RemoveTitle(tTitleData[1], tTitleData[2]);
	end
	
	local nShowTime = OTT.nTitleShowTime;
	if nTurnType == 0 then
		nShowTime = OTT.nWaitInviteTime + OTT.nWaitSelectTime + OTT.nWaitResultTime;
	end
	
	AddTitle(tTitleData[1], tTitleData[2]);
	SetTitleTime(tTitleData[1], tTitleData[2], GetTime() + nShowTime);
	SetCurTitle(tTitleData[1], tTitleData[2]);
end

function OTT_ShowResult(nPlayerIdx1, nPlayerIdx2)
	-- So s�nh token
	nPlayerIdx1 = tonumber(nPlayerIdx1) or 0;
	nPlayerIdx2 = tonumber(nPlayerIdx2) or 0;
	local bIsSameToken = OTT_CheckMatchToken(nPlayerIdx1, nPlayerIdx2);
	if bIsSameToken == 0 then
		OTT_QuitGame('��i ph��ng �� r�i kh�i!',
								'��i ph��ng �� r�i kh�i!',
								0);
		return 0;
	end
	
	local nOldPlayerIdx = PlayerIndex;
	local sPlayerName1 = '';
	local sPlayerName2 = '';
	local nPlayerTurn1 = 0;
	local nPlayerTurnCheck1 = 0;
	local nPlayerTurn2 = 0;
	local nPlayerTurnCheck2 = 0;
	local bRetPlayerCheat1 = 0;
	local bRetPlayerCheat2 = 0;
	
	PlayerIndex = nPlayerIdx1;
	sPlayerName1 = GetName();
	nPlayerTurn1 = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT);
	nPlayerTurnCheck1 = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_CHECK);
	if nPlayerTurn1*OTT.nTurnCheckSalt ~= nPlayerTurnCheck1 then
		bRetPlayerCheat1 = 1;
	end
	PlayerIndex = nOldPlayerIdx;
	
	PlayerIndex = nPlayerIdx2;
	sPlayerName2 = GetName();
	nPlayerTurn2 = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT);
	nPlayerTurnCheck2 = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_CHECK);
	if nPlayerTurn2*OTT.nTurnCheckSalt ~= nPlayerTurnCheck2 then
		bRetPlayerCheat2 = 1;
	end
	PlayerIndex = nOldPlayerIdx;
	
	if bRetPlayerCheat1 ~= 0 or bRetPlayerCheat2 ~= 0 then
		-- X� l� khi player1 thay ��i l�a ch�n sau khi ch�n xong
		if bRetPlayerCheat1 ~= 0 then
			PlayerIndex = nPlayerIdx1;
			gf_WriteLog(OTT.sModuleName, 
										gf_Join({
											'Ph�t hi�n ng��i ch�i '..sPlayerName1..' tr�o k�t qu� t� '..(nPlayerTurnCheck1/OTT.nTurnCheckSalt)..' -> '..nPlayerTurn1..'!',
											'Cheat',
											OTT_GetMatchToken() or '', --'Token='..
											sPlayerName1..' ', --'CheaterName='..
											nPlayerTurn1, --'CheaterTurn='..
											sPlayerName2..' ', --'Name='..
											nPlayerTurn2, --'Turn='..
											OTT.tPayType[GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE)] or '', --'PayType='..
											GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE), --'nPayValue='..
											OTT.nLoseFee or '0', --'nLoseFee='..
											OTT.nWinFee or '0', --'nWinFee='..
											'0', --'nRetPayLose='..
											'0', --'nRetPayWin='..
											'0', --'nGiaTriTru='..
											'0', --'nGiaTriCong='..
										}, '\t'), PlayerIndex);
			OTT_QuitGame('H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
										'H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
										1);
			PlayerIndex = nOldPlayerIdx;
		
			PlayerIndex = nPlayerIdx2;
			OTT_QuitGame('��i ph��ng �� r�i kh�i!',
										'��i ph��ng �� r�i kh�i!',
										1);
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end
		
		-- X� l� khi player2 thay ��i l�a ch�n sau khi ch�n xong
		if bRetPlayerCheat2 ~= 0 then
			PlayerIndex = nPlayerIdx1;
			OTT_QuitGame('��i ph��ng �� r�i kh�i!',
										'��i ph��ng �� r�i kh�i!',
										1);
			PlayerIndex = nOldPlayerIdx;
			
			PlayerIndex = nPlayerIdx2;
			gf_WriteLog(OTT.sModuleName, 
											gf_Join({
												'Ph�t hi�n ng��i ch�i '..sPlayerName2..' tr�o k�t qu� t� '..(nPlayerTurnCheck2/OTT.nTurnCheckSalt)..' -> '..nPlayerTurn2..'!',
												'Cheat',
												OTT_GetMatchToken() or '', --'Token='..
												sPlayerName2..' ', --'CheaterName='..
												nPlayerTurn2, --'CheaterTurn='..
												sPlayerName1..' ', --'Name='..
												nPlayerTurn1, --'Turn='..
												OTT.tPayType[GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE)] or '', --'PayType='..
												GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE), --'nPayValue='..
												OTT.nLoseFee or '0', --'nLoseFee='..
												OTT.nWinFee or '0', --'nWinFee='..
												'0', --'nRetPayLose='..
												'0', --'nRetPayWin='..
												'0', --'nGiaTriTru='..
												'0', --'nGiaTriCong='..
											}, '\t'), PlayerIndex);
			OTT_QuitGame('H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
										'H� th�ng ph�t hi�n b�n �� gian l�n, l��t ch�i n�y b� h�y!',
										1);
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end
	end
	
	local nWinPlayerIdx = 0;
	local nWinTurn = 0;
	local nLosePlayerIdx = 0;
	local nLoseTurn = 0;
	local sMatchDescription = '';
	if nPlayerTurn1 ~= 0 and nPlayerTurn2 ~= 0 then
		if nPlayerTurn1 == 1 and nPlayerTurn2 == 2 then
			-- Player2 th�ng: k�o < b�a
			nWinPlayerIdx = nPlayerIdx2;
			nWinTurn = nPlayerTurn2;
			nLosePlayerIdx = nPlayerIdx1;
			nLoseTurn = nPlayerTurn1;
			sMatchDescription = '(K�o thua B�a)';
		elseif nPlayerTurn1 == 1 and nPlayerTurn2 == 3 then
			-- Player1 th�ng: k�o > bao
			nWinPlayerIdx = nPlayerIdx1;
			nWinTurn = nPlayerTurn1;
			nLosePlayerIdx = nPlayerIdx2;
			nLoseTurn = nPlayerTurn2;
			sMatchDescription = '(K�o th�ng Bao)';
		elseif nPlayerTurn1 == 2 and nPlayerTurn2 == 1 then
			-- Player1 th�ng: b�a > k�o
			nWinPlayerIdx = nPlayerIdx1;
			nWinTurn = nPlayerTurn1;
			nLosePlayerIdx = nPlayerIdx2;
			nLoseTurn = nPlayerTurn2;
			sMatchDescription = '(B�a th�ng K�o)';
		elseif nPlayerTurn1 == 2 and nPlayerTurn2 == 3 then
			-- Player2 th�ng: b�a < bao
			nWinPlayerIdx = nPlayerIdx2;
			nWinTurn = nPlayerTurn2;
			nLosePlayerIdx = nPlayerIdx1;
			nLoseTurn = nPlayerTurn1;
			sMatchDescription = '(B�a thua Bao)';
		elseif nPlayerTurn1 == 3 and nPlayerTurn2 == 1 then
			-- Player2 th�ng: bao < k�o
			nWinPlayerIdx = nPlayerIdx2;
			nWinTurn = nPlayerTurn2;
			nLosePlayerIdx = nPlayerIdx1;
			nLoseTurn = nPlayerTurn1;
			sMatchDescription = '(Bao thua K�o)';
		elseif nPlayerTurn1 == 3 and nPlayerTurn2 == 2 then
			-- Player1 th�ng: bao > b�a
			nWinPlayerIdx = nPlayerIdx1;
			nWinTurn = nPlayerTurn1;
			nLosePlayerIdx = nPlayerIdx2;
			nLoseTurn = nPlayerTurn2;
			sMatchDescription = '(Bao th�ng B�a)';
		end
		
		if nWinPlayerIdx ~= 0 and nLosePlayerIdx ~= 0 then
			OTT_GiveWin(nWinPlayerIdx, nWinTurn, nLosePlayerIdx, nLoseTurn, sMatchDescription);
		else
			local sTestDescription = '';
			if OTT.bTestMode == 1 then
				sTestDescription = OTT.sTestDescription;
			end
		
			-- K�t qu� h�a
			PlayerIndex = nPlayerIdx1;
			OTT_ShowTitle(nPlayerTurn1);
			OTT_QuitGame('H�a '..OTT.tTurnType[nPlayerTurn1]..' - '..OTT.tTurnType[nPlayerTurn2]..'!',
									'K�t qu� h�a: <color=green>B�n ra '..OTT.tTurnType[nPlayerTurn1]..'<color>, <color=red>'..sPlayerName2..' ra '..OTT.tTurnType[nPlayerTurn2]..'<color> (gi�ng nhau th� h�a)'..sTestDescription,
									1);
			PlayerIndex = nOldPlayerIdx;
			
			PlayerIndex = nPlayerIdx2;
			local nToken = OTT_GetMatchToken();
			local nPayType = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE);
			local nPayValue = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE);
			local nSourcePlayerIdx = GetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1);
			OTT_ShowTitle(nPlayerTurn2);
			OTT_QuitGame('H�a '..OTT.tTurnType[nPlayerTurn2]..' - '..OTT.tTurnType[nPlayerTurn1]..'!',
									'K�t qu� h�a: <color=green>B�n ra '..OTT.tTurnType[nPlayerTurn2]..'<color>, <color=red>'..sPlayerName1..' ra '..OTT.tTurnType[nPlayerTurn1]..'<color> (gi�ng nhau th� h�a)'..sTestDescription,
									1);
			PlayerIndex = nOldPlayerIdx;

			gf_WriteLog(OTT.sModuleName, 
							gf_Join({
								'Th�ng tin th�ng thua ott ng��i m�i l� '..GetName(nSourcePlayerIdx),
								'H�a',
								nToken or '', --'Token='..
								(GetName(nPlayerIdx1) or '')..' ', --'WinName='..
								OTT.tTurnType[nPlayerTurn1] or '', --'WinTurn='..
								(GetName(nPlayerIdx2) or '')..' ', --'LoseName='..
								OTT.tTurnType[nPlayerTurn2] or '', --'LoseTurn='..
								OTT.tPayType[nPayType] or '', --'PayType='..
								nPayValue or '', --'nPayValue='..
								OTT.nLoseFee or '', --'nLoseFee='..
								OTT.nWinFee or '', --'nWinFee='..
								'0', --'nRetPayLose='..
								'0', --'nRetPayWin='..
								'0', --'nGiaTriTru='..
								'0', --'nGiaTriCong='..
							}, '\t'), nSourcePlayerIdx);
		end
	end
end

function OTT_GiveWin(nWinPlayerIdx, nWinTurn, nLosePlayerIdx, nLoseTurn, sMatchDescription)
	nPlayerIdx1 = tonumber(nWinPlayerIdx) or 0;
	nPlayerIdx2 = tonumber(nLosePlayerIdx) or 0;
	local bIsSameToken = OTT_CheckMatchToken(nPlayerIdx1, nPlayerIdx2);
	if bIsSameToken == 0 then
		OTT_QuitGame('��i ph��ng �� r�i kh�i!',
								'��i ph��ng �� r�i kh�i!',
								0);
		return 0;
	end
	
	local nRetPayWin, nRetPayWinValue = 0, 0;
	local nRetPayLose, nRetPayLoseValue = 0, 0;
	local nPayType = 0;
	local nPayValue = 0;
	local sTestDescription = '';
	if OTT.bTestMode == 1 then
		sTestDescription = OTT.sTestDescription;
	end
	
	-- Lose
	PlayerIndex = nLosePlayerIdx;
	SetTaskTemp(WARLORD_TMPTASK_OTT_STATUS, 1);
	nPayType = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE);
	nPayValue = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE);
	nRetPayLose, nRetPayLoseValue = OTT_PayLose(nPayType, nPayValue);
	if nRetPayLose == 1 then
		OTT_ShowTitle(nLoseTurn);
		local nReformatPayLoseValue = abs(nRetPayLoseValue);
		if nPayType == 1 then
			nReformatPayLoseValue = gf_GetMoneyString(nReformatPayLoseValue);
		else
			nReformatPayLoseValue = nReformatPayLoseValue..' '..OTT.tPayType[nPayType];
		end
		OTT_QuitGame('B�n b� t�n th�t '..nPayValue..' '..OTT.tPayType[nPayType]..'!',
							'K�t qu�: <color=green>B�n ra '..OTT.tTurnType[nLoseTurn]..'<color>, <color=red>'..GetName(nWinPlayerIdx)..' ra '..OTT.tTurnType[nWinTurn]..'<color> '..sMatchDescription..'\n<color=green>B�n b� t�n th�t '..nReformatPayLoseValue..', ��ng v�i n�n l�ng, ng� � ��u ta g�p ��i � ��y!<color>'..sTestDescription,
							1);
	else
		--local sLoseReport = date('%y-%m-%d %H:%M:%S')..' L�i kh�ng tr� ���c '..OTT.tPayType[nPayType]..' c�a ng��i ch�i '..GetName(nLosePlayerIdx)..', vui l�ng ch�p �nh m�n h�nh k�m th�ng b�o n�y g�i admin h� tr�!';
		--Msg2Player(sLoseReport);
		OTT_QuitGame('B�n kh�ng �� '..nPayValue..' '..OTT.tPayType[nPayType]..' trong h�nh trang, l��t ch�i n�y b� h�y!',
								'B�n kh�ng �� {r'..nPayValue..' '..OTT.tPayType[nPayType]..'} trong h�nh trang, l��t ch�i n�y b� h�y!'..sTestDescription..'\n{r'..(sLoseReport or '')..'}',
								1);
	end
	PlayerIndex = nOldPlayerIdx;
	
	-- Win
	local sCheaterLog = '';
	PlayerIndex = nWinPlayerIdx;
	SetTaskTemp(WARLORD_TMPTASK_OTT_STATUS, 1);
	local nToken = OTT_GetMatchToken();
	local nSourcePlayerIdx = GetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1);
	if nRetPayLose == 1 then
		OTT_ShowTitle(nWinTurn);
		nRetPayWin, nRetPayWinValue = OTT_PayWin(nPayType, nPayValue);
		local nReformatPayWinValue = abs(nRetPayWinValue);
		if nPayType == 1 then
			nReformatPayWinValue = gf_GetMoneyString(nReformatPayWinValue);
		else
			nReformatPayWinValue = nReformatPayWinValue..' '..OTT.tPayType[nPayType];
		end
		
		if GetTaskTemp(WARLORD_TMPTASK_OTT_WIN_BY_CHEAT) == 1 then
			sCheaterLog = ' - cheater';
		end
		
		OTT_QuitGame('B�n �� th�ng '..nPayValue..' '..OTT.tPayType[nPayType]..'!',
								'K�t qu�: <color=green>B�n ra '..OTT.tTurnType[nWinTurn]..'<color>, <color=red>'..GetName(nLosePlayerIdx)..' ra '..OTT.tTurnType[nLoseTurn]..'<color> '..sMatchDescription..'\n<color=green>Ch�c m�ng b�n �� chi�n th�ng '..nReformatPayWinValue..'!<color>'..sTestDescription,
								1);
								
		if nPayValue >= 5000 then
			Msg2Global('Ch�c m�ng '..GetName()..' may m�n th�ng '..nPayValue..' '..OTT.tPayType[nPayType]..' t� tr� ch�i o�n t� t� v�i ng��i ch�i kh�c t�i '..GetMapName(GetWorldPos())..'!');
		end
	else
		--local sWinReport = date('%y-%m-%d %H:%M:%S')..' L�i kh�ng tr� ���c '..OTT.tPayType[nPayType]..' c�a ng��i ch�i '..GetName(nLosePlayerIdx)..', vui l�ng ch�p �nh m�n h�nh k�m th�ng b�o n�y g�i admin h� tr�!';
		--Msg2Player(sWinReport);
		OTT_QuitGame(GetName(nLosePlayerIdx)..' kh�ng �� '..nPayValue..' '..OTT.tPayType[nPayType]..' trong h�nh trang, l��t ch�i n�y b� h�y!',
								GetName(nLosePlayerIdx)..' kh�ng �� {g'..nPayValue..' '..OTT.tPayType[nPayType]..'} trong h�nh trang, l��t ch�i n�y b� h�y!'..sTestDescription..'\n{r'..(sWinReport or '')..'}',
								1);
	end
	PlayerIndex = nOldPlayerIdx;
	
	-- gf_WriteLog(OTT.sModuleName, 
						-- gf_Join({
							-- 'Token='..nToken or '',
							-- 'WinName='..GetName(nWinPlayerIdx) or '',
							-- 'WinTurn='..OTT.tTurnType[nWinTurn] or '',
							-- 'LoseName='..GetName(nLosePlayerIdx) or '',
							-- 'LoseTurn='..OTT.tTurnType[nLoseTurn] or '',
							-- 'PayType='..OTT.tPayType[nPayType] or '',
							-- 'nPayValue='..nPayValue or '',
							-- 'nLoseFee='..OTT.nLoseFee or '',
							-- 'nWinFee='..OTT.nWinFee or '',
							-- 'nRetPayLose='..nRetPayLose or '',
							-- 'nRetPayWin='..nRetPayWin or '',
						-- }, ','), nSourcePlayerIdx);

	gf_WriteLog(OTT.sModuleName, 
							gf_Join({
								'Th�ng tin th�ng thua ott ng��i m�i l� '..GetName(nSourcePlayerIdx),
								'Th�ng thua'..sCheaterLog,
								nToken or '', --'Token='..
								(GetName(nWinPlayerIdx) or '')..' ', --'WinName='..
								OTT.tTurnType[nWinTurn] or '', --'WinTurn='..
								(GetName(nLosePlayerIdx) or '')..' ', --'LoseName='..
								OTT.tTurnType[nLoseTurn] or '', --'LoseTurn='..
								OTT.tPayType[nPayType] or '', --'PayType='..
								nPayValue or '', --'nPayValue='..
								OTT.nLoseFee or '', --'nLoseFee='..
								OTT.nWinFee or '', --'nWinFee='..
								nRetPayLose or '', --'nRetPayLose='..
								nRetPayWin or '', --'nRetPayWin='..
								nRetPayLoseValue or '', --'nGiaTriTru='..
								nRetPayWinValue or '', --'nGiaTriCong='..
							}, '\t'), nSourcePlayerIdx);
end

function OTT_CheckMatchToken(nPlayerIdx1, nPlayerIdx2)
	local nOldPlayerIdx = PlayerIndex;
	local nToken1 = 0;
	local nToken2 = 0;
	
	PlayerIndex = nPlayerIdx1;
	nToken1 = OTT_GetMatchToken();
	PlayerIndex = nOldPlayerIdx;
	
	PlayerIndex = nPlayerIdx2;
	nToken2 = OTT_GetMatchToken();
	PlayerIndex = nOldPlayerIdx;
	
	if nToken1 ~= 0 and nToken1 == nToken2 then
		return 1;
	else
		return 0;
	end
end

function OTT_CheckMap()
	local nMapId, nPosX, nPosY = GetWorldPos();
	if OTT.tAllowMap[nMapId] ~= nil then
		return 1;
	else
		return 0;
	end
end

function OTT_CheckPay(nPayType, nPayValue)
	local nRetCode = 0;
	if nPayType == 1 then
		if GetCash() >= nPayValue*10000 then
			nRetCode = 1;
		end
	elseif nPayType == 2 then
		if GetVipJinJuan() >= nPayValue then
			nRetCode = 1;
		end
	end
	
	return nRetCode;
end

function OTT_PayLose(nPayType, nPayValue)
	local nRetCode = 0;
	local nFee = (OTT.nLoseFee/100);
	local nPayIncludeFee = 0;
	if nPayType == 1 then
		nPayIncludeFee = floor(nPayValue*10000 + (nPayValue*10000*nFee));
		nRetCode = Pay(nPayIncludeFee);
		nPayIncludeFee = -nPayIncludeFee;
	elseif nPayType == 2 then
		nPayIncludeFee = floor(-(abs(nPayValue)) - (abs(nPayValue)*nFee));
		if ModifyJinJuan(nPayIncludeFee, 1) >= 0 then
			nRetCode = 1;
		end
	end
	
	return nRetCode, nPayIncludeFee;
end

function OTT_PayWin(nPayType, nPayValue)
	local nRetCode = 0;
	local nFee = (OTT.nWinFee/100);
	local nPayIncludeFee = 0;
	if nPayType == 1 then
		local nLastVal = GetCash();
		nPayIncludeFee = floor(nPayValue*10000 - (nPayValue*10000*nFee));
		Earn(nPayIncludeFee);
		--if nLastVal + (nPayValue*10000*nFee) >= GetCash() then
			nRetCode = 1;
		--end		
	elseif nPayType == 2 then
		nPayIncludeFee = floor(abs(nPayValue - (nPayValue*nFee)));
		if ModifyJinJuan(nPayIncludeFee, 1) >= 0 then
			nRetCode = 1;
		end
	end
	
	return nRetCode, nPayIncludeFee;
end

function OTT_CreateMatchToken(sInput)
	local sInputHash = tostring(String2Hash(sInput));
	local nInputLength = strlen(sInputHash);
	local nPart1Length = floor(nInputLength / 2);
	local nPart2Length = nInputLength - nPart1Length;
	local sPart1 = strsub(sInputHash, 1, nPart1Length);
	local sPart2 = strsub(sInputHash, nPart1Length+1, nInputLength);
	local nPart1 = tonumber('1'..sPart1) or 0;
	local nPart2 = tonumber('1'..sPart2) or 0;
	return nPart1, nPart2;
end

function OTT_GetMatchToken()
	return tonumber(tostring(GetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART1))..tostring(GetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART2))) or 0;
end

function OTT_GetPlayerState()
	local nRetCode = 0;
	if IsStalling() == 1 or IsReading() == 1 or IsSleeping() == 1 or IsOfflineLive() == 1 then
		nRetCode = 1;
	elseif GetPKFlag() ~= 0 or GetFightState() ~= 0 or GetPKEnmityState() ~= 0 then 
		nRetCode = 2;
	elseif GetTaskTemp(WARLORD_TMPTASK_OTT_ON_GAME) == 1 then
		nRetCode = 3;
	end
	
	if nRetCode == 0 then
		return 0, '';
	else
		return nRetCode, OTT.tPlayerState[nRetCode] or OTT.tPlayerState[0];
	end
end

function OTT_ResetTaskTemp()
	SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_ON_GAME, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_STATUS, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_CHECK, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID2, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART1, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART2, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, 0);
	SetTaskTemp(WARLORD_TMPTASK_OTT_WIN_BY_CHEAT, 0);
	
	local nTitleG, nTitleD = GetCurTitle();
	for i1 = 0, getn(OTT.tTurnType2PlayerTile) do
		local tTitleData = OTT.tTurnType2PlayerTile[i1];
		if tTitleData ~= nil then
			if IsTitleExist(tTitleData[1], tTitleData[2]) then
				if nTitleG == 80 and nTitleD ~= 1 and nTitleG == tTitleData[1] and nTitleD == tTitleData[2] then
					SetTitleTime(tTitleData[1], tTitleData[2], GetTime() + OTT.nTitleShowTime);
				else
					RemoveTitle(tTitleData[1], tTitleData[2]);
				end
			end
		end
	end
	--SetCurTitle(0,0);
end

function OTT_QuitGame(sMsg1v1, sMsgSay, bCloseSay)
	OTT_ResetTaskTemp();
	if sMsg1v1 == nil then
		sMsg1v1 = 'Tr� ch�i s� ��ng sau %ds!';
	else
		sMsg1v1 = sMsg1v1..', tr� ch�i s� ��ng sau %ds!';
	end
	sMsgSay = sMsgSay or '';
	bCloseSay = tonumber(bCloseSay) or 0;
	if bCloseSay == 1 then
		bCloseSay = 13;
	else
		bCloseSay = 1;
	end
	Accept1v1(PlayerIndex, sMsg1v1, 0, '');
	if sMsgSay ~= '' then
		gf_Msg2Player(sMsgSay, bCloseSay);
	end
end
