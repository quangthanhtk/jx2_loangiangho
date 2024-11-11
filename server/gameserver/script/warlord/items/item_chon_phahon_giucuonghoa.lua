----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item thÎ chän ®å ph¸ hån cã gi÷ c­êng hãa dùa vµo c­êng hãa cña thÎ
----------------------------------------------------------------------------------------------------
--É±ÐÇÁîÅÆ£¨Í·,ÒÂ,¿ã£©
--Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

g_CapDialog = {
    baseAttr = {
        { 3209, 10000, 0 },
    },
    UnLockAttr = {
        { 3215, 3216, 3217, 3218, 3219, 3220, 3221, 3222, 3223 },
        { 3225.3226, 3227, 3228, 3229 },
        { 3231, 3232, 3233, 3234 },
    },
};

g_ClothDialog = {
    baseAttr = {
        { 3211, 10000, 0 },
    },
    UnLockAttr = {
        { 3215, 3216, 3217, 3218, 3219, 3220, 3221, 3222, 3223 },
        { 3225.3226, 3227, 3228, 3229 },
        { 3231, 3232, 3233, 3234 },
    },
};

g_ShoeDialog = {
    baseAttr = {
        { 3213, 10000, 0 },
    },
    UnLockAttr = {
        { 3215, 3216, 3217, 3218, 3219, 3220, 3221, 3222, 3223 },
        { 3225.3226, 3227, 3228, 3229 },
        { 3231, 3232, 3233, 3234 },
    },
};

g_WeaponDialog = {
    baseAttr = {
        ["Vò khÝ s¸t th­¬ng"] = { { 3269, 3270 }, 3272, 0 },
        ["CÇm chuyªn dïng"] = { { 3264, 3265 }, 3272, 0 },
        ["Néi c«ng "] = { 3262, 3272, 0 },
        ["Ngo¹i c«ng"] = { 3267, 3272, 0 },
    },
    UnLockAttr = {
        { 3274, 3275, 3276, 3277, 3278, 3279 },
        { 3281, 3282, 3283, 3284 },
        { 3286, 3287, 3288 },
    },
};

g_RingDialog = {
    baseAttr = {
        { 3236, 0, 0 },
    },
    UnLockAttr = {
        { 3238, 3239, 3240, 3241, 3242, 3243, 3244, 3245 },
        { 3247, 3248, 3249, 3250, 3251 },
        { 3253, 3254, 3255, 3256, 3257, 3258, 3259, 3260 },
    },
};

function GetAttrTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItem2Attr = {
        [40006] = g_CapDialog,
        [40007] = g_ClothDialog,
        [40008] = g_ShoeDialog,
        [40009] = g_WeaponDialog,
        [40010] = g_RingDialog,
    }
    return tItem2Attr[nP];
end

function GetAwardTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItemAward = {
        [40006] = { { 0, 103, 32347, 1, 4, -1, -1, -1, -1, -1, -1 }, "MÆt N¹ Ph¸ Hån" },
        [40007] = { { 0, 100, 32347, 1, 4, -1, -1, -1, -1, -1, -1 }, "¸o Ph¸ Hån" },
        [40008] = { { 0, 101, 32347, 1, 4, -1, -1, -1, -1, -1, -1 }, "QuÇn Ph¸ Hån" },
        [40009] = { {
                        { { 0, 3, 15301, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-TÞch DiÖt §ao (ThiÕu L©m §ao)", 2 },
                        { { 0, 8, 15303, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Bå §Ò Tr­îng (ThiÕu L©m ThiÒn)", 3 },
                        { { 0, 0, 15302, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-NghÞch Phong Cù (ThiÕu L©m QuyÒn)", 4 },
                        { { 0, 1, 15304, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Diªm V­¬ng ThiÕp (§­êng M«n Ch©m)", 6 },
                        { { 0, 2, 15305, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Can Lé KiÕm(Nga My KiÕm)", 8 },
                        { { 0, 10, 15306, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Ngäc B¨ng CÇm (Nga My CÇm)", 9 },
                        { { 0, 0, 15307, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-XÝch L©n Thñ (C¸i Bang Thñ)", 11 },
                        { { 0, 5, 15308, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-TrÊn H¶i Bæng (C¸i Bang C«n)", 12 },
                        { { 0, 2, 15309, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-L­u V©n KiÕm (Vâ §ang KiÕm)", 14 },
                        { { 0, 9, 15310, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Thanh Liªn Bót (Vâ §ang Bót)", 15 },
                        { { 0, 6, 15311, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Long §¶m Th­¬ng (D­¬ng M«n Th­¬ng)", 17 },
                        { { 0, 4, 15312, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-V« ¶nh ThiÓm (D­¬ng M«n Cung)", 18 },
                        { { 0, 7, 15313, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Phong Ma Tr¶m (Ngò §éc §ao)", 20 },
                        { { 0, 11, 15314, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Kh« HuyÕt Tr¶o (Ngò §éc Tr¶o)", 21 },
                        { { 0, 2, 15315, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Hån KiÕm Ph¸ch (C«n L«n Thiªn S­)", 23 },
                        { { 0, 3, 15316, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Hån Th¸nh DiÖu §ao (Minh Gi¸o §ao)", 25 },
                        { { 0, 9, 15317, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Tõ ¢n Bót (Minh Gi¸o Bót)", 26 },
                        { { 0, 11, 15318, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-V« T­íng Tr¶o (Minh Gi¸o Tr¶o)", 27 },
                        { { 0, 13, 15319, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Lçi NguyÖt (Thóy Yªn PhiÕn)", 29 },
                        { { 0, 12, 15320, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-§é NguyÖt Tiªu (Thóy Yªn S¸o)", 30 },
                        { { 0, 14, 15321, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Tô B¹ch TuyÕt (NhËm HiÖp Chñy)", 31 },
                        { { 0, 2, 15322, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-L¹c Cöu Thiªn (C«n L«n KiÕm T«n)", 32 },
                    }, "Vò KhÝ Ph¸ Hån" },
        [40010] = { {
                        { { 0, 102, 32160, 1, 4, -1, -1, -1, -1, -1, -1 }, "NhÉn Ph¸ Hån" },
                        { { 0, 102, 32161, 1, 4, -1, -1, -1, -1, -1, -1 }, "D©y §eo NhiÕp T©m" },
                    }, "Trang Søc Ph¸ Hån" },
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

        WPlayerLog:WriteAddItemLog("item_chon_phahon_giucuonghoa", "Më lÖnh bµi", nRet, nItemIdx, tRet[1][4], tLineID);
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
