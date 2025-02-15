--一些事件处理函数
Include("\\script\\isolate\\online_activites\\every_month\\function.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\script\\lib\\string.lua")
Include("\\script\\isolate\\online_activites\\every_month\\award.lua")
Include("\\script\\isolate\\online_activites\\every_month\\item\\item_jingnangdashijian.lua")

function handle_on_prduct1_talk(nIndex)
    return _handle_on_prduct_talk(1, nIndex)
end

function handle_on_prduct2_talk(nIndex)
    return _handle_on_prduct_talk(2, nIndex)
end

function handle_on_prduct3_talk(nIndex)
    return _handle_on_prduct_talk(3, nIndex)
end

function _handle_on_prduct_talk(nType, nIndex)
    if isolate_in_date() ~= 1 then
        Talk(1, "", "Hi謓 t筰 kh玭g c� hi謚 l鵦")
        return 0
    end
    --M� r閚g event
    if ENABLE_EXTEND_EVENT == 1 then
        if nType == 1 or nType == 2 or nType == 3 then
            if GetTask(tCheckTask[nType][1]) >= 2000 and GetBit(GetTask(tCheckTask[nType][3]), tCheckTask[nType][2]) ~= 1 then
                Talk(1, "", "Чi hi謕 ch璦 nh薾 ph莕 thng cu鑙 n猲 kh玭g th� s� d鬾g ti誴 頲.")
                return 0
            end
        end
        if nType == 3 then
            if GetTask(tCheckTask[nType][1]) >= 2000 and (GetTask(tCheckTask[1][1]) < 4000 or GetTask(tCheckTask[2][1]) < 4000) then
                Talk(1, "", "Чi hi謕 ch璦 s� d鬾g K� Y誹 v� L璾 B髏  m鑓 4000 n猲 kh玭g th� s� d鬾g ti誴 頲.")
                return 0
            end
            if GetTask(tCheckTask[nType][1]) < 2000 and (GetTask(tCheckTask[1][1]) < 2000 or GetTask(tCheckTask[2][1]) < 2000) then
                Talk(1, "", "Чi hi謕 ch璦 s� d鬾g K� Y誹 v� L璾 B髏  m鑓 2000 n猲 kh玭g th� s� d鬾g 頲.")
                return 0
            end
        end
        --if _check_use_cnt(nType) == 1 then
        if GetTask(tCheckTask[nType][1]) >= 4000 then
            Talk(1, "", format("<color=yellow>%s<color>S� l莕 d飊g  t t鑙 產", GetItemName(nIndex)))
            return 0
        end
        --end
    end

    local p = tConfig.tProducts
    --	if nType == 3 and (_check_use_cnt(1)==0 or _check_use_cnt(2)==0) then
    --		Talk(1, "", format("<color=gold>%s:<color> <color=yellow>%s<color> v� <color=yellow>%s<color> t t鑙 產 m韎 頲 d飊g <color=yellow>%s<color>"
    --			, GetItemName(nIndex) , p[1][1], p[2][1], p[3][1]))
    --		return 0
    --	end
    --local t = tConfig.tProducts[nType][2]
    --local nItem = GetItemCount(t[1], t[2], t[3])
    --local nMax = min(nItem, 10)--一次最多使用10个
    --AskClientForNumber(format("_handle_on_use_prduct%d", nType), 1, nMax, "使用多少个")
    _handle_on_use_prduct(nType, 1)--一次使用1个
end
function _handle_on_use_prduct1(nNum)
    return _handle_on_use_prduct(1, nNum)
end
function _handle_on_use_prduct2(nNum)
    return _handle_on_use_prduct(2, nNum)
end
function _handle_on_use_prduct3(nNum)
    return _handle_on_use_prduct(3, nNum)
end
function _handle_on_use_prduct(nType, nNum)
    if nNum <= 0 then
        return
    end
    local nSuc = 0
    for i = 1, nNum do
        if _handle_on_use_prduct_once(nType) ~= 1 then
            break
        end
        nSuc = nSuc + 1
    end
    local t = tConfig.tProducts[nType]
    local nUseCount = get_product_use_count(nType)
    local nMaxUseCount = tStaticConfig.tProductsMaxUse[nType]
    if GetBit(GetTask(tCheckTask[nType][3]), tCheckTask[nType][2]) == 1 then
        nMaxUseCount = 4000
    end
    local szMsg = format("Х t輈h l騳 d飊g %d/%d c竔", nUseCount, nMaxUseCount)
    Msg2Player(format("D飊g th祅h c玭g %d/%d c竔 %s,%s", nSuc, nNum, t[1], szMsg))
    AddRuntimeStat(33, 2, nType, nSuc)
end
function _handle_on_use_prduct_once(nType)
    if isolate_in_date() ~= 1 then
        --Talk(1, "", "当前不在有效期")
        return 0
    end
    if _check_use_cnt(nType) == 1 then
        --Talk(1, "", "使用次数已达上限")
        return 0
    end
    local p = tConfig.tProducts
    --	if nType == 3 and (_check_use_cnt(1)==0 or _check_use_cnt(2)==0) then
    --Talk(1, "", format("<color=yellow>%s<color>和<color=yellow>%s<color>达到上限才能使用<color=yellow>%s<color>", p[1][1], p[2][1], p[3][1]))
    --		return 0
    --	end
    local nUseCount = get_product_use_count(nType) + 1
    local szAward = tStaticConfig.tProductPrize[nType][1]
    if nUseCount >= tStaticConfig.nExtAwardBegin and mod(nUseCount, tStaticConfig.tProductsExtAward[nType]) == 0 then
        --达到一定使用数量，使用第二个奖励组
        szAward = tStaticConfig.tProductPrize[nType][2]
    end
    if CustomAwardCheckCondition(szAward, 0, 1) ~= 1 then
        return 0
    end
    local tExtAward = nil
    if nUseCount < tStaticConfig.nExtAwardBegin then
        tExtAward = tStaticConfig.tExtraPrize[nType][nUseCount]
    end
    if tExtAward then
        if gf_Judge_Room_Weight(tExtAward[1], 100, "") ~= 1 then
            return 0
        end
    end
    local t = p[nType][2]
    if DelItem(t[1], t[2], t[3], 1) == 1 then
        local nSuc = 1
        if tExtAward then
            --额外给的奖励
            award_by_list(tExtAward[2], 1, 1, 0, 0)
        else
            if CustomAwardGiveGroup(szAward, 1) <= 0 then
                AddItem(t[1], t[2], t[3], 1)
                nSuc = 0
            end
        end
        if 1 == nSuc then
            local szTask = format("task_use_item%d_count", nType)
            add_task(szTask, 1)
            return 1
        end
    end
    return 0
end

function handle_add_material(tEvent, data, para)
    return add_material(unpack(tEvent[4]))
end
