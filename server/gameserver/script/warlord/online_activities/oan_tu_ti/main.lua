----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-27
-- Description: §©y lµ néi dung chøa nh÷ng hµm static
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\oan_tu_ti\\head.lua");
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
--Include("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\warlord\\tmp_task_id_def.lua");
----------------------------------------------------------------------------------------------------

function OTT_InviteGame(nTargetPlayerIdx, sTargetPlayerName, bNewGame)
	-- ChÆn kh«ng cho ch¬i
	Msg2Player('TÝnh n¨ng ®ang t¹m ®ãng, thêi gian më l¹i sÏ ®­îc c«ng bè sau!');
	do return 0; end
	
	if PlayerIndex <= 0 then return 0; end
	
	-- ChÆn c¸c giê ®i chiÕn tr­êng
	local nH = tonumber(date("%H"));
	if (nH >= 14 and nH < 16) or (nH >= 19 and nH < 21) then
		Say('Trong giê chiÕn tr­êng kh«ng thÓ ch¬i o¼n tï t×!', 0);
		return 0;
	end
	
	-- KiÓm tra map hîp lÖ
	if OTT_CheckMap() ~= 1 then
		gf_Msg2Player('H·y ®Õn '..gf_Join(OTT.tAllowMap, ', ')..' cïng ch¬i víi ng­êi ch¬i kh¸c nhÐ!', 13);
		return 0;
	end
	
	-- KiÓm tra khãa r­¬ng tr­íc khi ch¬i
	if IsBoxLocking() == 1 then
		gf_Msg2Player('B¹n cÇn t¹o & më khãa r­¬ng thñ khè tr­íc khi ch¬i!', 13);
		return 0;
	end
	
	-- §Þnh nghÜa ng­êi ch¬i
	-- Source = ng­êi mêi
	-- Target = ng­êi ®­îc mêi
	local nSourcePlayerIdx = PlayerIndex;
	local sSourcePlayerName = GetName();

	-- KiÓm tra tr¹ng th¸i ng­êi ch¬i, nÕu ®ang ch¬i th× hiÖn th«ng b¸o hái x¸c nhËn v¸n míi
	local nRetSourceState, sRetSourceStateStr = OTT_GetPlayerState();
	if nRetSourceState > 0 then
		if nRetSourceState == 3 then
			local tSay = { 'B¹n ®ang ch¬i cïng víi ng­êi kh¸c, cã muèn ch¬i v¸n míi kh«ng?',
				'Cã, ta muèn ch¬i v¸n míi víi '..sTargetPlayerName..'!/#OTT_InviteGame_NewGame('..nTargetPlayerIdx..', "'..sTargetPlayerName..'")',
			};
			gf_Say(tSay, -1, '*');
			return 0;
		end
		
		Msg2Player('B¹n ®ang '..sRetSourceStateStr..' kh«ng thÓ mêi ch¬i!');
		return 0;
	end
	
	-- KiÓm tra ng­êi ch¬i cã trong map kh«ng b»ng nTargetPlayerIdx vµ so s¸nh b»ng tªn nh©n vËt
	-- NÕu ng­êi ch¬i qua thµnh kh¸c, quay vÒ l¹i trong tÝch t¾c sÏ sinh lçi thao t¸c víi nh©n vËt sai
	-- nªn sÏ t×m l¹i ng­êi ch¬i b»ng tªn nh©n vËt vµ cËp nhËp l¹i nTargetPlayerIdx
	if GetName(nTargetPlayerIdx) ~= sTargetPlayerName then
		local tPlayerInMap = GetMapPlayer(GetWorldPos());
		local nTotalPlayerInMap = getn(tPlayerInMap);
		if nTotalPlayerInMap <= 1 then
			Msg2Player('Kh«ng t×m thÊy ®èi thñ!');
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
		Msg2Player('Ng­êi ch¬i ®· rêi khái!');
		return 0;
	end
	
	-- KiÓm tra vÞ trÝ, ë gÇn nhau míi cho ch¬i
	if gf_GetPlayerDistance(PlayerIndex, nTargetPlayerIdx) >= OTT.nMaxDistance then
		Msg2Player('Kho¶ng c¸ch víi '..sTargetPlayerName..' qu¸ xa!');
		return 0;
	end
	
	-- KiÓm tra tr¹ng th¸i cña ng­êi ®­îc mêi
	local nRetTargetState, sRetTargetStateStr = 0, '';
	
	-- Ch¹y trªn ng­êi ®­îc mêi xem cã ®ang ch¬i cïng ng­êi kh¸c kh«ng
	PlayerIndex = nTargetPlayerIdx;
	nRetTargetState, sRetTargetStateStr = OTT_GetPlayerState();
	-- Tr¶ vÒ ng­êi mêi
	PlayerIndex = nSourcePlayerIdx;
	
	-- NÕu ®ang ch¬i cïng ng­êi kh¸c th× k cho mêi
	if nRetTargetState > 0 then
		Msg2Player(sTargetPlayerName..' ®ang '..sRetTargetStateStr..' kh«ng thÓ tham gia!');
		return 0;
	end
	
	-- C¸ch ch¬i
	local tSay = { 'H·y chän c¸ch thøc ch¬i o¼n tï t× víi {y'..sTargetPlayerName..'}\nNÕu lì cã thua kh«ng qu¹o nhÐ <pic=7><pic=35><pic=25>\n<color=red>Chó ý: <sex> nªn ®äc h­íng dÉn vµ hiÓu râ luËt tr­íc khi ch¬i!<color>',
		'Ch¬i b»ng Vµng/#OTT_InviteGame_1('..nTargetPlayerIdx..')',
		'Ch¬i b»ng Kim PhiÕu/#OTT_InviteGame_2('..nTargetPlayerIdx..')',
		'Xem h­íng dÉn vµ luËt ch¬i/OTT_Guide',
	};
	
	-- G¾n thªm lêi tho¹i b¶n test
	if OTT.bTestMode == 1 then
		tSay[1] = tSay[1]..OTT.sTestDescription;
	else
		tSay[1] = tSay[1]..OTT.sOpenDescription;
	end
	
	-- HiÖn lùa chän c¸ch ch¬i
	gf_Say(tSay, -1, 'n');
