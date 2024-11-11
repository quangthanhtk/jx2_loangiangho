----------------------------------------------------------------------------------
tExchange = {
    gtNormalExchange:new(), --�һ�1�ɹ�
    gtNormalExchange:new(), --�һ�1ʧ��
    gtNormalExchange:new(), --�һ�2�ɹ�
    gtNormalExchange:new(), --�һ�2ʧ��
    gtNormalExchange:new(), --�һ�3�ɹ�
    gtNormalExchange:new(), --�һ�3ʧ��
    --gtNormalExchange:new(), --�һ�100����Xu
}
_tMaterials = tConfig.tMaterials
_Products = tConfig.tProducts
tExchange[1].tConsume = {
    { _tMaterials[1][1], _tMaterials[1][2][1], _tMaterials[1][2][2], _tMaterials[1][2][3], 10 }, --10����1
    { _tMaterials[2][1], _tMaterials[2][2][1], _tMaterials[2][2][2], _tMaterials[2][2][3], 10 }, --10����2
    { " Ti�u Dao Ng�c", 2, 1, 30603, 5 },
}
tExchange[1].tAward = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1��Ʒ1
}
tExchange[2].tConsume = tExchange[1].tConsume
tExchange[2].tAward = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1��Ʒ2
}
tExchange[3].tConsume = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1��Ʒ1
    { _tMaterials[3][1], _tMaterials[3][2][1], _tMaterials[3][2][2], _tMaterials[3][2][3], 20 }, --20����3
}
tExchange[3].tAward = {
    { _Products[3][1], _Products[3][2][1], _Products[3][2][2], _Products[3][2][3], 1 }, --1��Ʒ3
}
tExchange[4].tConsume = tExchange[3].tConsume
tExchange[4].tAward = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1��Ʒ1
}
tExchange[5].tConsume = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1��Ʒ2
    { _tMaterials[3][1], _tMaterials[3][2][1], _tMaterials[3][2][2], _tMaterials[3][2][3], 20 }, --20����3
}
tExchange[5].tAward = {
    { _Products[3][1], _Products[3][2][1], _Products[3][2][2], _Products[3][2][3], 1 }, --1��Ʒ3
}
tExchange[6].tConsume = tExchange[5].tConsume
tExchange[6].tAward = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1��Ʒ2
}
--tExchange[7].tConsume = {
--	{"����Ʊ", 2, 1, 199, 1},
--}
--tExchange[7].tAward = {
--	{"���", 2, 1, 30230, 100},
--}
_tMaterials = nil
_Products = nil

