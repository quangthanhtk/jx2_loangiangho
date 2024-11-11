----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: Khai b¸o c¸c biÕn m«i tr­êng
----------------------------------------------------------------------------------------------------
WEnv = {};
----------------------------------------------------------------------------------------------------

-- Thêi gian
WEnv.GAME_FPS = 18; -- 1 gi©y = 18frame
WEnv.SECOND = "gi©y";
WEnv.MINUTE = "phót";
WEnv.HOUR = "giê";
WEnv.DAY = "ngµy";
WEnv.WEEK = "tuÇn";
WEnv.MONTH = "th¸ng";
WEnv.YEAR = "n¨m";

-- TiÒn tÖ
WEnv.MONEY_GOLD = 1;
WEnv.MONEY_SLIVERCOUPON = 2;
WEnv.MONEY_GOLDCOUPON = 3;
WEnv.MONEY_NAMES = {
    [WEnv.MONEY_GOLD] = "vµng",
    [WEnv.MONEY_SLIVERCOUPON] = "ng©n phiÕu",
    [WEnv.MONEY_GOLDCOUPON] = "kim phiÕu",
};

-- Giíi tÝnh
WEnv.SEX_MALE = 1;
WEnv.SEX_FEMALE = 2;
WEnv.SEX_NAMES = {
    [WEnv.SEX_MALE] = "nam",
    [WEnv.SEX_FEMALE] = "n÷",
};

-- Ngò hµnh
WEnv.SERIES_NONE = 0;
WEnv.SERIES_METAL = 1;
WEnv.SERIES_WOOD = 2;
WEnv.SERIES_WATER = 3;
WEnv.SERIES_FIRE = 4;
WEnv.SERIES_EARTH = 5;
WEnv.SERIES_NAMES = {
    [WEnv.SERIES_NONE] = "V« hÖ",
    [WEnv.SERIES_METAL] = "Kim",
    [WEnv.SERIES_WOOD] = "Méc",
    [WEnv.SERIES_WATER] = "Thñy",
    [WEnv.SERIES_FIRE] = "Háa",
    [WEnv.SERIES_EARTH] = "Thæ",
};

-- BiÕn l­îng
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
    [WEnv.BATTLECAMP_ALL] = "TÊt c¶",
    [WEnv.BATTLECAMP_TONG] = "Tèng",
    [WEnv.BATTLECAMP_LIEU] = "Liªu",
};

WEnv.BATTLERESULT_DRAW = 0;
WEnv.BATTLERESULT_WIN = 1;
WEnv.BATTLERESULT_LOSE = 2;
WEnv.BATTLERESULT_NAMES = {
    [WEnv.BATTLERESULT_DRAW] = "Hßa",
    [WEnv.BATTLERESULT_WIN] = "Th¾ng",
    [WEnv.BATTLERESULT_LOSE] = "Thua",
};
