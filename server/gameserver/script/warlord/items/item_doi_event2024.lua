----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item t�i/r��ng m� ra c�c v�t ph�m con
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\lib\\globalfunctions.lua");
----------------------------------------------------------------------------------------------------
tbNguyenLieu = {
        {2,1,40157, "Men Bia", 3},--
        {2,1,40158, "L�a M�ch", 2}, --
        {2,1,40159, "Hoa Sinh T�", 2},--
        {2,1,30603, "Ti�u Dao ng�c", 10},--
}
tbNguyenLieu1 = {
        {2,1,40157, "Men Bia", 5},--
        {2,1,40158, "L�a M�ch", 4}, --
        {2,1,40159, "Hoa Sinh T�", 4},--
        {2,1,30603, "Ti�u Dao ng�c", 20},--
}
tbVPEvent = {
    {2,1,40160, "Bia V�a H�"},
}
tbVPEvent1 = {
    {2,1,40161, "Bia DaHu"},
}
function OnUse(nItemIdx)
    local nDate = tonumber(date("%Y%m%d"))
    local tSay = {}
    tinsert(tSay, format("%s/#DoiEvent(1)", "��i Bia V�a H�"));
    tinsert(tSay, format("%s/#DoiEvent(2)", "��i Bia Dahu"));

    tinsert(tSay,"Ta bi�t r�i/dlgover")

    if nDate <= 20260317 then
        local strSay = "H� �� ��n r�i. Ch�c c�c b�ng h�u g�n xa s�c kh�e d�i d�o!\nH�y nhanh ��i bia �� u�ng n�o!"
        Say(strSay,getn(tSay),tSay)
    end

end
function DoiEvent(nType)
    if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
        Talk(1,"","H�nh trang kh�ng �� ch� tr�ng, vui l�ng s�p x�p l�i.")
        return 0;
    end
    AskClientForNumber("ExeDoiEvent"..nType, 1, 1000, "S� l��ng");
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
        Talk(1, "", "Tr�n h�nh trang kh�ng �� nguy�n li�u xin ki�m tra l�i!");
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

    Talk(1, "", format("B�n v�a ��i th�nh c�ng %d Bia V�a H�. Ki�m tra � r��ng h�nh trang!", nVar))
    Msg2Player(format("B�n v�a ��i th�nh c�ng %d Bia V�a H�. Ki�m tra � r��ng h�nh trang!", nVar))
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
        Talk(1, "", "Tr�n h�nh trang kh�ng �� nguy�n li�u xin ki�m tra l�i!");
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

    Talk(1, "", format("B�n v�a ��i th�nh c�ng %d Bia Dahu. Ki�m tra � r��ng h�nh trang!", nVar))
    Msg2Player(format("B�n v�a ��i th�nh c�ng %d Bia Dahu. Ki�m tra � r��ng h�nh trang!", nVar))
end