--���Ҵ��¼�
SZ_TITLE_HEAD = "HOAT DONG CHINH THANG 11 NAM 2015"
function handle_on_item_talk_jingnangdashijian(nIndex)
    local _, nStartDate, nEndDate = isolate_get_dates()

    local szTalk = format("%s th�i gian m� %s - %s. . Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�.",
            isolate_view_name(), isolate_get_str_date(nStartDate), isolate_get_str_date(nEndDate))
    SZ_TITLE_HEAD = format("<color=gold>%s:<color>", GetItemName(nIndex))
    local szTitle = format("%s%s", SZ_TITLE_HEAD, szTalk)
    local tbSay = {}

    if isolate_in_date() == 1 then
        _add_exchange_talk(tbSay, 1)
        _add_exchange_talk(tbSay, 2)
        _add_exchange_talk(tbSay, 3)
        tinsert(tbSay, format("%s/#_final_award_talk(1)", format("Nh�n ph�n th��ng cu�i %s ", tConfig.tProducts[1][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(2)", format("Nh�n ph�n th��ng cu�i %s ", tConfig.tProducts[2][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(3)", format("Nh�n ph�n th��ng cu�i %s ", tConfig.tProducts[3][1])))
        if ENABLE_EXTEND_EVENT == 1 then
            tinsert(tbSay, format("%s/#_extra_final_award_talk(1)", format("Nh�n ph�n th��ng m� r�ng 4000 %s ", tConfig.tProducts[1][1])))
            tinsert(tbSay, format("%s/#_extra_final_award_talk(2)", format("Nh�n ph�n th��ng m� r�ng 4000 %s ", tConfig.tProducts[2][1])))
            tinsert(tbSay, format("%s/#_extra_final_award_talk(3)", format("Nh�n ph�n th��ng m� r�ng 4000 %s ", tConfig.tProducts[3][1])))
            tinsert(tbSay, format("%s/_all_extra_final_award_talk", "Nh�n ph�n th��ng m� r�ng s� d�ng t�i �a 4000 c�i m�i lo�i"))
		end
    end

    tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _add_exchange_talk(tSay, nIndex)
    local szWordCont = " b�ng "
    if nIndex == 1 then
        szWordCont = " ho�c "
    end
    local szWord = format("��i %s %s %s", tExchange[2 * nIndex - 1]:get_award_desc(), szWordCont, tExchange[2 * nIndex]:get_award_desc())
    tinsert(tSay, format("%s/#_exchange_talk(%d)", szWord, nIndex))
end
function _exchange_talk(nIndex, szWordCont, bConfirm)
    local szWordCont = " b�ng "
    if nIndex == 1 then
        szWordCont = " ho�c "
    end
    if not bConfirm then
        local tbSay = {}
        local szTitle = format("��i %s %s %s", tExchange[2 * nIndex - 1]:get_award_desc(), szWordCont, tExchange[2 * nIndex]:get_award_desc())
        szTitle = format("%s%s,%s<color=yellow>%s<color>,%s", SZ_TITLE_HEAD, szTitle, "C�n ti�u hao", tExchange[2 * nIndex - 1]:get_consume_desc(), "x�c nh�n kh�ng?")
        tinsert(tbSay, format("%s/#_exchange_talk(%d,1,1)", "X�c ��nh ��i", nIndex))
        --tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "����", 0))
        tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

    local t = tExchange[2 * nIndex - 1]
    local nMax = t:get_max_exchange_cnt()
    if nMax > 0 then
        local szFunc = format("_exchange_confirm_%d", nIndex)
        AskClientForNumber(szFunc, 1, nMax, "��i bao nhi�u l�n")
    else
        Talk(1, "", "H�nh nh� kh�ng �� nguy�n li�u")
    end
end
function _exchange_confirm(nIndex, nNum)
    gf_WriteLogEx("EventChinhThang12", "��i v�t ph�m event", nNum, "��i v�t ph�m event lo�i " .. nIndex)
    local nSucCnt = 0
    for i = 1, nNum do
        local t = nil
        if random(100) <= 50 then
            --50%�ɹ���
            t = tExchange[2 * nIndex - 1]
        else
            t = tExchange[2 * nIndex]
        end
        if 1 ~= t:do_exchange(1, 1) then
            break
        end
        nSucCnt = nSucCnt + 1
    end

    if nSucCnt > 0 then
        AddRuntimeStat(33, 1, nIndex, nSucCnt)
    end
end
function _exchange_confirm_1(nNum)
    return _exchange_confirm(1, nNum)
end
function _exchange_confirm_2(nNum)
    return _exchange_confirm(2, nNum)
end
function _exchange_confirm_3(nNum)
    return _exchange_confirm(3, nNum)
end

