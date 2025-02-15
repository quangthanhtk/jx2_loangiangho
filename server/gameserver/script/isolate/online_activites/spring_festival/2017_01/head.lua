--不经常修改的配置项写这里
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\main.lua")

SF2017_DEBUG = 0        -- DEBUG模式开关，开启后使用【粗制火药】能够开启控制菜单，以及会显示一些服务器调试信息。外网注意关闭。
if 1 ~= IsKsGMSystemOpen() then
	SF2017_DEBUG = 0
end
SF2017_DATE_ACT1 = { 20170126, 20170201 } 
SF2017_DATE_ACT2 = { 20170126, 20170201 }
SF2017_DATE_ACT3 = { 20170128, 20170201 } -- 活动3
SF2017_DATE_ACT4_1 = { 20170118, 20170201 } -- 活动4_1
SF2017_DATE_ACT4_2 = { 20170118, 20170125 } -- 活动4_2
SF2017_DATE_ACT5 = { 20170126, 20170201 } -- 活动5

SF2017_SHOP_DATE1 = {20170126, 20170201 } --商店开放日期
SF2017_SHOP_DATE2 = {20170202, 20170208 }
SF2017_SHOP_TIME1 = {0,2400}            --在商店开放日期的开放时间
SF2017_SHOP_TIME2 = {0,2400}
SF2017_TREES = {
    szName = "Уo Hoa th�",
    szTemp = "Уo Hoa th�",
    tPos = {
        {200, 1346, 2849},{200, 1341, 2854},{200, 1336, 2859},{200, 1332, 2875},
        {200, 1337, 2880},{200, 1342, 2885},{200, 1361, 2903},{200, 1366, 2908},
        {200, 1370, 2913},{200, 1379, 2922},{200, 1389, 2904},{200, 1396, 2898},
        {200, 1401, 2892},{200, 1416, 2878},{200, 1421, 2873},{200, 1426, 2869},
        {200, 1430, 2863},{200, 1425, 2858},{200, 1418, 2852},{200, 1396, 2834},
        {200, 1391, 2829},{200, 1386, 2823},{200, 1379, 2816},{200, 1374, 2821},
        {200, 1369, 2826},{200, 1364, 2831},{300, 1729, 3497},{300, 1736, 3491},
        {300, 1740, 3498},{300, 1745, 3520},{300, 1750, 3506},{300, 1768, 3524},
        {300, 1773, 3528},{300, 1780, 3535},{300, 1784, 3540},{300, 1789, 3544},
        {300, 1807, 3563},{300, 1793, 3574},{300, 1787, 3578},{300, 1781, 3584},
        {300, 1775, 3589},{300, 1768, 3596},{300, 1751, 3584},{300, 1744, 3577},
        {300, 1738, 3572},{300, 1725, 3562},{300, 1719, 3556},{300, 1714, 3549},
        {300, 1702, 3538},{300, 1696, 3533},{300, 1704, 3523},{300, 1711, 3516},
        {100, 1444, 3007},{100, 1439, 3012},{100, 1433, 3018},{100, 1427, 3024},
        {100, 1421, 3018},{100, 1416, 3012},{100, 1396, 2994},{100, 1389, 2986},
        {100, 1384, 2981},{100, 1390, 2974},{100, 1394, 2969},{100, 1401, 2964},
        {100, 1419, 2945},{100, 1424, 2940},{100, 1429, 2936},{100, 1434, 2941},
        {100, 1440, 2947},{100, 1459, 2967},{100, 1464, 2973},{100, 1470, 2979},
        {100, 1465, 2983},{350, 1476, 2957},{350, 1481, 2962},{350, 1485, 2967},
        {350, 1490, 2971},{350, 1487, 2979},{350, 1482, 2985},{350, 1453, 3014},
        {350, 1446, 3021},{350, 1439, 3026},{350, 1434, 3022},{350, 1429, 3017},
        {350, 1424, 3012},{350, 1405, 2994},{350, 1399, 2987},{350, 1393, 2981},
        {350, 1387, 2975},{350, 1393, 2969},{350, 1400, 2962},{350, 1432, 2937},
        {350, 1439, 2931},{350, 1446, 2926},{350, 1452, 2931},{350, 1457, 2936},

    }
}

