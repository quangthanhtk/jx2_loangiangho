----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item th� ch�n �� h�o hi�p v� h� c� gi� c��ng h�a d�a v�o c��ng h�a c�a th�
----------------------------------------------------------------------------------------------------
--��Ͼ�ĺ����ͷ���£��㣩
--Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

g_CapDialog = {
    baseAttr = {
        { 1558, 1562, 1566 },
    },
    UnLockAttr = {
        { 1665, 1668, 1671, 1674, 1677, 1680, 1681, 1682, 1683, 1684, 1685 },
        { 1689, 1692, 1695, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 1710, 1711, 1712, 1713 },
        { 1715, 1716, 1717, 1720, 1721, 1722 },
    },
};

g_ClothDialog = {
    baseAttr = {
        { 1571, 1575, 1579 },
    },
    UnLockAttr = {
        { 1726, 1729, 1732, 1736, 1740, 1743, 1744, 1745, 1746, 1747, 1748 },
        { 1752, 1755, 1758, 1761, 1762, 1763, 1764, 1765, 1766, 1767, 1768, 1769, 1770, 1771, 1772, 1773, 1774, 1775, 1776 },
        { 1778, 1779, 1780, 1783, 1784, 1785 },
    },
};

g_ShoeDialog = {
    baseAttr = {
        { 1584, 1588, 1592 },
    },
    UnLockAttr = {
        { 1789, 1792, 1795, 1799, 1803, 1806, 1807, 1808, 1809, 1810, 1811 },
        { 1815, 1818, 1821, 1824, 1825, 1826, 1827, 1828, 1829, 1830, 1831, 1832, 1833, 1834, 1835, 1836, 1837, 1838, 1839 },
        { 1841, 1842, 1843, 1846, 1847, 1848 },
    },
};

g_WeaponDialog = {
    baseAttr = {
        ["V� kh� s�t th��ng"] = { { 1597, 1601 }, 1605, 1609 },
        ["C�m chuy�n d�ng"] = { { 1614, 1618 }, 1622, 1626 },
        ["N�i c�ng "] = { 1631, 1635, 1639 },
        ["Ngo�i c�ng"] = { 1644, 1648, 1652 },
    },
    UnLockAttr = {
        { 1855, 1858, 1852, 1861, 1864, 1867 },
        { 1869, 1870, 1871, 1872, 1873, 1876 },
        { 1880, 1883, 1886, 1887, 1888, 1889, 1890, 1891, 1894 },
    },
};

g_RingDialog = {
    baseAttr = {
        { 1657, 1661, 0 },
    },
    UnLockAttr = {
        { 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907 },
        { 1911, 1914, 1917, 1920, 1921, 1922, 1923 },
        { 1925, 1928, 1934, 1935, 1936, 1937, 1938, 1940, 1943, 1944, 1947 },
    },
};

function GetAttrTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItem2Attr = {
        [40011] = g_CapDialog,
        [40012] = g_ClothDialog,
        [40013] = g_ShoeDialog,
        [40014] = g_WeaponDialog,
        [40015] = g_RingDialog,
    }
    return tItem2Attr[nP];
end

