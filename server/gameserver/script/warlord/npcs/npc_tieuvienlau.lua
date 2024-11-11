----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: Npc ®æi ®å
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_top_award.lua");
Include("\\script\\warlord\\functions\\function_doiphe_chutuoc.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Thî rÌn L­u<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_tieuvienlau.lua";

function _w_NpcMain(nNpcIdx)
    local tbSay = { "<npcname>: ë ®©y ta cã mét sè b¶o vËt dïng ®iÓm tÝch lòy chiÕn tr­êng ®Ó ®æi lÊy, <sex> cã bao nhiªu, muèn ®æi g× cø nãi?", };
    
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TICHLUY_CHIENTRUONG], EQUIP_SHOP_EXCHANGE_TICHLUY_CHIENTRUONG));
    if WPlayer:GetBattleCamp() == WEnv.BATTLECAMP_TONG then
        tinsert(tbSay, format("Ta muèn chuyÓn ®æi trang bÞ sang phe Tèng/#_w_ExchanceBattleEquip(%d)", WEnv.BATTLECAMP_TONG));
        tinsert(tbSay, format("ChuyÓn ®æi trang bÞ  tõ Liªu sang phe Tèng/#DoiPhe_ChuTuoc_Lieu_Tong()"));
    else
        tinsert(tbSay, format("Ta muèn chuyÓn ®æi trang bÞ sang phe Liªu/#_w_ExchanceBattleEquip(%d)", WEnv.BATTLECAMP_TONG));
        tinsert(tbSay, format("ChuyÓn ®æi trang bÞ Chu T­íc tõ Tèng sang phe Liªu/#DoiPhe_ChuTuoc_Tong_Lieu()"));
    end
    
    tinsert(tbSay, "\nKhi kh¸c sÏ quay l¹i.");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

function _w_ExchanceBattleEquip_LoadCfg()
    local tbBattleSuit = g_tbBattleSuit_ThanhLong;
    local szBattleSuitKey = "g_tbBattleSuit_ThanhLong";
    for _, szCamp in { "TONG", "LIEU" } do
        for _, szRank in { "TUONG", "SOAI" } do
            for _, szKeyCfg in { "ringCfg", "clothesCfg", "weaponCfg" } do
                local tbItemCfg = tbBattleSuit[szCamp][szRank][szKeyCfg];
                _w_ExchanceBattleEquip_LoadCfg_ParseData(szBattleSuitKey, szCamp, szKeyCfg, tbItemCfg);
            end
            for _, szKeyCfg in { "ringCfg", "clothesCfg", "weaponCfg" } do
                local tbItemCfg = tbBattleSuit[szCamp][szRank]["newFactionCfg"][szKeyCfg];
                _w_ExchanceBattleEquip_LoadCfg_ParseData(szBattleSuitKey, szCamp, szKeyCfg, tbItemCfg);
            end
        end
    end

    local tbBattleSuit = g_tbBattleSuit_UyHo;
    local szBattleSuitKey = "g_tbBattleSuit_UyHo";
    for _, szCamp in { "TONG", "LIEU" } do
        for _, szRank in { "TUONG", "SOAI" } do
            for _, szKeyCfg in { "ringCfg", "clothesCfg", "weaponCfg" } do
                local tbItemCfg = tbBattleSuit[szCamp][szRank][szKeyCfg];
                _w_ExchanceBattleEquip_LoadCfg_ParseData(szBattleSuitKey, szCamp, szKeyCfg, tbItemCfg);
            end
        end
    end
end

function _w_ExchanceBattleEquip_LoadCfg_ParseData(szBattleSuitKey, szCamp, szKeyCfg, tbItemCfg)
    if type(tbItemCfg) == "table" then
        for i = 1, getn(tbItemCfg) do
            local nStart = 0;
            local nEnd = 0;

            if type(tbItemCfg[i]) == "table" then
                nStart = tbItemCfg[i].nStart;
                nEnd = tbItemCfg[i].nEnd;
            elseif type(tbItemCfg[i]) == "number" then
                nStart = tbItemCfg[i];
                nEnd = tbItemCfg[i];
            end

            for nP = nStart, nEnd do
                if szKeyCfg == "ringCfg" then
                    local nIndex = getn(BATTLE_TRANSFER_MATCH_LIST[szCamp]) + 1;
                    tinsert(BATTLE_TRANSFER_MATCH_LIST[szCamp], nIndex, { tbProp = { TEM_G_EQUIP, ITEM_D_EQUIP_ADORN, nP } });
                    BATTLE_TRANSFER_MATCH_LIST.INDEX[PackItemId(TEM_G_EQUIP, ITEM_D_EQUIP_ADORN, nP)] = { nIndex, szBattleSuitKey };
                end
                if szKeyCfg == "clothesCfg" then
                    for _, nD in {100, 101, 103} do
                        if _ ~= "n" then
                            local nIndex = getn(BATTLE_TRANSFER_MATCH_LIST[szCamp]) + 1;
                            tinsert(BATTLE_TRANSFER_MATCH_LIST[szCamp], nIndex, { tbProp = { TEM_G_EQUIP, nD, nP } });
                            BATTLE_TRANSFER_MATCH_LIST.INDEX[PackItemId(TEM_G_EQUIP, nD, nP)] = { nIndex, szBattleSuitKey };
                        end
                    end
                end
                if szKeyCfg == "weaponCfg" then
                    for _, nD in { 3, 8, 0, 1, 2, 10, 0, 5, 2, 9, 6, 4, 7, 11, 2, 3, 9, 11, 13, 12, 14, 2 } do
                        if _ ~= "n" then
                            local nIndex = getn(BATTLE_TRANSFER_MATCH_LIST[szCamp]) + 1;
                            tinsert(BATTLE_TRANSFER_MATCH_LIST[szCamp], nIndex, { tbProp = { TEM_G_EQUIP, nD, nP } });
                            BATTLE_TRANSFER_MATCH_LIST.INDEX[PackItemId(TEM_G_EQUIP, nD, nP)] = { nIndex, szBattleSuitKey };
                        end
                    end
                end
            end
        end
    end