SF2017_FUSHEN = {
    szName = "Ph骳 Th莕",
    szTemp = "xnhd_fs",
    tPos = {
        [1] = {
            {100,1441,2785,"Tuy襫 Ch﹗"},{100,1400,2856,"Tuy襫 Ch﹗"},{100,1284,2953,"Tuy襫 Ch﹗"},{100,1256,2984,"Tuy襫 Ch﹗"},
            {100,1312,3023,"Tuy襫 Ch﹗"},{100,1301,3061,"Tuy襫 Ch﹗"},{100,1295,3113,"Tuy襫 Ch﹗"},{100,1378,3157,"Tuy襫 Ch﹗"},
            {100,1407,3054,"Tuy襫 Ch﹗"},{100,1435,3098,"Tuy襫 Ch﹗"},{100,1496,3160,"Tuy襫 Ch﹗"},{100,1543,3118,"Tuy襫 Ch﹗"},
            {100,1500,2966,"Tuy襫 Ch﹗"},{100,1576,3044,"Tuy襫 Ch﹗"},{100,1651,3010,"Tuy襫 Ch﹗"},{100,1587,2988,"Tuy襫 Ch﹗"},
        },
        [2] = {
            {200,1199,2802,"Bi謓 Kinh"},{200,1185,2905,"Bi謓 Kinh"},{200,1320,3001,"Bi謓 Kinh"},{200,1350,3056,"Bi謓 Kinh"},
            {200,1440,2954,"Bi謓 Kinh"},{200,1538,2951,"Bi謓 Kinh"},{200,1482,2875,"Bi謓 Kinh"},{200,1613,2861,"Bi謓 Kinh"},
            {200,1564,2842,"Bi謓 Kinh"},{200,1550,2813,"Bi謓 Kinh"},{200,1400,2678,"Bi謓 Kinh"},{200,1370,2615,"Bi謓 Kinh"},
            {200,1334,2657,"Bi謓 Kinh"},{200,1320,2695,"Bi謓 Kinh"},{200,1301,2830,"Bi謓 Kinh"},{200,1312,2914,"Bi謓 Kinh"},
        },
        [3] = {
            {300,1797,3359,"Th祅h Й"},{300,1748,3393,"Th祅h Й"},{300,1851,3419,"Th祅h Й"},{300,1942,3513,"Th祅h Й"},
            {300,1965,3569,"Th祅h Й"},{300,1881,3535,"Th祅h Й"},{300,1868,3615,"Th祅h Й"},{300,1812,3708,"Th祅h Й"},
            {300,1780,3778,"Th祅h Й"},{300,1766,3714,"Th祅h Й"},{300,1753,3637,"Th祅h Й"},{300,1633,3537,"Th祅h Й"},
            {300,1589,3586,"Th祅h Й"},{300,1636,3618,"Th祅h Й"},{300,1737,3475,"Th祅h Й"},
        },
        
    },
    nCnt = 0,           -- 记录当前福神已经发放了多少分奖品
    lim = 100,          -- 设置最多能放多少分奖品
    nLifeTime = 30*60,  -- 福神存在时间
    nHash = 0,          -- nHash值，不用管
}

SF2017_HDDS = {
    szName = "Чi S� Ho箃 чng Xu﹏ M韎",
    szTemp = "xnhd_cjhdds",
    tPos = {
        {100, 1429, 3000},
        {300, 1757, 3557},
        {200, 1385, 2894},
    }
}


