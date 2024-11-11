--É±ÐÇÁîÅÆ£¨Í·,ÒÂ,¿ã£©
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
    ["Vò khÝ s¸t th­¬ng"] = { { 3681, 3682 }, 3684, 0 },
    ["CÇm chuyªn dïng"] = { { 3676, 3677 }, 3684, 0 },
    ["Néi c«ng "] = { 3674, 3684, 0 },
    ["Ngo¹i c«ng"] = { 3679, 3684, 0 },
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
    [31684] = { { 0, 103, 32464, 1, 4, -1, -1, -1, -1, -1, -1 }, "MÆt N¹ L¨ng S­¬ng" },
    [31685] = { { 0, 100, 32464, 1, 4, -1, -1, -1, -1, -1, -1 }, "¸o L¨ng S­¬ng" },
    [31686] = { { 0, 101, 32464, 1, 4, -1, -1, -1, -1, -1, -1 }, "QuÇn L¨ng S­¬ng" },
    [31687] = { {
                  { { 0, 3, 15435, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-TÞch DiÖt §ao (ThiÕu L©m §ao)" },
                  { { 0, 0, 15436, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-NghÞch Phong Cù (ThiÕu L©m QuyÒn)" },
                  { { 0, 8, 15437, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Bå §Ò Tr­îng (ThiÕu L©m ThiÒn)" },
                  { { 0, 1, 15438, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Diªm V­¬ng ThiÕp (§­êng M«n Ch©m)" },
                  { { 0, 2, 15439, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Can Lé KiÕm(Nga My KiÕm)" },
                  { { 0, 10, 15440, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Ngäc B¨ng CÇm (Nga My CÇm)" },
                  { { 0, 0, 15441, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-XÝch L©n Thñ (C¸i Bang Thñ)" },
                  { { 0, 5, 15442, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-TrÊn H¶i Bæng (C¸i Bang C«n)" },
                  { { 0, 2, 15443, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-L­u V©n KiÕm (Vâ §ang KiÕm)" },
                  { { 0, 9, 15444, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Thanh Liªn Bót (Vâ §ang Bót)" },
                  { { 0, 6, 15445, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Long §¶m Th­¬ng (D­¬ng M«n Th­¬ng)" },
                  { { 0, 4, 15446, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-V« ¶nh ThiÓm (D­¬ng M«n Cung)" },
                  { { 0, 7, 15447, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Phong Ma Tr¶m (Ngò §éc §ao)" },
                  { { 0, 11, 15448, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Kh« HuyÕt Tr¶o (Ngò §éc Tr¶o)" },
                  { { 0, 2, 15449, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Hån KiÕm Ph¸ch (C«n L«n Thiªn S­)" },
                  { { 0, 3, 15450, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Hån Th¸nh DiÖu §ao (Minh Gi¸o §ao)" },
                  { { 0, 9, 15451, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Tõ ¢n Bót (Minh Gi¸o Bót)" },
                  { { 0, 11, 15452, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-V« T­íng Tr¶o (Minh Gi¸o Tr¶o)" },
                  { { 0, 13, 15453, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Lçi NguyÖt (Thóy Yªn PhiÕn)" },
                  { { 0, 12, 15454, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-§é NguyÖt Tiªu (Thóy Yªn S¸o)" },
                  { { 0, 14, 15455, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-Tô B¹ch TuyÕt (NhËm HiÖp Chñy)" },
                  { { 0, 2, 15456, 1, 4, -1, -1, -1, -1, -1, -1 }, "L¨ng S­¬ng-L¹c Cöu Thiªn (C«n L«n KiÕm T«n)" },
                }, "Vò KhÝ L¨ng S­¬ng" },
    [31688] = { {
                  { { 0, 102, 32494, 1, 4, -1, -1, -1, -1, -1, -1 }, "NhÉn L¨ng S­¬ng" },
                  { { 0, 102, 32495, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ngäc béi L¨ng S­¬ng" },
                }, "Trang Søc L¨ng S­¬ng" },
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
  Say(format("Sö dông <color=gold>%s<color> cã thÓ hîp thµnh <color=gold>%s<color>, x¸c nhËn sö dông kh«ng?", szItemName, szAwardName), 2,
      format("\n§ång ý dïng/#OnUseItem(%d)", nItem), "\n§Ó ta suy nghÜ l¹i/nothing");
end
