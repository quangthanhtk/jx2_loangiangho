--ɱ�����ƣ�ͷ,��,�㣩
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")

g_CapDialog = {
  baseAttr = {
    { 3623, 10001, 0 },
  },
  UnLockAttr = {
    { 3629, 3630, 3631, 3632, 3633, 3634, 3635, 3636, 3637 },
    { 3639.3640, 3641, 3642, 3643 },
    { 3645, 3646, 3647, 3648 },
  },
};

g_ClothDialog = {
  baseAttr = {
    { 3625, 10001, 0 },
  },
  UnLockAttr = {
    { 3629, 3630, 3631, 3632, 3633, 3634, 3635, 3636, 3637 },
    { 3639.3640, 3641, 3642, 3643 },
    { 3645, 3646, 3647, 3648 },
  },
};

g_ShoeDialog = {
  baseAttr = {
    { 3627, 10001, 0 },
  },
  UnLockAttr = {
    { 3629, 3630, 3631, 3632, 3633, 3634, 3635, 3636, 3637 },
    { 3639.3640, 3641, 3642, 3643 },
    { 3645, 3646, 3647, 3648 },
  },
};

g_WeaponDialog = {
  baseAttr = {
    ["V� kh� s�t th��ng"] = { { 3681, 3682 }, 3684, 0 },
    ["C�m chuy�n d�ng"] = { { 3676, 3677 }, 3684, 0 },
    ["N�i c�ng "] = { 3674, 3684, 0 },
    ["Ngo�i c�ng"] = { 3679, 3684, 0 },
  },
  UnLockAttr = {
    { 3686, 3687, 3688, 3689, 3690, 3691 },
    { 3693, 3694, 3695, 3696 },
    { 3698, 3699, 3700 },
  },
};

g_RingDialog = {
  baseAttr = {
    { 3650, 0, 0 },
  },
  UnLockAttr = {
    { 3652, 3653, 3654, 3655, 3656, 3657 },
    { 3659, 3660, 3661, 3662, 3663 },
    { 3665, 3666, 3667, 3668, 3669, 3670, 3671, 3672 },
  },
};

function GetAttrTable(nItem)
  local nP = GetItemParticular(nItem);
  local tItem2Attr = {
    [31684] = g_CapDialog,
    [31685] = g_ClothDialog,
    [31686] = g_ShoeDialog,
    [31687] = g_WeaponDialog,
    [31688] = g_RingDialog,
  }
  return tItem2Attr[nP];
end

