----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2021-05-16
--- Description: File n�y d�ng �� ��ng k� task cho nh�n v�t
--- C�c task c� th� d�ng ���c:
--- Vng hi�n �ang s� d�ng task t� 256, 272, max l� 511
--- N�n s� d�ng trong kho�ng 400-511
----------------------------------------------------------------------------------------------------
WARLORD_TMPTASK_BEGIN = 400;
----------------------------------------------------------------------------------------------------

-- Start perfect dodge system
WARLORD_TMPTASK_OBS_POINT_GS = WARLORD_TMPTASK_BEGIN + 1;
WARLORD_TMPTASK_PERFDODGE_ADD_SCRIPT = WARLORD_TMPTASK_BEGIN + 2;

WARLORD_TMPTASK_CUR_STAMINA_GS = WARLORD_TMPTASK_BEGIN + 3;
WARLORD_TMPTASK_MAX_STAMINA_GS = WARLORD_TMPTASK_BEGIN + 4;

WARLORD_TMPTASK_DEX_POINT_GS = WARLORD_TMPTASK_BEGIN + 5;
WARLORD_TMPTASK_DODGEPOINT_ADD_SCRIPT = WARLORD_TMPTASK_BEGIN + 6;

WARLORD_TMPTASK_RIDE_HITPOINT_SCRIPT = WARLORD_TMPTASK_BEGIN + 7;
WARLORD_TMPTASK_RIDE_ARMORPOINT_SCRIPT = WARLORD_TMPTASK_BEGIN + 8;

WARLORD_TMPTASK_MAGIC_PARMOR_BUFF = WARLORD_TMPTASK_BEGIN + 9;
WARLORD_TMPTASK_PHYSICAL_PARMOR_BUFF = WARLORD_TMPTASK_BEGIN + 10;
-- End perfect dodge system

WARLORD_TMPTASK_JAILPLAYER_TIMETICK = WARLORD_TMPTASK_BEGIN + 11;

WARLORD_TMPTASK_ON_BUFF_READSPEED = WARLORD_TMPTASK_BEGIN + 12;
WARLORD_TMPTASK_LAST_READSPEED_X2 = WARLORD_TMPTASK_BEGIN + 13;
WARLORD_TMPTASK_LAST_READSPEED_X4 = WARLORD_TMPTASK_BEGIN + 14;

WARLORD_TMPTASK_DEATHTIME = WARLORD_TMPTASK_BEGIN + 15;

-- Start H�i hoa ��ng
WARLORD_TMPTASK_DENLONG_CURRENT = WARLORD_TMPTASK_BEGIN + 16;
WARLORD_TMPTASK_DENLONG_DURATION = WARLORD_TMPTASK_BEGIN + 17;
-- End H�i hoa ��ng

-- Start Captcha
WTASKTEMP_TEMP_CAPTCHA = WARLORD_TMPTASK_BEGIN + 18;
WTASKTEMP_CAPTCHA_FAILED_COUNT = WARLORD_TMPTASK_BEGIN + 19;
WTASKTEMP_CAPTCHA_FAILED_DURATION = WARLORD_TMPTASK_BEGIN + 20;
-- End Captcha

-- Start OTT
WARLORD_TMPTASK_OTT_PAY_TYPE = WARLORD_TMPTASK_BEGIN + 21;
WARLORD_TMPTASK_OTT_PAY_VALUE = WARLORD_TMPTASK_BEGIN + 22;
WARLORD_TMPTASK_OTT_ON_GAME = WARLORD_TMPTASK_BEGIN + 23;
WARLORD_TMPTASK_OTT_STATUS = WARLORD_TMPTASK_BEGIN + 24;
WARLORD_TMPTASK_OTT_TURN_SELECT = WARLORD_TMPTASK_BEGIN + 25;
WARLORD_TMPTASK_OTT_TURN_CHECK = WARLORD_TMPTASK_BEGIN + 26;
WARLORD_TMPTASK_OTT_PLAYER_ID1 = WARLORD_TMPTASK_BEGIN + 27;
WARLORD_TMPTASK_OTT_PLAYER_ID2 = WARLORD_TMPTASK_BEGIN + 28;
WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART1 = WARLORD_TMPTASK_BEGIN + 29;
WARLORD_TMPTASK_OTT_MATCH_TOKEN_PART2 = WARLORD_TMPTASK_BEGIN + 30;
WARLORD_TMPTASK_OTT_START_TIME = WARLORD_TMPTASK_BEGIN + 31;
WARLORD_TMPTASK_OTT_WIN_BY_CHEAT = WARLORD_TMPTASK_BEGIN + 32;
-- End OTT

