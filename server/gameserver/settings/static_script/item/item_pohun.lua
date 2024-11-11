--É±ÐÇÁîÅÆ£¨Í·,ÒÂ,¿ã£©
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")

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
    [31529] = g_CapDialog,
    [31530] = g_ClothDialog,
    [31531] = g_ShoeDialog,
    [31532] = g_WeaponDialog,
    [31533] = g_RingDialog,
  }
  return tItem2Attr[nP];
end

function GetAwardTable(nItem)
  local nP = GetItemParticular(nItem);
  local tItemAward = {
    [31529] = { { 0, 103, 32347, 1, 4, -1, -1, -1, -1, -1, -1 }, "MÆt N¹ Ph¸ Hån" },
    [31530] = { { 0, 100, 32347, 1, 4, -1, -1, -1, -1, -1, -1 }, "¸o Ph¸ Hån" },
    [31531] = { { 0, 101, 32347, 1, 4, -1, -1, -1, -1, -1, -1 }, "QuÇn Ph¸ Hån" },
    [31532] = { {
                  { { 0, 3, 15301, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-TÞch DiÖt §ao (ThiÕu L©m §ao)" },
                  { { 0, 0, 15302, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-NghÞch Phong Cù (ThiÕu L©m QuyÒn)" },
                  { { 0, 8, 15303, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Bå §Ò Tr­îng (ThiÕu L©m ThiÒn)" },
                  { { 0, 1, 15304, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Diªm V­¬ng ThiÕp (§­êng M«n Ch©m)" },
                  { { 0, 2, 15305, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Can Lé KiÕm(Nga My KiÕm)" },
                  { { 0, 10, 15306, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Ngäc B¨ng CÇm (Nga My CÇm)" },
                  { { 0, 0, 15307, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-XÝch L©n Thñ (C¸i Bang Thñ)" },
                  { { 0, 5, 15308, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-TrÊn H¶i Bæng (C¸i Bang C«n)" },
                  { { 0, 2, 15309, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-L­u V©n KiÕm (Vâ §ang KiÕm)" },
                  { { 0, 9, 15310, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Thanh Liªn Bót (Vâ §ang Bót)" },
                  { { 0, 6, 15311, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Long §¶m Th­¬ng (D­¬ng M«n Th­¬ng)" },
                  { { 0, 4, 15312, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-V« ¶nh ThiÓm (D­¬ng M«n Cung)" },
                  { { 0, 7, 15313, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Phong Ma Tr¶m (Ngò §éc §ao)" },
                  { { 0, 11, 15314, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Kh« HuyÕt Tr¶o (Ngò §éc Tr¶o)" },
                  { { 0, 2, 15315, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Hån KiÕm Ph¸ch (C«n L«n Thiªn S­)" },
                  { { 0, 3, 15316, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Hån Th¸nh DiÖu §ao (Minh Gi¸o §ao)" },
                  { { 0, 9, 15317, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Tõ ¢n Bót (Minh Gi¸o Bót)" },
                  { { 0, 11, 15318, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-V« T­íng Tr¶o (Minh Gi¸o Tr¶o)" },
                  { { 0, 13, 15319, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Lçi NguyÖt (Thóy Yªn PhiÕn)" },
                  { { 0, 12, 15320, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-§é NguyÖt Tiªu (Thóy Yªn S¸o)" },
                  { { 0, 14, 15321, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-Tô B¹ch TuyÕt (NhËm HiÖp Chñy)" },
                  { { 0, 2, 15322, 1, 4, -1, -1, -1, -1, -1, -1 }, "Ph¸ Hån-L¹c Cöu Thiªn (C«n L«n KiÕm T«n)" },
                }, "Vò KhÝ Ph¸ Hån" },
    [31533] = { {
                  { { 0, 102, 32160, 1, 4, -1, -1, -1, -1, -1, -1 }, "NhÉn Ph¸ Hån" },
                  { { 0, 102, 32161, 1, 4, -1, -1, -1, -1, -1, -1 }, "D©y §eo NhiÕp T©m" },
                }, "Trang Søc Ph¸ Hån" },
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
    local checktInfo = GetItemInfoByIndex(nItemIdx, 1)
    if checktInfo.detail ~=102 then
      SetItemEnhance(nItemIdx,15)
    end
    --
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