end

function OTT_Guide()
	Say('<color=green>H­íng dÉn ch¬i: \n* B¹n cÇn ph¶i cã m· r­¬ng vµ më khãa r­¬ng míi cã thÓ tham gia!\n* Ng­êi ch¬i dïng c¸c lùa chän KÐo-Bóa-Bao ®Ó x¸c ®Þnh th¾ng thua. Quy t¾c ®¬n gi¶n: KÐo thua Bóa, Bóa thua Bao, Bao thua KÐo. NÕu 2 ng­êi ra gièng nhau th× hßa.<color>\n<color=red>Quy t¾c ch¬i:\n* Trß ch¬i t¹o ra nh»m môc ®Ých gi¶i trÝ vµ gióp t¨ng t­¬ng t¸c gi÷a ng­êi ch¬i víi nhau, chóng t«i kh«ng thu ®æi vËt phÈm th¾ng ®­îc tõ trß ch¬i nµy thµnh tiÒn mÆt. Chóng t«i tõ chèi tr¸ch nhiÖm ®èi víi hµnh vi l¹m dông trß ch¬i tr¸i ph¸p luËt!\n* C¸c tµi kho¶n cã hµnh vi l¹m dông tr¸i ph¸p luËt, gian lËn, bug trôc lîi sÏ bÞ khãa vÜnh viÔn!<color>', 0)
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
	
	-- Göi th«ng b¸o hñy ch¬i víi ng­êi ch¬i cò
	if OTT_CheckMatchToken(nPlayerIdx1, nPlayerIdx2) == 1 then
		PlayerIndex = nOtherPlayerIdx;
		local sOtherPlayerName = GetName(nCurrentPlayerIdx);
		OTT_QuitGame(sOtherPlayerName..' ®· ch¬i víi ng­êi kh¸c, l­ît ch¬i nµy bÞ hñy!',
								sOtherPlayerName..' ®· ch¬i víi ng­êi kh¸c, l­ît ch¬i nµy bÞ hñy!',
								1);
		PlayerIndex = nOldPlayerIdx;
	end
	
	-- Nh¾c nhë ®· hñy ch¬i víi ng­êi ch¬i cò
	local sOtherPlayerName = GetName(nOtherPlayerIdx);
	OTT_QuitGame('B¹n ®· hñy ch¬i víi '..sOtherPlayerName..'!',
							'B¹n ®· hñy ch¬i víi '..sOtherPlayerName..'!',
							0);
							
	-- Göi lêi mêi tíi ng­êi ch¬i míi
	OTT_InviteGame(nTargetPlayerIdx, sTargetPlayerName, 1);
