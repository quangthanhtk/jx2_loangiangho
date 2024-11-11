--�������޸ĵ�������д����
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\main.lua")

SF2017_DEBUG = 0        -- DEBUGģʽ���أ�������ʹ�á����ƻ�ҩ���ܹ��������Ʋ˵����Լ�����ʾһЩ������������Ϣ������ע��رա�
if 1 ~= IsKsGMSystemOpen() then
	SF2017_DEBUG = 0
end
SF2017_DATE_ACT1 = { 20170126, 20170201 } 
SF2017_DATE_ACT2 = { 20170126, 20170201 }
SF2017_DATE_ACT3 = { 20170128, 20170201 } -- �3
SF2017_DATE_ACT4_1 = { 20170118, 20170201 } -- �4_1
SF2017_DATE_ACT4_2 = { 20170118, 20170125 } -- �4_2
SF2017_DATE_ACT5 = { 20170126, 20170201 } -- �5

SF2017_SHOP_DATE1 = {20170126, 20170201 } --�̵꿪������
SF2017_SHOP_DATE2 = {20170202, 20170208 }
SF2017_SHOP_TIME1 = {0,2400}            --���̵꿪�����ڵĿ���ʱ��
SF2017_SHOP_TIME2 = {0,2400}
SF2017_TREES = {
    szName = "��o Hoa th�",
    szTemp = "��o Hoa th�",
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
    szName = "Ph�c Th�n",
    szTemp = "xnhd_fs",
    tPos = {
        [1] = {
            {100,1441,2785,"Tuy�n Ch�u"},{100,1400,2856,"Tuy�n Ch�u"},{100,1284,2953,"Tuy�n Ch�u"},{100,1256,2984,"Tuy�n Ch�u"},
            {100,1312,3023,"Tuy�n Ch�u"},{100,1301,3061,"Tuy�n Ch�u"},{100,1295,3113,"Tuy�n Ch�u"},{100,1378,3157,"Tuy�n Ch�u"},
            {100,1407,3054,"Tuy�n Ch�u"},{100,1435,3098,"Tuy�n Ch�u"},{100,1496,3160,"Tuy�n Ch�u"},{100,1543,3118,"Tuy�n Ch�u"},
            {100,1500,2966,"Tuy�n Ch�u"},{100,1576,3044,"Tuy�n Ch�u"},{100,1651,3010,"Tuy�n Ch�u"},{100,1587,2988,"Tuy�n Ch�u"},
        },
        [2] = {
            {200,1199,2802,"Bi�n Kinh"},{200,1185,2905,"Bi�n Kinh"},{200,1320,3001,"Bi�n Kinh"},{200,1350,3056,"Bi�n Kinh"},
            {200,1440,2954,"Bi�n Kinh"},{200,1538,2951,"Bi�n Kinh"},{200,1482,2875,"Bi�n Kinh"},{200,1613,2861,"Bi�n Kinh"},
            {200,1564,2842,"Bi�n Kinh"},{200,1550,2813,"Bi�n Kinh"},{200,1400,2678,"Bi�n Kinh"},{200,1370,2615,"Bi�n Kinh"},
            {200,1334,2657,"Bi�n Kinh"},{200,1320,2695,"Bi�n Kinh"},{200,1301,2830,"Bi�n Kinh"},{200,1312,2914,"Bi�n Kinh"},
        },
        [3] = {
            {300,1797,3359,"Th�nh ��"},{300,1748,3393,"Th�nh ��"},{300,1851,3419,"Th�nh ��"},{300,1942,3513,"Th�nh ��"},
            {300,1965,3569,"Th�nh ��"},{300,1881,3535,"Th�nh ��"},{300,1868,3615,"Th�nh ��"},{300,1812,3708,"Th�nh ��"},
            {300,1780,3778,"Th�nh ��"},{300,1766,3714,"Th�nh ��"},{300,1753,3637,"Th�nh ��"},{300,1633,3537,"Th�nh ��"},
            {300,1589,3586,"Th�nh ��"},{300,1636,3618,"Th�nh ��"},{300,1737,3475,"Th�nh ��"},
        },
        
    },
    nCnt = 0,           -- ��¼��ǰ�����Ѿ������˶��ٷֽ�Ʒ
    lim = 100,          -- ��������ܷŶ��ٷֽ�Ʒ
    nLifeTime = 30*60,  -- �������ʱ��
    nHash = 0,          -- nHashֵ�����ù�
}