MASONMY_TMPTASK_HOI_PHU = WARLORD_TMPTASK_BEGIN + 33;

-- Ng�n vi�c ��o s�m nu�i r�ng 2 l�n k� nhau, l�n th� nh�t ch�a ��o xong m� ��o ti�p l�n 2 => m�t l��t
--MASONMY_TMPTASK_PLANT_DIG = WARLORD_TMPTASK_BEGIN + 34;
--MASONMY_TMPTASK_DRAGON_FEED = WARLORD_TMPTASK_BEGIN + 35;

WARLORD_TMPTASK_SYNC_MIN = WARLORD_TMPTASK_BEGIN + 36; -- L�u l�i t�ng s� l�n ch�y trigger 60s, s� b� reset n�u chuy�n gs
WARLORD_TMPTASK_SMS_SERVICE_IGNORE = WARLORD_TMPTASK_BEGIN + 37; -- Tr�ng th�i c�a vi�c nh�p m� Otp h� tr�

WARLORD_TMPTASK_TONGRESOURCES_NEW_LEVEL = WARLORD_TMPTASK_BEGIN + 38; -- L�u c�p t�m th�i c�n set T�i Nguy�n Bang H�i trong h�m callback
WARLORD_TMPTASK_TONGRESOURCES_DEDICATION_POINT = WARLORD_TMPTASK_BEGIN + 39; -- L�u s� �i�m ��ng g�p c�a T�i Nguy�n Bang H�i trong h�m callback
WARLORD_TMPTASK_TONGRESOURCES_PLAYERTITLE_D = WARLORD_TMPTASK_BEGIN + 40; -- L�u t�m th�i gi� tr� nDetail l� nLevel c�a playertitle T�i Nguy�n Bang H�i ph�c v� c�c h�m callback
WARLORD_TMPTASK_TONGRESOURCES_PLAYERTITLE_SELECTED = WARLORD_TMPTASK_BEGIN + 41; -- L�u t�m th�i gi� tr� nDanhHieuIdx c�a item title T�i Nguy�n Bang H�i ph�c v� c�c h�m callback

-- L�u th�i gian ��ng y�n t�i ch� trong chi�n tr��ng, task n�y s� ��m d�a v�o h�m BT_KickSleeper
WARLORD_TMPTASK_NEWBATTLE_STAND_TIME = WARLORD_TMPTASK_BEGIN + 42;

--- D��i n�y l� d�nh cho 2022
-- L�u id trang b� ��t v�o PutinItem trong script n�ng c�p ��, s� ���c d�ng trong h�m callback
WTASKTEMP_ITEMUPGRADE_TYPE_IDX = WARLORD_TMPTASK_BEGIN + 43;
WTASKTEMP_ITEMUPGRADE_PUTITEM1_IDX = WARLORD_TMPTASK_BEGIN + 44;
WTASKTEMP_ITEMUPGRADE_PUTITEM1_NUM = WARLORD_TMPTASK_BEGIN + 45;

-- L�u nh� c�ch m� r��ng
WTASKTEMP_RUONG_BNL_OPENTYPE = WARLORD_TMPTASK_BEGIN + 46; -- R��ng B�t Nh� L�n
WTASKTEMP_RUONG_LSB_OPENTYPE = WARLORD_TMPTASK_BEGIN + 47; -- R��ng ��a Huy�n Cung
WTASKTEMP_RUONG_DHC_OPENTYPE = WARLORD_TMPTASK_BEGIN + 48; -- R��ng ��a Huy�n Cung
WTASKTEMP_RUONG_KDYV_OPENTYPE = WARLORD_TMPTASK_BEGIN + 49; -- R��ng Ki�m ��ng Y�n V�n

WTASKTEMPID_CLICKNPC_TIMEOUT = WARLORD_TMPTASK_BEGIN + 50; -- T�nh th�i gian click npc

WTASKTEMPID_WEBSERVICE_IGNORE = WARLORD_TMPTASK_BEGIN + 51; -- B� qua th�ng b�o nh�p code cho ��n khi ��ng nh�p l�i

----------------------------------------------------------------------------------------------------
WARLORD_TMPTASK_END = 511;
