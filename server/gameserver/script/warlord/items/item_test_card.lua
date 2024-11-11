----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-10
--- Description: c¸c hµm liªn quan ®Õn test
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
        WNpc:Talk("Sù kiÖn tr¶i nghiÖm tİnh n¨ng ®· kÕt thóc, vËt phÈm bŞ huû bá!");
        return WEnv.RETCODE_NOTOPEN;
    end

    -- Reset c¸c hç trî trong thÎ t©n thñ
    WTask:Set(WTASKID_NEWBIE_BIT_GIVE_STATUS, 0);
    WTask:Set(WTASKID_NEWBIE_BIT_GIVE2_STATUS, 0);
    local tbSay = { format("Chµo <color=yellow>%s<color>, thêi gian hiÖn t¹i lµ %s!\n"..
            "\nServer ®ang trong giai ®o¹n TEST. §Ó thuËn tiÖn trong qu¸ tr×nh tr¶i nghiÖm cña <sex>, c¸c trang bŞ cã thÓ nhËn t¹i kh«ng giíi h¹n t¹i ThÎ T©n Thñ th«ng qua <color=white>ThÎ Tr¶i NghiÖm<color>. Chóc <sex> vui vÎ cïng hµo h÷u trong suèt qu¸ tr×nh tr¶i nghiÖm!", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };
    local nRoute = WPlayer:GetRoute();

    if nRoute == 0 then
        tinsert(tbSay, format("%s/kgm_ChangeRoute", "Ta muèn gia nhËp m«n ph¸i vµ häc kü n¨ng"));
    else
        tinsert(tbSay, format("%s/#_w_test_OpenReset_ItemNewbieCard(%d)", "NhËn trang bŞ khi open (më thÎ tr¶i nghiÖm kh«ng giíi h¹n t¹i ®©y)", nItemIdx));
        tinsert(tbSay, format("%s/#_w_test_Give_RuongPhuBan()", "NhËn Test r­¬ng V­ît ¶i"));
        --tinsert(tbSay, format("%s/#_w_test_Give_EventT12()", "NhËn Test Event T12"));
        tinsert(tbSay, format("%s/#_w_test_NhanHotroCapHC()", "NhËn chuyÓn Sinh - Hãa C¶nh"));
        --tinsert(tbSay, format("%s/#_w_newbie_Give_VoSongChienThan(7)", "NhËn trang bŞ V« Song ChiÕn ThÇn +7"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_ItemTest()", "NhËn trang bŞ hç trî"));
        tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(5)", "NhËn qu©n hµm t­íng qu©n"));
        tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(6)", "NhËn qu©n hµm So¸i"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_KinhMach()", "Hç trî Kinh M¹ch"));
        tinsert(tbSay, format("%s/#test_changeCongTrang2020(1)", "ChuyÓn sang Liªu"));

        tinsert(tbSay, g_szSpaceLine);

        tinsert(tbSay, format("%s/#_w_test_OpenMenu_TongSupport()", "Hç trî liªn quan bang héi"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_OtherSupport()", "Hç trî vµng, ®iÓm, qu©n hµm, nguyªn liÖu, ..."));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_BookSupport()", "Hç trî liªn quan mËt tŞch"));
        tinsert(tbSay, format("%s/#_w_test_OpenMenu_ThuCung()", "Hç trî liªn quan Thó C­ng"));
        --tinsert(tbSay, format("%s/#set500_QuayThuong()", "NhËn 8000 l­ît quay th­ëng"));
        if WPlayer:IsSuperMod() == WEnv.TRUE or WPlayer:IsSuperAdmin() == WEnv.TRUE then
            tinsert(tbSay, format("%s/#_w_test_GenCode()", "T¹o mét giftcode"));
            tinsert(tbSay, format("%s/#get10VKNguyenTu()", "LÊy VK Nguyªn Tö"));
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
        tinsert(tbSay, format("%s/#_w_test_ReloadItem()", "### Reload ThÎ Tr¶i NghiÖm ###"));
    end
    
    tinsert(tbSay, "[!] Thanh lı vËt phÈm/_wgm_ClearBag");
    tinsert(tbSay, "[x] §ãng/nothing");
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
    local tbSay = { "NhËn hç trî ChuyÓn Sinh-Hãa C¶nh" };
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChuyenSinh(1099)", "NhËn ChuyÓn Sinh 10 - 99"));
    tinsert(tbSay, format("%s/#_w_test_NhanHMC300()", "Hãa m¹ch C¶nh 300"));


    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
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
    local tbSay = { "NhËn hç trî liªn quan mËt tŞch:" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_ManhBiDien30(100)", "NhËn 100 bİ ®iÓn 30"));
    tinsert(tbSay, format("%s/#_w_book_AddBookByType(3, 6, 10, 4, 120, 120, 120, 120)", "NhËn Bİ §iÓn luyÖn s½n cÊp 99"));
    tinsert(tbSay, format("%s/#_w_book_AddCommonBook(0, 3, 10, 4, 95, 95, 95, 95)", "NhËn c¸c lo¹i mËt tŞch th«ng dông"));
    tinsert(tbSay, format("%s/#_w_book_LearnBookEquip()", "LuyÖn nhanh mËt tŞch ®ang trang bŞ"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiemLuyenMatTich(50000, 50000, 0)", "§iÓm LuyÖn vµ LŞch LuyÖn  +50000"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiemLuyenMatTich(0, 0, 1000)", "Ch©n QuyÓn Tinh Hoa +1000"));
    tinsert(tbSay, format("%s/#_w_test_Give_YeuQuyet()", "NhËn YÕu QuyÕt"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_test_OpenMenu_TongSupport()
    local tbSay = { "NhËn hç trî liªn quan bang héi:" };

    tinsert(tbSay, format("%s/#_w_tong_ShowCreateDialog(1, \"item_test_card\")", "T¹o bang héi"));
    tinsert(tbSay, format("%s/#_w_tong_AddLevel(\"item_test_card\")", "Th¨ng cÊp bang héi"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TinVatBangHoi(25)", "NhËn tİn vËt bang héi"));
    tinsert(tbSay, format("%s/#_w_tong_AddTitle(nil, \"item_test_card\")", "NhËn danh hiÖu bang héi"));
    tinsert(tbSay, format("%s/#_w_tong_AddGxd(10000, \"item_test_card\")", "NhËn 10,000 ®iÓm cèng hiÕn bang héi"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DanhHieuBangHoi(10)", "NhËn danh hiÖu bang héi lv10"));
    tinsert(tbSay, format("%s/#_w_test_Give_HiepNghiaChiChung()", "NhËn 10k HiÖp nghÜa Chi Chøng"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_test_OpenMenu_OtherSupport()
    local tbSay = { "NhËn c¸c hç trî kh¸c:" };

    tinsert(tbSay, format("%s/#_w_test_Give_Money(100)", "NhËn 100,000 vµng"));
    tinsert(tbSay, format("%s/#_w_test_Give_Coin(10)", "NhËn 10,000 xu"));
    tinsert(tbSay, format("%s/#_w_test_Give_LinhKhiRucRo(1000)", "NhËn 1000 Linh Khİ Rùc Rì + HuyÕt Bå §Ò"));
    tinsert(tbSay, format("%s/#_w_test_Give_SuMonDanhVong(50000)", "NhËn 50,000 s­ m«n, danh väng"));
    tinsert(tbSay, format("%s/#_w_test_Give_PlayerTitle()", "NhËn c¸c lo¹i danh hiÖu"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_Medicine(999)", "NhËn 999 mçi lo¹i d­îc phÈm"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThienCangLenh(100)", "NhËn 100 Thiªn Cang lÖnh"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ManhTuyBienChau(10000)", "NhËn 10000 M¶nh Tïy biÕn ch©u"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThienMonKimLenh(100)", "NhËn 100 Thiªn M«n Kim lÖnh"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_newbie_Give_BotTranChau(10000)", "NhËn 10000 Bét Tr©n Ch©u"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThuongHaiDiChau(7, 1000)", "NhËn 1000 Th­¬ng H¶i Di Ch©u lv7"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TayTamLuyenLo(3, 500)", "NhËn 500 tÈy t©m luyÖn l« lv3"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_TayTamLuyenLo(8, 500)", "NhËn 500 tÈy t©m luyÖn l« lv8"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_Give_NangCapTuongSoai()", "NhËn Nguyªn liÖu n©ng cÊp T­íng So¸i"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLNuoiKimXa()", "NhËn nguyªn liÖu nu«i kim xµ"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLTayThuocTinhKimXa()", "NhËn ®¸ tÈy thuéc tİnh kim xµ"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLKhoaThuocTinhKimXa()", "NhËn ®¸ khãa thuéc tİnh kim xµ"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLTinhVanToaLinhThach()", "NhËn 100 Tinh VÉn Táa Linh Th¹ch1-6"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_Give_Gem()", "NhËn c¸c lo¹i ®¸ quı"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLMaiDame()", "NhËn c¸c lo¹i ®¸ mµi vò khİ"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLSuaDo()", "NhËn c¸c lo¹i nguyªn liÖu söa ®å"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLCuongHoa()", "NhËn c¸c lo¹i nguyªn liÖu c­êng hãa"));
    tinsert(tbSay, format("%s/#_w_test_Give_NLCuongHoaVS()", "NhËn nguyªn liÖu c­êng hãa v¨n søc"));


    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_test_OpenMenu_NoiBo()
    local tbSay = { "Menu test admin:" };

    tinsert(tbSay, format("%s/#_w_test_ReJoinRoute()", "Thay ®æi m«n ph¸i hiÖn t¹i"));
    if WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_BUFFTEST) == 0 then
        tinsert(tbSay, format("%s/#_w_test_BuffDame(1)", "NhËn buff test"));
    else
        tinsert(tbSay, format("%s/#_w_test_BuffDame(0)", "Hñy buff test"));
    end
    tinsert(tbSay, format("%s/#_w_newbie_Give_UyHoTuong(10)", "NhËn trang bŞ Uy Hæ T­íng +10"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_UyHoSoai(10)", "NhËn trang bŞ Uy Hæ So¸i +10"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_VanSuc4(5)", "NhËn trang bŞ V¨n Søc Lv4"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SatTinh(10)", "NhËn trang bŞ S¸t Tinh +10"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_wgm_AddItem()", "LÊy vËt phÈm"));
    tinsert(tbSay, format("%s/#ModifyExp(2e9)", "NhËn 2 tû exp"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#WPlayer:ModifyHonor(100000)", "NhËn thªm 100,000 ®iÓm c«ng tr¹ng"));
    tinsert(tbSay, format("%s/#WPlayer:ModifyHonor(1000000)", "NhËn thªm 1,000,000 ®iÓm c«ng tr¹ng"));
    tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(6)", "NhËn qu©n hµm nguyªn so¸i"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishTaskCTC()", "Hoµn thµnh nhanh 1 lÇn chiÕn tr­êng phô"));
    tinsert(tbSay, format("%s/#_w_test_FinishTaskCTP()", "Hoµn thµnh nhanh 1 lÇn chiÕn tr­êng chİnh"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishTaskTNC()", "Hoµn thµnh nhanh 1 l­ît ®µo TNC (®Õn npc tr¶ nv)"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailyTaskLimitTNC()", "Reset sè giíi h¹n nhiÖm vô TNC h«m nay"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailyTaskLimitTH()", "Reset l­ît vµo Th¸i H­ h«m nay"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailySystem()", "Reset ngµy"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishMaxTuBaoTrai()", "NhËn max l­ît quay Tô B¶o Trai"));
    tinsert(tbSay, format("%s/#_w_test_ResetTuBaoTrai()", "Reset l­ît quay Tô B¶o Trai"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_test_FinishTaskVanTieu()", "Hoµn thµnh nhanh 1 lÇn VËn Tiªu"));
    tinsert(tbSay, format("%s/#_w_test_ResetDailyTaskLimitVanTieu()", "Reset sè giíi h¹n nhiÖm vô VËn Tiªu h«m nay"));
    tinsert(tbSay, format("%s/#_w_test_SetOpenBox_BachBaoRuong()", "Söa sè lÇn më B¸ch B¶o R­¬ng"));
    tinsert(tbSay, g_szSpaceLine);
    if WPlayer:IsSuperMod() == WEnv.TRUE or WPlayer:IsSuperAdmin() == WEnv.TRUE then
        tinsert(tbSay, format("%s/#_w_test_GenCode()", "T¹o mét giftcode"));
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

-----NhËn trang bŞ hç trî cÊp 15



function _w_test_OpenMenu_ItemTest()
    local tbSay = { "NhËn hç trî  Trang bŞ:" };
    tinsert(tbSay, format("%s/#_w_test_Give_KXLenh(6)", "NhËn kim xµ 9 chän OP"));
    tinsert(tbSay, format("%s/#_w_test_Give_TTLL9()", "NhËn TÈy t©m luyÖn 9"));
    tinsert(tbSay, format("%s/#_w_test_Give_DHTLT()", "NhËn §¹i Hoang Táa Linh Th¹ch"));
    tinsert(tbSay, format("%s/#_w_test_Give_Da9()", "NhËn §¸ 9"));
    tinsert(tbSay, format("%s/#_w_test_Give_TTTA()", "NhËn Bét Tr©n Tr©u Tinh Anh"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, format("%s/#_w_newbie_Give_PhaHonLenhBai()", "NhËn set Ph¸ Hån"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_LangSuongLenhBai()", "NhËn set L¨ng S­¬ng"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KimXa9(15)", "NhËn trang bŞ Kim Xµ 9 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChuTuocTuong(15)", "NhËn trang bŞ Chu T­íc T­íng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ChuTuocSoai(15)", "NhËn trang bŞ Chu T­íc Soai +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThanUng(15,1)", "NhËn ThÇn ­ng T­íng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_ThanUng(15,2)", "NhËn ThÇn ­ng So¸i +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SatTinh(15)", "NhËn trang bŞ S¸t Tinh +15"));
    tinsert(tbSay, "NhËn bé ChiÕn Khİ S¸t ThÇn +15/#KsgAward:SetChienKhiSatThan(15)");

    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_VanSuc5(5)", "NhËn trang bŞ V¨n Søc Lv5 + 5 Cæ Kim Th¹ch"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon3(15)", "NhËn bé s­ m«n 3 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon4(15)", "NhËn bé s­ m«n 4 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SuMon5(15)", "NhËn bé s­ m«n 5 +15"));

    tinsert(tbSay, g_szSpaceLine);

    tinsert(tbSay, format("%s/#_w_newbie_Give_ChienCuong(15)", "NhËn bé trang bŞ ChiÕn Cuång +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DieuDuong(15)", "NhËn bé trang bŞ DiÖu D­¬ng +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SetBuff(15)", "NhËn bé trang bŞ Buff 35 +15"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KimXa6(15)", "NhËn trang bŞ Kim Xµ 6 +15"));



    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end
-----Thó c­ng
function _w_test_OpenMenu_ThuCung()
    local tbSay = { "NhËn hç trî liªn quan Thó C­ng" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_PhucSinhPet1()", "Hoµng Thµnh Phôc Sinh Thó C­ng 1+2"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_SachPetLv7(20)", "NhËn 20 s¸ch kÜ n¨ng ®ång hµnh lv7"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_DiaLinhTinhHoa(5)", "NhËn 5 §Şa Linh Tinh Hoa"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);

end
---Kinh m¹ch
function _w_test_OpenMenu_KinhMach()
    local tbSay = { "NhËn hç trî liªn quan Kinh m¹ch" };

    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachVoThanh()", "NhËn Kinh M¹ch Vâ Th¸nh +900k Ch©n Khİ"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachDongNhan(500)", "NhËn 500 Kinh M¹ch §ång Nh©n"));
    tinsert(tbSay, format("%s/#_w_newbie_Give_KinhMachNganNhan(500)", "NhËn 500 Kinh Ng©n nh©n"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);

end
function test_changeCongTrang2020(nType)
    local nHor = GetTask(701);
    if nType == 1 and nHor < 0 then
        Talk(1, "", szNpcName .. "§¹i hiÖp ®ang ë phe Liªu råi nªn kh«ng cÇn ta gióp ®ì ®©u.")
        return 0
    end
    if nType == 2 and nHor >= 0 then
        Talk(1, "", szNpcName .. "§¹i hiÖp ®ang ë phe Tèng råi nªn kh«ng cÇn ta gióp ®ì ®©u.")
        return 0
    end
    if nType == 1 and nHor >= 0 then
        --if DelItem(2,1,30370,25) == 1 and DelItem(2,95,204,25) == 1 then

            SetTask(701, -1000000)
            SetTask(704, -4)
            Talk(1, "", szNpcName .. "Chóc mõng ®¹i hiÖp, ta ®· gióp ®¹i hiÖp chuyÓn sang phe Liªu thµnh c«ng.")
            gf_WriteLogEx("CHUYEN DOI PHE CONG TRANG", "chuyÓn Liªu", 1, "Tèng sang Liªu")

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
    local txt="H¾c Dùc Long"..nText;
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