SF2017_HDDS = {
    szName = "��i S� Ho�t ��ng Xu�n M�i",
    szTemp = "xnhd_cjhdds",
    tPos = {
        {100, 1429, 3000},
        {300, 1757, 3557},
        {200, 1385, 2894},
    }
}


SF2017_FLOWER = {2, 200, 71, 1, 4, "Hoa ��o"}
SF2017_CLOTHES = {
    {
        {0,108,985,1,"X�ch Vi�n L�ng H�c Quan"},
        {0,108,986,1,"X�ch Vi�n L�ng H�c Quan"},
        {0,108,987,1,"X�ch Vi�n L�ng H�c Quan"},
        {0,108,988,1,"X�ch Vi�n L�ng H�c Quan"},
    },
    {
        {0,109,985,1,"X�ch Vi�n L�ng H�c y"},
        {0,109,986,1,"X�ch Vi�n L�ng H�c y"},
        {0,109,987,1,"X�ch Vi�n L�ng H�c y"},
        {0,109,988,1,"X�ch Vi�n L�ng H�c y"},
    },
    {
        {0,110,985,1,"X�ch Vi�n L�ng H�c Trang"},
        {0,110,986,1,"X�ch Vi�n L�ng H�c Trang"},
        {0,110,987,1,"X�ch Vi�n L�ng H�c Trang"},
        {0,110,988,1,"X�ch Vi�n L�ng H�c Trang"},
    },
}
SF2017_TAOHUA_LIM = 10        --ÿ�����ɶ��ٴ��һ�
SF2017_TJL = {2, 97, 236, 1, "Thi�n Ki�u L�nh"}
SF2017_TGL = {2, 95, 204, 1, "Thi�n Cang L�nh"}
SF2017_TMJL = {2, 1, 30370, 1, "Thi�n M�n Kim L�nh"}

SF2017_BYTE_DCTSK = {           -- ���ֽڴ洢�������ã�ÿ����գ�
    taohua = 1, -- ÿ�ղ��һ�
    fushen = 2, 
    firecrackers = 3,
    box = 4,    -- ÿ��ʰȡ����
}
SF2017_BYTE_TSK = {             -- ͬ�ϣ�����գ�
    get_clothes = 1,
    exc_clothes1 = 2,
    exc_clothes2 = 3,
    exc_clothes3 = 4,
}

SF2017_FIRE = {
    normal = {2,200,64,"H�a D��c S� Ch�"},
    delicate = {2,200,65,"H�a D��c Tinh Ch�"},
}
SF2017_FIRECRACKERS = {
    normal = {2,200,66,"Ph�o S� Ch�"},
    delicate = {2,200,67,"Ph�o Tinh Ch�"},
    nUselimit = 25,                     --ÿ��ʹ�ô��Ʊ��ڵĴ�������
}

SF2017_BOX = {
    szName      = "R��ng Xu�n M�i",
    szTemp      = "xnhd_nsdkz",
    tPos        = {100,1408,3189},      -- ���������ΪԲ�Ŀ�ʼˢNPC
    tItem       = {2,200,63,"R��ng Xu�n M�i"},
    nLifeTime   = 60,                   -- ����һ����
    nColdTime   = 60,                   -- �ɼ���ȴʱ�䣬Ŀ�����������һ��������ֻ����һ��
    nMaxLimit   = 3,                    -- ÿ��������������
}

