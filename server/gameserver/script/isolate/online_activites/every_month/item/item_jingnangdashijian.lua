----------------------------------------------------------------------------------
tExchange = {
    gtNormalExchange:new(), --兑换1成功
    gtNormalExchange:new(), --兑换1失败
    gtNormalExchange:new(), --兑换2成功
    gtNormalExchange:new(), --兑换2失败
    gtNormalExchange:new(), --兑换3成功
    gtNormalExchange:new(), --兑换3失败
    --gtNormalExchange:new(), --兑换100道具Xu
}
_tMaterials = tConfig.tMaterials
_Products = tConfig.tProducts
tExchange[1].tConsume = {
    { _tMaterials[1][1], _tMaterials[1][2][1], _tMaterials[1][2][2], _tMaterials[1][2][3], 10 }, --10材料1
    { _tMaterials[2][1], _tMaterials[2][2][1], _tMaterials[2][2][2], _tMaterials[2][2][3], 10 }, --10材料2
    { " Ti猽 Dao Ng鋍", 2, 1, 30603, 5 },
}
tExchange[1].tAward = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1产品1
}
tExchange[2].tConsume = tExchange[1].tConsume
tExchange[2].tAward = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1产品2
}
tExchange[3].tConsume = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1产品1
    { _tMaterials[3][1], _tMaterials[3][2][1], _tMaterials[3][2][2], _tMaterials[3][2][3], 20 }, --20材料3
}
tExchange[3].tAward = {
    { _Products[3][1], _Products[3][2][1], _Products[3][2][2], _Products[3][2][3], 1 }, --1产品3
}
tExchange[4].tConsume = tExchange[3].tConsume
tExchange[4].tAward = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1产品1
}
tExchange[5].tConsume = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1产品2
    { _tMaterials[3][1], _tMaterials[3][2][1], _tMaterials[3][2][2], _tMaterials[3][2][3], 20 }, --20材料3
}
tExchange[5].tAward = {
    { _Products[3][1], _Products[3][2][1], _Products[3][2][2], _Products[3][2][3], 1 }, --1产品3
}
tExchange[6].tConsume = tExchange[5].tConsume
tExchange[6].tAward = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1产品2
}
--tExchange[7].tConsume = {
--	{"大银票", 2, 1, 199, 1},
--}
--tExchange[7].tAward = {
--	{"金币", 2, 1, 30230, 100},
--}
_tMaterials = nil
_Products = nil

