--��һ��	���һ�
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")

function sf2017_talk2tree()
    if sf2017_indate(SF2017_DATE_ACT1) ~= 1 then 
        Talk(1,"",format("<color=green>%s<color>: M�t c�y ��o n� ��y hoa ��o th�m.",SF2017_TREES.szName))
        return 
    end
    local szTitle = format("<color=green>%s<color>: M�t c�y ��o n� ��y hoa ��o th�m.",SF2017_TREES.szName)
    local tbSay  = {}
    local nCnt   = get_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.taohua)
    tinsert(tbSay,format("H�i 1 Hoa ��o (%d/%d)/sf2017_on_caihua", nCnt, SF2017_TAOHUA_LIM))
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_on_caihua()
    if sf2017_indate(SF2017_DATE_ACT1) ~= 1 then return end
    local nTime = GetTime()
    local nLastTime = get_task("id_toahuaCD")
    if nTime < nLastTime + 6 then 
        Talk(1,"",format("<color=green>%s<color>: T�c �� thu th�p c�a b�n qu� nhanh, h�y quay l�i sau.",SF2017_TREES.szName))
        return
    end
    local nCnt   = get_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.taohua)
    if nCnt >= SF2017_TAOHUA_LIM then
        local nSex = GetSex()
        local szSex = "��i hi�p"
        if nSex == 2 then szSex = "N� hi�p " end
        Talk(1,"",format("<color=green>%s<color>: H�m nay b�n �� h�i r�t nhi�u Hoa ��o, kh�ng th� h�i ti�p. %s h�y quay l�i v�o ng�y mai.",SF2017_TREES.szName,szSex))
        return 
    end
    local bSuc = AddItemWithJudge(SF2017_FLOWER[1],SF2017_FLOWER[2],SF2017_FLOWER[3],SF2017_FLOWER[4],SF2017_FLOWER[5],SF2017_FLOWER[6])
    if bSuc == 1 then
        set_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.taohua,nCnt+1)
        set_task("id_toahuaCD",nTime)
    end
end

function NY2016_usetaohua( nIndex )
    if sf2017_use_taohua_award() == 1 then
        DelItemByIndex(nIndex,1)
    end
end