SF2017_MONSTER = {
    szName      = "Ni�n th�",
    szTemp      = "xnhd_ns",
    nHp         = 0,                    -- ��ʱ���棬��ʣ����Ѫ
    nMaxHp      = 180000,--180000,      -- �������Ѫ��
    nFlag       = 0,                    -- ��ʱ����2�������ϴ�ˢ�������ʱ���ﱻ�������Ѫ
    nMaxFlag    = 9000,                 -- ÿ��9000��Ѫ��ˢһ�α���
    nRefresh    = 0,                    -- ��ʱ����3��ÿ��ˢ�˶��ٴ�
    nMaxRefresh = 3,                    -- ÿ�����ˢ3��
    nLastDate   = 0,                    -- ��һ��ˢ���������ڣ������������
    nIdx        = 0,                    -- ����npc��index
    tPos        = {100,1408,3189},      -- λ��
    isLife      = 0,                    -- ��¼���������Ƿ����
    nDeadTime   = -1,                   -- ɶʱ������
    nRefreshTime= 30*60,                -- ������ˢ�� 30min
    ActTime     = {{1200,1400},{1900,2400}},-- ���޻ʱ��
    nSFX        = 952,                  -- ��Чid
    DeadCnt     = 0,                    -- ��¼�������˶��ٴ�
}

SF2017_CARD = {
    silver = {2,200,61,"Thi�p B�c Xu�n M�i"},
    gold   = {2,200,62,"Thi�p V�ng Xu�n M�i"}
}

SF2017_MISSION = {
    low = {488,489,490,491,492,493,494,495},
    mid = {496,497,498,499,500,504,505,506,507,508,509,510,511,512,513},
    high = {501,502,503,514,515,516,517,518,519,520,521,522,523,524},
    limit = 20,                         -- �շ�����ÿ�����20��
    nTJL = 2,                           -- һ����Ҫ2���콾��
}

SF2017_BOSS = {
    {"xnhd_bdj","B� �ao Tuy�t",309,1457,2953},
    {"xnhd_jjk","Qu�n Ki�m Cu�ng",309,1269,2984},
    {"xnhd_hdzg","Huy�n �ao T�ng Qu�n",321,1704,3479},
    {"xnhd_hjzg","Huy�n Ki�m T�ng Qu�n",321,1737,3203},
    {"xnhd_mlxztl","Th� L�nh Mi�u L�nh Tu�n Tr�i",408,1444,2797},
    {"xnhd_qzdymn","D� Mao Ng�u C��ng Tr�ng",408,1499,3023},
    {"xnhd_hyzg","H� �n ��i T�ng Qu�n",420,1527,3620},
    {"xnhd_dfr","��i phu nh�n",420,1577,3491},
    {"xnhd_sstl","S�t Th� ��u L�nh",600,1364,3058},
    {"xnhd_gstl","Cung Th� ��u L�nh",600,1373,2912},
    {"xnhd_cykh","Th�o Nguy�n Kh�c H�n",600,1540,2899},
    {"xnhd_yztm","D� T�c ��u M�c",601,1447,2963},
    {"xnhd_ljsl","Li�u Qu�n Th� L�nh",602,1500,2988},
}

SF2017_FINISH_TASK = {
    [1] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },--+487
    [2] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [3] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [4] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [5] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [6] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [7] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [8] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [9] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [10] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [11] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [12] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [13] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [14] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [15] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [16] = { 300, "��i S� Ho�t ��ng Xu�n M�i" },
    [17] = { 300, "A Th�nh" },
    [18] = { 300, "Chu Thi�n Nh�n" },
    [19] = { 200, "T�o ��i L�c" },
    [20] = { 200, "V� N��ng" },
    [21] = { 350, "H�n Ngh�a" },
    [22] = { 350, "Tr��ng �nh" },
    [23] = { 150, "H� H�u Anh" },
    [24] = { 150, "M�nh Nham " },
    [25] = { 100, "H� Ki�t" },
    [26] = { 100, "Chung Ph�ng" },
    [27] = { 300, "A Th�nh" },
    [28] = { 300, "Chu Thi�n Nh�n" },
    [29] = { 200, "T�o ��i L�c" },
    [30] = { 200, "V� N��ng" },
    [31] = { 350, "H�n Ngh�a" },
    [32] = { 350, "Tr��ng �nh" },
    [33] = { 350, "L�c Tr�c �ng" },
    [34] = { 200, "V� N��ng" },
    [35] = { 300, "Th�y b�i" },
    [36] = { 300, "Th�y b�i" },
    [37] = { 300, "Th�y b�i" },
}