--锦囊大事件
SZ_TITLE_HEAD = "HOAT DONG CHINH THANG 11 NAM 2015"
function handle_on_item_talk_jingnangdashijian(nIndex)
    local _, nStartDate, nEndDate = isolate_get_dates()

    local szTalk = format("%s th阨 gian m� %s - %s. . Th玭g tin chi ti誸 ho箃 ng ng o c� th� xem t筰 trang ch�.",
            isolate_view_name(), isolate_get_str_date(nStartDate), isolate_get_str_date(nEndDate))
    SZ_TITLE_HEAD = format("<color=gold>%s:<color>", GetItemName(nIndex))
    local szTitle = format("%s%s", SZ_TITLE_HEAD, szTalk)
    local tbSay = {}

    if isolate_in_date() == 1 then
        _add_exchange_talk(tbSay, 1)
        _add_exchange_talk(tbSay, 2)
        _add_exchange_talk(tbSay, 3)
        tinsert(tbSay, format("%s/#_final_award_talk(1)", format("Nh薾 ph莕 thng cu鑙 %s ", tConfig.tProducts[1][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(2)", format("Nh薾 ph莕 thng cu鑙 %s ", tConfig.tProducts[2][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(3)", format("Nh薾 ph莕 thng cu鑙 %s ", tConfig.tProducts[3][1])))
        if ENABLE_EXTEND_EVENT == 1 then
            tinsert(tbSay, format("%s/#_extra_final_award_talk(1)", format("Nh薾 ph莕 thng m� r閚g 4000 %s ", tConfig.tProducts[1][1])))
            tinsert(tbSay, format("%s/#_extra_final_award_talk(2)", format("Nh薾 ph莕 thng m� r閚g 4000 %s ", tConfig.tProducts[2][1])))
            tinsert(tbSay, format("%s/#_extra_final_award_talk(3)", format("Nh薾 ph莕 thng m� r閚g 4000 %s ", tConfig.tProducts[3][1])))
            tinsert(tbSay, format("%s/_all_extra_final_award_talk", "Nh薾 ph莕 thng m� r閚g s� d鬾g t鑙 產 4000 c竔 m鏸 lo筰"))
		end
    end

    tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _add_exchange_talk(tSay, nIndex)
    local szWordCont = " b籲g "
    if nIndex == 1 then
        szWordCont = " ho芻 "
    end
    local szWord = format("фi %s %s %s", tExchange[2 * nIndex - 1]:get_award_desc(), szWordCont, tExchange[2 * nIndex]:get_award_desc())
    tinsert(tSay, format("%s/#_exchange_talk(%d)", szWord, nIndex))
end
function _exchange_talk(nIndex, szWordCont, bConfirm)
    local szWordCont = " b籲g "
    if nIndex == 1 then
        szWordCont = " ho芻 "
    end
    if not bConfirm then
        local tbSay = {}
        local szTitle = format("фi %s %s %s", tExchange[2 * nIndex - 1]:get_award_desc(), szWordCont, tExchange[2 * nIndex]:get_award_desc())
        szTitle = format("%s%s,%s<color=yellow>%s<color>,%s", SZ_TITLE_HEAD, szTitle, "C莕 ti猽 hao", tExchange[2 * nIndex - 1]:get_consume_desc(), "x竎 nh薾 kh玭g?")
        tinsert(tbSay, format("%s/#_exchange_talk(%d,1,1)", "X竎 nh i", nIndex))
        --tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "返回", 0))
        tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

    local t = tExchange[2 * nIndex - 1]
    local nMax = t:get_max_exchange_cnt()
    if nMax > 0 then
        local szFunc = format("_exchange_confirm_%d", nIndex)
        AskClientForNumber(szFunc, 1, nMax, "фi bao nhi猽 l莕")
    else
        Talk(1, "", "H譶h nh� kh玭g  nguy猲 li謚")
    end