SF2017_FLOWER = {2, 200, 71, 1, 4, "Hoa Уo"}
SF2017_CLOTHES = {
    {
        {0,108,985,1,"X輈h Vi猲 L閚g H筩 Quan"},
        {0,108,986,1,"X輈h Vi猲 L閚g H筩 Quan"},
        {0,108,987,1,"X輈h Vi猲 L閚g H筩 Quan"},
        {0,108,988,1,"X輈h Vi猲 L閚g H筩 Quan"},
    },
    {
        {0,109,985,1,"X輈h Vi猲 L閚g H筩 y"},
        {0,109,986,1,"X輈h Vi猲 L閚g H筩 y"},
        {0,109,987,1,"X輈h Vi猲 L閚g H筩 y"},
        {0,109,988,1,"X輈h Vi猲 L閚g H筩 y"},
    },
    {
        {0,110,985,1,"X輈h Vi猲 L閚g H筩 Trang"},
        {0,110,986,1,"X輈h Vi猲 L閚g H筩 Trang"},
        {0,110,987,1,"X輈h Vi猲 L閚g H筩 Trang"},
        {0,110,988,1,"X輈h Vi猲 L閚g H筩 Trang"},
    },
}
SF2017_TAOHUA_LIM = 10        --每天最多采多少次桃花
SF2017_TJL = {2, 97, 236, 1, "Thi猲 Ki猽 L謓h"}
SF2017_TGL = {2, 95, 204, 1, "Thi猲 Cang L謓h"}
SF2017_TMJL = {2, 1, 30370, 1, "Thi猲 M玭 Kim L謓h"}

SF2017_BYTE_DCTSK = {           -- 按字节存储变量设置（每日清空）
    taohua = 1, -- 每日采桃花
    fushen = 2, 
    firecrackers = 3,
    box = 4,    -- 每日拾取宝箱
}
SF2017_BYTE_TSK = {             -- 同上（不清空）
    get_clothes = 1,
    exc_clothes1 = 2,
    exc_clothes2 = 3,
    exc_clothes3 = 4,
}

SF2017_FIRE = {
    normal = {2,200,64,"H醓 Dc S� Ch�"},
    delicate = {2,200,65,"H醓 Dc Tinh Ch�"},
}
SF2017_FIRECRACKERS = {
    normal = {2,200,66,"Ph竜 S� Ch�"},
    delicate = {2,200,67,"Ph竜 Tinh Ch�"},
    nUselimit = 25,                     --每日使用粗制鞭炮的次数限制
}

SF2017_BOX = {
    szName      = "Rng Xu﹏ M韎",
    szTemp      = "xnhd_nsdkz",
    tPos        = {100,1408,3189},      -- 以这个坐标为圆心开始刷NPC
    tItem       = {2,200,63,"Rng Xu﹏ M韎"},
    nLifeTime   = 60,                   -- 存在一分钟
    nColdTime   = 60,                   -- 采集冷却时间，目的是让玩家在一波宝箱里只能拿一个
    nMaxLimit   = 3,                    -- 每天最多捡三个宝箱
}

SF2017_MONSTER = {
    szName      = "Ni猲 th�",
    szTemp      = "xnhd_ns",
    nHp         = 0,                    -- 临时缓存，还剩多少血
    nMaxHp      = 180000,--180000,      -- 年兽最大血量
    nFlag       = 0,                    -- 临时缓存2，距离上次刷宝箱这段时间里被打掉多少血
    nMaxFlag    = 9000,                 -- 每掉9000点血，刷一次宝箱
    nRefresh    = 0,                    -- 临时缓存3，每天刷了多少次
    nMaxRefresh = 3,                    -- 每天最多刷3次
    nLastDate   = 0,                    -- 上一次刷出来的日期，用来处理跨天
    nIdx        = 0,                    -- 保存npc的index
    tPos        = {100,1408,3189},      -- 位置
    isLife      = 0,                    -- 记录年兽现在是否活着
    nDeadTime   = -1,                   -- 啥时候死的
    nRefreshTime= 30*60,                -- 死后多久刷新 30min
    ActTime     = {{1200,1400},{1900,2400}},-- 年兽活动时间
    nSFX        = 952,                  -- 特效id
    DeadCnt     = 0,                    -- 记录年兽死了多少次
}

