----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: Npc ��i ��
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_top_award.lua");
Include("\\script\\warlord\\functions\\function_doiphe_chutuoc.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Th� r�n L�u<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_tieuvienlau.lua";

function _w_NpcMain(nNpcIdx)
    local tbSay = { "<npcname>: � ��y ta c� m�t s� b�o v�t d�ng �i�m t�ch l�y chi�n tr��ng �� ��i l�y, <sex> c� bao nhi�u, mu�n ��i g� c� n�i?", };
    
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TICHLUY_CHIENTRUONG], EQUIP_SHOP_EXCHANGE_TICHLUY_CHIENTRUONG));
    if WPlayer:GetBattleCamp() == WEnv.BATTLECAMP_TONG then
        tinsert(tbSay, format("Ta mu�n chuy�n ��i trang b� sang phe T�ng/#_w_ExchanceBattleEquip(%d)", WEnv.BATTLECAMP_TONG));
        tinsert(tbSay, format("Chuy�n ��i trang b�  t� Li�u sang phe T�ng/#DoiPhe_ChuTuoc_Lieu_Tong()"));
    else
        tinsert(tbSay, format("Ta mu�n chuy�n ��i trang b� sang phe Li�u/#_w_ExchanceBattleEquip(%d)", WEnv.BATTLECAMP_TONG));
        tinsert(tbSay, format("Chuy�n ��i trang b� Chu T��c t� T�ng sang phe Li�u/#DoiPhe_ChuTuoc_Tong_Lieu()"));
    end
    
    tinsert(tbSay, "\nKhi kh�c s� quay l�i.");
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
        local tbSay = { "Ta c� th� gi�p <sex> chuy�n ��i phe trang b�, c�n ti�u t�n m�t �t nguy�n li�u �� th�c hi�n, h�y ch�n trang b� c�n chuy�n:" };

        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "Chi�n kh�i", nNpcIdx, nToCamp, ITEMPART_HEAD));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "Chi�n gi�p", nNpcIdx, nToCamp, ITEMPART_BODY));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "Chi�n trang", nNpcIdx, nToCamp, ITEMPART_FOOT));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "Nh�n tr�n", nNpcIdx, nToCamp, ITEMPART_RING));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "Nh�n d��i", nNpcIdx, nToCamp, ITEMPART_RING2));
        tinsert(tbSay, format("%s/#_w_ExchanceBattleEquip(%d, %d, %d)", "V� kh�", nNpcIdx, nToCamp, ITEMPART_WEAPON));

        tinsert(tbSay, format("%s/nothing", "T�m th�i ch�a c�n."));
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local nItemIdx = GetPlayerEquipIndex(nItemPart);
    if not nItemIdx or nItemIdx <= 0 then
        WNpc:Talk("H�y m�c trang b� l�n ng��i r�i ti�n h�nh thao t�c!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
    local nItemKey = PackItemId(nG, nD, nP);
    if not BATTLE_TRANSFER_MATCH_LIST.INDEX[nItemKey] then
        WNpc:Talk("��y kh�ng ph�i l� trang b� chi�n tr��ng!", WEnv.TRUE);
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
            { tbProp = { 2, 95, 204 }, nCount = 1 }, -- Thi�n Cang L�nh
            { tbProp = { 2, 1, 30370 }, nCount = 1 }, -- Thi�n M�n Kim L�nh
            { tbProp = { 2, 1, 539 }, nCount = 10 }, -- Ho�ng Kim ��i H�ng Bao
        }
    };

    if bConfirm == 0 then
        WNpc:SayConfirm(format("<sex> ��ng � d�ng %s chuy�n ��i <color=white>%s<color> th�nh <color=white>%s<color> kh�ng?", WLib:MaterialDescription(tbConsume), WItem:GetName(tbFromItem.tbProp[1] or 0, tbFromItem.tbProp[2], tbFromItem.tbProp[3]), WItem:GetName(tbToItem.tbProp[1] or 0, tbToItem.tbProp[2], tbToItem.tbProp[3])), format("_w_ExchanceBattleEquip(%d, %d, %d, 1)", nNpcIdx, nToCamp, nItemPart));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    if WItem:DelByIndex(nItemIdx) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Kh�ng th� thu h�i trang b� g�c, h�y li�n h� admin �� ���c h� tr�!");
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WAward:Give(tbToItem, "Chuy�n ��i phe trang b� chi�n tr��ng");
end
