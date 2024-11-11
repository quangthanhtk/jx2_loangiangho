--ÎÞÏ¾µÄºÀÏÀÁî£¨Í·£¬ÒÂ£¬¿ã£©
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")

g_CapDialog = {
    baseAttr = {
        { 10001, 0, 0 },
    },
    UnLockAttr = {
        { 10007, 10008, 10009, 10010, 10011, 10012, 10013, 10014, 10015,  },
        { 10071, 10072, 10073, 10074, 10075, 10076, 10077, 10078, 10007, 10008, 10011, 10012, 10013, 10014, 10015, },
        { 10080, 10081, 10082, 10007, 10008, 10011, 10012, 10013, 10014, 10015,  },
    },
};

g_ClothDialog = {
    baseAttr = {
        { 10003, 0, 0 },
    },
    UnLockAttr = {
        { 10007, 10008, 10009, 10010, 10011, 10012, 10013, 10014, 10015,  },
        { 10071, 10072, 10073, 10074, 10075, 10076, 10077, 10078, 10007, 10008, 10011, 10012, 10013, 10014, 10015,  },
        { 10080, 10081, 10082, 10007, 10008, 10011, 10012, 10013, 10014, 10015,  },
    },
};

g_ShoeDialog = {
    baseAttr = {
        { 10005, 0, 0 },
    },
    UnLockAttr = {
        { 10007, 10008, 10009, 10010, 10011, 10012, 10013, 10014, 10015,  },
        { 10071, 10072, 10073, 10074, 10075, 10076, 10077, 10078, 10007, 10008, 10011, 10012, 10013, 10014, 10015, },
        { 10080, 10081, 10082, 10007, 10008, 10011, 10012, 10013, 10014, 10015, },
    },
};

g_WeaponDialog = {
    baseAttr = {
        ["Vò khÝ s¸t th­¬ng"] = { { 10048, 10049 }, 10051, 0 },
        ["CÇm chuyªn dïng"] = { { 10043, 10044 }, 10051, 0 },
        ["Néi c«ng "] = { 10041, 10051, 0 },
        ["Ngo¹i c«ng"] = { 10046, 10051, 0 },
    },
    UnLockAttr = {
        { 10053, 10054, 10055, 10056, 10057, 10058, 10059, 10060, 10061, 10062,  },
        { 10053, 10054, 10055, 10056, 10057, 10058, 10059, 10060, 10061, 10062,  },
        { 10064, 10065, 10066, 10067, 10068, 10069, 10053, 10054, 10055, 10056, 10057, 10058, 10059, 10060, 10061, 10062 },
    },
};

g_RingDialog = {
    baseAttr = {
        { 10020, 0, 0 },
    },
    UnLockAttr = {
        { 10022, 10023, 10024, 10025, 10026, 10027, 10028, 10029, 10030,  },
        { 10084, 10085, 10086, 10087, 10088, 10089, 10090, 10091, 10022, 10023, 10026, 10027, 10028, 10029, 10030,  },
        { 10032, 10033, 10034, 10035, 10036, 10037, 10038, 10039, 10022, 10023, 10026, 10027, 10028, 10029, 10030 },
    },
};

function GetAttrTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItem2Attr = {
        [50022] = g_CapDialog,
        [50023] = g_ClothDialog,
        [50024] = g_ShoeDialog,
        [50025] = g_WeaponDialog,
        [50026] = g_RingDialog,
    }
    return tItem2Attr[nP];
end

function GetAwardTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItemAward = {
        [50022] = { { 0, 103, 50000, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] MÆt N¹ S¸t Tinh" },
        [50023] = { { 0, 100, 50000, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] ¸o S¸t Tinh" },
        [50024] = { { 0, 101, 50000, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] QuÇn S¸t Tinh" },
        [50025] = {
            {
                { { 0, 3, 50000, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh L­u Ly Giíi §ao (ThiÕu L©m §ao)" },
                { { 0, 8, 50001, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Kinh L«i ThiÒn Tr­îng (ThiÕu L©m Tr­îng)" },
                { { 0, 0, 50002, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh L«i ¢m Nang Thñ (ThiÕu L©m QuyÒn)" },
                { { 0, 1, 50003, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh ¢m D­¬ng Xuyªn ¶nh (§­êng M«n Ch©m)" },
                { { 0, 2, 50004, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Tõ Hµn ¢m KiÕm(Nga My KiÕm)" },
                { { 0, 10, 50005, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Cöu Hoµn Bèi CÇm (Nga My §µn)" },
                { { 0, 0, 50006, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Quy L©n Hé Thñ (C¸i Bang QuyÒn)" },
                { { 0, 5, 50007, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh TrÊn Ng¹o C«n (C¸i Bang C«n)" },
                { { 0, 2, 50008, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh ThuÇn Phong KiÕm (Vâ §ang KiÕm)" },
                { { 0, 9, 50009, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Tinh §Èu ChuyÓn Bót (Vâ §ang Bót)" },
                { { 0, 6, 50010, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Ph¸ Qu©n TrËn Th­¬ng (D­¬ng M«n Th­¬ng)" },
                { { 0, 4, 50011, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Truy MÖnh Cung (D­¬ng M«n Cung)" },
                { { 0, 7, 50012, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh ThiÖp Cèt HuyÕt §ao (HiÖp §éc)" },
                { { 0, 11, 50013, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh LuyÖn Hån HuyÕt Tr¶o (Cæ S­)" },
                { { 0, 2, 50014, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Ngù Thiªn Phong KiÕm (C«n L«n Thiªn S­)" },
                { { 0, 3, 50015, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh ThÇn DiÖm Thiªn §ao (Minh Gi¸o §ao)" },
                { { 0, 9, 50016, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh ThÇn Phong Ph¸n Bót (Minh Gi¸o Bót)" },
                { { 0, 11, 50017, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh ThÇn Linh Chó Tr¶o (Minh Gi¸o Tr¶o)" },
                { { 0, 13, 50018, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Linh Lung Chi (Thóy Yªn Vò Tiªn)" },
                { { 0, 12, 50019, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Cöu Tiªu S¸o (Thóy Yªn Linh N÷)" },
                { { 0, 14, 50020, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Ng­ Tµng (§­êng M«n NhËm HiÖp)" },
                { { 0, 2, 50021, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh ChØ Qua (C«n L«n KiÕm T«n)" },
            },
            "Vò KhÝ S¸t Tinh Tr¸c ViÖt"
        },
        [50026] = {
            {
                { { 0, 102, 50000, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Cöu Linh Háa Giíi" },
                { { 0, 102, 50001, 1, 4, -1, -1, -1, -1, -1, -1 }, "[Tr¸c ViÖt] S¸t Tinh Ng­ng Ngäc Thæ Hoµn" },
            },
            "Trang Søc S¸t Tinh Tr¸c ViÖt"
        },
    }
    return tItemAward[nP];
end

function GetItemFeedAttrDesc(id)
    if not g_FeedItemDesc then
        g_ItemFeedDesc = {};
    end
    if not g_ItemFeedDesc[id] then
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
    if DelItemByIndex(nItem, 1) ~= 1 then
        return 0;
    end
    local szName = GetName();
    local tRet = GetAwardTable(nItem);
    if nLineID then
        tRet = tRet[1][nLineID];
    end
    local tLineID = tempLineID[szName];
    local nRet, nItemIdx = gf_AddItemEx2(tRet[1], tRet[2], szItemName, tRet[2], 0, 1);
    if nItemIdx then
        SetItemFeedUpAttrs(nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]);
        gf_WriteLogEx(szItemName, tRet[2], format("Index:%d LineID:%d|%d|%d|%d|%d|%d", nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]))
    end
end

--Ñ¡Ôñ½âËøÊôÐÔ
function ChoiceUnLockAttr(nItem, nLineID)
    local szName = GetName();
    local tDialog = GetAttrTable(nItem);
    local tLineID = tempLineID[szName];
    if nLineID and getn(tLineID) < 6 then
        tLineID[getn(tLineID) + 1] = nLineID;
        nLineID = nil
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
    if not nLineID and type(tRet[1][1]) == "table" then
        local tbSay = {};
        tbSay.msg = format("H·y chän lo¹i cña %s: ", tRet[2]);
        tbSay.sel = {};
        for i = 1, getn(tRet[1]) do
            tinsert(tbSay.sel, { tRet[1][i][2],
                                 format("#ChoiceUnLockAttr(%d, %d)", nItem, i) });
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
    if not choice1 and getn(base) ~= 1 then
        local tSay = {};
        for k, v in base do
            tinsert(tSay, format("%s/#ChoiceBaseAttr(%d, '%s')", k, nItem, k));
        end
        tinsert(tSay, "\n rót lui/nothing");
        Say("H·y chän lo¹i thuéc tÝnh c¬ b¶n: ", getn(tSay), tSay);
        return 0;
    end
    if not choice1 then
        choice1 = 1;
    end
    local tLineID = tempLineID[szName];
    local tBaseAttr = tDialog.baseAttr[choice1];
    if choice2 then
        tLineID[curIndex] = tBaseAttr[curIndex][choice2];
        choice2 = nil;
    end
    if not curIndex then
        curIndex = 0;
    end
    for i = curIndex + 1, getn(tBaseAttr) do
        if not choice2 and type(tBaseAttr[i]) == "table" then
            local tSay = {}
            for j = 1, getn(tBaseAttr[i]) do
                local szFormat = "%s/#ChoiceBaseAttr(%d, '%s', %d, %d)";
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
    if not tempLineID then
        tempLineID = {};
    end
    local szName = GetName();
    tempLineID[szName] = {};
    ChoiceBaseAttr(nItem);
end

function OnUse(nItem)
    local szItemName = GetItemName(nItem);
    local szAwardName = GetAwardTable(nItem)[2];
    Say(format("Sö dông<color=gold> %s<color> cã thÓ hîp thµnh <color=gold>%s<color>, x¸c nhËn sö dông kh«ng?", szItemName, szAwardName), 2,
            format("\n§ång ý dïng/#OnUseItem(%d)", nItem), "\n§Ó ta suy nghÜ l¹i/nothing");
end