SF2017_CARD = {
    silver = {2,200,61,"Thi謕 B筩 Xu﹏ M韎"},
    gold   = {2,200,62,"Thi謕 V祅g Xu﹏ M韎"}
}

SF2017_MISSION = {
    low = {488,489,490,491,492,493,494,495},
    mid = {496,497,498,499,500,504,505,506,507,508,509,510,511,512,513},
    high = {501,502,503,514,515,516,517,518,519,520,521,522,523,524},
    limit = 20,                         -- 收费任务，每天最多20个
    nTJL = 2,                           -- 一次需要2个天骄令
}

SF2017_BOSS = {
    {"xnhd_bdj","B� o Tuy謙",309,1457,2953},
    {"xnhd_jjk","Qu﹏ Ki誱 Cu錸g",309,1269,2984},
    {"xnhd_hdzg","Huy詎 o T鎛g Qu秐",321,1704,3479},
    {"xnhd_hjzg","Huy詎 Ki誱 T鎛g Qu秐",321,1737,3203},
    {"xnhd_mlxztl","Th� L躰h Mi猽 L躰h Tu莕 Tr筰",408,1444,2797},
    {"xnhd_qzdymn","D� Mao Ng璾 Cng Tr竛g",408,1499,3023},
    {"xnhd_hyzg","H� 蕁 Чi T鎛g Qu秐",420,1527,3620},
    {"xnhd_dfr","Чi phu nh﹏",420,1577,3491},
    {"xnhd_sstl","S竧 Th� u L躰h",600,1364,3058},
    {"xnhd_gstl","Cung Th� u L躰h",600,1373,2912},
    {"xnhd_cykh","Th秓 Nguy猲 Kh綾 H穘",600,1540,2899},
    {"xnhd_yztm","D� T閏 u M鬰",601,1447,2963},
    {"xnhd_ljsl","Li猽 Qu﹏ Th� L躰h",602,1500,2988},
}

SF2017_FINISH_TASK = {
    [1] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },--+487
    [2] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [3] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [4] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [5] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [6] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [7] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [8] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [9] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [10] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [11] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [12] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [13] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [14] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [15] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [16] = { 300, "Чi S� Ho箃 чng Xu﹏ M韎" },
    [17] = { 300, "A Th辬h" },
    [18] = { 300, "Chu Thi謓 Nh﹏" },
    [19] = { 200, "T祇 Чi L鵦" },
    [20] = { 200, "V� Nng" },
    [21] = { 350, "H祅 Ngh躠" },
    [22] = { 350, "Trng 秐h" },
    [23] = { 150, "H� H莡 Anh" },
    [24] = { 150, "M穘h Nham " },
    [25] = { 100, "H� Ki謙" },
    [26] = { 100, "Chung Ph鉵g" },
    [27] = { 300, "A Th辬h" },
    [28] = { 300, "Chu Thi謓 Nh﹏" },
    [29] = { 200, "T祇 Чi L鵦" },
    [30] = { 200, "V� Nng" },
    [31] = { 350, "H祅 Ngh躠" },
    [32] = { 350, "Trng 秐h" },
    [33] = { 350, "L鬰 Tr骳 g" },
    [34] = { 200, "V� Nng" },
    [35] = { 300, "Th莥 b鉯" },
    [36] = { 300, "Th莥 b鉯" },
    [37] = { 300, "Th莥 b鉯" },
}

SF2017_WUSHI = {0, 105, 30044, "L﹏ S�"}


