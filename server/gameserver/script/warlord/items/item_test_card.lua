----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-10
--- Description: c�c h�m li�n quan ��n test
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Import("\\script\\warlord\\functions\\function_test.lua");
Import("\\script\\warlord\\functions\\function_gm.lua");
Import("\\script\\warlord\\functions\\function_newbie.lua");
Import("\\script\\warlord\\functions\\function_top_award.lua");
Import("\\script\\warlord\\functions\\function_tong.lua");
Import("\\script\\warlord\\functions\\function_book.lua");
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong_award.lua")
Include("\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong_head.lua")
----------------------------------------------------------------------------------------------------

function _w_test_ReloadItem()
    dofile("script/warlord/functions/function_test.lua");
    dofile("script/warlord/functions/function_newbie.lua");
    dofile("script/warlord/items/item_test_card.lua");
    dofile("script/warlord/libs/lib_award.lua");
    WPlayer:Msg(date("%Y-%m-%d %H:%M:%S")..": item_test_card update!");
end

function OnUse(nItemIdx)
    --_w_test_ReloadItem();
    OnUse_ItemTestCard(nItemIdx);
end

function OnUse_ItemTestCard(nItemIdx)
    if (WLib:GetSrvCfg("bOpenTestCard") ~= 1 or WDate:Today() > WLib:GetSrvCfg("tbTimeTest").nEndDate)
           -- and WPlayer:IsSuperAdmin() == WEnv.FALSE
    then
        WItem:DelByIndex(nItemIdx);
        WNpc:Talk("S� ki�n tr�i nghi�m t�nh n�ng �� k�t th�c, v�t ph�m b� hu� b�!");
        return WEnv.RETCODE_NOTOPEN;
    end

    -- Reset c�c h� tr� trong th� t�n th�
    WTask:Set(WTASKID_NEWBIE_BIT_GIVE_STATUS, 0);
    WTask:Set(WTASKID_NEWBIE_BIT_GIVE2_STATUS, 0);
    local tbSay = { format("Ch�o <color=yellow>%s<color>, th�i gian hi�n t�i l� %s!\n"..
            "\nServer �ang trong giai �o�n TEST. �� thu�n ti�n trong qu� tr�nh tr�i nghi�m c�a <sex>, c�c trang b� c� th� nh�n t�i kh�ng gi�i h�n t�i Th� T�n Th� th�ng qua <color=white>Th� Tr�i Nghi�m<color>. Ch�c <sex> vui v� c�ng h�o h�u trong su�t qu� tr�nh tr�i nghi�m!", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };
    local nRoute = WPlayer:GetRoute();

    if nRoute == 0 then
        tinsert(tbSay, format("%s/kgm_ChangeRoute", "Ta mu�n gia nh�p m�n ph�i v� h�c k� n�ng"));
    else
        tinsert(tbSay, format("%s/#_w_test_OpenReset_ItemNewbieCard(%d)", "Nh�n trang b� khi open (m� th� tr�i nghi�m kh�ng gi�i h�n t�i ��y)", nItemIdx));
        tinsert(tbSay, format("%s/#_w_test_Give_RuongPhuBan()", "Nh�n Test r��ng V��t �i"));
        --tinsert(tbSay, format("%s/#_w_test_Give_EventT12()", "Nh�n Test Event T12"));
        tinsert(tbSay, format("%s/#_w_test_NhanHotroCapHC()", "Nh�n chuy�n Sinh - H�a C�nh"));
        --tinsert(tbSay, format("%s/#_w_newbie_Give_VoSongChienThan(7)", "Nh�n trang b� V� Song Chi�n Th�n +7"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_ItemTest()", "Nh�n trang b� h� tr�"));
        tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(5)", "Nh�n qu�n h�m t��ng qu�n"));
        tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(6)", "Nh�n qu�n h�m So�i"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_KinhMach()", "H� tr� Kinh M�ch"));
        tinsert(tbSay, format("%s/#test_changeCongTrang2020(1)", "Chuy�n sang Li�u"));

        tinsert(tbSay, g_szSpaceLine);

        tinsert(tbSay, format("%s/#_w_test_OpenMenu_TongSupport()", "H� tr� li�n quan bang h�i"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_OtherSupport()", "H� tr� v�ng, �i�m, qu�n h�m, nguy�n li�u, ..."));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_BookSupport()", "H� tr� li�n quan m�t t�ch"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_ThuCung()", "H� tr� li�n quan Th� C�ng"));
        --tinsert(tbSay, format("%s/#set500_QuayThuong()", "Nh�n 8000 l��t quay th��ng"));
        if WPlayer:IsSuperMod() == WEnv.TRUE or WPlayer:IsSuperAdmin() == WEnv.TRUE then
            tinsert(tbSay, format("%s/#_w_test_GenCode()", "T�o m�t giftcode"));
            tinsert(tbSay, format("%s/#get10VKNguyenTu()", "L�y VK Nguy�n T�"));
            tinsert(tbSay, format("%s/#GiveBackHonor()", "Checkkkkkkkk"));
        end


    end

    tinsert(tbSay, g_szSpaceLine);
    if WPlayer:IsSuperAdmin() == WEnv.TRUE
        or WPlayer:IsAdmin() == WEnv.TRUE
        or WPlayer:IsSuperMod() == WEnv.TRUE
        or WPlayer:IsModLive() == WEnv.TRUE
        or WPlayer:IsTester() == WEnv.TRUE
    then
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_NoiBo()", "### Menu test admin ###"));
    end

    if WPlayer:IsSuperAdmin() == WEnv.TRUE then
        tinsert(tbSay, format("%s/#_w_test_ReloadItem()", "### Reload Th� Tr�i Nghi�m ###"));
    end
    
    tinsert(tbSay, "[!] Thanh l� v�t ph�m/_wgm_ClearBag");
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
function set500_QuayThuong()
    SetTask(TASKID_LUCKYBOX_COUNT, 8000);
end
function get10VKNguyenTu()
    for i=1 ,15 do
        BbrAward:GiveRandomWeapon(9);
    end

end
function _w_test_OpenReset_ItemNewbieCard(nItemIdx)
    SetPlayerScript("\\script\\warlord\\items\\item_newbie_card.lua");
    SendScript2VM("\\script\\warlord\\items\\item_newbie_card.lua", format("OnUse_ItemNewbieCard(%d)", nItemIdx));
end
function _w_test_NhanHotroCapHC()
    local tbSay = { "Nh�n h� tr� Chuy�n Sinh-H�a C�nh" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChuyenSinh(1099)", "Nh�n Chuy�n Sinh 10 - 99"));
    tinsert(tbSay, format("%s/#_w_test_NhanHMC300()", "H�a m�ch C�nh 300"));


    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);

end

function _w_test_NhanHMC300()
    nLevel1 = 99;
    nLevel2 = 199;
    nLevel3 = 300;
    WPlayer:LevelUpFair(nLevel1);
    WPlayer:LevelUpFair(nLevel2);
    WPlayer:LevelUpFair(nLevel3);
end

function _w_test_OpenMenu_BookSupport()
    local tbSay = { "Nh�n h� tr� li�n quan m�t t�ch:" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_ManhBiDien30(100)", "Nh�n 100 b� �i�n 30"));
    tinsert(tbSay, format("%s/#_w_book_AddBookByType(3, 6, 10, 4, 120, 120, 120, 120)", "Nh�n B� �i�n luy�n s�n c�p 99"));
    tinsert(tbSay, format("%s/#_w_book_AddCommonBook(0, 3, 10, 4, 95, 95, 95, 95)", "Nh�n c�c lo�i m�t t�ch th�ng d�ng"));
    tinsert(tbSay, format("%s/#_w_book_LearnBookEquip()", "Luy�n nhanh m�t t�ch �ang trang b�"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiemLuyenMatTich(50000, 50000, 0)", "�i�m Luy�n v� L�ch Luy�n  +50000"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiemLuyenMatTich(0, 0, 1000)", "Ch�n Quy�n Tinh Hoa +1000"));
    tinsert(tbSay, format("%s/#_w_test_Give_YeuQuyet()", "Nh�n Y�u Quy�t"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_test_OpenMenu_TongSupport()
    local tbSay = { "Nh�n h� tr� li�n quan bang h�i:" };

    tinsert(tbSay, format("%s/#_w_tong_ShowCreateDialog(1, \"item_test_card\")", "T�o bang h�i"));
    tinsert(tbSay, format("%s/#_w_tong_AddLevel(\"item_test_card\")", "Th�ng c�p bang h�i"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TinVatBangHoi(25)", "Nh�n t�n v�t bang h�i"));
    tinsert(tbSay, format("%s/#_w_tong_AddTitle(nil, \"item_test_card\")", "Nh�n danh hi�u bang h�i"));
    tinsert(tbSay, format("%s/#_w_tong_AddGxd(10000, \"item_test_card\")", "Nh�n 10,000 �i�m c�ng hi�n bang h�i"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DanhHieuBangHoi(10)", "Nh�n danh hi�u bang h�i lv10"));
    tinsert(tbSay, format("%s/#_w_test_Give_HiepNghiaChiChung()", "Nh�n 10k Hi�p ngh�a Chi Ch�ng"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_test_OpenMenu_OtherSupport()
    local tbSay = { "Nh�n c�c h� tr� kh�c:" };

    tinsert(tbSay, format("%s/#_w_test_Give_Money(100)", "Nh�n 100,000 v�ng"));
    tinsert(tbSay, format("%s/#_w_test_Give_Coin(10)", "Nh�n 10,000 xu"));
    tinsert(tbSay, format("%s/#_w_test_Give_LinhKhiRucRo(1000)", "Nh�n 1000 Linh Kh� R�c R� + Huy�t B� ��"));
    tinsert(tbSay, format("%s/#_w_test_Give_SuMonDanhVong(50000)", "Nh�n 50,000 s� m�n, danh v�ng"));
    tinsert(tbSay, format("%s/#_w_test_Give_PlayerTitle()", "Nh�n c�c lo�i danh hi�u"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_Medicine(999)", "Nh�n 999 m�i lo�i d��c ph�m"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThienCangLenh(100)", "Nh�n 100 Thi�n Cang l�nh"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ManhTuyBienChau(10000)", "Nh�n 10000 M�nh T�y bi�n ch�u"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThienMonKimLenh(100)", "Nh�n 100 Thi�n M�n Kim l�nh"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_newbie_Give_BotTranChau(10000)", "Nh�n 10000 B�t Tr�n Ch�u"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(7, 1000)", "Nh�n 1000 Th��ng H�i Di Ch�u lv7"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TayTamLuyenLo(3, 500)", "Nh�n 500 t�y t�m luy�n l� lv3"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TayTamLuyenLo(8, 500)", "Nh�n 500 t�y t�m luy�n l� lv8"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_Give_NangCapTuongSoai()", "Nh�n Nguy�n li�u n�ng c�p T��ng So�i"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLNuoiKimXa()", "Nh�n nguy�n li�u nu�i kim x�"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLTayThuocTinhKimXa()", "Nh�n �� t�y thu�c t�nh kim x�"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLKhoaThuocTinhKimXa()", "Nh�n �� kh�a thu�c t�nh kim x�"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLTinhVanToaLinhThach()", "Nh�n 100 Tinh V�n T�a Linh Th�ch1-6"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_Give_Gem()", "Nh�n c�c lo�i �� qu�"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLMaiDame()", "Nh�n c�c lo�i �� m�i v� kh�"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLSuaDo()", "Nh�n c�c lo�i nguy�n li�u s�a ��"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLCuongHoa()", "Nh�n c�c lo�i nguy�n li�u c��ng h�a"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLCuongHoaVS()", "Nh�n nguy�n li�u c��ng h�a v�n s�c"));


    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_test_OpenMenu_NoiBo()
    local tbSay = { "Menu test admin:" };

    tinsert(tbSay, format("%s/#_w_test_ReJoinRoute()", "Thay ��i m�n ph�i hi�n t�i"));
    if WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_BUFFTEST) == 0 then
        tinsert(tbSay, format("%s/#_w_test_BuffDame(1)", "Nh�n buff test"));
    else
        tinsert(tbSay, format("%s/#_w_test_BuffDame(0)", "H�y buff test"));
    end
    tinsert(tbSay, format("%s/#_w_newbie_Give_UyHoTuong(10)", "Nh�n trang b� Uy H� T��ng +10"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_UyHoSoai(10)", "Nh�n trang b� Uy H� So�i +10"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_VanSuc4(5)", "Nh�n trang b� V�n S�c Lv4"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SatTinh(10)", "Nh�n trang b� S�t Tinh +10"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_wgm_AddItem()", "L�y v�t ph�m"));
    tinsert(tbSay, format("%s/#ModifyExp(2e9)", "Nh�n 2 t� exp"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#WPlayer:ModifyHonor(100000)", "Nh�n th�m 100,000 �i�m c�ng tr�ng"));
    tinsert(tbSay, format("%s/#WPlayer:ModifyHonor(1000000)", "Nh�n th�m 1,000,000 �i�m c�ng tr�ng"));
    tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(6)", "Nh�n qu�n h�m nguy�n so�i"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishTaskCTC()", "Ho�n th�nh nhanh 1 l�n chi�n tr��ng ph�"));
    tinsert(tbSay, format("%s/#_w_test_FinishTaskCTP()", "Ho�n th�nh nhanh 1 l�n chi�n tr��ng ch�nh"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishTaskTNC()", "Ho�n th�nh nhanh 1 l��t ��o TNC (��n npc tr� nv)"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailyTaskLimitTNC()", "Reset s� gi�i h�n nhi�m v� TNC h�m nay"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailyTaskLimitTH()", "Reset l��t v�o Th�i H� h�m nay"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailySystem()", "Reset ng�y"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishMaxTuBaoTrai()", "Nh�n max l��t quay T� B�o Trai"));
    tinsert(tbSay, format("%s/#_w_test_ResetTuBaoTrai()", "Reset l��t quay T� B�o Trai"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishTaskVanTieu()", "Ho�n th�nh nhanh 1 l�n V�n Ti�u"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailyTaskLimitVanTieu()", "Reset s� gi�i h�n nhi�m v� V�n Ti�u h�m nay"));
    tinsert(tbSay, format("%s/#_w_test_SetOpenBox_BachBaoRuong()", "S�a s� l�n m� B�ch B�o R��ng"));
    tinsert(tbSay, g_szSpaceLine);
    if WPlayer:IsSuperMod() == WEnv.TRUE or WPlayer:IsSuperAdmin() == WEnv.TRUE then
        tinsert(tbSay, format("%s/#_w_test_GenCode()", "T�o m�t giftcode"));
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

-----Nh�n trang b� h� tr� c�p 15



function _w_test_OpenMenu_ItemTest()
    local tbSay = { "Nh�n h� tr�  Trang b�:" };
    tinsert(tbSay, format("%s/#_w_test_Give_KXLenh(6)", "Nh�n kim x� 9 ch�n OP"));
    tinsert(tbSay, format("%s/#_w_test_Give_TTLL9()", "Nh�n T�y t�m luy�n 9"));
    tinsert(tbSay, format("%s/#_w_test_Give_DHTLT()", "Nh�n ��i Hoang T�a Linh Th�ch"));
    tinsert(tbSay, format("%s/#_w_test_Give_Da9()", "Nh�n �� 9"));
    tinsert(tbSay, format("%s/#_w_test_Give_TTTA()", "Nh�n B�t Tr�n Tr�u Tinh Anh"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhaHonLenhBai()", "Nh�n set Ph� H�n"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_LangSuongLenhBai()", "Nh�n set L�ng S��ng"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KimXa9(15)", "Nh�n trang b� Kim X� 9 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChuTuocTuong(15)", "Nh�n trang b� Chu T��c T��ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChuTuocSoai(15)", "Nh�n trang b� Chu T��c Soai +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThanUng(15,1)", "Nh�n Th�n �ng T��ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThanUng(15,2)", "Nh�n Th�n �ng So�i +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SatTinh(15)", "Nh�n trang b� S�t Tinh +15"));
    tinsert(tbSay, "Nh�n b� Chi�n Kh� S�t Th�n +15/#KsgAward:SetChienKhiSatThan(15)");

    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_VanSuc5(5)", "Nh�n trang b� V�n S�c Lv5 + 5 C� Kim Th�ch"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon3(15)", "Nh�n b� s� m�n 3 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon4(15)", "Nh�n b� s� m�n 4 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon5(15)", "Nh�n b� s� m�n 5 +15"));

    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_ChienCuong(15)", "Nh�n b� trang b� Chi�n Cu�ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DieuDuong(15)", "Nh�n b� trang b� Di�u D��ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SetBuff(15)", "Nh�n b� trang b� Buff 35 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KimXa6(15)", "Nh�n trang b� Kim X� 6 +15"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end
-----Th� c�ng
function _w_test_OpenMenu_ThuCung()
    local tbSay = { "Nh�n h� tr� li�n quan Th� C�ng" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet1()", "Ho�ng Th�nh Ph�c Sinh Th� C�ng 1+2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SachPetLv7(20)", "Nh�n 20 s�ch k� n�ng ��ng h�nh lv7"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiaLinhTinhHoa(5)", "Nh�n 5 ��a Linh Tinh Hoa"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);

end
---Kinh m�ch
function _w_test_OpenMenu_KinhMach()
    local tbSay = { "Nh�n h� tr� li�n quan Kinh m�ch" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachVoThanh()", "Nh�n Kinh M�ch V� Th�nh +900k Ch�n Kh�"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachDongNhan(500)", "Nh�n 500 Kinh M�ch ��ng Nh�n"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachNganNhan(500)", "Nh�n 500 Kinh Ng�n nh�n"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);

end
function test_changeCongTrang2020(nType)
    local nHor = GetTask(701);
    if nType == 1 and nHor < 0 then
        Talk(1, "", szNpcName .. "��i hi�p �ang � phe Li�u r�i n�n kh�ng c�n ta gi�p �� ��u.")
        return 0
    end
    if nType == 2 and nHor >= 0 then
        Talk(1, "", szNpcName .. "��i hi�p �ang � phe T�ng r�i n�n kh�ng c�n ta gi�p �� ��u.")
        return 0
    end
    if nType == 1 and nHor >= 0 then
        --if DelItem(2,1,30370,25) == 1 and DelItem(2,95,204,25) == 1 then

            SetTask(701, -1000000)
            SetTask(704, -4)
            Talk(1, "", szNpcName .. "Ch�c m�ng ��i hi�p, ta �� gi�p ��i hi�p chuy�n sang phe Li�u th�nh c�ng.")
            gf_WriteLogEx("CHUYEN DOI PHE CONG TRANG", "chuy�n Li�u", 1, "T�ng sang Li�u")

    end
end
function _save_killct_test(nText)
    local szDate = date("%Y%m%d")
    local nCurTime = tostring(szDate);
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\logkill."..nCurTime..".txt";
    else
        fileName = "data/logkill"..nCurTime..".txt";
    end
    local pf = openfile(fileName, "a+");
    local txt="H�c D�c Long"..nText;
    if not pf then return end
    write(pf, format("%s", "\n"..txt))
    closefile(pf);
    return 1
end

function GiveBackHonor()
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\givebackhonor.txt";
    else
        fileName = "data/givebackhonor.txt";
    end
    --local szData=GetAccount()..'=';
    local szData=GetAccount().."=";
    local HonorGive=0;
    local pf = openfile(fileName, "r");
    if pf ~= nil then
        local str = ""
        local nRow = 0
        while 1 do
            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if strfind(str,szData) then
                local nPosition = strfind(str,"=");
                HonorGive = strsub(str,nPosition+1) or 0
                if GetTask(WTASKID_GIVEBACK_HONOR)~=1 then
                    WPlayer:ModifyHonor(HonorGive)
                    SetTask(WTASKID_GIVEBACK_HONOR,1)
                end
            end
        end
        closefile(pf);
        return HonorGive;
    else
        return 0
    end
end