end

if not BATTLE_TRANSFER_MATCH_LIST then
    BATTLE_TRANSFER_MATCH_LIST = {
        TONG = {
        },

        LIEU = {
        },

        INDEX = {

        };
    };
    _w_ExchanceBattleEquip_LoadCfg();
end

function _w_ExchanceBattleEquip(nNpcIdx, nToCamp, nItemPart, bConfirm)
    local nFromCamp = WPlayer:GetBattleCamp();

    nToCamp = nToCamp or WEnv.BATTLECAMP_TONG;
    if nFromCamp == WEnv.BATTLECAMP_TONG then
        nToCamp = WEnv.BATTLECAMP_LIEU;
    end

    bConfirm = tonumber(bConfirm) or 0;

    if nToCamp ~= WEnv.BATTLECAMP_TONG and nToCamp ~= WEnv.BATTLECAMP_LIEU then
        return WEnv.RETCODE_ERROR;
    end

    if not nItemPart or (nItemPart < ITEMPART_HEAD and nItemPart > ITEMPART_RING2) then
        local tbSay = { "Ta cã thÓ gióp <sex> chuyÓn ®æi phe trang bÞ, cÇn tiªu tèn mét Ýt nguyªn liÖu ®Ó thùc hiÖn, h·y chän trang bÞ cÇn chuyÓn:" };

        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "ChiÕn kh«i", nNpcIdx, nToCamp, ITEMPART_HEAD));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "ChiÕn gi¸p", nNpcIdx, nToCamp, ITEMPART_BODY));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "ChiÕn trang", nNpcIdx, nToCamp, ITEMPART_FOOT));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "NhÉn trªn", nNpcIdx, nToCamp, ITEMPART_RING));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "NhÉn d­íi", nNpcIdx, nToCamp, ITEMPART_RING2));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "Vò khÝ", nNpcIdx, nToCamp, ITEMPART_WEAPON));

        tinsert(tbSay, format("%s/nothing", "T¹m thêi ch­a cÇn."));
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local nItemIdx = GetPlayerEquipIndex(nItemPart);
    if not nItemIdx or nItemIdx <= 0 then
        WNpc:Talk("H·y mÆc trang bÞ lªn ng­êi råi tiÕn hµnh thao t¸c!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
    local nItemKey = PackItemId(nG, nD, nP);
    if not BATTLE_TRANSFER_MATCH_LIST.INDEX[nItemKey] then
        WNpc:Talk("§©y kh«ng ph¶i lµ trang bÞ chiÕn tr­êng!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    local szFromCampKey = "TONG";
    local szToCampKey = "LIEU";
    if nToCamp == WEnv.BATTLECAMP_TONG then
        szFromCampKey = "LIEU";
        szToCampKey = "TONG";
    end

    local nMatchListIndex = BATTLE_TRANSFER_MATCH_LIST.INDEX[nItemKey][1];
    local nBattleSuitKey = BATTLE_TRANSFER_MATCH_LIST.INDEX[nItemKey][2];
    local tbFromItem = BATTLE_TRANSFER_MATCH_LIST[szFromCampKey][nMatchListIndex];
    local tbToItem = WLib:MergeTable(BATTLE_TRANSFER_MATCH_LIST[szToCampKey][nMatchListIndex]);
    tbToItem.nLevel = GetEquipAttr(nItemIdx, 2);
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 1 }, -- Thiªn Cang LÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 1 }, -- Thiªn M«n Kim LÖnh
            { tbProp = { 2, 1, 539 }, nCount = 10 }, -- Hoµng Kim §¹i Hång Bao
        }
    };

    if bConfirm == 0 then
        WNpc:SayConfirm(format("<sex> ®ång ý dïng %s chuyÓn ®æi <color=white>%s<color> thµnh <color=white>%s<color> kh«ng?", WLib:MaterialDescription(tbConsume), WItem:GetName(tbFromItem.tbProp[1] or 0, tbFromItem.tbProp[2], tbFromItem.tbProp[3]), WItem:GetName(tbToItem.tbProp[1] or 0, tbToItem.tbProp[2], tbToItem.tbProp[3])), format("_w_ExchanceBattleEquip(%d, %d, %d, 1)", nNpcIdx, nToCamp, nItemPart));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    if WItem:DelByIndex(nItemIdx) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Kh«ng thÓ thu håi trang bÞ gèc, h·y liªn hÖ admin ®Ô ®­îc hç trî!");
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WAward:Give(tbToItem, "ChuyÓn ®æi phe trang bÞ chiÕn tr­êng");
end