function SF2017_MONSTER:Init()
    local nDate = tonumber( date("%Y%m%d") );
    if nDate > SF2017_MONSTER.nLastDate then SF2017_MONSTER.nRefresh = 0 end  -- 第二天重置刷新数
    if SF2017_MONSTER.nRefresh >= SF2017_MONSTER.nMaxRefresh then return end
    if SF2017_MONSTER.isLife == 1 then return end
    local npcidx = CreateNpc(SF2017_MONSTER.szTemp,SF2017_MONSTER.szName,SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3])
    SF2017_MONSTER.nIdx     = npcidx
    SF2017_MONSTER.nLastDate= nDate
    SF2017_MONSTER.nHp      = SF2017_MONSTER.nMaxHp
    SF2017_MONSTER.Flag     = 0
    SF2017_MONSTER.nRefresh = SF2017_MONSTER.nRefresh + 1
    SF2017_MONSTER.isLife   = 1
    SF2017_MONSTER.nDeadTime= -1
    if npcidx ~= 0 then 
        Msg2Global("Ni猲 Th� 產ng xu蕋 hi謓 � Tuy襫 Ch﹗, c竎 i hi謕 h穣 mau n , d飊g Ph竜 畊鎖 n�  gi祅h ph莕 thng!")
    end
end

function SF2017_MONSTER:Die()
    local nDate = tonumber( date("%Y%m%d") );
    SF2017_MONSTER.isLife = 0
    SetNpcLifeTime(SF2017_MONSTER.nIdx,0)
    SF2017_MONSTER.nDeadTime = GetTime()
    SF2017_MONSTER.DeadCnt = SF2017_MONSTER.DeadCnt + 1;
end

function CreateBox(nPosm,nPosx,nPosy,nNum)
    local nRangeX,nRangeY = 22,22;
    for i = 1, nNum do
        local nX = nPosx + random(-nRangeX,nRangeX);
        local nY = nPosy + random(-nRangeY,nRangeY);
        local nidx = CreateNpc(SF2017_BOX.szTemp,SF2017_BOX.szName,nPosm,nX,nY)
        SetNpcLifeTime(nidx,SF2017_BOX.nLifeTime)
    end
end 

function SF2017_MONSTER:BeAttacked(nNum,nType,nUsed)  -- nNum 为伤害值
    if SF2017_MONSTER.nIdx == 0 then return end
    SetCurrentNpcSFX(SF2017_MONSTER.nIdx,SF2017_MONSTER.nSFX,1,0,18)
    SF2017_MONSTER.nHp = SF2017_MONSTER.nHp - nNum
    SF2017_MONSTER.nFlag = SF2017_MONSTER.nFlag + nNum
    local szType = SF2017_FIRECRACKERS.normal[4]
    if nType == 2 then szType = SF2017_FIRECRACKERS.delicate[4] end
    
    local tItem = {}
    if nType == 1 then 
        tItem = SF2017_CARD.silver 
        AddItemWithJudge(tItem[1],tItem[2],tItem[3],nNum,4,tItem[4])
    else  
        tItem = SF2017_CARD.gold 
        for i = 1, nUsed do
            local nRand = random(1,100)
            if nRand <= 70 then
                gf_AddItemEx({tItem[1],tItem[2],tItem[3],1,4},tItem[4])
            end
        end
    end
    if  SF2017_MONSTER.nHp <= 0 then 
        SF2017_MONSTER:Die()
        Talk(1,"","Ni猲 Th� s� qu� b� ch箉 r錳,  l筰 tr猲 m苩 t Rng Xu﹏ M韎.")
        Msg2Global("Ni猲 Th� s� qu� b� ch箉 r錳,  l筰 tr猲 m苩 t Rng Xu﹏ M韎.")
        CreateBox(SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3],100)
        return
    end
    if SF2017_MONSTER.nFlag >= SF2017_MONSTER.nMaxFlag then
        SF2017_MONSTER.nFlag = SF2017_MONSTER.nFlag - SF2017_MONSTER.nMaxFlag -- BOSS惊慌放出宝箱
        Talk(1,"","Ni猲 Th� b� ho秐g s�,  l筰 tr猲 m苩 t m閠 s� Rng Xu﹏ M韎.")
        Msg2Global("Ni猲 Th� b� ho秐g s�,  l筰 tr猲 m苩 t m閠 s� Rng Xu﹏ M韎.")
        CreateBox(SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3],50)
        return
    end
    Talk(1,"",format("B筺  s� d鬾g <color=gold>%s<color> v韎 Ni猲 Th�, g﹜ cho n� <color=red>%d<color> 甶觤 s竧 thng. Hi謓 甶觤 s� h穒 c馻 Ni猲 Th� l� <color=red>%d/%d<color>.",szType,nNum,SF2017_MONSTER.nMaxHp-SF2017_MONSTER.nHp,SF2017_MONSTER.nMaxHp))
