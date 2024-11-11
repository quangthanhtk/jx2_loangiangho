----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item thÎ chän ®å s¸t tinh cã gi÷ c­êng hãa dùa vµo c­êng hãa cña thÎ
----------------------------------------------------------------------------------------------------
--É±ÐÇÁîÅÆ£¨Í·,ÒÂ,¿ã£©
--Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

g_CapDialog = {
    baseAttr = {
        { 2825, 0, 0 },
    },
    UnLockAttr = {
        { 2831, 2832, 2833, 2834, 2835, 2836, 2837, 2838, 2839 },
        { 2841, 2842, 2843, 2844, 2845, 2846, 2847, 2848 },
        { 2850, 2851, 2852, 2853 },
    },
};

g_ClothDialog = {
    baseAttr = {
        { 2827, 0, 0 },
    },
    UnLockAttr = {
        { 2831, 2832, 2833, 2834, 2835, 2836, 2837, 2838, 2839 },
        { 2841, 2842, 2843, 2844, 2845, 2846, 2847, 2848 },
        { 2850, 2851, 2852, 2853 },
    },
};

g_ShoeDialog = {
    baseAttr = {
        { 2829, 0, 0 },
    },
    UnLockAttr = {
        { 2831, 2832, 2833, 2834, 2835, 2836, 2837, 2838, 2839 },
        { 2841, 2842, 2843, 2844, 2845, 2846, 2847, 2848 },
        { 2850, 2851, 2852, 2853 },
    },
};

g_WeaponDialog = {
    baseAttr = {
        ["Vò khÝ s¸t th­¬ng"] = { { 2891, 2892 }, 2894, 0 },
        ["CÇm chuyªn dïng"] = { { 2886, 2887 }, 2894, 0 },
        ["Néi c«ng "] = { 2884, 2894, 0 },
        ["Ngo¹i c«ng"] = { 2889, 2894, 0 },
    },
    UnLockAttr = {
        { 2896, 2897, 2898, 2899, 2900, 2901 },
        { 2903, 2904, 2905 },
        { 2907, 2908, 2909, 2910, 2911, 2912 },
    },
};

g_RingDialog = {
    baseAttr = {
        { 2855, 0, 0 },
    },
    UnLockAttr = {
        { 2857, 2858, 2859, 2860, 2861, 2862, 2863, 2864 },
        { 2866, 2867, 2868, 2869, 2870, 2871, 2872, 2873 },
        { 2875, 2876, 2877, 2878, 2879, 2880, 2881, 2882 },
    },
};

function GetAttrTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItem2Attr = {
        [40001] = g_CapDialog,
        [40002] = g_ClothDialog,
        [40003] = g_ShoeDialog,
        [40004] = g_WeaponDialog,
        [40005] = g_RingDialog,
    }
    return tItem2Attr[nP];
end

function GetAwardTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItemAward = {
        [40001] = { { 0, 103, 865, 1, 4, -1, -1, -1, -1, -1, -1 }, "MÆt N¹ S¸t Tinh" },
        [40002] = { { 0, 100, 865, 1, 4, -1, -1, -1, -1, -1, -1 }, "¸o S¸t Tinh" },
        [40003] = { { 0, 101, 865, 1, 4, -1, -1, -1, -1, -1, -1 }, "QuÇn S¸t Tinh" },
        [40004] = { {
                        { { 0, 3, 32483, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-L­u Ly Giíi §ao (ThiÕu L©m §ao)", 2 },
                        { { 0, 8, 32485, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Kinh L«i ThiÒn Tr­îng (ThiÕu L©m ThiÒn)", 3 },
                        { { 0, 0, 32484, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-L«i ¢m Nang Thñ (ThiÕu L©m Thñ)", 4 },
                        { { 0, 1, 32486, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-¢m D­¬ng Xuyªn ¶nh (§­êng M«n Ch©m)", 6 },
                        { { 0, 2, 32487, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Tõ Hµn ¢m KiÕm (Nga My KiÕm)", 8 },
                        { { 0, 10, 32488, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Cöu Hoµn Bèi CÇm (Nga My CÇm)", 9 },
                        { { 0, 0, 32489, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Quy L©n Hé Thñ (C¸i Bang Thñ)", 11 },
                        { { 0, 5, 32490, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-TrÊn Ng¹o C«n (C¸i Bang C«n)", 12 },
                        { { 0, 2, 32491, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-ThuÇn Phong KiÕm (Vâ §ang KiÕm)", 14 },
                        { { 0, 9, 32492, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Tinh §Èu ChuyÓn Bót (Vâ §ang Bót)", 15 },
                        { { 0, 6, 32493, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Ph¸ Qu©n TrËn Th­¬ng (D­¬ng M«n Th­¬ng)", 17 },
                        { { 0, 4, 32494, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Truy MÖnh Cung (D­¬ng M«n Cung)", 18 },
                        { { 0, 7, 32495, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-ThiÖp Cèt HuyÕt §ao (Ngò §éc §ao)", 20 },
                        { { 0, 11, 32496, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-LuyÖn Hån HuyÕt Tr¶o (Ngò §éc Tr¶o)", 21 },
                        { { 0, 2, 32497, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Ngù Thiªn Phong KiÕm (C«n L«n Thiªn S­)", 23 },
                        { { 0, 3, 32498, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-ThÇn DiÖm Thiªn §ao (Minh Gi¸o §ao)", 25 },
                        { { 0, 9, 32499, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-ThÇn Phong Ph¸n Bót (Minh Gi¸o Bót)", 26 },
                        { { 0, 11, 32500, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-ThÇn Linh Chó Tr¶o (Minh Gi¸o Tr¶o)", 27 },
                        { { 0, 13, 32501, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Linh Lung Chi (Thóy Yªn PhiÕn)", 29 },
                        { { 0, 12, 32502, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Cöu Tiªu S¸o (Thóy Yªn S¸o)", 30 },
                        { { 0, 14, 32503, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Ng­ Tµng (NhËm HiÖp Chñy)", 31 },
                        { { 0, 2, 32504, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-ChØ Qua (C«n L«n KiÕm T«n)", 32 },
                    }, "Vò KhÝ S¸t Tinh" },
        [40005] = { {
                        { { 0, 102, 31850, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Cöu Linh Háa Giíi" },
                        { { 0, 102, 31851, 1, 4, -1, -1, -1, -1, -1, -1 }, "S¸t Tinh-Ng­ng Ngäc Thæ Hoµn" },
                    }, "Trang Søc S¸t Tinh" },
    }
    return tItemAward[nP];
end

function GetItemFeedAttrDesc(id)
    if g_FeedItemDesc == WEnv.NULL then
        g_ItemFeedDesc = {};
    end
    if g_ItemFeedDesc[id] == WEnv.NULL then
        local itemDesc = GetItemFeedAttiDesc(id);
        itemDesc = sf_Replace(itemDesc, "<enter>", ", ")
        itemDesc = sf_RemoveTag(itemDesc, "<", ">")
        g_ItemFeedDesc[id] = itemDesc

    end
    return g_ItemFeedDesc[id];
end

function ComposeFeedItem(nItem, nLineID)
    if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
        return 0;
    end
    local szItemName = GetItemName(nItem);
    local nLockSaved = 1;
    if GetItemSpecialAttr(nItem, "BIND") == 1 then
        nLockSaved = 4;
    end
    local nEnhanceSaved = GetEquipAttr(nItem, 2);
    if DelItemByIndex(nItem, 1) ~= 1 then
        return 0;
    end
    local szName = GetName();
    local tRet = GetAwardTable(nItem);
    if nLineID then
        tRet = tRet[1][nLineID];
    end
    local tLineID = tempLineID[szName];
    --tRet[1][4] = nLockSaved;
    if tRet[1][2] ~= 102 and (nEnhanceSaved >= 0 and nEnhanceSaved <= 15) then
        tRet[1][13] = nEnhanceSaved;
    end
    local nRet, nItemIdx = gf_AddItemEx2(tRet[1], tRet[2], szItemName, tRet[2], 0, 1);
    if nItemIdx then
        SetItemFeedUpAttrs(nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]);
        --WDebug:Log(szItemName, tRet[2], format("Index:%d LineID:%d|%d|%d|%d|%d|%d", nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]));

        WPlayerLog:WriteAddItemLog("item_chon_sattinh_giucuonghoa", "Më lÖnh bµi", nRet, nItemIdx, tRet[1][4], tLineID);
    end
end

--Ñ¡Ôñ½âËøÊôÐÔ
function ChoiceUnLockAttr(nItem, nLineID)
    local szName = GetName();
    local tDialog = GetAttrTable(nItem);
    local tLineID = tempLineID[szName];
    if nLineID and getn(tLineID) < 6 then
        tLineID[getn(tLineID) + 1] = nLineID;
        nLineID = WEnv.NULL
    end
    if getn(tLineID) < 6 then
        local nIndex = getn(tLineID) - 2;
        local unlock = tDialog.UnLockAttr;
        local tCurrList = unlock[nIndex];
        local tbSay = {};
        local tName = { "Thuéc tÝnh tÊn c«ng", "Thuéc tÝnh phßng thñ", "Thuéc tÝnh kh¸c" };
        tbSay.msg = format("lùa chän %s:", tName[nIndex]);
        tbSay.sel = {};
        for i = 1, getn(tCurrList) do
            tinsert(tbSay.sel, { GetItemFeedAttrDesc(tCurrList[i]), format("#ChoiceUnLockAttr(%d, %d)", nItem, tCurrList[i]) });
        end
        tinsert(tbSay.sel, { "\n rót lui", "nothing" });
        temp_Talk(tbSay);
        return 0;
    end
    --×îºóµÄÈ·ÈÏ
    local tRet = GetAwardTable(nItem);
    if nLineID == WEnv.NULL and type(tRet[1][1]) == "table" then
        local tbSay = {};
        tbSay.msg = format("H·y chän lo¹i cña %s: ", tRet[2]);
        tbSay.sel = {};
        local nPlayerRoute = GetPlayerRoute();
        local nDetectRoute = 0;
        for i = 1, getn(tRet[1]) do
            if tRet[1][i][3] == WEnv.NULL or (type(tRet[1][i][3]) == "number" and tRet[1][i][3] == nPlayerRoute) then
                tinsert(tbSay.sel, { tRet[1][i][2],
                                     format("#ChoiceUnLockAttr(%d, %d)", nItem, i) });
                if type(tRet[1][i][3]) == "number" and tRet[1][i][3] == nPlayerRoute then
                    nDetectRoute = i;
                    break ;
                end
            end
        end
        if nDetectRoute ~= 0 then
            ChoiceUnLockAttr(nItem, nDetectRoute);
            return 0;
        end
        tinsert(tbSay.sel, { "\n rót lui", "nothing" });
        temp_Talk(tbSay);
        return 0;
    end
    local szDialog = format("§ång ý/#ComposeFeedItem(%d)", nItem);
    if nLineID and type(tRet[1][1]) == "table" then
        tRet = tRet[1][nLineID]
        szDialog = format("§ång ý/#ComposeFeedItem(%d, %d)", nItem, nLineID);
    end
    local msg = "Thuéc tÝnh lùa chän cuèi cïng nh­ sau:\n";
    msg = msg .. format("Thuéc tÝnh mÆc ®Þnh: \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[1]), GetItemFeedAttrDesc(tLineID[2]), GetItemFeedAttrDesc(tLineID[3]));
    msg = msg .. format("Thuéc tÝnh më khãa:  \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[4]), GetItemFeedAttrDesc(tLineID[5]), GetItemFeedAttrDesc(tLineID[6]));
    msg = msg .. format("QuyÕt ®Þnh dïng <color=gold>%s<color> ghÐp thµnh <color=gold>%s<color> kh«ng?", GetItemName(nItem), tRet[2]);
    Say(msg, 2, szDialog, "§Ó ta suy nghÜ/nothing");
end

--Ñ¡Ôñ»ù´¡ÊôÐÔ
function ChoiceBaseAttr(nItem, choice1, curIndex, choice2)
    local szName = GetName();
    local tDialog = GetAttrTable(nItem);
    local base = tDialog.baseAttr;
    if choice1 == WEnv.NULL and getn(base) ~= 1 then
        local tSay = {};
        for k, v in base do
            tinsert(tSay, format("%s/#ChoiceBaseAttr(%d, %q)", k, nItem, k));
        end
        tinsert(tSay, "\n rót lui/nothing");
        Say("H·y chän lo¹i thuéc tÝnh c¬ b¶n: ", getn(tSay), tSay);
        return 0;
    end
    if choice1 == WEnv.NULL then
        choice1 = 1;
    end
    local tLineID = tempLineID[szName];
    local tBaseAttr = tDialog.baseAttr[choice1];
    if choice2 then
        tLineID[curIndex] = tBaseAttr[curIndex][choice2];
        choice2 = WEnv.NULL;
    end
    if curIndex == WEnv.NULL then
        curIndex = 0;
    end
    for i = curIndex + 1, getn(tBaseAttr) do
        if choice2 == WEnv.NULL and type(tBaseAttr[i]) == "table" then
            local tSay = {}
            for j = 1, getn(tBaseAttr[i]) do
                local szFormat = "%s/#ChoiceBaseAttr(%d, %q, %d, %d)";
                if type(choice1) == "number" then
                    szFormat = "%s/#ChoiceBaseAttr(%d, %d, %d, %d)";
                end
                tinsert(tSay, format(szFormat, GetItemFeedAttrDesc(tBaseAttr[i][j]), nItem, choice1, i, j));
            end
            tinsert(tSay, "\n rót lui/nothing");
            Say("H·y chän lo¹i thuéc tÝnh con c¬ b¶n: ", getn(tSay), tSay);
            return 0;
        end
        tLineID[i] = tBaseAttr[i];
    end
    ChoiceUnLockAttr(nItem);
end

function OnUseItem(nItem)
    if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
        return 0;
    end
    if gf_Check55FullSkill() ~= 1 then
        Talk(1, "", "Gia nhËp l­u ph¸i vµ häc kü n¨ng cÊp 55 míi ®­îc dïng!");
        return 0;
    end
    if tempLineID == WEnv.NULL then
        tempLineID = {};
    end
    local szName = GetName();
    tempLineID[szName] = {};
    ChoiceBaseAttr(nItem);
end

function OnUse(nItem)
    local szItemName = GetItemName(nItem);
    local szAwardName = GetAwardTable(nItem)[2];
    local tbAwardInfo = GetAwardTable(nItem)[1];
    local nEnhanceSaved = GetEquipAttr(nItem, 2);
    if (type(tbAwardInfo[1]) == "number" and tbAwardInfo[2] ~= 102 and (nEnhanceSaved >= 0 and nEnhanceSaved <= 15))
            or (type(tbAwardInfo[1]) == "table" and tbAwardInfo[1][1][2] ~= 102 and (nEnhanceSaved >= 0 and nEnhanceSaved <= 15))
    then
        Say(format("sö dông <color=gold>%s<color> cã thÓ hîp thµnh <color=gold>%s+%d<color>, x¸c nhËn sö dông kh«ng?", szItemName, szAwardName, nEnhanceSaved), 2,
                format("\n§ång ý dïng/#OnUseItem(%d)", nItem), "\n§Ó ta suy nghÜ l¹i/nothing");
    else
        Say(format("sö dông <color=gold>%s<color> cã thÓ hîp thµnh <color=gold>%s<color>, x¸c nhËn sö dông kh«ng?", szItemName, szAwardName), 2,
                format("\n§ång ý dïng/#OnUseItem(%d)", nItem), "\n§Ó ta suy nghÜ l¹i/nothing");
    end
end
