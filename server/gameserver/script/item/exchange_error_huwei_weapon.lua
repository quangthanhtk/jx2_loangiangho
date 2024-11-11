Import("\\script\\lib\\globalfunctions.lua")

local EquipTable = {
    ["010032192"] = {"T�ng-Uy H� T��ng Qu�n Y" ,0,100,32192,},
    ["010032214"] = {"T�ng-Uy H� Nguy�n So�i Y" ,0,100,32214,},
    ["010032236"] = {"Li�u-Uy H� T��ng Qu�n Y" ,0,100,32236,},
    ["010032258"] = {"Li�u-Uy H� Nguy�n So�i Y" ,0,100,32258,},
    ["010231563"] = {"T�ng-Uy H� T��ng Qu�n L�nh B�i" ,0,102,31563,},
    ["010231585"] = {"T�ng-Uy H� T��ng Qu�n L�nh K�" ,0,102,31585,},
    ["010231607"] = {"T�ng-Uy H� T��ng Qu�n L�nh Ph�" ,0,102,31607,},
    ["010231629"] = {"T�ng-Uy H� Nguy�n So�i Hi�u Ph�" ,0,102,31629,},
    ["010231651"] = {"T�ng-Uy H� Nguy�n So�i H� Ph�" ,0,102,31651,},
    ["010231673"] = {"T�ng-Uy H� Nguy�n So�i L�nh K�" ,0,102,31673,},
    ["010231695"] = {"T�ng-Uy H� Nguy�n So�i L�nh B�i" ,0,102,31695,},
    ["010231717"] = {"Li�u-Uy H� T��ng Qu�n L�nh B�i" ,0,102,31717,},
    ["010231739"] = {"Li�u-Uy H� T��ng Qu�n L�nh K�" ,0,102,31739,},
    ["010231761"] = {"Li�u-Uy H� T��ng Qu�n L�nh Ph�" ,0,102,31761,},
    ["010231783"] = {"Li�u-Uy H� Nguy�n So�i Hi�u Ph�" ,0,102,31783,},
    ["010231805"] = {"Li�u-Uy H� Nguy�n So�i H� Ph�" ,0,102,31805,},
    ["010231827"] = {"Li�u-Uy H� Nguy�n So�i L�nh K�" ,0,102,31827,},
    ["010231849"] = {"Li�u-Uy H� Nguy�n So�i L�nh B�i" ,0,102,31849,},
    ["010132192"] = {"T�ng-Uy H� T��ng Qu�n Trang" ,0,101,32192,},
    ["010132214"] = {"T�ng-Uy H� Nguy�n So�i Trang" ,0,101,32214,},
    ["010132236"] = {"Li�u-Uy H� T��ng Qu�n Trang" ,0,101,32236,},
    ["010132258"] = {"Li�u-Uy H� Nguy�n So�i Trang" ,0,101,32258,},
    ["0232240"] =   {"T�ng-Uy H� T��ng Qu�n Ki�m (S�)" ,0,2,32240,},
    ["0232262"] =   {"T�ng-Uy H� T��ng Qu�n Ki�m (Trung)" ,0,2,32262,},
    ["0232284"] =   {"T�ng-Uy H� T��ng Qu�n Ki�m (Cao)" ,0,2,32284,},
    ["0232306"] =   {"T�ng-Uy H� Nguy�n So�i Ki�m (S�)" ,0,2,32306,},
    ["0232328"] =   {"T�ng-Uy H� Nguy�n So�i Ki�m (Trung)" ,0,2,32328,},
    ["0232350"] =   {"T�ng-Uy H� Nguy�n So�i Ki�m (Cao)" ,0,2,32350,},
    ["0232372"] =   {"Li�u-Uy H� T��ng Qu�n Ki�m (S�)" ,0,2,32372,},
    ["0232394"] =   {"Li�u-Uy H� T��ng Qu�n Ki�m (Trung)" ,0,2,32394,},
    ["0232416"] =   {"Li�u-Uy H� T��ng Qu�n Ki�m (Cao)" ,0,2,32416,},
    ["0232438"] =   {"Li�u-Uy H� Nguy�n So�i Ki�m (S�)" ,0,2,32438,},
    ["0232460"] =   {"Li�u-Uy H� Nguy�n So�i Ki�m (Trung)" ,0,2,32460,},
    ["0232482"] =   {"Li�u-Uy H� Nguy�n So�i Ki�m (Cao)" ,0,2,32482,},
    ["010332192"] = {"T�ng-Uy H� T��ng Qu�n Kh�i" ,0,103,32192,},
    ["010332214"] = {"T�ng-Uy H� Nguy�n So�i Kh�i" ,0,103,32214,},
    ["010332236"] = {"Li�u-Uy H� T��ng Qu�n Kh�i" ,0,103,32236,},
    ["010332258"] = {"Li�u-Uy H� Nguy�n So�i Kh�i" ,0,103,32258,},
}


TIME_LINE = 20190311 
-- player can exchange equipment which they got before this date (include this day)
function main()
    main_exchange()
end
function main_exchange()
    if GetPlayerRoute() ~= 32 then
        Talk(1,"","Ch� �� t� C�n L�n Ki�m T�n ���c ��n ��y ��i v�t ph�m.")
        return
    end
    local szTitle = format("Trang B� Uy H� c�a �� t� C�n L�n g�p ch�t tr�c tr�c v� thu�c t�nh, nay c� th� ��n ch� ta, d�ng trang b� tr��c �� ��i th�nh trang b� m�i nh�t. <color=yellow>Trang b� sau khi ��i s� c�ng ch�ng lo�i v�i trang b� tr��c ��, gi� nguy�n m�c c��ng h�a v� B�o Th�ch �� kh�m<color>")
    local tbSay = {}
    tinsert(tbSay, "��i Trang B� Uy H� M�i Nh�t/echange_error_equip")
    tinsert(tbSay, "H�y b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function echange_error_equip()
    local flag = 0
    for i = 0, 10 do
        local nItemIndex = GetPlayerEquipIndex(i);
        local nG = GetItemGenre(nItemIndex);
        local nD = GetItemDetail(nItemIndex);
        local nP = GetItemParticular(nItemIndex);
        local szIndex = tostring(nG)..tostring(nD)..tostring(nP)
        local tEquip = %EquipTable[szIndex]
        if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
            Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
            return 0;
        end
        if tEquip ~= nil then
            -- ��Ҫ�һ�
            ExchangeEquip(nItemIndex, tEquip)
            flag = flag + 1
        end
    end
    if flag == 0 then
        Talk(1,"","Ch�a t�m th�y trang b� ph� h�p �i�u ki�n, h�y m�c Trang B� Uy H� c�n ��i l�n ng��i.")
        return
    end
    
end

function ExchangeEquip(nItemIndex, tEquip)
    local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
    local tGenInfo = GetItemGemInfo(nItemIndex)
    if DelItemByIndex(nItemIndex, -1) == 1 then
        -- ��ԭװ��������ǿ���Ⱥͱ�ʯ
        local _,newItemIdx = AddItem(tEquip[2],tEquip[3],tEquip[4],1,4,-1,-1,-1,-1,-1,-1,-1,nEnhance)
        for k,v in tGenInfo do
            SetItemGemInfo(newItemIdx, k, v)
        end
    end
end