function GetAwardTable(nItem)
  local nP = GetItemParticular(nItem);
  local tItemAward = {
    [31684] = { { 0, 103, 32464, 1, 4, -1, -1, -1, -1, -1, -1 }, "M�t N� L�ng S��ng" },
    [31685] = { { 0, 100, 32464, 1, 4, -1, -1, -1, -1, -1, -1 }, "�o L�ng S��ng" },
    [31686] = { { 0, 101, 32464, 1, 4, -1, -1, -1, -1, -1, -1 }, "Qu�n L�ng S��ng" },
    [31687] = { {
                  { { 0, 3, 15435, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-T�ch Di�t �ao (Thi�u L�m �ao)" },
                  { { 0, 0, 15436, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Ngh�ch Phong C� (Thi�u L�m Quy�n)" },
                  { { 0, 8, 15437, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-B� �� Tr��ng (Thi�u L�m Thi�n)" },
                  { { 0, 1, 15438, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Di�m V��ng Thi�p (���ng M�n Ch�m)" },
                  { { 0, 2, 15439, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Can L� Ki�m(Nga My Ki�m)" },
                  { { 0, 10, 15440, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Ng�c B�ng C�m (Nga My C�m)" },
                  { { 0, 0, 15441, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-X�ch L�n Th� (C�i Bang Th�)" },
                  { { 0, 5, 15442, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Tr�n H�i B�ng (C�i Bang C�n)" },
                  { { 0, 2, 15443, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-L�u V�n Ki�m (V� �ang Ki�m)" },
                  { { 0, 9, 15444, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Thanh Li�n B�t (V� �ang B�t)" },
                  { { 0, 6, 15445, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Long ��m Th��ng (D��ng M�n Th��ng)" },
                  { { 0, 4, 15446, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-V� �nh Thi�m (D��ng M�n Cung)" },
                  { { 0, 7, 15447, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Phong Ma Tr�m (Ng� ��c �ao)" },
                  { { 0, 11, 15448, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-Kh� Huy�t Tr�o (Ng� ��c Tr�o)" },
                  { { 0, 2, 15449, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-H�n Ki�m Ph�ch (C�n L�n Thi�n S�)" },
                  { { 0, 3, 15450, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-H�n Th�nh Di�u �ao (Minh Gi�o �ao)" },
                  { { 0, 9, 15451, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-T� �n B�t (Minh Gi�o B�t)" },
                  { { 0, 11, 15452, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-V� T��ng Tr�o (Minh Gi�o Tr�o)" },
                  { { 0, 13, 15453, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-L�i Nguy�t (Th�y Y�n Phi�n)" },
                  { { 0, 12, 15454, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-�� Nguy�t Ti�u (Th�y Y�n S�o)" },
                  { { 0, 14, 15455, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-T� B�ch Tuy�t (Nh�m Hi�p Ch�y)" },
                  { { 0, 2, 15456, 1, 4, -1, -1, -1, -1, -1, -1 }, "L�ng S��ng-L�c C�u Thi�n (C�n L�n Ki�m T�n)" },
                }, "V� Kh� L�ng S��ng" },
    [31688] = { {
                  { { 0, 102, 32494, 1, 4, -1, -1, -1, -1, -1, -1 }, "Nh�n L�ng S��ng" },
                  { { 0, 102, 32495, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ng�c b�i L�ng S��ng" },
                }, "Trang S�c L�ng S��ng" },
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

--ѡ���������
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
    local tName = { "Thu�c t�nh t�n c�ng", "Thu�c t�nh ph�ng th�", "Thu�c t�nh kh�c" };
    tbSay.msg = format("l�a ch�n %s:", tName[nIndex]);
    tbSay.sel = {};
    for i = 1, getn(tCurrList) do
      tinsert(tbSay.sel, { GetItemFeedAttrDesc(tCurrList[i]), format("#ChoiceUnLockAttr(%d, %d)", nItem, tCurrList[i]) });
    end
    tinsert(tbSay.sel, { "\n r�t lui", "nothing" });
    temp_Talk(tbSay);
    return 0;
  end
  --����ȷ��
  local tRet = GetAwardTable(nItem);
  if not nLineID and type(tRet[1][1]) == "table" then
    local tbSay = {};
    tbSay.msg = format("H�y ch�n lo�i c�a %s: ", tRet[2]);
    tbSay.sel = {};
    for i = 1, getn(tRet[1]) do
      tinsert(tbSay.sel, { tRet[1][i][2],
                           format("#ChoiceUnLockAttr(%d, %d)", nItem, i) });
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
  msg = msg .. format("Thu�c t�nh m�c ��nh: \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[1]), GetItemFeedAttrDesc(tLineID[2]), GetItemFeedAttrDesc(tLineID[3]));
  msg = msg .. format("Thu�c t�nh m� kh�a:  \n<color=green>%s, %s, %s<color>\n", GetItemFeedAttrDesc(tLineID[4]), GetItemFeedAttrDesc(tLineID[5]), GetItemFeedAttrDesc(tLineID[6]));
  msg = msg .. format("Quy�t ��nh d�ng <color=gold>%s<color> gh�p th�nh <color=gold>%s<color> kh�ng?", GetItemName(nItem), tRet[2]);
  Say(msg, 2, szDialog, "�� ta suy ngh�/nothing");
end

--ѡ���������
function ChoiceBaseAttr(nItem, choice1, curIndex, choice2)
  local szName = GetName();
  local tDialog = GetAttrTable(nItem);
  local base = tDialog.baseAttr;
  if not choice1 and getn(base) ~= 1 then
    local tSay = {};
    for k, v in base do
      tinsert(tSay, format("%s/#ChoiceBaseAttr(%d, '%s')", k, nItem, k));
    end
    tinsert(tSay, "\n r�t lui/nothing");
    Say("H�y ch�n lo�i thu�c t�nh c� b�n: ", getn(tSay), tSay);
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
  Say(format("S� d�ng <color=gold>%s<color> c� th� h�p th�nh <color=gold>%s<color>, x�c nh�n s� d�ng kh�ng?", szItemName, szAwardName), 2,
      format("\n��ng � d�ng/#OnUseItem(%d)", nItem), "\n�� ta suy ngh� l�i/nothing");
end