end
function _exchange_confirm(nIndex, nNum)
    gf_WriteLogEx("EventChinhThang12", "фi v藅 ph萴 event", nNum, "фi v藅 ph萴 event lo筰 " .. nIndex)
    local nSucCnt = 0
    for i = 1, nNum do
        local t = nil
        if random(100) <= 50 then
            --50%成功率
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
        Talk(1, "", "Х nh薾 ph莕 thng n祔 r錳")
        return
    end
    local nUseCount = get_product_use_count(nIndex)
    local nMaxUseCount = tStaticConfig.tProductsMaxUse[nIndex]
    local szTitle = format("%s hi謓 t筰 d飊g <color=yellow>%s<color> c� s� lng l� <color=yellow>[%d/%d]<color>", SZ_TITLE_HEAD, t[1], nUseCount, nMaxUseCount
    )
    local tbSay = {}
    if _check_use_cnt(nIndex, 1) == 1 then
        szTitle = format("%s,%s", szTitle, "C� th� ch鋘 1 ph莕 thng b猲 di")
        local tAward = tConfig.tFinalPrizeSel[nIndex]
        for i = 1, getn(tAward) do
            local szAward = tAward[i]
            tinsert(tbSay, format("%s/#_final_award(%d, %d)", get_award_name(szAward), nIndex, i))
        end
    else
        szTitle = format("%s,%s", szTitle, "T筸 th阨 kh玭g th� nh薾 ph莕 thng cu鑙")
    end
    --tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "返回", 0))
    tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
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
        local szTitle = format("%s s� nh薾 ph莕 thng[<color=yellow>%s<color><color=red>%s<color>], x竎 nh nh薾 kh玭g? ", SZ_TITLE_HEAD, get_award_desc(szAward), msg)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_final_award(%d, %d, 1)", "Nh薾 ", nIndex, nAward))
        tinsert(tbSay, format("%s/#_final_award_talk(%d)", "tr� l筰", nIndex))
        tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
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
            --vng的奖励领奖标志他们自己在函数里面去设置
            if r == 1 then
                set_task_bit(szTask, szTaskBit, 1)
                Talk(1, "", "Nh薾 ph莕 thng cu鑙 th祅h c玭g")
                AddRuntimeStat(33, 3, nIndex, 1)
                AddRuntimeStat(33, 4, nIndex * 10 + nAward, 1)
            else
                Talk(1, "", "Nh薾 ph莕 thng cu鑙 th蕋 b筰")
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
        Talk(1, "", format("<color=yellow>%s<color>S� l莕 d飊g ch璦  4000 c竔 n猲 kh玭g th� nh薾 thng", tCheckTask[nIndex][5]))
        return 0
    end
    if GetBit(GetTask(tCheckTask[nIndex][4]), tCheckTask[nIndex][2]) == 1 then
        Talk(1, "", format("<color=yellow>%s<color>Чi hi謕  nh薾 thng r錳 n猲 kh玭g th� nh薾 thng 頲 n鱝.", tCheckTask[nIndex][5]))
        return 0
    end
    local tbAward = {
        [1] = { item = {

            { gdp = { 2, 1, 31024, 1 }, name = "T骾 Ц Qu� C蕄 5" }, --, nExpired = 15*24*60*60},
            { gdp = { 2, 1, 30526, 8 }, name = "T葃 T﹎ Th筩h c蕄 6" },
        }, --{gdp={2, 1, 30344, 1}, name="Th莕 T礽 B秓 Rng"},
                nExp = 2000000000,
            --nGold = 50000000,
                nDanhvong = 5000,
                nSumon = 5000,
            --nChankhi = 20000,
        },
        [2] = { item = {

            { gdp = { 2, 1, 31024, 1 }, name = "T骾 Ц Qu� C蕄 5" }, --, nExpired = 15*24*60*60},
            { gdp = { 2, 1, 30532, 8 }, name = "Luy謓 L� Thi誸 c蕄 6" },
        }, --{gdp={2, 1, 30344, 1}, name="Th莕 T礽 B秓 Rng"},
                nExp = 2000000000,
                nDanhvong = 5000,
                nSumon = 5000,
            --nChankhi = 20000,
        },
        [3] = { item = {
            { gdp = { 2, 1, 31024, 2 }, name = "T骾 Ц Qu� C蕄 5" },
            { gdp = { 2, 1, 30730, 30 }, name = "Kinh M筩h уng Nh﹏" },
            { gdp = { 2, 1, 31239, 1 }, name = "Linh Ph竎h Кn" },
            { gdp = { 2, 1, 30731, 10 }, name = "Kinh M筩h Ng﹏ Nh﹏" },
            { gdp = { 2, 1, 9977, 5 }, name = "Qu﹏ C玭g Huy Ho祅g", nExpired = 30 * 24 * 60 * 60 },
        },
                nExp = 2000000000,
                nChankhi = 40000,
        },
    }
    SetTask(tCheckTask[nIndex][4], SetBit(GetTask(tCheckTask[nIndex][4]), tCheckTask[nIndex][2], 1));
    LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
    LIB_Award.szLogAction = "Nh薾 th祅h c玭g lo筰" .. nIndex
    LIB_Award:Award(tbAward[nIndex])
end

function _all_extra_final_award_talk()
    if gf_Judge_Room_Weight(13, 300, "") ~= 1 then
        Talk(1, "", "H祅h trang c馻 Чi hi謕 kh玭g  � tr鑞g, kh玭g th� nh薾 thng!")
        return 0
    end
    if GetBit(GetTask(TSK_EVENTCHINH_MORONG), 1) ~= 1 or GetBit(GetTask(TSK_EVENTCHINH_MORONG), 2) ~= 1 or GetBit(GetTask(TSK_EVENTCHINH_MORONG), 3) ~= 1 then
        Talk(1, "", "Чi hi謕 ch璦 nh薾 thng h誸 c竎 ph莕 thng m� r閚g event, n猲 kh玭g th� nh薾 thng 頲.")
        return 0
    end
    if GetBit(GetTask(TSK_EVENTCHINH_MORONG), 4) == 1 then
        Talk(1, "", "Чi hi謕  nh薾 ph莕 thng n祔 r錳, n猲 kh玭g th� nh薾 thng 頲.")
        return 0
    end
    local tbSay = {}
    tinsert(tbSay, "Ph莕 thng 1: T葃 T﹎ Th筩h 6*8 (Kh玭g kh鉧), Luy謓 L� Thi誸 6*8 (Kh玭g kh鉧), Чi мnh H錸 (7 ng祔)/_get_extra_final_award")
    tinsert(tbSay, "Ph莕 thng 2: Ph鬰 sinh nhanh ng h祅h l莕 2/_fast_finish_phucsinh_pet_lan2")
    tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
    Say("Nh薾 thng m� r閚g, vui l遪g ch鋘 m閠 trong c竎 ph莕 thng sau: ", getn(tbSay), tbSay)
