----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-24
--- Description: item th� t�n th�
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

m_szNpcName = "<color=green>T�n Th� L�nh<color>: "

m_tbTetAward = {
    [20240407] = {
        [10] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_10M,
            tbAward = {
                { tbProp = { 2, 0, 554 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tu ch�n y�u quy�t
            },
        },
        [30] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_20M,
            tbAward = {
                { tbProp = { 2, 0, 553 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- ��i nh�n s�m
                { tbProp = { 2, 0, 552 }, nStack = 5, nStatus = ITEMSTATUS_LOCK },-- ti�u nh�n s�m
            },
        },
        [60] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_1H,
            tbAward = {
                { tbProp = { 2, 1, 30642 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- 5 qu�n cng vinh d�
            },
            --tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'T� B�o Trai')" },
        },
        [120] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_2H,
            tbAward = {
                { tbProp = { 2, 1, 31166 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- B� Ngo�i Trang
            },
        },
    },

    [20240408] = {
        [10] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_10M,
            tbAward = {
                { tbProp = { 2, 114, 143 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Ch�n v� h�n th�ch
            },
        },
        [30] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_20M,
            tbAward = {
                { tbProp = { 2, 95, 5830 }, nStack = 2, nStatus = ITEMSTATUS_LOCK }, -- Kh�i L�i c� quan nh�n
            },
        },
        [60] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_1H,
            tbAward = {
                { tbProp = { 2, 1, 40049 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- B� b� �i�n 30
            },
        },
        [120] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_2H,
            tbAward = {
                { tbProp = { 0, 105, 30047 }, nStack = 1, nStatus = ITEMSTATUS_LOCK ,nExpiredTime = 30 * 24 * 3600}, -- B�o tr�ng b�o b�o
            },
        },
    },

    [20240409] = {
        [10] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_10M,
            tbAward = {
                { tbProp = { 2, 1, 1009 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Th�ch Tinh Th�ch
            },
        },
        [30] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_20M,
            tbAward = {
                { tbProp = { 2, 1, 1067 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, --Ti�u ��nh H�n
                { tbProp = { 2, 1, 1113 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- ��ii ��nh H�n
                { tbProp = { 2, 1, 1068 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Th�ch Linh Th�ch
            },
        },
        [60] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_1H,
            tbAward = {
                { tbProp = { 2, 1, 30424 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- B�a C��ng H�a 12
                { tbProp = { 2, 1, 30425 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- B�a C��ng H�a 13
            },
        },
        [120] = {
            nBit = WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_2H,
            tbAward = {
                { tbProp = {  2, 102, 213 }, nStack = 30, nStatus = ITEMSTATUS_LOCK}, -- Th��ng Ha�i Di Chau 6
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

    --t�m fix nh�ng ��a b� l�i do k m� item tr��c khi ��o
    local nDate = tonumber(date("%Y%m%d"))
    if GetTask(TSK_NEWRES_DATE) ~= nDate then
        gf_SetTaskByte(TSK_NEWRES_FINISH, BYTE_NEWRES_DONE, 0)
        gf_SetTaskByte(TSK_NEWRES_FINISH, BYTE_NEWRES_DOUBLE_EXP, 0)
        SetTask(TSK_NEWRES_DATE, nDate)
    end
    WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_TNC_DONE, WTask:GetByte(TSK_NEWRES_FINISH, BYTE_NEWRES_DONE));

    local tbSay = { format("<npcname>: Ch�o <color=yellow>%s<color>, th�i gian hi�n t�i l� %s!", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };

    local nRoute = WPlayer:GetRoute();
    if nRoute == 0 then
        tinsert(tbSay, format("%s/kgm_ChangeRoute", "Ta mu�n gia nh�p m�n ph�i v� h�c k� n�ng"));
    else
        local nToday = WDate:Today();
        if m_tbTetAward[nToday] ~= WEnv.NULL then
            for nOnlineMin = 1, getn(m_tbTetAward[nToday]) do
                if m_tbTetAward[nToday][nOnlineMin] ~= WEnv.NULL
                        and WTask:GetBit(WTASKID_TREO_ONLINE_NHAN_THUONG_BIT, m_tbTetAward[nToday][nOnlineMin].nBit) == 0
                then
                    tinsert(tbSay, format("%s/#WNewbieAward:GetOnlineAward(%d)", "Nh�n th��ng online ".. nOnlineMin .. " ph�t", nOnlineMin));
                end
            end
        end

        --if GetAccount() =='ngocmai19' then
        --    tinsert(tbSay, format("%s/fix_backLangSuong", "Give Back Lang Suong"));
        --end
        tinsert(tbSay, format("%s/TestMSG_newbie", "Ki�m Tra c�c h�t d�ng h�ng ng�y"));
        tinsert(tbSay, format("%s/_w_newbie_OpenMenu_Buy_BatNha_HatGiong", "Mua nguy�n li�u tr�ng c�y"));
        --tinsert(tbSay, format("%s/fix_LangSuong", "Fix Lang Suong"));
       -- tinsert(tbSay, format("%s/_w_give_award_HMC", "Nh�n th��ng m�c H�a m�ch c�nh"));
        --tinsert(tbSay, format("%s/_w_newbie_OpenMenu_TrangbiUpdate122024", "Nh�n H� tr� M�i"));
        tinsert(tbSay, g_szSpaceLine);

        tinsert(tbSay, format("%s/_w_newbie_OpenMenu", "Nh�n H� tr� T�n Th�"));
        --tinsert(tbSay, format("%s/_w_newbie_OpenMenu_HoaMachCanh", "N�ng H�a M�ch C�nh"));
        tinsert(tbSay, format("%s/_w_newbie_OpenMenu_ItemTest", "Nh�n Trang b� h� tr�"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_OtherSupport()", "H� tr� kh�c"));

        tinsert(tbSay, format("%s/_w_newbie_monthly_ward", "D�ng 5000 Xu V�t Ph�m mua g�i H� Tr� Th�ng"));
        tinsert(tbSay, format("%s/_w_newbie_buy_DauHon", "Mua ��u H�n(70 xu)"));

        --tinsert(tbSay, format("%s/_w__OpenMenu_DiemNangDong", "Ho�t ��ng �i�m n�ng ��ng"));

        --tinsert(tbSay, format("%s/_w_newbie_OpenMenu_QuayThuong", "Ho�t ��ng quay th��ng"));
        --tinsert(tbSay, format("%s/tubaotrai_Open", "T� B�o Trai"));
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, format("%s/_w_newbie_OpenMenu_ThuCung", "Th� C�ng"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_KinhMach()", "Kinh M�ch"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_BookSupport()", "M�t T�ch v� y�u Quy�t"));

        
        tinsert(tbSay, format("%s/#WNewbieAward:ShowAwardList()", "Nh�n th��ng m�c C�ng Tr�ng"));
        --tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_DailyTaskSupport2()", "Nh�n th��ng nhi�m v� ��c th�"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_DailyTaskSupport()", "Nh�n th��ng nhi�m v� h�ng ng�y"));
        tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_WeeklyTaskSupport()", "Nh�n th��ng nhi�m v� h�ng tu�n"));



        --- H� tr� m�n ph�i
        --if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tbSay, "Nh�n Thi�n Ph�t Ch�u v� Ph� Ma Ch�/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tbSay, "Nh�n �m Kh� v� C� Quan/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tbSay, "Nh�n X� L�i Kim ��n/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tbSay, "Nh�n Chi�n M�/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tbSay, "Nh�n Chi�n M� v� T� Ti�n/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tbSay, "Nh�n Phong Thi Ph�/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tbSay, "Nh�n C�/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tbSay, "H� tr� nu�i Ti�u �i�u/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tbSay, "Nh�n Linh Ki�m v� L� Luy�n Ki�m/factionSupport_CLKT")
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
            tinsert(tbSay, format("%s/#WGiftCode:ActiveCode()", "Nh�p GIFTCODE nh�n qu�"));
            --tinsert(tbSay, format("%s/#CreateBossEvent20241()", "Goi Boss  1111"));
        end
    end

    if WPlayer:IsSuperAdmin() == WEnv.TRUE
            or WPlayer:IsAdmin() == WEnv.TRUE
            or WPlayer:IsSuperMod() == WEnv.TRUE
            or WPlayer:IsModLive() == WEnv.TRUE
    then
        tinsert(tbSay, format("%s/#_wgm_AddGmItem()", "### Nh�n th� GM ###"));
    end

    if WPlayer:IsSuperAdmin() == WEnv.TRUE then
        tinsert(tbSay, format("%s/#_w_newbie_ReloadItem()", "### Reload Th� T�n Th� ###"));
        --tinsert(tbSay, format("%s/#reset_NangDong()", "### Reset N�ng ��ng ###"));
        tinsert(tbSay, format("%s/#_w_newbie_Nhan3TrieuCongTrang()", "### 3 trieu cong trang ###"));
    end

    tinsert(tbSay, format("%s/#WWebService:CheckCode()", "Ki�m tra tin nh�n h� tr� t�i kho�n"));
    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end


---M� menu nh�n th��ng nhi�m v� h�ng ng�y
function _w_newbie_OpenMenu_DailyTaskSupport()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckDailyTask();
    --local tbSay = { format("H� tr� t�n th� ��c bi�t d�nh cho t�n th� d��i 3 ng�y ho�c �� ho�n th�nh c�c nhi�m v�: \n" .. WLib:Join(tbTaskStatus, "\n"), m_nDayStartCheckDailyTask) };
    local tbSay = { "H� tr� h�ng ng�y n�y ch� d�nh cho nh�n s� �� ho�n th�nh c�c nhi�m v�: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        {
            szSelect = "Nh�n 2 Qu�n C�ng Vinh D�",
            szFunc = "_w_newbie_Give_QuanCongVinhDu(2)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_TMKL,
        },
        {
            szSelect = "Nh�n 1 Linh ph�ch ��n",
            szFunc = "_w_newbie_Give_LinhPhachDon(1)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_TAYTAMLUYENLO7,
        },
        {
            szSelect = "Nh�n 5 Thi�n Th�ch Tinh Th�ch",
            szFunc = "_w_newbie_Give_ThienThachTinhThach(5)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_SACHKYNANGPET6,
        },
        {
            szSelect = "Nh�n 5000 v�ng",
            szFunc = "_w_newbie_Give_Money(50000000)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_VANG,
        },
        {
            szSelect = "Nh�n 3 Th��ng H�i Di Ch�u 6",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(6,3)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_MANHMACGIA,
        },
        {
            szSelect = "Nh�n 1 Huy�t B� ��",
            szFunc = "_w_newbie_Give_HuyetBoDe(1)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY_BIT_HUYETBODE,
        },
        {
            szSelect = "Nh�n 1 Th��ng H�i Di Ch�u 7",
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
            --tinsert(tbReadyGet, format("%s%s/nothing", "[�� nh�n] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hi�n th� �� nh�n � d��i
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> �� nh�n h�t c�c h� tr� n�y r�i, khi kh�c h�y quay l�i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end

---M� menu nh�n th��ng nhi�m v� ��c th�
function _w_newbie_OpenMenu_DailyTaskSupport2()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckDailyTask2();
    --local tbSay = { format("H� tr� t�n th� ��c bi�t d�nh cho t�n th� d��i 3 ng�y ho�c �� ho�n th�nh c�c nhi�m v�: \n" .. WLib:Join(tbTaskStatus, "\n"), m_nDayStartCheckDailyTask) };
    local tbSay = { "H� tr� ��c th� n�y ch� d�nh cho nh�n s� �� ho�n th�nh c�c nhi�m v�: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        {
            szSelect = "Nh�n trang b� V�n S�c Lv3",
            szFunc = "_w_newbie_Give_VanSuc3(0)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_VANSUC3,
        },
        {
            szSelect = "Nh�n 4,000 v�ng",
            szFunc = "_w_newbie_Give_Money(40000000)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_VANG,
        },
        {
            szSelect = "Nh�n 5 m�t t�ch b� �i�n 20% 3 ph� l�c",
            szFunc = "_w_newbie_Give_MatTichBiDien(5)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_BIDIEN,
        },
        {
            szSelect = "Nh�n 50 tu ch�n y�u quy�t (luy�n m�t t�ch)",
            szFunc = "_w_newbie_Give_TuChan(50)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_TUCHAN,
        },
        {
            szSelect = "Nh�n 5,000 �i�m l�ch luy�n (ti�n c�p m�t t�ch)",
            szFunc = "_w_newbie_Give_LichLuyen(0, 5000, 100)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_LICHLUYEN,
        },
        {
            szSelect = "Nh�n 500 M�nh C� Quan M�c Gia (��i YQCC t�i Cao Nh�n � �n - C�n L�n)",
            szFunc = "_w_newbie_Give_ManhMacGia(500)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_MANHMACGIA,
        },
        {
            szSelect = "Nh�n 20 s�ch k� n�ng b�n ��ng h�nh Lv5",
            szFunc = "_w_newbie_Give_SachPetLv5(20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_SACHKYNANGPET,
        },
        {
            szSelect = "Nh�n 5 Th��ng H�i Di Ch�u Lv7",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(7, 5)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_THUONGHAIDICHAU,
        },
        {
            szSelect = "Nh�n 5,000 B�t Tr�n Ch�u",
            szFunc = "_w_newbie_Give_BotTranChau(5000)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_BOTTRANCHAU,
        },
        {
            szSelect = "Nh�n 100 �� m�i v� kh� c�c lo�i",
            szFunc = "_w_newbie_Give_DaMai(100)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_DAMAI,
        },
        {
            szSelect = "Nh�n 20 Thi�n Th�ch Tinh Th�ch (c��ng ho� trang b� +7 tr� l�n)",
            szFunc = "_w_newbie_Give_ThienThachTinhThach(20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_TTTT,
        },
        {
            szSelect = "Nh�n 20 T�y T�m + Luy�n l� Lv6 (t�y trang b�)",
            szFunc = "_w_newbie_Give_TayTamLuyenLo(6, 20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_TAYTAMLUYENLO,
        },
        {
            szSelect = "Nh�n 20 L�u Kim (c��ng ho� v�n s�c)",
            szFunc = "_w_newbie_Give_LuuKim(20)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_LUUKIM,
        },
        {
            szSelect = "Nh�n 10 Thi�n V�n Th�ch (gi� c��ng ho� v�n s�c)",
            szFunc = "_w_newbie_Give_ThienVanThach(10)",
            nTaskId = WTASKID_NEWBIE_GIVEDAILY2_BIT,
            nBitId = WTASKID_NEWBIE_GIVEDAILY2_BIT_THIENVANTHACH,
        },
        --{
        --    szSelect = "Nh�n 200 �� qu� c�c lo�i (kh�m trang b�)",
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
            --tinsert(tbReadyGet, format("%s%s/nothing", "[�� nh�n] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hi�n th� �� nh�n � d��i
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> �� nh�n h�t c�c h� tr� n�y r�i, khi kh�c h�y quay l�i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end

---M� menu nh�n th��ng nhi�m v� tu�n
function _w_newbie_OpenMenu_WeeklyTaskSupport()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckWeeklyTask();
    local tbSay = { "Th��ng h�ng tu�n ch� d�nh cho nh�n s� �� ho�n th�nh c�c nhi�m v�: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        --{
        --    szSelect = "Nh�n hi�u Ph� V��ng - sinh, gtt, v� c� (chon 1 trong 2 danh hi�u)",
        --    szFunc = "_w_newbie_Give_DanhHieuPhaVuong()",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_DANHHIEU,
        --},
        --{
        --    szSelect = "Nh�n hi�u Chi�n Th�n - dame, tdxc, ph� ��ch (chon 1 trong 2 danh hi�u)",
        --    szFunc = "_w_newbie_Give_DanhHieuChienThan()",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_DANHHIEU,
        --},
        
        --{
        --    szSelect = "Nh�n 200 T�y T�m + Luy�n l� Lv7 (t�y trang b�)",
        --    szFunc = "_w_newbie_Give_TayTamLuyenLo(7, 200)",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_TAYTAMLUYENLO7,
        --},
        --
        --{
        --    szSelect = "Nh�n 200 M�nh B� �i�n 30",
        --    szFunc = "_w_newbie_Give_ManhBiDien30(200)",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_MANHBIDIEN,
        --},
        --{
        --    szSelect = "Nh�n 20 Th��ng H�i Di Ch�u Lv7",
        --    szFunc = "_w_newbie_Give_ThuongHaiDiChau(7, 20)",
        --    nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
        --    nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_DICHAU,
        --},
        {
            szSelect = "Nh�n 2 Thi�n Cang L�nh",
            szFunc = "_w_newbie_Give_ThienCangLenh(2)",
            nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
            nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_TCL,
        },
        {
            szSelect = "Nh�n 2 Thi�n M�n Kim L�nh",
            szFunc = "_w_newbie_Give_ThienMonKimLenh(2)",
            nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
            nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_TMKL,
        },
        {
            szSelect = "Nh�n 1 Thanh Long H�n ",
            szFunc = "_w_newbie_Give_ThanhLongHon(5)",
            nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT,
            nBitId = WTASKID_WEEKLYTASK_GIVE_BIT_THANHLONGHON,
        },
        {
            szSelect = "Nh�n 1000 v�ng",
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
            --tinsert(tbReadyGet, format("%s%s/nothing", "[�� nh�n] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hi�n th� �� nh�n � d��i
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> �� nh�n h�t c�c h� tr� n�y r�i, khi kh�c h�y quay l�i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu()
    WTask:ResetDaily();

    local tbSay = { format("<npcname>: Ch�o <color=yellow>%s<color>, th�i gian hi�n t�i l� %s!", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };

    local tbSayOptionDef = {
        {
            szSelect = "[1 l�n] Nh�n 10.000 B�t Tr�n Ch�u",
            szFunc = "_w_newbie_Give_BotTranChau(10000)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_BOTTRANCHAU,
        },
        {
            szSelect = "[1 l�n] Nh�n ho� c�nh 50 m�ch",
            szFunc = "_w_newbie_Give_HoaCanh(50)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_HOACANH_150,
        },
        {
            szSelect = "[1 l�n] Nh�n trang b� Kim X� 7 Ch�n OP",
            szFunc = "_w_newbie_Give_KXLenh()",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_KIMXA7,
        },
        {
            szSelect = "[1 l�n] Nh�n H� Tr� Danh Hi�u ",
            szFunc = "_w_newbie_Give_NormalTitle()",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_DANHHIEU,
        },
        --
        -----trang b� ch�nh
        --{
        --    szSelect = "[1 l�n] Nh�n trang b� �m Huy�t +10",
        --    szFunc = "_w_newbie_Give_AmHuyet(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_AMHUYET,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n trang b� Thanh Long T��ng +10",
        --    szFunc = "_w_newbie_Give_ThanhLongTuong(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_THANHLONGTUONG,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n trang b� Thanh Long So�i +10",
        --    szFunc = "_w_newbie_Give_ThanhLongSoai(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_THANHLONGSOAI,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n trang b� V�n S�c Lv3 + 5 C� Kim Th�ch",
        --    szFunc = "_w_newbie_Give_VanSuc3(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_VANSUC3,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n trang b� Kim X� 6 +10",
        --    szFunc = "_w_newbie_Give_KimXa6(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KIMXA6,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n b� trang b� Chi�n Cu�ng +10",
        --    szFunc = "_w_newbie_Give_ChienCuong(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_CHIENCUONG,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n b� trang b� Di�u D��ng +10",
        --    szFunc = "_w_newbie_Give_DieuDuong(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_DIEUDUONG,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n b� s� m�n 3 +10",
        --    szFunc = "_w_newbie_Give_SuMon3(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_SM3,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n b� s� m�n 4 +10",
        --    szFunc = "_w_newbie_Give_SuMon4(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_SM4,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n b� s� m�n 5 +10",
        --    szFunc = "_w_newbie_Give_SuMon5(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_SM5,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n b� trang b� Buff 35 +10",
        --    szFunc = "_w_newbie_Give_SetBuff(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_SETBUFF,
        --},

        ---th��ng h�i di ch�u
        {
            szSelect = "[1 l�n] Nh�n 500 Th��ng H�i Ch�u Lv5 (ch�a gi�m ��nh)",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 500)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU,
        },
        {
            szSelect = "[1 l�n] Nh�n 50 Th��ng H�i Ch�u Lv6 (ch�a gi�m ��nh)",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(6, 50)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU6,
        },
        {
            szSelect = "[1 l�n] Nh�n 10 Linh Ph�ch ��n",
            szFunc = "_w_newbie_Give_LinhPhachDon(10)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_BOTTRANCHAU,
        },
        --{
        --    szSelect = "[1 l�n] Nh�n 50 T�y T�m + Luy�n L� Lv6 (t�y trang b�)",
        --    szFunc = "_w_newbie_Give_TayTamLuyenLo(6, 50)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_TAYTAMLUYENLO,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 300 T�y T�m + Luy�n L� Lv3 (t�y trang b�)",
        --    szFunc = "_w_newbie_Give_TayTamLuyenLo(3, 300)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_TAYTAMLUYENLO3,
        --},

        ---c�p �� v� ho� c�nh
        {
            szSelect = "[1 l�n] Nh�n chuy�n sinh 10 c�p 99",
            szFunc = "_w_newbie_Give_ChuyenSinh(1099)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_CHUYENSINH,
        },
        {
            szSelect = "Thay ��i h��ng chuy�n sinh",
            szFunc = "_w_newbie_Give_ChangeChuyenSinh()",
            nTaskId = 0,
            nBitId = 0,
        },
        --{
        --    szSelect = "[1 l�n] Nh�n ho� c�nh 90 m�ch",
        --    szFunc = "_w_newbie_Give_HoaCanh(90)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_HOACANH_90,
        --},

        -----m�t t�ch v� y�u quy�t
        --{
        --    szSelect = "[v� h�n] Nh�n m�t t�ch th�ng d�ng",
        --    szFunc = "_w_newbie_Give_MatTichThongDung(1)",
        --    nTaskId = 0, --WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = 0, --WTASKID_NEWBIE_BIT_GIVE_MATTICHTHUONG,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 50 Tu Ch�n Y�u Quy�t",
        --    szFunc = "_w_newbie_Give_TuChan(50)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_TUCHAN,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 5 m�t t�ch B� �i�n",
        --    szFunc = "_w_newbie_Give_MatTichBiDien(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_MATTICHBIDIEN,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 3 b� y�u quy�t",
        --    szFunc = "_w_newbie_Give_YeuQuyet(3)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_YEUQUYET,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 5,000 �i�m L�ch Luy�n v� 100 Ch�n Quy�n Tinh Hoa",
        --    szFunc = "_w_newbie_Give_DiemLuyenMatTich(0, 5000, 100)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_DIEMLUYENMATTICH,
        --},
        --
        -----kinh m�ch
        --{
        --    szSelect = "[1 l�n] Nh�n kinh m�ch V� Th�nh + 900,000 ch�n kh�",
        --    szFunc = "_w_newbie_Give_KinhMachVoThanh()",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KINHMACHVOTHANH,
        --},
        --{
        --    szSelect = "[m�i ng�y] Nh�n 500 Kinh M�ch ��ng Nh�n",
        --    szFunc = "_w_newbie_Give_KinhMachDongNhan(500)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KINHMACHDONGNHAN,
        --},
        --{
        --    szSelect = "[m�i ng�y] Nh�n 500 Kinh M�ch Ng�n Nh�n",
        --    szFunc = "_w_newbie_Give_KinhMachNganNhan(500)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_KINHMACHNGANNHAN,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 900,000 �i�m Ch�n Kh�",
        --    szFunc = "_w_newbie_Give_ChanKhi(900000)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_CHANKHI,
        --},

        -----bang h�i
        --{
        --    szSelect = "[1 l�n] Nh�n t�n v�t bang h�i Lv20",
        --    szFunc = "_w_newbie_Give_TinVatBangHoi(20)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_TINVAT,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n danh hi�u bang h�i Lv10",
        --    szFunc = "_w_newbie_Give_DanhHieuBangHoi(10)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_HIEUBANG,
        --},
        --
        -----pet
        --{
        --    szSelect = "[1 l�n] Ho�n th�nh ph�c sinh b�n ��ng h�nh 1+2",
        --    szFunc = "_w_newbie_Give_PhucSinhPet1()",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_PHUCSINHPET1,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 5 H�c B�ch K�",
        --    szFunc = "_w_newbie_Give_HacBachKy(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_HACBACHKY,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 20 s�ch k� n�ng b�n ��ng h�nh Lv5",
        --    szFunc = "_w_newbie_Give_SachPetLv5(20)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_SACHPET5,
        --},

        ---v�t ph�m h� tr�
        --{
        --    szSelect = "[1 l�n] Nh�n 999 �� qu� c�c lo�i (kh�m trang b�)",
        --    szFunc = "_w_newbie_Give_DaQuy(-1, 999)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_DAQUY,
        --},
        {
            szSelect = "[m�i ng�y] Nh�n 100 B�ng Th�ch (s�a ��)",
            szFunc = "_w_newbie_Give_RepairStone(100)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_SUADO,
        },
        --{
        --    szSelect = "[1 l�n] Nh�n 100 �� m�i v� kh� c�c lo�i",
        --    szFunc = "_w_newbie_Give_DaMai(100)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_MAIDAMAGE,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n 10,000 �i�m Ti�u Y Ph��ng",
        --    szFunc = "_w_newbie_Give_NgoaiTrang(10000)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_NGOAITRANG,
        --},
        --{
        --    szSelect = "[1 l�n] Nh�n danh hi�u Chi�n Cu�ng, Ph� Qu�n",
        --    szFunc = "_w_newbie_Give_NormalTitle()",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_DANHHIEU,
        --},
        {
            szSelect = "[1 l�n] Nh�n 100 b�nh m�u, mana c�c lo�i",
            szFunc = "_w_newbie_Give_Medicine(100)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_DUOCPHAM,
        },
        --{
        --    szSelect = "[1 l�n] Nh�n 500 v�ng",
        --    szFunc = "_w_newbie_Give_Money(5000000)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE_VANG,
        --},
        {
            szSelect = "[1 l�n] Nh�n 1 Th�n H�nh B�o �i�n",
            szFunc = "_w_newbie_Give_ThanHanh(1)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE2_THANHANH,
        },
        --{
        --    szSelect = "[1 l�n] Nh�n 5 ��i ��nh H�n",
        --    szFunc = "_w_newbie_Give_DaiDinhHon(5)",
        --    nTaskId = WTASKID_NEWBIE_BIT_GIVE2_STATUS,
        --    nBitId = WTASKID_NEWBIE_BIT_GIVE2_DAIDINHHON,
        --},
        {
            szSelect = "[1 l�n] Nh�n th� c��i ng�u nhi�n",
            szFunc = "_w_newbie_Give_ThuCuoi(1)",
            nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS,
            nBitId = WTASKID_NEWBIE_BIT_GIVE_THUCUOI,
        },
        --{
        --    szSelect = "[1 l�n] Nh�n 1,000 Thi�t Tinh c�c lo�i",
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
            --tinsert(tbReadyGet, format("%s%s/nothing", "[�� nh�n] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hi�n th� �� nh�n � d��i
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> �� nh�n h�t c�c h� tr� n�y r�i, khi kh�c h�y quay l�i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end

---M� menu nh�n th��ng nhi�m v� h� tr� t�n th�
function _w_newbie_OpenMenu_Support1()
    WTask:ResetDaily();

    local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckSupport1Task();
    local tbSay = { "Ph�n th��ng h� tr� t�n th� ch� d�nh cho nh�n s� �� ho�n th�nh c�c nhi�m v�: \n" .. WLib:Join(tbTaskStatus, "\n") };

    local tbSayOptionDef = {
        {
            szSelect = "Nh�n 20 B�a c��ng ho� 12 13 14 15",
            szFunc = "_w_newbie_Give_BuaCuongHoa(-1, 20)",
            nTaskId = WTASKID_SUPPOE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_BUACUONGHOA,
        },
        {
            szSelect = "Nh�n 200 M�nh B� �i�n 27",
            szFunc = "_w_newbie_Give_ManhBiDien27(200)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_MANHBIDIEN27,
        },
        {
            szSelect = "Nh�n 100 M�nh B� �i�n 30",
            szFunc = "_w_newbie_Give_ManhBiDien30(100)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_MANHBIDIEN30,
        },
        {
            szSelect = "Nh�n 20 Th��ng H�i Di Ch�u Lv7",
            szFunc = "_w_newbie_Give_ThuongHaiDiChau(7, 20)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_DICHAU,
        },
        {
            szSelect = "Nh�n 50 Thi�n Th�ch Tinh Th�ch",
            szFunc = "_w_newbie_Give_ThienThachTinhThach(50)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_THIENTHACHTINHTHACH,
        },
        {
            szSelect = "Nh�n 2 ��i ��nh H�n",
            szFunc = "_w_newbie_Give_DaiDinhHon(2)",
            nTaskId = WTASKID_SUPPORT1_GIVE_BIT,
            nBitId = WTASKID_SUPPORT1_GIVE_BIT_DAIDINHHON,
        },
        {
            szSelect = "Nh�n 50 Ch�n V� H�n Th�ch",
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
            --tinsert(tbReadyGet, format("%s%s/nothing", "[�� nh�n] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hi�n th� �� nh�n � d��i
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "<sex> �� nh�n h�t c�c h� tr� n�y r�i, khi kh�c h�y quay l�i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_KinhMach()
    local tbSay = { "Nh�n h� tr� li�n quan Kinh m�ch" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_900KCK()", "Nh�n 900k Ch�n Kh�"));
    tinsert(tbSay, format("%s/#_w_newbie_TayChanKhi()", "T�y Ch�n Kh�"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachVoThanh()", "Kinh M�ch V� Th�nh + 900k Ch�n Kh�"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachDongNhan(500)", "500 Kinh M�ch ��ng Nh�n"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachNganNhan(200)", "200 Kinh M�ch ��ng Nh�n"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);

end

function _w_newbie_OpenMenu_HoaMachCanh()
    local tbSay = { "Nh�n H� Tr� H�a M�ch C�nh!\n��i v�i H�a M�ch VIP  s� n�ng l�n ��n m�c 10 c�p ti�p theo.\n<color=yellow>V� d�: H�a M�ch c�p 154 s� tr�c ti�p l�n c�p 160<color>.\n<color=red>H�a M�ch VIP ch� nh�n 1 l�n<color>" };

    --tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh(140)", "Nh�n H�a m�ch 140 mi�n ph�"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh120()", "25 TCL+25TMKL + 15 Linh Ph�ch ��n n�ng H�a M�ch 120"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh130()", "50 TCL+50TMKL + 30 Linh Ph�ch ��n n�ng H�a M�ch 130"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(1)", "155 TCL+155 + 60 Linh Ph�ch ��n n�ng H�a M�ch 210"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(2)", "165 TCL+165 + 70 Linh Ph�ch ��n n�ng H�a M�ch 220"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(3)", "175 TCL+175 + 80 Linh Ph�ch ��n n�ng H�a M�ch 230"));
    tinsert(tbSay, format("%s/#_w_newbie_buy_HoaCanh2024(4)", "185 TCL+185 + 90 Linh Ph�ch ��n n�ng H�a M�ch 240"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_VIP122023()", "75 TCL+75TMKL + 45 Linh Ph�ch ��n n�ng H�a M�ch VIP"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);

end
function _w_newbie_OpenMenu_OtherSupport()
    local tbSay = { "Nh�n h� tr� kh�c:" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_NLNuoiKimXa(1000)", "Nh�n 1000 thi�t tinh 1-2-3-4"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMonDanhVong(10000)", "Nh�n 10,000 s� m�n, danh v�ng"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_BotTranChau(10000)", "Nh�n 10000 B�t Tr�n Ch�u"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_RepairStone(100)", "Nh�n B�ng Th�ch v� m�nh b�ng th�ch"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChangeChuyenSinh()", "Chuy�n h��ng chuy�n sinh"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DanhHieuBangHoi(10)", "Nh�n danh hi�u bang h�i lv10"));
    tinsert(tbSay, format("%s/#_w_newbie_OpenMenu_NhanTuiDaQuy()", "Nh�n T�i �� Qu� 1-6"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_NormalTitle()", "Nh�n c�c lo�i danh hi�u kh�c"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_QuayThuong()
    local tbSay = { "Quan Th��ng:" };
    tinsert(tbSay, format("%s/_open_gem_lucky_box", "Quay th��ng"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_NLNuoiKimXa(1000)", "Nh�n 1000 thi�t tinh 1-2-3-4"));
    tinsert(tbSay, format("%s/#QuayThuong_GetAccumulateAward()", "T�ch L�y Quay Th��ng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_BookSupport()
    local tbSay = { "Nh�n h� tr� li�n quan m�t t�ch:" };

    tinsert(tbSay, format("%s/#_w_book_AddCommonBook(0, 3, 10, 4, 95, 95, 95, 95)", "Nh�n c�c lo�i m�t t�ch th�ng d�ng"));
    tinsert(tbSay, format("%s/#_w_book_LearnBookEquip()", "Luy�n nhanh m�t t�ch �ang trang b�"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiemLuyenMatTich(0, 0, 1000)", "Ch�n Quy�n Tinh Hoa +1000"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ManhBiDien27(200)", "Nh�n 200 M�nh B� �i�n  27%"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_YeuQuyet()", "Nh�n y�u quy�t"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_Buy_BatNha_HatGiong()
    local tbSay = { "Mua B�t Nh� Nh� v� H�t Gi�ng:" };

    tinsert(tbSay, format("%s/#_w_newbie_Buy_BatNhaLon(1)", "Mua 1 B�t Nh� Nh� b�ng 50 v�ng"));
    tinsert(tbSay, format("%s/#_w_newbie_Buy_HatGiong(1)", "Mua 1 T�i h�t Gi�ng b�ng 200 v�ng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_monthly_ward()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 5000 }, -- xu v�t ph�m
        }
    };
    local tbAward = {
        { tbProp = { 2, 1, 40124 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Thanh V�n ��i Ph�
    };

    local nMonth = tonumber(date("%m"));
    local nowBuy=GetTask(WTASKID_HOTROHANGTHANG2024);
    if nMonth ==nowBuy then
        WNpc:Talk("Th�ng n�y b�n �� mua T�i H� Tr� Th�ng");
        return 0;
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE  then
        WAward:Give(tbAward, "item_newbie_card");
        SetTask(WTASKID_HOTROHANGTHANG2024,nMonth);
        WNpc:Talk("B�n �� mua th�nh c�ng 1 T�i H� Tr� Th�ng");
    end
end
function _w_newbie_buy_DauHon()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 70 }, -- xu v�t ph�m
        }
    };
    local tbAward = {
        { tbProp = { 2,1,1157 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --u H�n
    };
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE  then
        WAward:Give(tbAward, "item_newbie_card");
        WNpc:Talk("B�n �� mua 1 ��u H�n");
    end
end


function _w_newbie_OpenMenu_ItemTest()
    local tbSay = { "Nh�n h� tr�  Trang b�:" };
    --tinsert(tbSay, format("%s/#_w_newbie_Give_KXLenh()", "Nh�n Set Kim X�"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SatTinh(15)", "Nh�n trang b� S�t Tinh +15"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_ThanhLongTuong(15)", "Nh�n trang b� Thanh Long Tuong +15"));
    tinsert(tbSay, format("%s/#KsgItem:AddSuitByBody(30207, 15)", "Nh�n trang b� Thi�n h� v� song"));
    tinsert(tbSay, format("%s/#_w_tong_AddToken(15, \"item_test_card\")", "Nh�n t�n v�t bang h�i c�p 15"));


    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_VanSuc3(10)", "Nh�n trang b� V�n S�c Lv3 + 5 C� Kim Th�ch"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon3(15)", "Nh�n b� s� m�n 3 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon4(15)", "Nh�n b� s� m�n 4 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon5(15)", "Nh�n b� s� m�n 5 +15"));

    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_ChienCuong(15)", "Nh�n b� trang b� Chi�n Cu�ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DieuDuong(15)", "Nh�n b� trang b� Di�u D��ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SetBuff(15)", "Nh�n b� trang b� Buff 35 +15"));
    --tinsert(tbSay, format("%s/#_w_newbie_Give_KimXa6(15)", "Nh�n trang b� Kim X� 6 +15"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_NhanThuongHaiDiChau()
    local tbSay = { "Nh�n Th��ng H�i Di Ch�u:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(1, 200)", "Nh�n 200 th��ng hai di ch�u lv1"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(2, 200)", "Nh�n 200 th��ng hai di ch�u lv2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(3, 200)", "Nh�n 200 th��ng hai di ch�u lv3"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(4, 200)", "Nh�n 200 th��ng hai di ch�u lv4"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_NhanTuiDaQuy()
    local tbSay = { "Nh�n t�i �� qu�:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(1, 500)", "Nh�n 500 T�i �� qu� lv1"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(2, 500)", "Nh�n 500 T�i �� qu� lv2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(3, 500)", "Nh�n 500 T�i �� qu� lv3"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(4, 500)", "Nh�n 500 T�i �� qu� lv4"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(5, 500)", "Nh�n 500 T�i �� qu� lv5"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TuiDaQuy(6, 500)", "Nh�n 500 T�i �� qu� lv6"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_ThuCung()
    local tbSay = { "Menu Th� C�ng Pet:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet1()", "Ho�ng Th�nh Ph�c Sinh Th� C�ng 1+2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_HacBachKy(3)", "Nh�n H�c b�ch k�"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SachPetLv5(100)", "Nh�n t�i k� n�ng th� c�ng lv5"));
    tinsert(tbSay, format("%s/#_w_newbie_Buy_TienDieu()", "��i 10 Thi�n Cang l�nh +10 Thi�n M�n KL l�y Ti�n �i�u"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_NhanPhucsinhthucung()
    local tbSay = { "Nh�n ph�c sinh pet:" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet1()", "Nh�n phuc sinh pet 1"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet2()", "Nh�n phuc sinh pet 2"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_newbie_OpenMenu_TrangbiUpdate122024()
    local tbSay = { "��i nguy�n li�u l�y trang b� nhanh:" };
    tinsert(tbSay, format("%s/_w_newbie_Buy_UHT_2024", "Nh�n b� Uy H� T��ng"));
    tinsert(tbSay, format("%s/_w_newbie_Buy_VanSuc4_2024", "Nh�n b� V�n S�c 4"));
    tinsert(tbSay, format("%s/_w_newbie_Give_PhaHonLenhBai", "Nh�n b� Ph� H�n"));
    tinsert(tbSay, format("%s/_w_newbie_Give_1500000CongTrang", "Nh�n H� Tr�  3Tr C�ng Tr�ng"));
    if WTask:GetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS,WTASKID_NEWBIE_BIT_GIVE_KIMXA6)~=1 then
        tinsert(tbSay, format("%s/_w_newbie_Buy_KimXa8_2024", "Nh�n b� Kim X� 8"));
    end

    tinsert(tbSay, format("%s/#_w_newbie_Give_HoaCanh(140)", "Nh�n H�a m�ch 140 mi�n ph�"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
function _w_newbie_OpenMenu_Rank_2024()
    local nCurRank=GetTask(704);
    local checkRankLieu=GetTask(WTASKID_QHTUONG_UNLIMIT2024_LIEU) or 0;
    local checkRankTong=GetTask(WTASKID_QHTUONG_UNLIMIT2024_TONG) or 0;
    local szCheck="";
    if checkRankLieu==1 then
        szCheck=szCheck.."\n <color=red>�� mua Qu�n H�m T��ng - Li�u v�nh vi�n<color>"
    end
    if checkRankTong==1 then
        szCheck=szCheck.."\n <color=red>�� mua Qu�n H�m T��ng - T�ng v�nh vi�n<color>"
    end
    local tbSay = { "N�ng c�p Qu�n H�m:"..szCheck };
    if nCurRank <5 and nCurRank>-5 then
        tinsert(tbSay, format("%s/_w_newbie_Buy_QhTuong", "N�ng c�p Qu�n h�m T��ng (c�n 500 xu v�t ph�m)"));
    end

    if nCurRank <0 and nCurRank>-5 and checkRankLieu ==0  then
        tinsert(tbSay, format("%s/_w_newbie_Buy_QhTuong_Unlimit", "N�ng c�p Qu�n h�m T��ng - Li�u v�nh vi�n (c�n 3000 xu v�t ph�m)"));
    end
    if nCurRank >0 and nCurRank <5 and checkRankTong ==0  then
        tinsert(tbSay, format("%s/_w_newbie_Buy_QhTuong_Unlimit", "N�ng c�p Qu�n h�m T��ng - T�ng v�nh vi�n (c�n 3000 xu v�t ph�m)"));
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end



function _wnewbie_LoadDuaTopBXHData()
    local nWeeks, nRank, nPoint = GetPlayerRank();
    --print(nWeeks, nRank, nPoint);
    if nRank == nil then
    elseif nRank > 0 then -- X�a tr�n BXH T�ng tu�n tr��c
        RemoveRelayShareDataByIndex('_PlayerBattleRankS', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
    elseif nRank < 0 then -- X�a tr�n BXH Li�u tu�n tr��c

        RemoveRelayShareDataByIndex('_PlayerBattleRankL', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
    end
end
function RemoveRelayBRT(bSuccess)
    if bSuccess == 1 then
        -- ��nh gi� qu�n h�m
        --SetRankPoint(5, 701, 1);
        --SetTask(TSK_TRANS_POINT_ALLOW,1);

        -- C�p nh�p qu�n h�m
        --CalcBattleRank();
        --UpdateBattleMaxRank();
    end
end
function TestMSG_newbie()
    local a=GetTask(4063) or 0
    local b=GetTask(2686) or 0
    local c=GetTask(4088) or 0
    local d=GetTask(4093) or 0
    Talk(1, "", format("S� l�n Kill BOSS DHC: %d - LSB: %d. Thu ho�ch BNL: %d. Thu nh�p TNC : %d", a,b,c,d));
end