function GetAwardTable(nItem)
    local nP = GetItemParticular(nItem);
    local tItemAward = {
        [40011] = { { 0, 103, 30569, 1, 4, -1, -1, -1, -1, -1, -1 }, "N�n H�o Hi�p-V� H�" },
        [40012] = { { 0, 100, 30569, 1, 4, -1, -1, -1, -1, -1, -1 }, "�o H�o Hi�p-V� H�" },
        [40013] = { { 0, 101, 30569, 1, 4, -1, -1, -1, -1, -1, -1 }, "Qu�n H�o Hi�p-V� H�" },
        [40014] = { {
                        { { 0, 3, 30744, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p �ao (Thi�u L�m �ao)", 2 },
                        { { 0, 8, 30745, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Tr��ng (Thi�u L�m Thi�n)", 3 },
                        { { 0, 0, 30746, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Th� (Thi�u L�m Th�)", 4 },
                        { { 0, 1, 30747, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Ch�m (���ng M�n Ch�m)", 6 },
                        { { 0, 2, 30748, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Ki�m (Nga My Ki�m)", 8 },
                        { { 0, 10, 30749, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p C�m (Nga My C�m)", 9 },
                        { { 0, 0, 30750, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Th� (C�i Bang Th�)", 11 },
                        { { 0, 5, 30751, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p C�n (C�i Bang C�n)", 12 },
                        { { 0, 2, 30752, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Ki�m (V� �ang Ki�m)", 14 },
                        { { 0, 9, 30753, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p B�t (V� �ang B�t)", 15 },
                        { { 0, 6, 30754, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Th��ng (D��ng M�n Th��ng)", 17 },
                        { { 0, 4, 30755, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Cung (D��ng M�n Cung)", 18 },
                        { { 0, 7, 30756, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Song �ao (Ng� ��c �ao)", 20 },
                        { { 0, 11, 30757, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Tr�o (Ng� ��c Tr�o)", 21 },
                        { { 0, 2, 30758, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Ki�m (C�n L�n Thi�n S�)", 23 },
                        { { 0, 3, 30759, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p �ao(Minh gi�o �ao)", 25 },
                        { { 0, 9, 30760, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p B�t(Minh gi�o B�t)", 26 },
                        { { 0, 11, 30761, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Tr�o(Minh gi�o Tr�o)", 27 },
                        { { 0, 13, 30762, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Phi�n (Th�y Y�n Phi�n)", 29 },
                        { { 0, 12, 30763, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p ��ch (Th�y Y�n ��ch)", 30 },
                        { { 0, 14, 32163, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Ch�y (Nh�m Hi�p-Ch�y)", 31 },
                        { { 0, 2, 32191, 1, 4, -1, -1, -1, -1, -1, -1 }, "V� H� H�o Hi�p Ki�m (C�n L�n Ki�m T�n)", 32 },
                    }, "V� Kh� H�o Hi�p V� H�" },
        [40015] = { {
                        { { 0, 102, 31128, 1, 4, -1, -1, -1, -1, -1, -1 }, "H�o Hi�p Gi�i-V� H�" },
                        { { 0, 102, 31129, 1, 4, -1, -1, -1, -1, -1, -1 }, "H�o Hi�p B�i-V� H�" },
                    }, "Trang S�c H�o Hi�p V� H�" },
    }
    return tItemAward[nP];
end

function GetItemFeedAttrDesc(id)
    if g_FeedItemDesc == WEnv.NULL then
        g_ItemFeedDesc = {};
    end
    if g_ItemFeedDesc[id] == WEnv.NULL then
        g_ItemFeedDesc[id] = GetItemFeedAttiDesc(id);
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

        WPlayerLog:WriteAddItemLog("item_chon_haohiepvoha_giucuonghoa", "M� l�nh b�i", nRet, nItemIdx, tRet[1][4], tLineID);
    end
end

--ѡ���������
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
        local tName = { "Thu�c t�nh t�n c�ng", "Thu�c t�nh ph�ng th�", "Thu�c t�nh kh�c" };
        tbSay.msg = format("l�a ch�n %s:", tName[nIndex]);
        tbSay.sel = {};
        for i = 1, getn(tCurrList) do
            tinsert(tbSay.sel, { GetItemFeedAttiDesc(tCurrList[i]),
                                 format("#ChoiceUnLockAttr(%d, %d)", nItem, tCurrList[i]) });
        end
        tinsert(tbSay.sel, { "\n r�t lui", "nothing" });
        temp_Talk(tbSay);
        return 0;
    end
    --����ȷ��
    local tRet = GetAwardTable(nItem);
    if nLineID == WEnv.NULL and type(tRet[1][1]) == "table" then
        local tbSay = {};
        tbSay.msg = format("H�y ch�n lo�i c�a %s: ", tRet[2]);
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
        tinsert(tbSay.sel, { "\n r�t lui", "nothing" });
        temp_Talk(tbSay);
        return 0;
    end
    local szDialog = format("��ng �/#ComposeFeedItem(%d)", nItem);
    if nLineID and type(tRet[1][1]) == "table" then
        tRet = tRet[1][nLineID]
        szDialog = format("��ng �/#ComposeFeedItem(%d, %d)", nItem, nLineID);
    end
    local msg = "Thu�c t�nh l�a ch�n cu�i c�ng nh� sau:\n";
    msg = msg .. format("    Thu�c t�nh m�c ��nh: <color=green>%s, %s, %s<color>\n", GetItemFeedAttiDesc(tLineID[1]), GetItemFeedAttiDesc(tLineID[2]), GetItemFeedAttiDesc(tLineID[3]));
    msg = msg .. format("    Thu�c t�nh m� kh�a: <color=green>%s, %s, %s<color>\n", GetItemFeedAttiDesc(tLineID[4]), GetItemFeedAttiDesc(tLineID[5]), GetItemFeedAttiDesc(tLineID[6]));
    msg = msg .. format("Quy�t ��nh d�ng <color=gold>%s<color> gh�p th�nh <color=gold>%s<color> kh�ng?", GetItemName(nItem), tRet[2]);
    Say(msg, 2, szDialog, "�� ta suy ngh�/nothing");
end

--ѡ���������
function ChoiceBaseAttr(nItem, choice1, curIndex, choice2)
    local szName = GetName();
    local tDialog = GetAttrTable(nItem);
    local base = tDialog.baseAttr;
    if choice1 == WEnv.NULL and getn(base) ~= 1 then
        local tSay = {};
        for k, v in base do
            tinsert(tSay, format("%s/#ChoiceBaseAttr(%d, %q)", k, nItem, k));
        end
        tinsert(tSay, "\n r�t lui/nothing");
        Say("H�y ch�n lo�i thu�c t�nh c� b�n: ", getn(tSay), tSay);
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
        if chioce2 == WEnv.NULL and type(tBaseAttr[i]) == "table" then
            local tSay = {}
            for j = 1, getn(tBaseAttr[i]) do
                local szFormat = "%s/#ChoiceBaseAttr(%d, %q, %d, %d)";
                if type(choice1) == "number" then
                    szFormat = "%s/#ChoiceBaseAttr(%d, %d, %d, %d)";
                end
                tinsert(tSay, format(szFormat, GetItemFeedAttiDesc(tBaseAttr[i][j]), nItem, choice1, i, j));
            end
            tinsert(tSay, "\n r�t lui/nothing");
            Say("H�y ch�n lo�i thu�c t�nh con c� b�n: ", getn(tSay), tSay);
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
        Talk(1, "", "Gia nh�p l�u ph�i v� h�c k� n�ng c�p 55 m�i ���c d�ng!");
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
        Say(format("s� d�ng <color=gold>%s<color> c� th� h�p th�nh <color=gold>%s+%d<color>, x�c nh�n s� d�ng kh�ng?", szItemName, szAwardName, nEnhanceSaved), 2,
                format("\n��ng � d�ng/#OnUseItem(%d)", nItem), "\n�� ta suy ngh� l�i/nothing");
    else
        Say(format("s� d�ng <color=gold>%s<color> c� th� h�p th�nh <color=gold>%s<color>, x�c nh�n s� d�ng kh�ng?", szItemName, szAwardName), 2,
                format("\n��ng � d�ng/#OnUseItem(%d)", nItem), "\n�� ta suy ngh� l�i/nothing");
    end
end