SF2017_WUSHI = {0, 105, 30044, "L�n S�"}


function SF2017_MONSTER:Init()
    local nDate = tonumber( date("%Y%m%d") );
    if nDate > SF2017_MONSTER.nLastDate then SF2017_MONSTER.nRefresh = 0 end  -- �ڶ�������ˢ����
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
        Msg2Global("Ni�n Th� �ang xu�t hi�n � Tuy�n Ch�u, c�c ��i hi�p h�y mau ��n ��, d�ng Ph�o �u�i n� �� gi�nh ph�n th��ng!")
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

function SF2017_MONSTER:BeAttacked(nNum,nType,nUsed)  -- nNum Ϊ�˺�ֵ
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
        Talk(1,"","Ni�n Th� s� qu� b� ch�y r�i, �� l�i tr�n m�t ��t R��ng Xu�n M�i.")
        Msg2Global("Ni�n Th� s� qu� b� ch�y r�i, �� l�i tr�n m�t ��t R��ng Xu�n M�i.")
        CreateBox(SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3],100)
        return
    end
    if SF2017_MONSTER.nFlag >= SF2017_MONSTER.nMaxFlag then
        SF2017_MONSTER.nFlag = SF2017_MONSTER.nFlag - SF2017_MONSTER.nMaxFlag -- BOSS���ŷų�����
        Talk(1,"","Ni�n Th� b� ho�ng s�, �� l�i tr�n m�t ��t m�t s� R��ng Xu�n M�i.")
        Msg2Global("Ni�n Th� b� ho�ng s�, �� l�i tr�n m�t ��t m�t s� R��ng Xu�n M�i.")
        CreateBox(SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3],50)
        return
    end
    Talk(1,"",format("B�n �� s� d�ng <color=gold>%s<color> v�i Ni�n Th�, g�y cho n� <color=red>%d<color> �i�m s�t th��ng. Hi�n �i�m s� h�i c�a Ni�n Th� l� <color=red>%d/%d<color>.",szType,nNum,SF2017_MONSTER.nMaxHp-SF2017_MONSTER.nHp,SF2017_MONSTER.nMaxHp))
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
        tinsert(tbSay,"Hi�n th� th�ng tin chi ti�t Ni�n Th�/showdetail")
        tinsert(tbSay,"X�a Ni�n Th� (Sau khi reload script, ch� l�nh n�y s� m�t t�c d�ng)/Die")
        tinsert(tbSay,"T�ng Ph�o S� Ch�/#AddItem(2,200,66,100)")
        tinsert(tbSay,"T�ng Ph�o Tinh Ch�/#AddItem(2,200,67,100)")
        tinsert(tbSay,"T�ng H�a D��c S� Ch�/#AddItem(2,200,64,100)")
        tinsert(tbSay,"T�ng H�a D��c Tinh Ch�/#AddItem(2,200,65,100)")
        tinsert(tbSay,"T�o Ni�n Th�/_refresh_monster")
        tinsert(tbSay,"T�o Ph�c Th�n/#_refresh_fushen(1)")
        tinsert(tbSay,"Thi�t l�p l�i to�n b� bi�n l��ng/sf2017_reset")
        tinsert(tbSay,"H�y b�/nothing")
        Say(szTitle,getn(tbSay),tbSay)
    end
end
function sf2017_reset()
    if 1 ~= IsKsGMSystemOpen() then
		return
	end
    for i=2782,2791 do SetTask(i,0)end
end
