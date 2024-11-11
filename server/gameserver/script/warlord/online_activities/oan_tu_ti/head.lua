----------------------------------------------------------------------------------------------------
-- Author: Long Thai
-- Modified: 2021-07-30
-- Description: §©y lµ néi dung chøa th«ng tin configs
----------------------------------------------------------------------------------------------------

OTT = {
	sModuleName = 'OTT',
	bTestMode = 1,
	sTestDescription = '\nHiÖn trß ch¬i ®ang trong qu¸ tr×nh thö nghiÖm, nÕu ph¸t hiÖn lçi, bug h·y b¸o ngay cho admin ®Ó nhËn th­ëng nãng nhÐ!',
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
		[1] = 'Vµng',
		[2] = 'Kim PhiÕu',
	},
	tTurnType = {
		[-1] = 'xong',
		[1] = 'KÐo',
		[2] = 'Bóa',
		[3] = 'Bao',
	},
	tPlayerState = {
		[0] = 'ch­a ®Þnh nghÜa',
		[1] = 'ngñ, bµy b¸n, luyÖn s¸ch hoÆc ñy th¸c',
		[2] = 'chiÕn ®Êu hoÆc tû vâ',
		[3] = 'ch¬i víi ng­êi kh¸c',
	},
	tAllowMap = {
		--[100] = 'TuyÒn Ch©u',
		[200] = 'BiÖn Kinh',
		--[300] = 'Thµnh §«',
		--[350] = 'T­¬ng D­¬ng',
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