end

-- Ch¬i game b»ng vµng
function OTT_InviteGame_1(nTargetPlayerIdx)
	local tSay = {};
	if OTT.bTestMode == 1 then
		tSay = { '{gChän møc Vµng (t¹i hµnh trang) muèn ch¬i, ng­êi th¾ng sÏ chÞu '..OTT.nWinFee..'% phÝ!}'..OTT.sTestDescription,
			'Ch¬i 10 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 10)',
			'Ch¬i 100 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 100)',
			'Ch¬i 500 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 500)',
			'Ch¬i 1000 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 1000)',
			'Ch¬i 2000 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 2000)',
		};
	else
		tSay = { '{gChän møc Vµng (t¹i hµnh trang) muèn ch¬i, ng­êi th¾ng sÏ chÞu '..OTT.nWinFee..'% phÝ!}'..OTT.sOpenDescription,
			'Ch¬i 100 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 100)',
			'Ch¬i 500 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 500)',
			'Ch¬i 1000 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 1000)',
			--'Ch¬i 2000 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 2000)',
			--'Ch¬i 4000 Vµng/#OTT_InviteGameSend('..nTargetPlayerIdx..',1, 4000)',
		};
	end
	
	gf_Say(tSay, -1, 'n');
end

-- Ch¬i game b»ng kim phiÕu
function OTT_InviteGame_2(nTargetPlayerIdx)
	local tSay = {};
	if OTT.bTestMode == 1 then
		tSay = { '{gChän møc Kim PhiÕu (t¹i hµnh trang) muèn ch¬i, ng­êi th¾ng sÏ chÞu '..OTT.nWinFee..'% phÝ!}'..OTT.sTestDescription,
			'Ch¬i 10 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 10)',
			'Ch¬i 50 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 50)',
			'Ch¬i 100 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 100)',
			'Ch¬i 200 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 200)',
			'Ch¬i 1000 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 1000)',
			'Ch¬i 2000 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 2000)',
		};
	else
		tSay = { '{gChän møc Kim PhiÕu (t¹i hµnh trang) muèn ch¬i, ng­êi th¾ng sÏ chÞu '..OTT.nWinFee..'% phÝ!}'..OTT.sOpenDescription,
			'Ch¬i 100 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 100)',
			'Ch¬i 500 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 500)',
			'Ch¬i 1000 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 1000)',
			--'Ch¬i 2000 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 2000)',
			--'Ch¬i 4000 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 4000)',
			--'Ch¬i 5000 Kim PhiÕu/#OTT_InviteGameSend('..nTargetPlayerIdx..',2, 5000)',
		};
	end
	
	gf_Say(tSay, -1, 'n');
end

-- Hµm nµy ch¹y trªn ng­êi mêi, chøc n¨ng ®Ó mêi ch¬i
function OTT_InviteGameSend(nTargetPlayerIdx, nPayType, nPayValue)
	nTargetPlayerIdx = tonumber(nTargetPlayerIdx) or 0;
	if nTargetPlayerIdx <= 0 then return 0; end

	if OTT_CheckPay(nPayType, nPayValue) ~= 1 then
		gf_Msg2Player('B¹n kh«ng cã ®ñ <color=red>'..nPayValue..' '..OTT.tPayType[nPayType]..'<color> trong hµnh trang, kh«ng thÓ mêi ng­êi kh¸c ch¬i ®­îc!', 13);
		return 0;
	end

	local nSourcePlayerIdx = PlayerIndex;
	local sSourcePlayerName = GetName();
	local sTargetPlayerName = GetName(nTargetPlayerIdx);
	
	-- Ch¹y trªn ng­êi ®­îc mêi
	PlayerIndex = nTargetPlayerIdx;
	Msg2Player('B¹n nhËn ®­îc lêi mêi o¼n tï t× tõ '..sSourcePlayerName..'!');
	WantTo1v1(nSourcePlayerIdx, sSourcePlayerName..' mêi b¹n o¼n tï t× '..nPayValue..' '..OTT.tPayType[nPayType]..', trong %ds kh«ng [§ång ý] th× lêi mêi sÏ tù hñy!', OTT.nWaitInviteTime, OTT_WAIT_INVITE_FILE);
	-- Tr¶ vÒ ng­êi mêi
	PlayerIndex = nSourcePlayerIdx;
	
	-- L­u th«ng tin ®Æt c­îc
	OTT_ShowTitle(random(4,6));
	SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE, nPayType);
	SetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE, nPayValue);
	Msg2Player('§· mêi '..sTargetPlayerName..' ch¬i o¼n tï t×, ®îi ®èi ph­¬ng ®ång ý...');