function _final_award_talk(nIndex)
    if nIndex == 3 then
        if gf_Judge_Room_Weight(10, 100, "") ~= 1 then
            return 0
        end
    end
    local t = tConfig.tProducts[nIndex]
    if get_task_bit("task_get_final_award", format("bit_award%d", nIndex)) == 1 then
        Talk(1, "", "�� nh�n ph�n th��ng n�y r�i")
        return
    end
    local nUseCount = get_product_use_count(nIndex)
    local nMaxUseCount = tStaticConfig.tProductsMaxUse[nIndex]
    local szTitle = format("%s hi�n t�i d�ng <color=yellow>%s<color> c� s� l��ng l� <color=yellow>[%d/%d]<color>", SZ_TITLE_HEAD, t[1], nUseCount, nMaxUseCount
    )
    local tbSay = {}
    if _check_use_cnt(nIndex, 1) == 1 then
        szTitle = format("%s,%s", szTitle, "C� th� ch�n 1 ph�n th��ng b�n d��i")
        local tAward = tConfig.tFinalPrizeSel[nIndex]
        for i = 1, getn(tAward) do
            local szAward = tAward[i]
            tinsert(tbSay, format("%s/#_final_award(%d, %d)", get_award_name(szAward), nIndex, i))
        end
    else
        szTitle = format("%s,%s", szTitle, "T�m th�i kh�ng th� nh�n ph�n th��ng cu�i")
    end
    --tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "����", 0))
    tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
    Say(szTitle, getn(tbSay), tbSay)
    return
end

function _final_award(nIndex, nAward, bConfirm)
    if get_task_bit("task_get_final_award", format("bit_award%d", nIndex)) == 1 then
        return
    end
    local tAward = tConfig.tFinalPrizeSel[nIndex]
    local szAward = tAward[nAward]
    local r, msg = check_get_award(szAward, 0)
    if not bConfirm then
        local szTitle = format("%s s� nh�n ph�n th��ng[<color=yellow>%s<color><color=red>%s<color>], x�c ��nh nh�n kh�ng? ", SZ_TITLE_HEAD, get_award_desc(szAward), msg)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_final_award(%d, %d, 1)", "Nh�n ", nIndex, nAward))
        tinsert(tbSay, format("%s/#_final_award_talk(%d)", "tr� l�i", nIndex))
        tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end
    if _check_use_cnt(nIndex, 1) == 1 then
        local szTask, szTaskBit = "task_get_final_award", format("bit_award%d", nIndex)
        local nTask = get_task_id(szTask)
        local nTaskBit = get_task_sub_id(szTask, szTaskBit)
        local r = get_award(szAward, nTask, nTaskBit)
        local is_vng_award = check_is_vng_award(szAward)
        if is_vng_award == 0 then
            --vng�Ľ����콱��־�����Լ��ں�������ȥ����
            if r == 1 then
                set_task_bit(szTask, szTaskBit, 1)
                Talk(1, "", "Nh�n ph�n th��ng cu�i th�nh c�ng")
                AddRuntimeStat(33, 3, nIndex, 1)
                AddRuntimeStat(33, 4, nIndex * 10 + nAward, 1)
            else
                Talk(1, "", "Nh�n ph�n th��ng cu�i th�t b�i")
            end
        end

    end
end
function _check_use_cnt(nIndex, bRelate)
    local nUseCount = get_product_use_count(nIndex)
    local nMaxUseCount = tStaticConfig.tProductsMaxUse[nIndex]
    --if GetBit(GetTask(2765),1) == 1 and GetBit(GetTask(2765),2) == 1 and GetBit(GetTask(2765),3) == 1 then
    --	nMaxUseCount = 4000
    --end
	if ENABLE_EXTEND_EVENT == 1 then
		if GetBit(GetTask(tCheckTask[nIndex][3]), tCheckTask[nIndex][2]) == 1 then
			nMaxUseCount = 4000
		end
	end
    if nUseCount < nMaxUseCount then
        return 0
    end
    if bRelate and bRelate == 1 and nIndex == 3 and (GetBit(GetTask(2765), 1) ~= 1 or GetBit(GetTask(2765), 2) ~= 1) then
        --	if bRelate and bRelate == 1 and nIndex == 3 and (_check_use_cnt(1)~=1 or _check_use_cnt(2)~=1) then
        return 0
    end
    return 1
end