end

function _get_extra_final_award()
    tbAward = {
        item = { { gdp = { 2, 1, 30526, 8 }, name = "T葃 T﹎ Th筩h c蕄 6" },
                 { gdp = { 2, 1, 30532, 8 }, name = "Luy謓 L� Thi誸 c蕄 6" },
                 { gdp = { 2, 1, 1113, 1 }, name = "Чi мnh H錸", nExpired = 7 * 24 * 60 * 60 },
            --	    {gdp={2, 1, 30344, 3}, name="Th莕 T礽 B秓 Rng"},
        }
    }
    LIB_Award:Award(tbAward)
    LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
    LIB_Award.szLogAction = "Nh薾 th祅h c玭g s� d鬾g 4000 m鏸 lo筰"
    SetTask(TSK_EVENTCHINH_MORONG, SetBit(GetTask(TSK_EVENTCHINH_MORONG), 4, 1))
end

function _fast_finish_phucsinh_pet_lan2()

    --local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
    --if nLan2_GetQuest >= 2 then
    --   return  Talk(1,"", "Чi hi謕  ho祅 th祅h chu鏸 nhi謒 v� Ph鬰 Sinh l莕 2 cho B筺 уng H祅h!")
    --elseif nLan2_GetQuest < 1 then
    --    Talk(1,"", "Чi hi謕 ch璦 nh薾 nhi謒 v� Ph鬰 Sinh l莕 2 cho B筺 уng H祅h !!!!")
    --    return 0
    --end
    local nPSLan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
    local nPSLan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1)/1000000000)
    if nPSLan1 < 1 then
        Talk(1,"", "H穣 ph鬰 sinh B筺 уng H祅h c馻 Чi hi謕 l莕 1 trc!")
        return 0
    end
    if nPSLan2 >= 1 then
        Talk(1,"", "B筺 ng h祅h c馻 Чi hi謕  ph鬰 sinh l莕 2 r錳,  qu� m筺h r錳!")
        return 0
    end

    if GetItemCount(2,1,30370) < 15 then
        Talk(1,"", "Чi hi謕 kh玭g mang  15 Thi猲 M玭 Kim L謓h!")
        return 0
    end
    if GetItemCount(2,95,204) < 15 then
        Talk(1,"", "Чi hi謕 kh玭g mang  15 Thi猲 Cang L謓h!")
        return 0
    end

    if DelItem(2,1,30370,15) == 1 and DelItem(2,95,204,15) == 1 then
        VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, 1, 10, 10)	 --t╪g bc nhi謒 v� l猲 gi� tr� 1 l�  ph鬰 sinh pet l莕 2 th祅h c玭g
        VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 2, 10, 10)	 --t╪g bc nhi謒 v� l猲 gi� tr� 2 l� ho祅 th祅h chu鏸 nhi謒 v�
        AddTitle(77, 1)	--title ph鬰 sinh b筺 ng h祅h l莕 2
        gf_WriteLogEx("PHUC SINH PET LAN 2", "Ho祅 th祅h nhanh PS Pet l莕 2", 1, "Ho祅 th祅h nhanh nv PS Pet l莕 2")
        Msg2Player("Чi hi謕 ho祅 th祅h nhanh nhi謒 v� Ph鬰 Sinh l莕 2 cho B筺 уng H祅h th祅h c玭g !!!!")
        Talk(1,"", "Ch骳 m鮪g, B筺 уng H祅h c馻 Чi hi謕  Ph鬰 Sinh l莕 2 th祅h c玭g!")

        LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
        LIB_Award.szLogAction = "Nh薾 th祅h c玭g s� d鬾g 4000 m鏸 lo筰"
        SetTask(TSK_EVENTCHINH_MORONG, SetBit(GetTask(TSK_EVENTCHINH_MORONG), 4, 1))
    end
end