end

function Die()
    SF2017_MONSTER:Die()
end

function MonsterTalk()
    Talk(1,"",format("<color=green>%s<color>: G� g�?",SF2017_MONSTER.szName))
end

function showdetail()
    if 1 ~= IsKsGMSystemOpen() then
		return
	end
    print("\n\n-------------------------------")
    print("F2017_MONSTER.nHp:",SF2017_MONSTER.nHp)
    print("SF2017_MONSTER.nMaxHp",SF2017_MONSTER.nMaxHp)
    print("SF2017_MONSTER.nFlag",SF2017_MONSTER.nFlag)
    print("SF2017_MONSTER.nMaxFlag",SF2017_MONSTER.nMaxFlag)
    print("SF2017_MONSTER.nRefresh",SF2017_MONSTER.nRefresh)
    print("SF2017_MONSTER.nMaxRefresh",SF2017_MONSTER.nMaxRefresh)
    print("SF2017_MONSTER.nLastDate",SF2017_MONSTER.nLastDate)
    print("SF2017_MONSTER.nIdx",SF2017_MONSTER.nIdx)
    print("SF2017_MONSTER.DeadCnt",SF2017_MONSTER.DeadCnt)
    print("-------------------------------\n\n")
end
function sf2017_Debug()
    if 1 ~= IsKsGMSystemOpen() then
		return
	end
    if SF2017_DEBUG == 1 then
        local szTitle = format("<color=green>%s<color>:Debug Mode",SF2017_MONSTER.szName)
        local tbSay  = {}
        tinsert(tbSay,"Hi觧 th� th玭g tin chi ti誸 Ni猲 Th�/showdetail")
        tinsert(tbSay,"X鉧 Ni猲 Th� (Sau khi reload script, ch� l謓h n祔 s� m蕋 t竎 d鬾g)/Die")
        tinsert(tbSay,"T╪g Ph竜 S� Ch�/#AddItem(2,200,66,100)")
        tinsert(tbSay,"T╪g Ph竜 Tinh Ch�/#AddItem(2,200,67,100)")
        tinsert(tbSay,"T╪g H醓 Dc S� Ch�/#AddItem(2,200,64,100)")
        tinsert(tbSay,"T╪g H醓 Dc Tinh Ch�/#AddItem(2,200,65,100)")
        tinsert(tbSay,"T筼 Ni猲 Th�/_refresh_monster")
        tinsert(tbSay,"T筼 Ph骳 Th莕/#_refresh_fushen(1)")
        tinsert(tbSay,"Thi誸 l藀 l筰 to祅 b� bi課 lng/sf2017_reset")
        tinsert(tbSay,"H駓 b�/nothing")
        Say(szTitle,getn(tbSay),tbSay)
    end
end
function sf2017_reset()
    if 1 ~= IsKsGMSystemOpen() then
		return
	end
    for i=2782,2791 do SetTask(i,0)end
end
