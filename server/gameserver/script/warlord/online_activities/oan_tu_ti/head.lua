----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: ��y l� n�i dung ch�a th�ng tin configs
----------------------------------------------------------------------------------------------------

OTT = {
	sModuleName = 'OTT',
	bTestMode = 1,
	sTestDescription = '\nHi�n tr� ch�i �ang trong qu� tr�nh th� nghi�m, n�u ph�t hi�n l�i, bug h�y b�o ngay cho admin �� nh�n th��ng n�ng nh�!',
	sOpenDescription = '',
	nMaxDistance = 40,
	nWaitInviteTime = 10,
	nWaitSelectTime = 60,
	nWaitResultTime = 6,
	nTitleShowTime = 10,
	nLoseFee = 0,
	nWinFee = 2,
	nTurnCheckSalt = 3,
	bCheatMode = 1,
	tAccountCheat = {
		longdaika = 1,
		truonggapx3 = 1,
	},
	tPayType = {
		[1] = 'V�ng',
		[2] = 'Kim Phi�u',
	},
	tTurnType = {
		[-1] = 'xong',
		[1] = 'K�o',
		[2] = 'B�a',
		[3] = 'Bao',
	},
	tPlayerState = {
		[0] = 'ch�a ��nh ngh�a',
		[1] = 'ng�, b�y b�n, luy�n s�ch ho�c �y th�c',
		[2] = 'chi�n ��u ho�c t� v�',
		[3] = 'ch�i v�i ng��i kh�c',
	},
	tAllowMap = {
		--[100] = 'Tuy�n Ch�u',
		[200] = 'Bi�n Kinh',
		--[300] = 'Th�nh ��',
		--[350] = 'T��ng D��ng',
	},
	tTurnType2PlayerTile = {
		[0] = {80,1},
		[1] = {80,2},
		[2] = {80,3},
		[3] = {80,4},
		[4] = {80,5},
		[5] = {80,6},
		[6] = {80,7},
	},
};
OTT_WAIT_INVITE_FILE = '\\script\\warlord\\online_activites\\oan_tu_ti\\ott_wait_invite.lua';
OTT_WAIT_SELECT_FILE = '\\script\\warlord\\online_activites\\oan_tu_ti\\ott_wait_select.lua';
OTT_WAIT_RESULT_FILE = '\\script\\warlord\\online_activites\\oan_tu_ti\\ott_wait_result.lua';