function _extra_final_award_talk(nIndex)
    if gf_Judge_Room_Weight(13, 300, "") ~= 1 then
        return 0
    end
    if GetTask(tCheckTask[nIndex][1]) < 4000 then
        Talk(1, "", format("<color=yellow>%s<color>S� l�n d�ng ch�a �� 4000 c�i n�n kh�ng th� nh�n th��ng", tCheckTask[nIndex][5]))
        return 0
    end
    if GetBit(GetTask(tCheckTask[nIndex][4]), tCheckTask[nIndex][2]) == 1 then
        Talk(1, "", format("<color=yellow>%s<color>��i hi�p �� nh�n th��ng r�i n�n kh�ng th� nh�n th��ng ���c n�a.", tCheckTask[nIndex][5]))
        return 0
    end
    local tbAward = {
        [1] = { item = {

            { gdp = { 2, 1, 31024, 1 }, name = "T�i �� Qu� C�p 5" }, --, nExpired = 15*24*60*60},
            { gdp = { 2, 1, 30526, 8 }, name = "T�y T�m Th�ch c�p 6" },
        }, --{gdp={2, 1, 30344, 1}, name="Th�n T�i B�o R��ng"},
                nExp = 2000000000,
            --nGold = 50000000,
                nDanhvong = 5000,
                nSumon = 5000,
            --nChankhi = 20000,
        },
        [2] = { item = {

            { gdp = { 2, 1, 31024, 1 }, name = "T�i �� Qu� C�p 5" }, --, nExpired = 15*24*60*60},
            { gdp = { 2, 1, 30532, 8 }, name = "Luy�n L� Thi�t c�p 6" },
        }, --{gdp={2, 1, 30344, 1}, name="Th�n T�i B�o R��ng"},
                nExp = 2000000000,
                nDanhvong = 5000,
                nSumon = 5000,
            --nChankhi = 20000,
        },
        [3] = { item = {
            { gdp = { 2, 1, 31024, 2 }, name = "T�i �� Qu� C�p 5" },
            { gdp = { 2, 1, 30730, 30 }, name = "Kinh M�ch ��ng Nh�n" },
            { gdp = { 2, 1, 31239, 1 }, name = "Linh Ph�ch ��n" },
            { gdp = { 2, 1, 30731, 10 }, name = "Kinh M�ch Ng�n Nh�n" },
            { gdp = { 2, 1, 9977, 5 }, name = "Qu�n C�ng Huy Ho�ng", nExpired = 30 * 24 * 60 * 60 },
        },
                nExp = 2000000000,
                nChankhi = 40000,
        },
    }
    SetTask(tCheckTask[nIndex][4], SetBit(GetTask(tCheckTask[nIndex][4]), tCheckTask[nIndex][2], 1));
    LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
    LIB_Award.szLogAction = "Nh�n th�nh c�ng lo�i" .. nIndex
    LIB_Award:Award(tbAward[nIndex])
end

function _all_extra_final_award_talk()
    if gf_Judge_Room_Weight(13, 300, "") ~= 1 then
        Talk(1, "", "H�nh trang c�a ��i hi�p kh�ng �� � tr�ng, kh�ng th� nh�n th��ng!")
        return 0
    end
    if GetBit(GetTask(TSK_EVENTCHINH_MORONG), 1) ~= 1 or GetBit(GetTask(TSK_EVENTCHINH_MORONG), 2) ~= 1 or GetBit(GetTask(TSK_EVENTCHINH_MORONG), 3) ~= 1 then
        Talk(1, "", "��i hi�p ch�a nh�n th��ng h�t c�c ph�n th��ng m� r�ng event, n�n kh�ng th� nh�n th��ng ���c.")
        return 0
    end
    if GetBit(GetTask(TSK_EVENTCHINH_MORONG), 4) == 1 then
        Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i, n�n kh�ng th� nh�n th��ng ���c.")
        return 0
    end
    local tbSay = {}
    tinsert(tbSay, "Ph�n th��ng 1: T�y T�m Th�ch 6*8 (Kh�ng kh�a), Luy�n L� Thi�t 6*8 (Kh�ng kh�a), ��i ��nh H�n (7 ng�y)/_get_extra_final_award")
    tinsert(tbSay, "Ph�n th��ng 2: Ph�c sinh nhanh ��ng h�nh l�n 2/_fast_finish_phucsinh_pet_lan2")
    tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
    Say("Nh�n th��ng m� r�ng, vui l�ng ch�n m�t trong c�c ph�n th��ng sau: ", getn(tbSay), tbSay)
