-- �������콵�鸣
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")


function sf2017_on_getclothes()
    if gf_Judge_Room_Weight(getn(SF2017_CLOTHES), 0) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return
    end
    local nBody = GetBody()
    for i = 1, getn(SF2017_CLOTHES) do
        local tItem = SF2017_CLOTHES[i]
        local _,nIdx = AddItemWithJudge(tItem[nBody][1],tItem[nBody][2],tItem[nBody][3],tItem[nBody][4],4,tItem[nBody][5])
        SetItemExpireTime(nIdx, 7*24*3600)
    end
    set_task_byte("id_byte",SF2017_BYTE_TSK.get_clothes,1)
end

function sf2017_excclothes()
    if sf2017_indate(SF2017_DATE_ACT3) ~= 1 then return end
    local bExcClothes1 = get_task_byte("id_byte",SF2017_BYTE_TSK.exc_clothes1)
    local bExcClothes2 = get_task_byte("id_byte",SF2017_BYTE_TSK.exc_clothes2)
    local bExcClothes3 = get_task_byte("id_byte",SF2017_BYTE_TSK.exc_clothes3)
    local szTitle = format("<color=green>%s<color>: Ch�c m�ng xu�n m�i.",SF2017_HDDS.szName)
    if bExcClothes1 == 1 and bExcClothes2 == 1 and bExcClothes3 == 1 then
        Talk(1,"",format("<color=green>%s<color>: B�n �� ��i h�t 3 m�n ngo�i trang r�i.",SF2017_HDDS.szName))
        return 
    end
    local tbSay  = {}
    if bExcClothes1 == 0 then tinsert(tbSay,"��i X�ch Vi�n L�ng H�c Quan/#sf2017_on_excclothes(1)") end
    if bExcClothes2 == 0 then tinsert(tbSay,"��i X�ch Vi�n L�ng H�c y/#sf2017_on_excclothes(2)") end
    if bExcClothes3 == 0 then tinsert(tbSay,"��i X�ch Vi�n L�ng H�c Trang/#sf2017_on_excclothes(3)") end
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end


function sf2017_on_excclothes(nType)
    local nBody = GetBody()
    local n1 = GetItemCount(SF2017_CLOTHES[1][nBody][1],SF2017_CLOTHES[1][nBody][2],SF2017_CLOTHES[1][nBody][3])
    local n2 = GetItemCount(SF2017_CLOTHES[2][nBody][1],SF2017_CLOTHES[2][nBody][2],SF2017_CLOTHES[2][nBody][3])
    local n3 = GetItemCount(SF2017_CLOTHES[3][nBody][1],SF2017_CLOTHES[3][nBody][2],SF2017_CLOTHES[3][nBody][3])

    if nType == 1 and n1 < 1 then Talk(1,"",format("<color=green>%s<color>: H�y ��t X�ch Vi�n L�ng H�c Quan c� th�i h�n v�o t�i.",SF2017_HDDS.szName)) return end
    if nType == 2 and n2 < 1 then Talk(1,"",format("<color=green>%s<color>: H�y ��t X�ch Vi�n L�ng H�c y c� th�i h�n v�o t�i.",SF2017_HDDS.szName)) return end
    if nType == 3 and n3 < 1 then Talk(1,"",format("<color=green>%s<color>: H�y ��t X�ch Vi�n L�ng H�c Trang c� th�i h�n v�o t�i.",SF2017_HDDS.szName)) return end

    local nTJL = GetItemCount(SF2017_TJL[1],SF2017_TJL[2],SF2017_TJL[3])
    if nTJL < 40 then
        Talk(1,"","Thi�n Ki�u L�nh kh�ng ��.")
        return
    end
    local nCash = GetCash()
    if nCash < 5000000 then
        Talk(1,"",format("<color=green>%s<color>: Ti�n tr�n ng��i kh�ng ��.",SF2017_HDDS.szName))
        return
    end
    if nType == 1 then if DelItem(SF2017_CLOTHES[1][nBody][1],SF2017_CLOTHES[1][nBody][2],SF2017_CLOTHES[1][nBody][3],1) ~= 1 then return end end
    if nType == 2 then if DelItem(SF2017_CLOTHES[2][nBody][1],SF2017_CLOTHES[2][nBody][2],SF2017_CLOTHES[2][nBody][3],1) ~= 1 then return end end
    if nType == 3 then if DelItem(SF2017_CLOTHES[3][nBody][1],SF2017_CLOTHES[3][nBody][2],SF2017_CLOTHES[3][nBody][3],1) ~= 1 then return end end
    if DelItem(SF2017_TJL[1],SF2017_TJL[2],SF2017_TJL[3],40) ~= 1 then return end
    Pay(5000000)
    local tItem = {}
    if nType == 1 then set_task_byte("id_byte",SF2017_BYTE_TSK.exc_clothes1,1); tItem = SF2017_CLOTHES[1] end
    if nType == 2 then set_task_byte("id_byte",SF2017_BYTE_TSK.exc_clothes2,1); tItem = SF2017_CLOTHES[2] end
    if nType == 3 then set_task_byte("id_byte",SF2017_BYTE_TSK.exc_clothes3,1); tItem = SF2017_CLOTHES[3] end
    AddItemWithJudge(tItem[nBody][1],tItem[nBody][2],tItem[nBody][3],tItem[nBody][4],5,tItem[nBody][5])
end