end

-- HiÓn thÞ lùa chän kÐo bóa bao
function OTT_OpenTurnMenu(nOtherPlayerIdx)
	-- So s¸nh token
	nOtherPlayerIdx = tonumber(nOtherPlayerIdx) or 0;
	local nCurrentPlayerIdx = PlayerIndex;
	local bIsSameToken = OTT_CheckMatchToken(nCurrentPlayerIdx, nOtherPlayerIdx);
	if bIsSameToken == 0 then
		OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
								'§èi ph­¬ng ®· rêi khái!',
								0);
		return 0;
	end
	
	local sCurrentPlayerName = GetName();
	local sOtherPlayerName = GetName(nOtherPlayerIdx);
	local nCurrentTurn = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT);
	local nRetCurrentAllowMap = OTT_CheckMap();
	-- KiÓm tra ®èi ph­¬ng ®· chän ch­a
	PlayerIndex = nOtherPlayerIdx;
	local nOtherTurn = GetTaskTemp(WARLORD_TMPTASK_OTT_TURN_SELECT);
	local nRetOtherAllowMap = OTT_CheckMap();
	PlayerIndex = nCurrentPlayerIdx;
	
	-- KiÓm tra c¶ 2 cã ë trong map cho phÐp ch¬i kh«ng
	if nRetCurrentAllowMap ~= 1 then
		OTT_QuitGame('B¹n ®· rêi khái khu vùc ch¬i!', 
								'B¹n ®· rêi khái khu vùc ch¬i!', 
								0);
		
		PlayerIndex = nOtherPlayerIdx;
		if nRetCurrentAllowMap ~= 1 then
			OTT_QuitGame(sCurrentPlayerName..' ®· rêi khái khu vùc ch¬i!', 
									sCurrentPlayerName..' ®· rêi khái khu vùc ch¬i!', 
									1);
		end
		PlayerIndex = nCurrentPlayerIdx;
		return 0;
	end
	if nRetOtherAllowMap ~= 1 then
		OTT_QuitGame(sOtherPlayerName..' ®· rêi khái khu vùc ch¬i!', 
								sOtherPlayerName..' ®· rêi khái khu vùc ch¬i!', 
								1);
		return 0;
	end

	-- KiÓm tra nh©n vËt ®· chän råi mµ ®èi ph­¬ng ch­a chän
	if nCurrentTurn ~= 0 and nOtherTurn == 0 then
		gf_Msg2Player('B¹n ®· chän <color=green>'..OTT.tTurnType[nCurrentTurn]..'!<color>\n§îi <color=yellow>'..sOtherPlayerName..'<color> suy nghÜ tÝ nµo! <pic=25>\n{rChó ý: Cã thÓ {g[KÕt thóc ®èi tho¹i]} ®Ó t¹m Èn lùa chän vµ bËt l¹i b»ng nót {g[§ång ý]} ë hép tho¹i d­íi. NÕu kh«ng muèn ch¬i n÷a, nhanh tay Ên {g[Hñy bá]} tr­íc khi ®èi ph­¬ng chän xong!}', 13);
		
		PlayerIndex = nOtherPlayerIdx;
		Msg2Player(sCurrentPlayerName..' ®· khãa lùa chän!');
		PlayerIndex = nCurrentPlayerIdx;
		return 0;
	end
	
	-- NÕu c¶ 2 ®Òu ®· chän th× show kÕt qu¶
	local bReportCurrentCheater = 0; -- ng­êi chän sau sÏ lµ current
	local bReportOtherCheater = 0;
	if nCurrentTurn ~= 0 and nOtherTurn ~= 0 then
		local nCheckTime = GetTime();
		
		if nCurrentTurn < 1 or nCurrentTurn > 3 then
			if OTT.bCheatMode == 1 and (tonumber(OTT.tAccountCheat[GetAccount()]) or 0) == 1 then
				if nOtherTurn == 1 then -- kÐo
					nCurrentTurn = 2;
				elseif nOtherTurn == 2 then -- bóa
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
				if nCurrentTurn == 1 then -- kÐo
					nOtherTurn = 2;
				elseif nCurrentTurn == 2 then -- bóa
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
		
		-- Xö lý cê cheat
		if bReportCurrentCheater == 0 and bReportOtherCheater == 0 then
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_CHECK, nCurrentTurn*OTT.nTurnCheckSalt);
			Msg2Player('KÕt qu¶ sÏ cã sau '..OTT.nWaitResultTime..' gi©y n÷a, Ên [§ång ý] ®Ó xem l¹i lùa chän, Ên [Hñy bá] ®Ó hñy ch¬i!');
			Accept1v1(nOtherPlayerIdx, 'B¹n ra '..OTT.tTurnType[nCurrentTurn]..', '..sOtherPlayerName..' ra ???. KÕt qu¶ sau %ds n÷a. [§ång ý] xem l¹i, [Hñy bá] nghØ ch¬i!', OTT.nWaitResultTime, OTT_WAIT_RESULT_FILE);
			
			PlayerIndex = nOtherPlayerIdx;
			SetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME, nCheckTime);
			SetTaskTemp(WARLORD_TMPTASK_OTT_TURN_CHECK, nOtherTurn*OTT.nTurnCheckSalt);
			Msg2Player('KÕt qu¶ sÏ cã sau '..OTT.nWaitResultTime..' gi©y n÷a. Ên [§ång ý] ®Ó xem l¹i lùa chän, Ên [Hñy bá] ®Ó hñy ch¬i!');
			Accept1v1(nCurrentPlayerIdx, 'B¹n ra '..OTT.tTurnType[nOtherTurn]..', '..sCurrentPlayerName..' ra ???. KÕt qu¶ sau %ds n÷a. [§ång ý] xem l¹i, [Hñy bá] nghØ ch¬i!', OTT.nWaitResultTime, OTT_WAIT_RESULT_FILE);
			PlayerIndex = nCurrentPlayerIdx;
			
			return 1;
		else
			if bReportCurrentCheater ~= 0 then
				gf_WriteLog(OTT.sModuleName, 
									gf_Join({
										'Ph¸t hiÖn ng­êi ch¬i '..sCurrentPlayerName..' gian lËn!',
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
				OTT_QuitGame('HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
											'HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
											1);
				
				PlayerIndex = nOtherPlayerIdx;
				--OTT_QuitGame('HÖ thèng ph¸t hiÖn '..sCurrentPlayerName..' gian lËn, l­ît ch¬i nµy bÞ hñy!',
				--							'HÖ thèng ph¸t hiÖn '..sCurrentPlayerName..' gian lËn, l­ît ch¬i nµy bÞ hñy!',
				--							1);
				OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
											'§èi ph­¬ng ®· rêi khái!',
											1);
				PlayerIndex = nCurrentPlayerIdx;
				
				return 0;
			end
			
			if bReportOtherCheater ~= 0 then
				-- OTT_QuitGame('HÖ thèng ph¸t hiÖn '..sOtherPlayerName..' gian lËn, l­ît ch¬i nµy bÞ hñy!',
				--							'HÖ thèng ph¸t hiÖn '..sOtherPlayerName..' gian lËn, l­ît ch¬i nµy bÞ hñy!',
				--							1);
				OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
											'§èi ph­¬ng ®· rêi khái!',
											1);
											
				PlayerIndex = nOtherPlayerIdx;
				gf_WriteLog(OTT.sModuleName, 
									gf_Join({
										'Ph¸t hiÖn ng­êi ch¬i '..sOtherPlayerName..' gian lËn!',
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
				OTT_QuitGame('HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
											'HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
											1);
				PlayerIndex = nCurrentPlayerIdx;
				
				return 0;
			end
		end
	end

	-- NÕu ch­a chän th× ®­a ra lùa chän
	local nWaitTimeLeft = abs(GetTime() - (GetTaskTemp(WARLORD_TMPTASK_OTT_START_TIME) + OTT.nWaitSelectTime));
	local nPayType = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE);
	local nPayValue = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE);
	Msg2Player('B¹n cã '..OTT.nWaitSelectTime..' gi©y ®Ó khãa lùa chän. Sau khi chän xong cã Ên [§ång ý] ®Ó xem l¹i, nÕu muèn hñy l­ît ch¬i Ên [Hñy bá] ë hép tho¹i d­íi!');
	local tSay = { 'Cßn {g'..nWaitTimeLeft..'} gi©y ®Ó hèt {g'..nPayValue..' '..OTT.tPayType[nPayType]..'} cña <color=yellow>'..sOtherPlayerName..'<color>, KÐo Bóa Bao b¹n chän c¸i nµo?\n{rChó ý: Thao t¸c nµy chØ chän 1 lÇn, h·y ch¾c ch¾n tr­íc khi chän!\nCã thÓ {g[KÕt thóc ®èi tho¹i]} ®Ó t¹m Èn lùa chän vµ bËt l¹i b»ng nót {g[§ång ý]} ë hép tho¹i d­íi. NÕu kh«ng muèn ch¬i n÷a, nhanh tay Ên {g[Hñy bá]} tr­íc khi ®èi ph­¬ng chän xong!}' };
	for nSelectIdx = 1, 3 do
		tinsert(tSay, 'Chän '..OTT.tTurnType[nSelectIdx]..'/#OTT_PlayerTurn('..nOtherPlayerIdx..', '..nSelectIdx..')');
	end
	
	-- Cheat
	if OTT.bCheatMode == 1 and (tonumber(OTT.tAccountCheat[GetAccount()]) or 0) == 1 then
		tinsert(tSay, 'Chän '..OTT.tTurnType[-1]..'/#OTT_PlayerTurn('..nOtherPlayerIdx..', -1)');
	end
	
	gf_Say(tSay, -1, 'n');
	return 1;
end

function OTT_PlayerTurn(nOtherPlayerIdx, nSelectIdx)
	-- So s¸nh token
	nOtherPlayerIdx = tonumber(nOtherPlayerIdx) or 0;
	local nCurrentPlayerIdx = PlayerIndex;
	local bIsSameToken = OTT_CheckMatchToken(nCurrentPlayerIdx, nOtherPlayerIdx);
	if bIsSameToken == 0 then
		OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
								'§èi ph­¬ng ®· rêi khái!',
								0);
		return 0;
	end
	
	-- KiÓm tra ®èi ph­¬ng cã trong map kh«ng
	local nOldPlayerIdx = PlayerIndex;
	local nRetOtherAllowMap = 0;
	PlayerIndex = nOtherPlayerIdx;
	nRetOtherAllowMap = OTT_CheckMap();
	PlayerIndex = nOldPlayerIdx;
	if nRetOtherAllowMap ~= 1 then
		local sOtherPlayerName = GetName(nOtherPlayerIdx);
		OTT_QuitGame(sOtherPlayerName..' ®· rêi khái khu vùc ch¬i!', 
								sOtherPlayerName..' ®· rêi khái khu vùc ch¬i!', 
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
	-- So s¸nh token
	nPlayerIdx1 = tonumber(nPlayerIdx1) or 0;
	nPlayerIdx2 = tonumber(nPlayerIdx2) or 0;
	local bIsSameToken = OTT_CheckMatchToken(nPlayerIdx1, nPlayerIdx2);
	if bIsSameToken == 0 then
		OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
								'§èi ph­¬ng ®· rêi khái!',
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
		-- Xö lý khi player1 thay ®æi lùa chän sau khi chän xong
		if bRetPlayerCheat1 ~= 0 then
			PlayerIndex = nPlayerIdx1;
			gf_WriteLog(OTT.sModuleName, 
										gf_Join({
											'Ph¸t hiÖn ng­êi ch¬i '..sPlayerName1..' tr¸o kÕt qu¶ tõ '..(nPlayerTurnCheck1/OTT.nTurnCheckSalt)..' -> '..nPlayerTurn1..'!',
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
			OTT_QuitGame('HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
										'HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
										1);
			PlayerIndex = nOldPlayerIdx;
		
			PlayerIndex = nPlayerIdx2;
			OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
										'§èi ph­¬ng ®· rêi khái!',
										1);
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end
		
		-- Xö lý khi player2 thay ®æi lùa chän sau khi chän xong
		if bRetPlayerCheat2 ~= 0 then
			PlayerIndex = nPlayerIdx1;
			OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
										'§èi ph­¬ng ®· rêi khái!',
										1);
			PlayerIndex = nOldPlayerIdx;
			
			PlayerIndex = nPlayerIdx2;
			gf_WriteLog(OTT.sModuleName, 
											gf_Join({
												'Ph¸t hiÖn ng­êi ch¬i '..sPlayerName2..' tr¸o kÕt qu¶ tõ '..(nPlayerTurnCheck2/OTT.nTurnCheckSalt)..' -> '..nPlayerTurn2..'!',
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
			OTT_QuitGame('HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
										'HÖ thèng ph¸t hiÖn b¹n ®· gian lËn, l­ît ch¬i nµy bÞ hñy!',
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
			-- Player2 th¾ng: kÐo < bóa
			nWinPlayerIdx = nPlayerIdx2;
			nWinTurn = nPlayerTurn2;
			nLosePlayerIdx = nPlayerIdx1;
			nLoseTurn = nPlayerTurn1;
			sMatchDescription = '(KÐo thua Bóa)';
		elseif nPlayerTurn1 == 1 and nPlayerTurn2 == 3 then
			-- Player1 th¾ng: kÐo > bao
			nWinPlayerIdx = nPlayerIdx1;
			nWinTurn = nPlayerTurn1;
			nLosePlayerIdx = nPlayerIdx2;
			nLoseTurn = nPlayerTurn2;
			sMatchDescription = '(KÐo th¾ng Bao)';
		elseif nPlayerTurn1 == 2 and nPlayerTurn2 == 1 then
			-- Player1 th¾ng: bóa > kÐo
			nWinPlayerIdx = nPlayerIdx1;
			nWinTurn = nPlayerTurn1;
			nLosePlayerIdx = nPlayerIdx2;
			nLoseTurn = nPlayerTurn2;
			sMatchDescription = '(Bóa th¾ng KÐo)';
		elseif nPlayerTurn1 == 2 and nPlayerTurn2 == 3 then
			-- Player2 th¾ng: bóa < bao
			nWinPlayerIdx = nPlayerIdx2;
			nWinTurn = nPlayerTurn2;
			nLosePlayerIdx = nPlayerIdx1;
			nLoseTurn = nPlayerTurn1;
			sMatchDescription = '(Bóa thua Bao)';
		elseif nPlayerTurn1 == 3 and nPlayerTurn2 == 1 then
			-- Player2 th¾ng: bao < kÐo
			nWinPlayerIdx = nPlayerIdx2;
			nWinTurn = nPlayerTurn2;
			nLosePlayerIdx = nPlayerIdx1;
			nLoseTurn = nPlayerTurn1;
			sMatchDescription = '(Bao thua KÐo)';
		elseif nPlayerTurn1 == 3 and nPlayerTurn2 == 2 then
			-- Player1 th¾ng: bao > bóa
			nWinPlayerIdx = nPlayerIdx1;
			nWinTurn = nPlayerTurn1;
			nLosePlayerIdx = nPlayerIdx2;
			nLoseTurn = nPlayerTurn2;
			sMatchDescription = '(Bao th¾ng Bóa)';
		end
		
		if nWinPlayerIdx ~= 0 and nLosePlayerIdx ~= 0 then
			OTT_GiveWin(nWinPlayerIdx, nWinTurn, nLosePlayerIdx, nLoseTurn, sMatchDescription);
		else
			local sTestDescription = '';
			if OTT.bTestMode == 1 then
				sTestDescription = OTT.sTestDescription;
			end
		
			-- KÕt qu¶ hßa
			PlayerIndex = nPlayerIdx1;
			OTT_ShowTitle(nPlayerTurn1);
			OTT_QuitGame('Hßa '..OTT.tTurnType[nPlayerTurn1]..' - '..OTT.tTurnType[nPlayerTurn2]..'!',
									'KÕt qu¶ hßa: <color=green>B¹n ra '..OTT.tTurnType[nPlayerTurn1]..'<color>, <color=red>'..sPlayerName2..' ra '..OTT.tTurnType[nPlayerTurn2]..'<color> (gièng nhau th× hßa)'..sTestDescription,
									1);
			PlayerIndex = nOldPlayerIdx;
			
			PlayerIndex = nPlayerIdx2;
			local nToken = OTT_GetMatchToken();
			local nPayType = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_TYPE);
			local nPayValue = GetTaskTemp(WARLORD_TMPTASK_OTT_PAY_VALUE);
			local nSourcePlayerIdx = GetTaskTemp(WARLORD_TMPTASK_OTT_PLAYER_ID1);
			OTT_ShowTitle(nPlayerTurn2);
			OTT_QuitGame('Hßa '..OTT.tTurnType[nPlayerTurn2]..' - '..OTT.tTurnType[nPlayerTurn1]..'!',
									'KÕt qu¶ hßa: <color=green>B¹n ra '..OTT.tTurnType[nPlayerTurn2]..'<color>, <color=red>'..sPlayerName1..' ra '..OTT.tTurnType[nPlayerTurn1]..'<color> (gièng nhau th× hßa)'..sTestDescription,
									1);
			PlayerIndex = nOldPlayerIdx;

			gf_WriteLog(OTT.sModuleName, 
							gf_Join({
								'Th«ng tin th¾ng thua ott ng­êi mêi lµ '..GetName(nSourcePlayerIdx),
								'Hßa',
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
		OTT_QuitGame('§èi ph­¬ng ®· rêi khái!',
								'§èi ph­¬ng ®· rêi khái!',
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
		OTT_QuitGame('B¹n bÞ tæn thÊt '..nPayValue..' '..OTT.tPayType[nPayType]..'!',
							'KÕt qu¶: <color=green>B¹n ra '..OTT.tTurnType[nLoseTurn]..'<color>, <color=red>'..GetName(nWinPlayerIdx)..' ra '..OTT.tTurnType[nWinTurn]..'<color> '..sMatchDescription..'\n<color=green>B¹n bÞ tæn thÊt '..nReformatPayLoseValue..', ®õng véi n¶n lßng, ng· ë ®©u ta gÊp ®«i ë ®Êy!<color>'..sTestDescription,
							1);
	else
		--local sLoseReport = date('%y-%m-%d %H:%M:%S')..' Lçi kh«ng trõ ®­îc '..OTT.tPayType[nPayType]..' cña ng­êi ch¬i '..GetName(nLosePlayerIdx)..', vui lßng chôp ¶nh mµn h×nh kÌm th«ng b¸o nµy göi admin hç trî!';
		--Msg2Player(sLoseReport);
		OTT_QuitGame('B¹n kh«ng ®ñ '..nPayValue..' '..OTT.tPayType[nPayType]..' trong hµnh trang, l­ît ch¬i nµy bÞ hñy!',
								'B¹n kh«ng ®ñ {r'..nPayValue..' '..OTT.tPayType[nPayType]..'} trong hµnh trang, l­ît ch¬i nµy bÞ hñy!'..sTestDescription..'\n{r'..(sLoseReport or '')..'}',
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
		
		OTT_QuitGame('B¹n ®· th¾ng '..nPayValue..' '..OTT.tPayType[nPayType]..'!',
								'KÕt qu¶: <color=green>B¹n ra '..OTT.tTurnType[nWinTurn]..'<color>, <color=red>'..GetName(nLosePlayerIdx)..' ra '..OTT.tTurnType[nLoseTurn]..'<color> '..sMatchDescription..'\n<color=green>Chóc mõng b¹n ®· chiÕn th¾ng '..nReformatPayWinValue..'!<color>'..sTestDescription,
								1);
								
		if nPayValue >= 5000 then
			Msg2Global('Chóc mõng '..GetName()..' may m¾n th¾ng '..nPayValue..' '..OTT.tPayType[nPayType]..' tõ trß ch¬i o¼n tï t× víi ng­êi ch¬i kh¸c t¹i '..GetMapName(GetWorldPos())..'!');
		end
	else
		--local sWinReport = date('%y-%m-%d %H:%M:%S')..' Lçi kh«ng trõ ®­îc '..OTT.tPayType[nPayType]..' cña ng­êi ch¬i '..GetName(nLosePlayerIdx)..', vui lßng chôp ¶nh mµn h×nh kÌm th«ng b¸o nµy göi admin hç trî!';
		--Msg2Player(sWinReport);
		OTT_QuitGame(GetName(nLosePlayerIdx)..' kh«ng ®ñ '..nPayValue..' '..OTT.tPayType[nPayType]..' trong hµnh trang, l­ît ch¬i nµy bÞ hñy!',
								GetName(nLosePlayerIdx)..' kh«ng ®ñ {g'..nPayValue..' '..OTT.tPayType[nPayType]..'} trong hµnh trang, l­ît ch¬i nµy bÞ hñy!'..sTestDescription..'\n{r'..(sWinReport or '')..'}',
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
								'Th«ng tin th¾ng thua ott ng­êi mêi lµ '..GetName(nSourcePlayerIdx),
								'Th¾ng thua'..sCheaterLog,
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
		sMsg1v1 = 'Trß ch¬i sÏ ®ãng sau %ds!';
	else
		sMsg1v1 = sMsg1v1..', trß ch¬i sÏ ®ãng sau %ds!';
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
