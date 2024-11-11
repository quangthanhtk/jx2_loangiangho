----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-24
--- Description: item thÎ t©n thñ
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_gm.lua");
Include("\\script\\warlord\\functions\\function_newbie.lua");
Include("\\script\\warlord\\functions\\function_top_award.lua");
Include("\\script\\warlord\\functions\\function_newbie_award.lua");
Include("\\settings\\static_script\\gem\\imp_npc_gem.lua");
Include("\\script\\ksgvn\\event\\tubaotrai\\tubaotrai.lua");
Import("\\script\\function\\cdkey\\ck_head.lua");
Import("\\script\\function\\lucky_box\\lb_head.lua");
Include("\\script\\warlord\\online_activities\\diem_nang_dong\\functions.lua");
Import("\\script\\warlord\\functions\\function_tong.lua");
Import("\\script\\warlord\\functions\\function_doiphe_chutuoc.lua");
Import("\\script\\warlord\\online_activities\\duatop_t1_2024\\functions.lua");
Import("\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong_award.lua");

----------------------------------------------------------------------------------------------------

m_szNpcName = "<color=green>T©n Thñ LÖnh<color>: "

m_tbTetAward = {
    [20240407] = {
        [10] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_10M,
            tbAward = {
                { tbProp = { 2, 0, 554 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tu ch©n yÕu quyÕt
            },
        },
        [30] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_20M,
            tbAward = {
                { tbProp = { 2, 0, 553 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- ®¹i nh©n s©m
                { tbProp = { 2, 0, 552 }, nStack = 5, nStatus = ITEMSTATUS_LOCK },-- tiªu nh©n s©m
            },
        },
        [60] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_1H,
            tbAward = {
                { tbProp = { 2, 1, 30642 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- 5 qu©n cng vinh dù
            },
            --tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'Tô B¶o Trai')" },
        },
        [120] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_2H,
            tbAward = {
                { tbProp = { 2, 1, 31166 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Bé Ngo¹i Trang
            },
        },
    },

    [20240408] = {
        [10] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_10M,
            tbAward = {
                { tbProp = { 2, 114, 143 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Ch©n vâ hån th¹ch
            },
        },
        [30] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_20M,
            tbAward = {
                { tbProp = { 2, 95, 5830 }, nStack = 2, nStatus = ITEMSTATUS_LOCK }, -- Kh«i Lçi c¬ quan nh©n
            },
        },
        [60] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_1H,
            tbAward = {
                { tbProp = { 2, 1, 40049 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- BÝ bÝ ®iÓn 30
            },
        },
        [120] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_2H,
            tbAward = {
                { tbProp = { 0, 105, 30047 }, nStack = 1, nStatus = ITEMSTATUS_LOCK ,nExpiredTime = 30 * 24 * 3600}, -- B¸o tr¾ng b¶o b¶o
            },
        },
    },

    [20240409] = {
        [10] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_10M,
            tbAward = {
                { tbProp = { 2, 1, 1009 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch Tinh Th¹ch
            },
        },
        [30] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_20M,
            tbAward = {
                { tbProp = { 2, 1, 1067 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, --TiÓu §Þnh Hån
                { tbProp = { 2, 1, 1113 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- §¹ii §Þnh Hån
                { tbProp = { 2, 1, 1068 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch Linh Th¹ch
            },
        },
        [60] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_1H,
            tbAward = {
                { tbProp = { 2, 1, 30424 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Bïa C­êng Hãa 12
                { tbProp = { 2, 1, 30425 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Bïa C­êng Hãa 13
            },
        },
        [120] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_2H,
            tbAward = {
                { tbProp = {  2, 102, 213 }, nStack = 30, nStatus = ITEMSTATUS_LOCK}, -- Th­¬ng Ha¶i Di Chau 6
            },
        },
    },
};

function _w_newbie_ReloadItem()
    dofile("script/warlord/defines/define_item.lua");
    dofile("script/warlord/defines/define_task.lua");
    dofile("script/warlord/functions/function_newbie.lua");
    dofile("script/warlord/functions/function_book.lua");
    dofile("script/warlord/functions/function_top_award.lua");
    dofile("script/warlord/functions/function_newbie_award.lua");
    dofile("script/warlord/libs/lib_award.lua");
    dofile("script/warlord/items/item_newbie_card.lua");
    WPlayer:Msg(date("%Y-%m-%d %H:%M:%S") .. ": item_newbie_card update!");
end

function OnUse(nItemIdx)
    --_w_newbie_ReloadItem();
    OnUse_ItemNewbieCard(nItemIdx);
end

function OnUse_ItemNewbieCard(nItemIdx)
    WTask:ResetDaily();

    --t¹m fix nh÷ng ®øa bÞ lçi do k më item tr­íc khi ®µo
    local nDate = tonumber(date("%Y%m%d"))
    if GetTask(TSK_NEWRES_DATE) ~= nDate then
        gf_SetTaskByte(TSK_NEWRES_FINISH, BYTE_NEWRES_DONE, 0)
        gf_SetTaskByte(TSK_NEWRES_FINISH, BYTE_NEWRES_DOUBLE_EXP, 0)
        SetTask(TSK_NEWRES_DATE, nDate)
    end
    WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_TNC_DONE, WTask:GetByte(TSK_NEWRES_FINISH, BYTE_NEWRES_DONE));

    local tbSay = { format("<npcname>: Chµo <color=yellow>%s<color>, thêi gian hiÖn t¹i lµ %s!", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };

    local nRoute = WPlayer:GetRoute();
    if nRoute == 0 then
        tinsert(tbSay, format("%s/kgm_ChangeRoute", "Ta muèn gia nhËp m«n ph¸i vµ häc kü n¨ng"));
    else
        local nToday = WDate:Today();
        if m_tbTetAward[nToday] ~= WEnv.NULL then
            for nOnlineMin = 1, getn(m_tbTetAward[nToday]) do
                if m_tbTetAward[nToday][nOnlineMin] ~= WEnv.NULL
                        and WTask:GetBit(WTASKID_TREO_ONLINE_NHAN_THUONG_BIT, m_tbTetAward[nToday][nOnlineMin].nBit) == 0
                then
                    tinsert(tbSay, format("%s/#WNewbieAward:GetOnlineAward(%d)", "NhËn th­ëng online ".. nOnlineMin .. " phót", nOnlineMin));
                end
            end
        end

        --if GetAccount() =='ngocmai19' then
        --    tinsert(tbSay, format("%s/fix_backLangSuong", "Give Back Lang Suong"));
        --end
        tinsert(tbSay, format("%s/TestMSG_newbie", "KiÓm Tra c¸c hä¹t déng hµng ngµy"));
        tinsert(tbSay, format("%s/_w_newbie_OpenMenu_Buy_BatNha_HatGiong", "Mua nguyªn liÖu trång c©y"));
        --tinsert(tbSay, format("%s/fix_LangSuong", "Fix Lang Suong"));
       -- tinsert(tbSay, format("%s/_w_give_award_HMC", "NhËn th­ëng mèc Hãa m¹ch c¶nh"));
        --tinsert(tbSay, format("%s/_w_newbie_OpenMenu_TrangbiUpdate122024", "NhËn Hç trî Míi"));
        tinsert(tbSay, g_szSpaceLine);

        tinsert(tbSay, format("%s/_w_newbie_OpenMenu", "NhËn Hç trî T©n Thñ"));
        --tinsert(tbSay, format("%s/_w_newbie_OpenMenu_HoaMachCanh", "N©ng Hãa M¹ch C¶nh"));
        tinsert(tbSay, format("%s/_w_newbie_OpenMenu_ItemTest", "NhËn Trang bÞ hç trî"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_OtherSupport()", "Hç trî kh¸c"));

        tinsert(tbSay, format("%s/_w_newbie_monthly_ward", "Dïng 5000 Xu VËt PhÈm mua gãi Hç Trî Th¸ng"));
        tinsert(tbSay, format("%s/_w_newbie_buy_DauHon", "Mua §Êu Hån(70 xu)"));

        --tinsert(tbSay, format("%s/_w__OpenMenu_DiemNangDong", "Ho¹t ®éng ®iÓm n¨ng ®éng"));

        --tinsert(tbSay, format("%s/_w_newbie_OpenMenu_QuayThuong", "Ho¹t ®éng quay th­ëng"));
        --tinsert(tbSay, format("%s/tubaotrai_Open", "Tô B¶o Trai"));
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, format("%s/_w_newbie_OpenMenu_ThuCung", "Thó C­ng"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_KinhMach()", "Kinh M¹ch"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_BookSupport()", "MËt TÞch vµ yÕu QuyÕt"));

        
        tinsert(tbSay, format("%s/#WNewbieAward:ShowAwardList()", "NhËn th­ëng mèc C«ng Tr¹ng"));
        --tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_DailyTaskSupport2()", "NhËn th­ëng nhiÖm vô ®Æc thï"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_DailyTaskSupport()", "NhËn th­ëng nhiÖm vô h»ng ngµy"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_WeeklyTaskSupport()", "NhËn th­ëng nhiÖm vô h»ng tuÇn"));



        --- Hç trî m«n ph¸i
        --if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tbSay, "NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tbSay, "NhËn ¸m KhÝ vµ C¬ Quan/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tbSay, "NhËn X¸ Lîi Kim §¬n/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tbSay, "NhËn ChiÕn M·/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tbSay, "NhËn ChiÕn M· vµ Tô TiÔn/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tbSay, "NhËn Phong Thi Phï/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tbSay, "NhËn Cæ/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tbSay, "Hç trî nu«i TiÓu §iªu/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tbSay, "NhËn Linh KiÕm vµ Lß LuyÖn KiÕm/factionSupport_CLKT")
        end
        --end

        tinsert(tbSay, g_szSpaceLine);

        if WLib:IsTestServer() ~= WEnv.TRUE
                or WPlayer:IsSuperAdmin() == WEnv.TRUE
                or WPlayer:IsAdmin() == WEnv.TRUE
                or WPlayer:IsSuperMod() == WEnv.TRUE
                or WPlayer:IsModLive() == WEnv.TRUE
                or WPlayer:IsTester() == WEnv.TRUE
        then
            tinsert(tbSay, format("%s/#WGiftCode:ActiveCode()", "NhËp GIFTCODE nhËn quµ"));
            --tinsert(tbSay, format("%s/#CreateBossEvent20241()", "Goi Boss  1111"));
        end
    end

    if WPlayer:IsSuperAdmin() == WEnv.TRUE
            or WPlayer:IsAdmin() == WEnv.TRUE
            or WPlayer:IsSuperMod() == WEnv.TRUE
            or WPlayer:IsModLive() == WEnv.TRUE
    then
        tinsert(tbSay, format("%s/#_wgm_AddGmItem()", "### NhËn thÎ GM ###"));
    end

    if WPlayer:IsSuperAdmin() == WEnv.TRUE then
        tinsert(tbSay, format("%s/#_w_newbie_ReloadItem()", "### Reload ThÎ T©n Thñ ###"));
        --tinsert(tbSay, format("%s/#reset_NangDong()", "### Reset N¨ng §éng ###"));
        tinsert(tbSay, format("%s/#_w_newbie_Nhan3TrieuCongTrang()", "### 3 trieu cong trang ###"));
    end

    tinsert(tbSay, format("%s/#WWebService:CheckCode()", "KiÓm tra tin nh¾n hç trî tµi kho¶n"));
    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end


---Më menu nhËn th­ëng nhiÖm vô h»ng ngµy
function _w_newbie_OpenMenu_DailyTaskSupport()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckDailyTask();
    --local tbSay = { format("Hç trî t©n thñ ®Æc biÖt dµnh cho t©n thñ d­íi 3 ngµy hoÆc ®· hoµn thµnh c¸c nhiÖm vô: \n" .. WLib:Join(tbTaskStatus, "\n"), m_nDayStartCheckDailyTask) };
    local tbSay = { "Hç trî h»ng ngµy nµy chØ dµnh cho nh©n sÜ ®· hoµn thµnh c¸c nhiÖm vô: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        {
            szSelect = "NhËn 2 Qu©n C«ng Vinh Dù",
            szFunc = "_w_newbie_Give_QuanCongVinhDu(2)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_TMKL,
        },
        {
            szSelect = "NhËn 1 Linh ph¸ch ®¬n",
            szFunc = "_w_newbie_Give_LinhPhachDon(1)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_TAYTAMLUYENLO7,
        },
        {
            szSelect = "NhËn 5 Thiªn Th¹ch Tinh Th¹ch",
            szFunc = "_w_newbie_Give_ThienThachTinhThach(5)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_SACHKYNANGPET6,
        },
        {
            szSelect = "NhËn 5000 vµng",
            szFunc = "_w_newbie_Give_Money(50000000)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_VANG,
        },
        {
            szSelect = "NhËn 3 Th­¬ng H¶i Di Ch©u 6",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(6,3)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_MANHMACGIA,
        },
        {
            szSelect = "NhËn 1 HuyÕt Bå §Ò",
            szFunc = "_w_newbie_Give_HuyetBoDe(1)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_HUYETBODE,
        },
        {
            szSelect = "NhËn 1 Th­¬ng H¶i Di Ch©u 7",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(7,1)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_HUYETBODE,
        },
    };

    local tbReadyGet = {};

    for i = 1, getn(tbSayOptionDef) do
        if WTask:GetBit(tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId) == 0 then
            --if bIsCompleteTask == WEnv.TRUE then
            tinsert(tbSay, format("%s%s/#_w_newbie_GiveDailySupport(%d, %d, %q)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId, tbSayOptionDef[i].szFunc));
            --else
            --    tinsert(tbSay, format("%s%s/nothing", "", tbSayOptionDef[i].szSelect));
            --end
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[®· nhËn] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hiÓn thÞ ®· nhËn ë d­íi
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> ®· nhËn hÕt c¸c hç trî nµy råi, khi kh¸c h·y quay l¹i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end

---Më menu nhËn th­ëng nhiÖm vô ®Æc thï
function _w_newbie_OpenMenu_DailyTaskSupport2()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckDailyTask2();
    --local tbSay = { format("Hç trî t©n thñ ®Æc biÖt dµnh cho t©n thñ d­íi 3 ngµy hoÆc ®· hoµn thµnh c¸c nhiÖm vô: \n" .. WLib:Join(tbTaskStatus, "\n"), m_nDayStartCheckDailyTask) };
    local tbSay = { "Hç trî ®Æc thï nµy chØ dµnh cho nh©n sÜ ®· hoµn thµnh c¸c nhiÖm vô: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        {
            szSelect = "NhËn trang bÞ V¨n Søc Lv3",
            szFunc = "_w_newbie_Give_VanSuc3(0)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_VANSUC3,
        },
        {
            szSelect = "NhËn 4,000 vµng",
            szFunc = "_w_newbie_Give_Money(40000000)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_VANG,
        },
        {
            szSelect = "NhËn 5 mËt tÞch bÝ ®iÓn 20% 3 phô lôc",
            szFunc = "_w_newbie_Give_MatTichBiDien(5)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_BIDIEN,
        },
        {
            szSelect = "NhËn 50 tu ch©n yÕu quyÕt (luyÖn mËt tÞch)",
            szFunc = "_w_newbie_Give_TuChan(50)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_TUCHAN,
        },
        {
            szSelect = "NhËn 5,000 ®iÓm lÞch luyÖn (tiÕn cÊp mËt tÞch)",
            szFunc = "_w_newbie_Give_LichLuyen(0, 5000, 100)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_LICHLUYEN,
        },
        {
            szSelect = "NhËn 500 M¶nh C¬ Quan MÆc Gia (®æi YQCC t¹i Cao Nh©n ë Èn - C«n L«n)",
            szFunc = "_w_newbie_Give_ManhMacGia(500)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_MANHMACGIA,
        },
        {
            szSelect = "NhËn 20 s¸ch kü n¨ng b¹n ®ång hµnh Lv5",
            szFunc = "_w_newbie_Give_SachPetLv5(20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_SACHKYNANGPET,
        },
        {
            szSelect = "NhËn 5 Th­¬ng H¶i Di Ch©u Lv7",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(7, 5)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_THUONGHAIDICHAU,
        },
        {
            szSelect = "NhËn 5,000 Bét Tr©n Ch©u",
            szFunc = "_w_newbie_Give_BotTranChau(5000)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_BOTTRANCHAU,
        },
        {
            szSelect = "NhËn 100 ®¸ mµi vò khÝ c¸c lo¹i",
            szFunc = "_w_newbie_Give_DaMai(100)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_DAMAI,
        },
        {
            szSelect = "NhËn 20 Thiªn Th¹ch Tinh Th¹ch (c­êng ho¸ trang bÞ +7 trë lªn)",
            szFunc = "_w_newbie_Give_ThienThachTinhThach(20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_TTTT,
        },
        {
            szSelect = "NhËn 20 TÈy T©m + LuyÖn l« Lv6 (tÈy trang bÞ)",
            szFunc = "_w_newbie_Give_TayTamLuyenLo(6, 20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_TAYTAMLUYENLO,
        },
        {
            szSelect = "NhËn 20 L­u Kim (c­êng ho¸ v¨n søc)",
            szFunc = "_w_newbie_Give_LuuKim(20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_LUUKIM,
        },
        {
            szSelect = "NhËn 10 Thiªn V¨n Th¹ch (gi÷ c­êng ho¸ v¨n søc)",
            szFunc = "_w_newbie_Give_ThienVanThach(10)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_THIENVANTHACH,
        },
        --{
        --    szSelect = "NhËn 200 ®¸ quý c¸c lo¹i (kh¶m trang bÞ)",
        --    szFunc = "_w_newbie_Give_DaQuy(-1, 200)",
        --    nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
        --    nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_DAQUY,
        --},
    };

    local tbReadyGet = {};

    for i = 1, getn(tbSayOptionDef) do
        if WTask:GetBit(tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId) == 0 then
            --if bIsCompleteTask == WEnv.TRUE then
            tinsert(tbSay, format("%s%s/#_w_newbie_GiveDailySupport2(%d, %d, %q)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId, tbSayOptionDef[i].szFunc));
            --else
            --    tinsert(tbSay, format("%s%s/nothing", "", tbSayOptionDef[i].szSelect));
            --end
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[®· nhËn] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hiÓn thÞ ®· nhËn ë d­íi
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> ®· nhËn hÕt c¸c hç trî nµy råi, khi kh¸c h·y quay l¹i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end

---Më menu nhËn th­ëng nhiÖm vô tuÇn
function _w_newbie_OpenMenu_WeeklyTaskSupport()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckWeeklyTask();
    local tbSay = { "Th­ëng hµng tuÇn chØ dµnh cho nh©n sÜ ®· hoµn thµnh c¸c nhiÖm vô: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        --{
        --    szSelect = "NhËn hiÖu Ph¸ V­¬ng - sinh, gtt, v« cô (chon 1 trong 2 danh hiÖu)",
        --    szFunc = "_w_newbie_Give_DanhHieuPhaVuong()",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_DANHHIEU,
        --},
        --{
        --    szSelect = "NhËn hiÖu ChiÕn ThÇn - dame, tdxc, ph¸ ®Þch (chon 1 trong 2 danh hiÖu)",
        --    szFunc = "_w_newbie_Give_DanhHieuChienThan()",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_DANHHIEU,
        --},
        
        --{
        --    szSelect = "NhËn 200 TÈy T©m + LuyÖn l« Lv7 (tÈy trang bÞ)",
        --    szFunc = "_w_newbie_Give_TayTamLuyenLo(7, 200)",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_TAYTAMLUYENLO7,
        --},
        --
        --{
        --    szSelect = "NhËn 200 M¶nh BÝ §iÓn 30",
        --    szFunc = "_w_newbie_Give_ManhBiDien30(200)",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_MANHBIDIEN,
        --},
        --{
        --    szSelect = "NhËn 20 Th­¬ng H¶i Di Ch©u Lv7",
        --    szFunc = "_w_newbie_Give_ThuongHaiDiChau(7, 20)",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_DICHAU,
        --},
        {
            szSelect = "NhËn 2 Thiªn Cang LÖnh",
            szFunc = "_w_newbie_Give_ThienCangLenh(2)",
            nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
            nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_TCL,
        },
        {
            szSelect = "NhËn 2 Thiªn M«n Kim LÖnh",
            szFunc = "_w_newbie_Give_ThienMonKimLenh(2)",
            nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
            nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_TMKL,
        },
        {
            szSelect = "NhËn 1 Thanh Long Hån ",
            szFunc = "_w_newbie_Give_ThanhLongHon(5)",
            nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
            nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_THANHLONGHON,
        },
        {
            szSelect = "NhËn 1000 vµng",
            szFunc = "_w_newbie_Give_Money(10000000)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_Vang,
        },
    };

    local tbReadyGet = {};

    for i = 1, getn(tbSayOptionDef) do
        if WTask:GetBit(tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId) == 0 then
            --if bIsCompleteTask == WEnv.TRUE then
            tinsert(tbSay, format("%s%s/#_w_newbie_GiveWeeklySupport(%d, %d, %q)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId, tbSayOptionDef[i].szFunc));
            --else
            --    tinsert(tbSay, format("%s%s/nothing", "", tbSayOptionDef[i].szSelect));
            --end
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[®· nhËn] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hiÓn thÞ ®· nhËn ë d­íi
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> ®· nhËn hÕt c¸c hç trî nµy råi, khi kh¸c h·y quay l¹i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu()
    WTask:ResetDaily();

    local tbSay = { format("<npcname>: Chµo <color=yellow>%s<color>, thêi gian hiÖn t¹i lµ %s!", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };

    local tbSayOptionDef = {
        {
            szSelect = "[1 lÇn] NhËn 10.000 Bét Tr©n Ch©u",
            szFunc = "_w_newbie_Give_BotTranChau(10000)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_BOTTRANCHAU,
        },
        {
            szSelect = "[1 lÇn] NhËn ho¸ c¶nh 50 m¹ch",
            szFunc = "_w_newbie_Give_HoaCanh(50)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_HOACANH_150,
        },
        {
            szSelect = "[1 lÇn] NhËn trang bÞ Kim Xµ 7 Chän OP",
            szFunc = "_w_newbie_Give_KXLenh()",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_KIMXA7,
        },
        {
            szSelect = "[1 lÇn] NhËn Hç Trî Danh HiÖu ",
            szFunc = "_w_newbie_Give_NormalTitle()",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_DANHHIEU,
        },
        --
        -----trang bÞ chÝnh
        --{
        --    szSelect = "[1 lÇn] NhËn trang bÞ Èm HuyÕt +10",
        --    szFunc = "_w_newbie_Give_AmHuyet(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_AMHUYET,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn trang bÞ Thanh Long T­íng +10",
        --    szFunc = "_w_newbie_Give_ThanhLongTuong(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_THANHLONGTUONG,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn trang bÞ Thanh Long So¸i +10",
        --    szFunc = "_w_newbie_Give_ThanhLongSoai(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_THANHLONGSOAI,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn trang bÞ V¨n Søc Lv3 + 5 Cæ Kim Th¹ch",
        --    szFunc = "_w_newbie_Give_VanSuc3(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_VANSUC3,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn trang bÞ Kim Xµ 6 +10",
        --    szFunc = "_w_newbie_Give_KimXa6(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KIMXA6,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn bé trang bÞ ChiÕn Cuång +10",
        --    szFunc = "_w_newbie_Give_ChienCuong(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_CHIENCUONG,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn bé trang bÞ DiÖu D­¬ng +10",
        --    szFunc = "_w_newbie_Give_DieuDuong(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_DIEUDUONG,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn bé s­ m«n 3 +10",
        --    szFunc = "_w_newbie_Give_SuMon3(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_SM3,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn bé s­ m«n 4 +10",
        --    szFunc = "_w_newbie_Give_SuMon4(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_SM4,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn bé s­ m«n 5 +10",
        --    szFunc = "_w_newbie_Give_SuMon5(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_SM5,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn bé trang bÞ Buff 35 +10",
        --    szFunc = "_w_newbie_Give_SetBuff(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_SETBUFF,
        --},

        ---th­¬ng h¶i di ch©u
        {
            szSelect = "[1 lÇn] NhËn 500 Th­¬ng H¶i Ch©u Lv5 (ch­a gi¸m ®Þnh)",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 500)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU,
        },
        {
            szSelect = "[1 lÇn] NhËn 50 Th­¬ng H¶i Ch©u Lv6 (ch­a gi¸m ®Þnh)",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(6, 50)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU6,
        },
        {
            szSelect = "[1 lÇn] NhËn 10 Linh Ph¸ch §¬n",
            szFunc = "_w_newbie_Give_LinhPhachDon(10)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_BOTTRANCHAU,
        },
        --{
        --    szSelect = "[1 lÇn] NhËn 50 TÈy T©m + LuyÖn L« Lv6 (tÈy trang bÞ)",
        --    szFunc = "_w_newbie_Give_TayTamLuyenLo(6, 50)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_TAYTAMLUYENLO,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 300 TÈy T©m + LuyÖn L« Lv3 (tÈy trang bÞ)",
        --    szFunc = "_w_newbie_Give_TayTamLuyenLo(3, 300)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_TAYTAMLUYENLO3,
        --},

        ---cÊp ®é vµ ho¸ c¶nh
        {
            szSelect = "[1 lÇn] NhËn chuyÓn sinh 10 cÊp 99",
            szFunc = "_w_newbie_Give_ChuyenSinh(1099)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_CHUYENSINH,
        },
        {
            szSelect = "Thay ®æi h­íng chuyÓn sinh",
            szFunc = "_w_newbie_Give_ChangeChuyenSinh()",
            nTaskId = 0,
            nBitId = 0,
        },
        --{
        --    szSelect = "[1 lÇn] NhËn ho¸ c¶nh 90 m¹ch",
        --    szFunc = "_w_newbie_Give_HoaCanh(90)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_HOACANH_90,
        --},

        -----mËt tÞch vµ yÕu quyÕt
        --{
        --    szSelect = "[v« h¹n] NhËn mËt tÞch th«ng dông",
        --    szFunc = "_w_newbie_Give_MatTichThongDung(1)",
        --    nTaskId = 0, --WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = 0, --WTASKID_NEWBIE_BIT_GIVE_MATTICHTHUONG,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 50 Tu Ch©n YÕu QuyÕt",
        --    szFunc = "_w_newbie_Give_TuChan(50)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_TUCHAN,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 5 mËt tÞch BÝ §iÓn",
        --    szFunc = "_w_newbie_Give_MatTichBiDien(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_MATTICHBIDIEN,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 3 bé yÕu quyÕt",
        --    szFunc = "_w_newbie_Give_YeuQuyet(3)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_YEUQUYET,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 5,000 ®iÓm LÞch LuyÖn vµ 100 Ch©n QuyÓn Tinh Hoa",
        --    szFunc = "_w_newbie_Give_DiemLuyenMatTich(0, 5000, 100)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_DIEMLUYENMATTICH,
        --},
        --
        -----kinh m¹ch
        --{
        --    szSelect = "[1 lÇn] NhËn kinh m¹ch Vâ Th¸nh + 900,000 ch©n khÝ",
        --    szFunc = "_w_newbie_Give_KinhMachVoThanh()",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KINHMACHVOTHANH,
        --},
        --{
        --    szSelect = "[mçi ngµy] NhËn 500 Kinh M¹ch §ång Nh©n",
        --    szFunc = "_w_newbie_Give_KinhMachDongNhan(500)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KINHMACHDONGNHAN,
        --},
        --{
        --    szSelect = "[mçi ngµy] NhËn 500 Kinh M¹ch Ng©n Nh©n",
        --    szFunc = "_w_newbie_Give_KinhMachNganNhan(500)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KINHMACHNGANNHAN,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 900,000 ®iÓm Ch©n KhÝ",
        --    szFunc = "_w_newbie_Give_ChanKhi(900000)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_CHANKHI,
        --},

        -----bang héi
        --{
        --    szSelect = "[1 lÇn] NhËn tÝn vËt bang héi Lv20",
        --    szFunc = "_w_newbie_Give_TinVatBangHoi(20)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_TINVAT,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn danh hiÖu bang héi Lv10",
        --    szFunc = "_w_newbie_Give_DanhHieuBangHoi(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_HIEUBANG,
        --},
        --
        -----pet
        --{
        --    szSelect = "[1 lÇn] Hoµn thµnh phôc sinh b¹n ®ång hµnh 1+2",
        --    szFunc = "_w_newbie_Give_PhucSinhPet1()",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_PHUCSINHPET1,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 5 H¾c B¹ch Kú",
        --    szFunc = "_w_newbie_Give_HacBachKy(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_HACBACHKY,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 20 s¸ch kü n¨ng b¹n ®ång hµnh Lv5",
        --    szFunc = "_w_newbie_Give_SachPetLv5(20)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_SACHPET5,
        --},

        ---vËt phÈm hç trî
        --{
        --    szSelect = "[1 lÇn] NhËn 999 ®¸ quý c¸c lo¹i (kh¶m trang bÞ)",
        --    szFunc = "_w_newbie_Give_DaQuy(-1, 999)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_DAQUY,
        --},
        {
            szSelect = "[mçi ngµy] NhËn 100 B¨ng Th¹ch (söa ®å)",
            szFunc = "_w_newbie_Give_RepairStone(100)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_SUADO,
        },
        --{
        --    szSelect = "[1 lÇn] NhËn 100 ®¸ mµi vò khÝ c¸c lo¹i",
        --    szFunc = "_w_newbie_Give_DaMai(100)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_MAIDAMAGE,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn 10,000 ®iÓm TiÕu Y Ph­¬ng",
        --    szFunc = "_w_newbie_Give_NgoaiTrang(10000)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_NGOAITRANG,
        --},
        --{
        --    szSelect = "[1 lÇn] NhËn danh hiÖu ChiÕn Cuång, Ph¸ Qu©n",
        --    szFunc = "_w_newbie_Give_NormalTitle()",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_DANHHIEU,
        --},
        {
            szSelect = "[1 lÇn] NhËn 100 b×nh m¸u, mana c¸c lo¹i",
            szFunc = "_w_newbie_Give_Medicine(100)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_DUOCPHAM,
        },
        --{
        --    szSelect = "[1 lÇn] NhËn 500 vµng",
        --    szFunc = "_w_newbie_Give_Money(5000000)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_VANG,
        --},
        {
            szSelect = "[1 lÇn] NhËn 1 ThÇn Hµnh B¶o §iÓn",
            szFunc = "_w_newbie_Give_ThanHanh(1)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_THANHANH,
        },
        --{
        --    szSelect = "[1 lÇn] NhËn 5 §¹i §Þnh Hån",
        --    szFunc = "_w_newbie_Give_DaiDinhHon(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_DAIDINHHON,
        --},
        {
            szSelect = "[1 lÇn] NhËn thó c­ìi ngÉu nhiªn",
            szFunc = "_w_newbie_Give_ThuCuoi(1)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_THUCUOI,
        },
        --{
        --    szSelect = "[1 lÇn] NhËn 1,000 ThiÕt Tinh c¸c lo¹i",
        --    szFunc = "_w_newbie_Give_NLNuoiKimXa(1000)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_NLKIMXA,
        --},
    };

    local tbReadyGet = {};

    for i = 1, getn(tbSayOptionDef) do
        if WTask:GetBit(tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId) == 0 then
            tinsert(tbSay, format("%s%s/#_w_newbie_GiveOnceSupport(%d, %d, %q)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId, tbSayOptionDef[i].szFunc));
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[®· nhËn] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hiÓn thÞ ®· nhËn ë d­íi
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> ®· nhËn hÕt c¸c hç trî nµy råi, khi kh¸c h·y quay l¹i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end

---Më menu nhËn th­ëng nhiÖm vô hç trî t©n thñ
function _w_newbie_OpenMenu_Support1()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckSupport1Task();
    local tbSay = { "PhÇn th­ëng hç trî t©n thñ chØ dµnh cho nh©n sÜ ®· hoµn thµnh c¸c nhiÖm vô: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        {
            szSelect = "NhËn 20 Bïa c­êng ho¸ 12 13 14 15",
            szFunc = "_w_newbie_Give_BuaCuongHoa(-1, 20)",
            nTaskId = WTASKID_SUPPOE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_BUACUONGHOA,
        },
        {
            szSelect = "NhËn 200 M¶nh BÝ §iÓn 27",
            szFunc = "_w_newbie_Give_ManhBiDien27(200)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_MANHBIDIEN27,
        },
        {
            szSelect = "NhËn 100 M¶nh BÝ §iÓn 30",
            szFunc = "_w_newbie_Give_ManhBiDien30(100)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_MANHBIDIEN30,
        },
        {
            szSelect = "NhËn 20 Th­¬ng H¶i Di Ch©u Lv7",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(7, 20)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_DICHAU,
        },
        {
            szSelect = "NhËn 50 Thiªn Th¹ch Tinh Th¹ch",
            szFunc = "_w_newbie_Give_ThienThachTinhThach(50)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_THIENTHACHTINHTHACH,
        },
        {
            szSelect = "NhËn 2 §¹i §Þnh Hån",
            szFunc = "_w_newbie_Give_DaiDinhHon(2)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_DAIDINHHON,
        },
        {
            szSelect = "NhËn 50 Ch©n Vâ Hån Th¹ch",
            szFunc = "_w_newbie_Give_ChanVoHonThach(50)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_CHANVOHONTHACH,
        },
    };

    local tbReadyGet = {};

    for i = 1, getn(tbSayOptionDef) do
        if WTask:GetBit(tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId) == 0 then
            --if bIsCompleteTask == WEnv.TRUE then
            tinsert(tbSay, format("%s%s/#_w_newbie_GiveSupport1(%d, %d, %q)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nBitId, tbSayOptionDef[i].szFunc));
            --else
            --    tinsert(tbSay, format("%s%s/nothing", "", tbSayOptionDef[i].szSelect));
            --end
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[®· nhËn] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hiÓn thÞ ®· nhËn ë d­íi
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> ®· nhËn hÕt c¸c hç trî nµy råi, khi kh¸c h·y quay l¹i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_KinhMach()
    local tbSay = { "NhËn hç trî liªn quan Kinh m¹ch" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_900KCK()", "NhËn 900k Ch©n KhÝ"));
    tinsert(tbSay, format("%s/#_w_newbie_TayChanKhi()", "TÈy Ch©n KhÝ"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachVoThanh()", "Kinh M¹ch Vâ Th¸nh + 900k Ch©n KhÝ"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachDongNhan(500)", "500 Kinh M¹ch §ång Nh©n"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachNganNhan(200)", "200 Kinh M¹ch §ång Nh©n"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);

end

function _w_newbie_OpenMenu_HoaMachCanh()
    local tbSay = { "NhËn Hç Trî Hãa M¹ch C¶nh!\n§èi víi Hãa M¹ch VIP  sÏ n©ng lªn ®Õn mèc 10 cÊp tiÕp theo.\n<color=yellow>VÝ dô: Hãa M¹ch cÊp 154 sÏ trùc tiÕp lªn cÊp 160<color>.\n<color=red>Hãa M¹ch VIP chØ nhËn 1 lÇn<color>" };

    --tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh(140)", "NhËn Hãa m¹ch 140 miÔn phÝ"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh120()", "25 TCL+25TMKL + 15 Linh Ph¸ch §¬n n©ng Hãa M¹ch 120"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh130()", "50 TCL+50TMKL + 30 Linh Ph¸ch §¬n n©ng Hãa M¹ch 130"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(1)", "155 TCL+155 + 60 Linh Ph¸ch §¬n n©ng Hãa M¹ch 210"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(2)", "165 TCL+165 + 70 Linh Ph¸ch §¬n n©ng Hãa M¹ch 220"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(3)", "175 TCL+175 + 80 Linh Ph¸ch §¬n n©ng Hãa M¹ch 230"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(4)", "185 TCL+185 + 90 Linh Ph¸ch §¬n n©ng Hãa M¹ch 240"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_VIP122023()", "75 TCL+75TMKL + 45 Linh Ph¸ch §¬n n©ng Hãa M¹ch VIP"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);

end
function _w_newbie_OpenMenu_OtherSupport()
    local tbSay = { "NhËn hç trî kh¸c:" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_NLNuoiKimXa(1000)", "NhËn 1000 thiÕt tinh 1-2-3-4"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMonDanhVong(10000)", "NhËn 10,000 s­ m«n, danh väng"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_BotTranChau(10000)", "NhËn 10000 Bét Tr©n Ch©u"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_RepairStone(100)", "NhËn B¨ng Th¹ch vµ m¶nh b¨ng th¹ch"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChangeChuyenSinh()", "ChuyÓn h­íng chuyÓn sinh"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DanhHieuBangHoi(10)", "NhËn danh hiÖu bang héi lv10"));
    tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_NhanTuiDaQuy()", "NhËn Tói §¸ Quý 1-6"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_NormalTitle()", "NhËn c¸c lo¹i danh hiÖu kh¸c"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_QuayThuong()
    local tbSay = { "Quan Th­¬ng:" };
    tinsert(tbSay, format("%s/_open_gem_lucky_box", "Quay th­ëng"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_NLNuoiKimXa(1000)", "NhËn 1000 thiÕt tinh 1-2-3-4"));
    tinsert(tbSay, format("%s/#QuayThuong_GetAccumulateAward()", "TÝch Lòy Quay Th­ëng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_BookSupport()
    local tbSay = { "NhËn hç trî liªn quan mËt tÞch:" };

    tinsert(tbSay, format("%s/#_w_book_AddCommonBook(0, 3, 10, 4, 95, 95, 95, 95)", "NhËn c¸c lo¹i mËt tÞch th«ng dông"));
    tinsert(tbSay, format("%s/#_w_book_LearnBookEquip()", "LuyÖn nhanh mËt tÞch ®ang trang bÞ"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiemLuyenMatTich(0, 0, 1000)", "Ch©n QuyÓn Tinh Hoa +1000"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ManhBiDien27(200)", "NhËn 200 M¶nh BÝ §iÓn  27%"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_YeuQuyet()", "NhËn yÕu quyÕt"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_Buy_BatNha_HatGiong()
    local tbSay = { "Mua B¸t Nh· Nhá vµ H¹t Gièng:" };

    tinsert(tbSay, format("%s/#_w_newbie_Buy_BatNhaLon(1)", "Mua 1 B¸t Nh· Nhá b»ng 50 vµng"));
    tinsert(tbSay, format("%s/#_w_newbie_Buy_HatGiong(1)", "Mua 1 Tói h¹t Gièng b»ng 200 vµng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_monthly_ward()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 5000 }, -- xu vËt phÈm
        }
    };
    local tbAward = {
        { tbProp = { 2, 1, 40124 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Thanh V©n §¹i Phó
    };

    local nMonth = tonumber(date("%m"));
    local nowBuy=GetTask(WTASKID_HOTROHANGTHANG2024);
    if nMonth ==nowBuy then
        WNpc:Talk("Th¸ng nµy b¹n ®· mua Tói Hç Trî Th¸ng");
        return 0;
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE  then
        WAward:Give(tbAward, "item_newbie_card");
        SetTask(WTASKID_HOTROHANGTHANG2024,nMonth);
        WNpc:Talk("B¹n ®· mua thµnh c«ng 1 Tói Hç Trî Th¸ng");
    end
end
function _w_newbie_buy_DauHon()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 70 }, -- xu vËt phÈm
        }
    };
    local tbAward = {
        { tbProp = { 2,1,1157 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --u Hån
    };
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE  then
        WAward:Give(tbAward, "item_newbie_card");
        WNpc:Talk("B¹n ®· mua 1 §Êu Hån");
    end
end


function _w_newbie_OpenMenu_ItemTest()
    local tbSay = { "NhËn hç trî  Trang bÞ:" };
    --tinsert(tbSay, format("%s/#_w_newbie_Give_KXLenh()", "NhËn Set Kim Xµ"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SatTinh(15)", "NhËn trang bÞ S¸t Tinh +15"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_ThanhLongTuong(15)", "NhËn trang bÞ Thanh Long Tuong +15"));
    tinsert(tbSay, format("%s/#KsgItem:AddSuitByBody(30207, 15)", "NhËn trang bÞ Thiªn h¹ v« song"));
    tinsert(tbSay, format("%s/#_w_tong_AddToken(15, \"item_test_card\")", "NhËn tÝn vËt bang héi cÊp 15"));


    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_VanSuc3(10)", "NhËn trang bÞ V¨n Søc Lv3 + 5 Cæ Kim Th¹ch"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon3(15)", "NhËn bé s­ m«n 3 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon4(15)", "NhËn bé s­ m«n 4 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon5(15)", "NhËn bé s­ m«n 5 +15"));

    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_ChienCuong(15)", "NhËn bé trang bÞ ChiÕn Cuång +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DieuDuong(15)", "NhËn bé trang bÞ DiÖu D­¬ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SetBuff(15)", "NhËn bé trang bÞ Buff 35 +15"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_KimXa6(15)", "NhËn trang bÞ Kim Xµ 6 +15"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_NhanThuongHaiDiChau()
    local tbSay = { "NhËn Th­¬ng H¶i Di Ch©u:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(1, 200)", "NhËn 200 th­¬ng hai di ch©u lv1"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(2, 200)", "NhËn 200 th­¬ng hai di ch©u lv2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(3, 200)", "NhËn 200 th­¬ng hai di ch©u lv3"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(4, 200)", "NhËn 200 th­¬ng hai di ch©u lv4"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_NhanTuiDaQuy()
    local tbSay = { "NhËn tói ®¸ quý:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(1, 500)", "NhËn 500 Tói ®· quý lv1"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(2, 500)", "NhËn 500 Tói ®· quý lv2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(3, 500)", "NhËn 500 Tói ®· quý lv3"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(4, 500)", "NhËn 500 Tói ®· quý lv4"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(5, 500)", "NhËn 500 Tói ®· quý lv5"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(6, 500)", "NhËn 500 Tói ®· quý lv6"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_ThuCung()
    local tbSay = { "Menu Thó C­ng Pet:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet1()", "Hoµng Thµnh Phôc Sinh Thó C­ng 1+2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_HacBachKy(3)", "NhËn H¾c b¹ch kú"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SachPetLv5(100)", "NhËn tói kü n¨ng thó c­ng lv5"));
    tinsert(tbSay, format("%s/#_w_newbie_Buy_TienDieu()", "§æi 10 Thiªn Cang lÖnh +10 Thiªn M«n KL lÊy Tiªn §iªu"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_NhanPhucsinhthucung()
    local tbSay = { "NhËn phôc sinh pet:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet1()", "NhËn phuc sinh pet 1"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet2()", "NhËn phuc sinh pet 2"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_TrangbiUpdate122024()
    local tbSay = { "§æi nguyªn liÖu lÊy trang bÞ nhanh:" };
    tinsert(tbSay, format("%s/_w_newbie_Buy_UHT_2024", "NhËn bé Uy Hæ T­íng"));
    tinsert(tbSay, format("%s/_w_newbie_Buy_VanSuc4_2024", "NhËn bé V¨n Søc 4"));
    tinsert(tbSay, format("%s/_w_newbie_Give_PhaHonLenhBai", "NhËn bé Ph¸ Hån"));
    tinsert(tbSay, format("%s/_w_newbie_Give_1500000CongTrang", "NhËn Hç Trî  3Tr C«ng Tr¹ng"));
    if WTask:GetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS,WTASKID_NEWBIE_BIT_GIVE_KIMXA6)~=1 then
        tinsert(tbSay, format("%s/_w_newbie_Buy_KimXa8_2024", "NhËn bé Kim Xµ 8"));
    end

    tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh(140)", "NhËn Hãa m¹ch 140 miÔn phÝ"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_Rank_2024()
    local nCurRank=GetTask(704);
    local checkRankLieu=GetTask(WTASKID_QHTUONG_UNLIMIT2024_LIEU) or 0;
    local checkRankTong=GetTask(WTASKID_QHTUONG_UNLIMIT2024_TONG) or 0;
    local szCheck="";
    if checkRankLieu==1 then
        szCheck=szCheck.."\n <color=red>§· mua Qu©n Hµm T­íng - Liªu vÜnh viÔn<color>"
    end
    if checkRankTong==1 then
        szCheck=szCheck.."\n <color=red>§· mua Qu©n Hµm T­íng - Tèng vÜnh viÔn<color>"
    end
    local tbSay = { "N©ng cÊp Qu©n Hµm:"..szCheck };
    if nCurRank <5 and nCurRank>-5 then
        tinsert(tbSay, format("%s/_w_newbie_Buy_QhTuong", "N©ng cÊp Qu©n hµm T­íng (cÇn 500 xu vËt phÈm)"));
    end

    if nCurRank <0 and nCurRank>-5 and checkRankLieu ==0  then
        tinsert(tbSay, format("%s/_w_newbie_Buy_QhTuong_Unlimit", "N©ng cÊp Qu©n hµm T­íng - Liªu vÜnh viÔn (cÇn 3000 xu vËt phÈm)"));
    end
    if nCurRank >0 and nCurRank <5 and checkRankTong ==0  then
        tinsert(tbSay, format("%s/_w_newbie_Buy_QhTuong_Unlimit", "N©ng cÊp Qu©n hµm T­íng - Tèng vÜnh viÔn (cÇn 3000 xu vËt phÈm)"));
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end



function _wnewbie_LoadDuaTopBXHData()
    local nWeeks, nRank, nPoint = GetPlayerRank();
    --print(nWeeks, nRank, nPoint);
    if nRank == nil then
    elseif nRank > 0 then -- Xãa trªn BXH Tèng tuÇn tr­íc
        RemoveRelayShareDataByIndex('_PlayerBattleRankS', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
    elseif nRank < 0 then -- Xãa trªn BXH Liªu tuÇn tr­íc

        RemoveRelayShareDataByIndex('_PlayerBattleRankL', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
    end
end
function RemoveRelayBRT(bSuccess)
    if bSuccess == 1 then
        -- §¸nh gi¸ qu©n hµm
        --SetRankPoint(5, 701, 1);
        --SetTask(TSK_TRANS_POINT_ALLOW,1);

        -- CËp nhËp qu©n hµm
        --CalcBattleRank();
        --UpdateBattleMaxRank();
    end
end
function TestMSG_newbie()
    local a=GetTask(4063) or 0
    local b=GetTask(2686) or 0
    local c=GetTask(4088) or 0
    local d=GetTask(4093) or 0
    Talk(1, "", format("Sè lÇn Kill BOSS DHC: %d - LSB: %d. Thu ho¹ch BNL: %d. Thu nhËp TNC : %d", a,b,c,d));
end