end

function _get_extra_final_award()
    tbAward = {
        item = { { gdp = { 2, 1, 30526, 8 }, name = "T�y T�m Th�ch c�p 6" },
                 { gdp = { 2, 1, 30532, 8 }, name = "Luy�n L� Thi�t c�p 6" },
                 { gdp = { 2, 1, 1113, 1 }, name = "��i ��nh H�n", nExpired = 7 * 24 * 60 * 60 },
            --	    {gdp={2, 1, 30344, 3}, name="Th�n T�i B�o R��ng"},
        }
    }
    LIB_Award:Award(tbAward)
    LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
    LIB_Award.szLogAction = "Nh�n th�nh c�ng s� d�ng 4000 m�i lo�i"
    SetTask(TSK_EVENTCHINH_MORONG, SetBit(GetTask(TSK_EVENTCHINH_MORONG), 4, 1))
end

function _fast_finish_phucsinh_pet_lan2()

    --local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
    --if nLan2_GetQuest >= 2 then
    --   return  Talk(1,"", "��i hi�p �� ho�n th�nh chu�i nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh!")
    --elseif nLan2_GetQuest < 1 then
    --    Talk(1,"", "��i hi�p ch�a nh�n nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
    --    return 0
    --end
    local nPSLan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
    local nPSLan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1)/1000000000)
    if nPSLan1 < 1 then
        Talk(1,"", "H�y ph�c sinh B�n ��ng H�nh c�a ��i hi�p l�n 1 tr��c!")
        return 0
    end
    if nPSLan2 >= 1 then
        Talk(1,"", "B�n ��ng h�nh c�a ��i hi�p �� ph�c sinh l�n 2 r�i, �� qu� m�nh r�i!")
        return 0
    end

    if GetItemCount(2,1,30370) < 15 then
        Talk(1,"", "��i hi�p kh�ng mang �� 15 Thi�n M�n Kim L�nh!")
        return 0
    end
    if GetItemCount(2,95,204) < 15 then
        Talk(1,"", "��i hi�p kh�ng mang �� 15 Thi�n Cang L�nh!")
        return 0
    end

    if DelItem(2,1,30370,15) == 1 and DelItem(2,95,204,15) == 1 then
        VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, 1, 10, 10)	 --t�ng b��c nhi�m v� l�n gi� tr� 1 l� �� ph�c sinh pet l�n 2 th�nh c�ng
        VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 2, 10, 10)	 --t�ng b��c nhi�m v� l�n gi� tr� 2 l� ho�n th�nh chu�i nhi�m v�
        AddTitle(77, 1)	--title ph�c sinh b�n ��ng h�nh l�n 2
        gf_WriteLogEx("PHUC SINH PET LAN 2", "Ho�n th�nh nhanh PS Pet l�n 2", 1, "Ho�n th�nh nhanh nv PS Pet l�n 2")
        Msg2Player("��i hi�p ho�n th�nh nhanh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh th�nh c�ng !!!!")
        Talk(1,"", "Ch�c m�ng, B�n ��ng H�nh c�a ��i hi�p �� Ph�c Sinh l�n 2 th�nh c�ng!")

        LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
        LIB_Award.szLogAction = "Nh�n th�nh c�ng s� d�ng 4000 m�i lo�i"
        SetTask(TSK_EVENTCHINH_MORONG, SetBit(GetTask(TSK_EVENTCHINH_MORONG), 4, 1))
    end
end

