----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: Khai b�o c�c bi�n m�i tr��ng
----------------------------------------------------------------------------------------------------
WEnv = {};
----------------------------------------------------------------------------------------------------

-- Th�i gian
WEnv.GAME_FPS = 18; -- 1 gi�y = 18frame
WEnv.SECOND = "gi�y";
WEnv.MINUTE = "ph�t";
WEnv.HOUR = "gi�";
WEnv.DAY = "ng�y";
WEnv.WEEK = "tu�n";
WEnv.MONTH = "th�ng";
WEnv.YEAR = "n�m";

-- Ti�n t�
WEnv.MONEY_GOLD = 1;
WEnv.MONEY_SLIVERCOUPON = 2;
WEnv.MONEY_GOLDCOUPON = 3;
WEnv.MONEY_NAMES = {
    [WEnv.MONEY_GOLD] = "v�ng",
    [WEnv.MONEY_SLIVERCOUPON] = "ng�n phi�u",
    [WEnv.MONEY_GOLDCOUPON] = "kim phi�u",
};

-- Gi�i t�nh
WEnv.SEX_MALE = 1;
WEnv.SEX_FEMALE = 2;
WEnv.SEX_NAMES = {
    [WEnv.SEX_MALE] = "nam",
    [WEnv.SEX_FEMALE] = "n�",
};

-- Ng� h�nh
WEnv.SERIES_NONE = 0;
WEnv.SERIES_METAL = 1;
WEnv.SERIES_WOOD = 2;
WEnv.SERIES_WATER = 3;
WEnv.SERIES_FIRE = 4;
WEnv.SERIES_EARTH = 5;
WEnv.SERIES_NAMES = {
    [WEnv.SERIES_NONE] = "V� h�",
    [WEnv.SERIES_METAL] = "Kim",
    [WEnv.SERIES_WOOD] = "M�c",
    [WEnv.SERIES_WATER] = "Th�y",
    [WEnv.SERIES_FIRE] = "H�a",
    [WEnv.SERIES_EARTH] = "Th�",
};

-- Bi�n l��ng
WEnv.TRUE = 1;
WEnv.FALSE = 0;
WEnv.NULL = nil;
WEnv.RETCODE_SUCCESS = 0;
WEnv.RETCODE_ERROR = -1;
WEnv.RETCODE_UNDEFINE = -2;
WEnv.RETCODE_BOXLOCK = -3;
WEnv.RETCODE_NOTOPEN = -4;
WEnv.RETCODE_NEEDCONFIRM = -5;
WEnv.RETCODE_NEEDROOM = -6;
WEnv.RETCODE_CONSUMEERROR = -7;
WEnv.RETCODE_NOTMATCH = -8;
WEnv.RETCODE_NEEDLEVEL = -9;
WEnv.RETCODE_USELIMIT = -10;
WEnv.RETCODE_OVERTIME = -11;
WEnv.RETCODE_ROUTE = -12;
WEnv.RETCODE_DENY = -13;

WEnv.BATTLECAMP_ALL = 0;
WEnv.BATTLECAMP_TONG = 1;
WEnv.BATTLECAMP_LIEU = 2;
WEnv.BATTLECAMP_NAMES = {
    [WEnv.BATTLECAMP_ALL] = "T�t c�",
    [WEnv.BATTLECAMP_TONG] = "T�ng",
    [WEnv.BATTLECAMP_LIEU] = "Li�u",
};

WEnv.BATTLERESULT_DRAW = 0;
WEnv.BATTLERESULT_WIN = 1;
WEnv.BATTLERESULT_LOSE = 2;
WEnv.BATTLERESULT_NAMES = {
    [WEnv.BATTLERESULT_DRAW] = "H�a",
    [WEnv.BATTLERESULT_WIN] = "Th�ng",
    [WEnv.BATTLERESULT_LOSE] = "Thua",
};
