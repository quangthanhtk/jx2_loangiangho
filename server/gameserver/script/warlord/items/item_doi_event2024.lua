----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item tói/r­¬ng më ra c¸c vËt phÈm con
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\lib\\globalfunctions.lua");
----------------------------------------------------------------------------------------------------
tbNguyenLieu = {
        {2,1,40157, "Men Bia", 3},--
        {2,1,40158, "Lóa M¹ch", 2}, --
        {2,1,40159, "Hoa Sinh Tè", 2},--
        {2,1,30603, "Tiªu Dao ngäc", 10},--
}
tbNguyenLieu1 = {
        {2,1,40157, "Men Bia", 5},--
        {2,1,40158, "Lóa M¹ch", 4}, --
        {2,1,40159, "Hoa Sinh Tè", 4},--
        {2,1,30603, "Tiªu Dao ngäc", 20},--
}
tbVPEvent = {
    {2,1,40160, "Bia VØa HÌ"},
}
tbVPEvent1 = {
    {2,1,40161, "Bia DaHu"},
}
function OnUse(nItemIdx)
    local nDate = tonumber(date("%Y%m%d"))
    local tSay = {}
    tinsert(tSay, format("%s/#DoiEvent(1)", "§æi Bia VØa HÌ"));
    tinsert(tSay, format("%s/#DoiEvent(2)", "§æi Bia Dahu"));

    tinsert(tSay,"Ta biÕt råi/dlgover")

    if nDate <= 20260317 then
        local strSay = "HÌ ®· ®Õn råi. Chóc c¸c b»ng h÷u gÇn xa søc kháe dåi dµo!\nH·y nhanh ®æi bia ®Ó uèng nµo!"
        Say(strSay,getn(tSay),tSay)
    end

end
function DoiEvent(nType)
    if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
        Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng, vui lßng s¾p xÕp l¹i.")
        return 0;
    end
    AskClientForNumber("ExeDoiEvent"..nType, 1, 1000, "Sè l­îng");
end

function ExeDoiEvent1(nVar)
    local notNL = 0;
    --Check
    for i=1, getn(tbNguyenLieu) do
        if GetItemCount(tbNguyenLieu[i][1], tbNguyenLieu[i][2], tbNguyenLieu[i][3]) < nVar * tbNguyenLieu[i][5] then
            notNL = notNL + 1;
        end
    end
    if notNL ~= 0 then
        Talk(1, "", "Trªn hµnh trang kh«ng ®ñ nguyªn liÖu xin kiÓm tra l¹i!");
        return 0;
    end

    --Pay
    for i=1, getn(tbNguyenLieu) do
        DelItem(tbNguyenLieu[i][1], tbNguyenLieu[i][2], tbNguyenLieu[i][3], nVar * tbNguyenLieu[i][5])
    end

    --Add Item
    local tItem = {}
    tItem = tbVPEvent[1]
    gf_AddItemEx2({tItem[1],tItem[2],tItem[3],nVar}, tItem[4], "event_tet2023", "exchange_item: "..nVar, 0, 1)

    Talk(1, "", format("B¹n võa ®æi thµnh c«ng %d Bia VØa HÌ. KiÓm tra ë r­¬ng hµnh trang!", nVar))
    Msg2Player(format("B¹n võa ®æi thµnh c«ng %d Bia VØa HÌ. KiÓm tra ë r­¬ng hµnh trang!", nVar))
end
function ExeDoiEvent2(nVar)
    local notNL = 0;
    --Check
    for i=1, getn(tbNguyenLieu1) do
        if GetItemCount(tbNguyenLieu1[i][1], tbNguyenLieu1[i][2], tbNguyenLieu1[i][3]) < nVar * tbNguyenLieu1[i][5] then
            notNL = notNL + 1;
        end
    end
    if notNL ~= 0 then
        Talk(1, "", "Trªn hµnh trang kh«ng ®ñ nguyªn liÖu xin kiÓm tra l¹i!");
        return 0;
    end

    --Pay
    for i=1, getn(tbNguyenLieu1) do
        DelItem(tbNguyenLieu1[i][1], tbNguyenLieu1[i][2], tbNguyenLieu1[i][3], nVar * tbNguyenLieu1[i][5])
    end

    --Add Item
    local tItem = {}
    tItem = tbVPEvent1[1]
    gf_AddItemEx2({tItem[1],tItem[2],tItem[3],nVar}, tItem[4], "event_tet2023", "exchange_item: "..nVar, 0, 1)

    Talk(1, "", format("B¹n võa ®æi thµnh c«ng %d Bia Dahu. KiÓm tra ë r­¬ng hµnh trang!", nVar))
    Msg2Player(format("B¹n võa ®æi thµnh c«ng %d Bia Dahu. KiÓm tra ë r­¬ng hµnh trang!", nVar))
end
