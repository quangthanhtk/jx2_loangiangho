Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
tItem_HaoXia = {
    ["0330724"]={"H�o Hi�p �ao",	0,	3,	30724,},
    ["0830725"]={"H�o Hi�p Tr��ng",	0,	8,	30725,},
    ["0030726"]={"H�o Hi�p Th�",	0,	0,	30726,},
    ["0130727"]={"H�o Hi�p Ch�m",	0,	1,	30727,},
    ["0230728"]={"H�o Hi�p Ki�m",	0,	2,	30728,},
    ["01030729"]={"H�o Hi�p C�m",0,	10,	30729,},
    ["0030730"]={"H�o Hi�p Th�",	0,	0,	30730,},
    ["0530731"]={"H�o Hi�p C�n",	0,	5,	30731,},
    ["0230732"]={"H�o Hi�p Ki�m",	0,	2,	30732,},
    ["0930733"]={"H�o Hi�p B�t",	0,	9,	30733,},
    ["0630734"]={"H�o Hi�p Th��ng",	0,	6,	30734,},
    ["0430735"]={"H�o Hi�p Cung",	0,	4,	30735,},
    ["0730736"]={"H�o Hi�p Song �ao",	0,	7,	30736,},
    ["01130737"]={"H�o Hi�p Tr�o",	0,	11,  30737,},
    ["0230738"]={"H�o Hi�p Ki�m",	0,	2	,30738,},
    ["0330739"]={"H�o Hi�p �ao",	0,	3	,30739,},
    ["0930740"]={"H�o Hi�p B�t",	0,	9	,30740,},
    ["01130741"]={"H�o Hi�p Tr�o",	0,	11	,30741,},
    ["01330742"]={"H�o Hi�p Phi�n",	0,	13	,30742,},
    ["01230743"]={"H�o Hi�p ��ch",	0,	12	,30743,},
    ["01432162"]={"H�o Hi�p Ch�y",	0,	14	,32162,},
    ["0232191"]={"H�o Hi�p Ki�m",	0,	2	,32191,},
    ["010330568"]={"H�o Hi�p ��u",	0,	103	,30568,},
    ["010030568"]={"H�o Hi�p y",	0,	100	,30568,},
    ["010231126"]={"H�o Hi�p Gi�i",	0,	102	,31126,},
    ["010231127"]={"H�o Hi�p B�i",	0,	102	,31127,},
    ["010130568"]={"H�o Hi�p Trang",	0,	101	,30568,},
}
tGiveBack = {
    { {2,2,7,16,4},   {2,2,8,40,4},   {2,1,1009,0,4} },
    { {2,2,7,16,4},   {2,2,8,80,4},   {2,1,1009,0,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,0,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,4,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,8,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,16,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,32,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,64,4} },
}
function _build_hash_string(ng,nd,np)
    return format("%d%d%d",ng,nd,np)
end

function _compose_item(szItem,nIdx,nStone)
    local nLv = GetEquipAttr(nIdx,2)
    if nLv > 7 then
        if gf_Judge_Room_Weight(3, 0) ~= 1 then
            Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
            return 0
        end
    end
    local nCash = GetCash()
    if nCash < 500000 then
        Talk(1,"","V�ng tr�n ng��i kh�ng �� 50")
        return
    end
    
    local szTitle = format("Mu�n ti�u hao <color=red>1 Thi�n Tinh Th�ch<color>, <color=red>%s<color>, <color=red>50 V�ng<color> ti�n h�nh dung h�p?",tItem_HaoXia[szItem][1])
    local tbSay = {}
    tinsert(tbSay,format("��ng/#_compose_item_confirm(\"%s\",%d,%d)",szItem,nIdx,nStone))
    tinsert(tbSay,"Sai/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function _compose_item_confirm(szItem,nIdx,nStone)
    local nLv = GetEquipAttr(nIdx,2)
    if nLv > 7 then
        local tItems = tGiveBack[nLv-7];
        gf_AddItemEx({tItems[1][1],tItems[1][2],tItems[1][3],tItems[1][4],tItems[1][5]},"M�nh Thi�n th�ch")
        gf_AddItemEx({tItems[2][1],tItems[2][2],tItems[2][3],tItems[2][4],tItems[2][5]},"Thi�n th�ch")
        gf_AddItemEx({tItems[3][1],tItems[3][2],tItems[3][3],tItems[3][4],tItems[3][5]},"Thi�n Th�ch Tinh Th�ch")
    end
    DelItemByIndex(nIdx,-1)
    DelItemByIndex(nStone,1)
    Pay(500000)
    tItems = tItem_HaoXia[szItem]
    gf_AddItemEx({tItems[2],tItems[3],tItems[4],1,4,-1,-1,-1,-1,-1,-1},tItems[1])
end
function _show_details()
    Talk(1,"","Khi ti�n h�nh dung h�p, n�u �� c��ng h�a c�a trang b� H�o Hi�p ��t +7 tr� l�n, s� t�y theo �� c��ng h�a �� t�ch v� ho�n tr� nguy�n li�u c��ng h�a, n�u �� c��ng h�a ��t d��i +7 th� kh�ng ho�n tr� nguy�n li�u c��ng h�a. Dung h�p th�nh c�ng s� t�o m�i 1 trang b� H�o Hi�p kh�a c� c�ng v� tr� v� th� h�nh.")
end
function OnUse(ItemIdx)
    local tHaoxia = {}
    local item_idx = -1;
    for i = 0, 5 do
        local item_idx = GetPlayerEquipIndex(i);
        local nG, nD, nP = GetItemInfoByIndex(item_idx);
        if nG ~= nil and nD ~= nil and nP ~= nil then
            local szItem = _build_hash_string(nG, nD, nP)
            if tItem_HaoXia[szItem]~=nil then
                tinsert(tHaoxia,{szItem,item_idx})
            end
        end
    end
    if getn(tHaoxia) == 0 then 
        Talk(1,"","Vui l�ng �eo trang b� H�o Hi�p.")
        return
    end
    local szTitle = "Thi�n Tinh Th�ch ch�a uy l�c th�n k�, c� th� k�t h�p c�ng trang b� H�o Hi�p h�nh th�nh 1 trang b� H�o Hi�p m�i."
    local tbSay = {}
    for i = 1, getn(tHaoxia) do
        local tItem = tItem_HaoXia[tHaoxia[i][1]]
        tinsert(tbSay,format("K�t h�p c�ng %s/#_compose_item(\"%s\",%d,%d)",tItem[1],tHaoxia[i][1],tHaoxia[i][2],ItemIdx))
    end
    tinsert(tbSay,"M� t� dung h�p/_show_details")
    tinsert(tbSay,"K�t th�c/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end
