--һЩ�¼�������
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
        Talk(1, "", "Hi�n t�i kh�ng c� hi�u l�c")
        return 0
    end
    --M� r�ng event
    if ENABLE_EXTEND_EVENT == 1 then
        if nType == 1 or nType == 2 or nType == 3 then
            if GetTask(tCheckTask[nType][1]) >= 2000 and GetBit(GetTask(tCheckTask[nType][3]), tCheckTask[nType][2]) ~= 1 then
                Talk(1, "", "��i hi�p ch�a nh�n ph�n th��ng cu�i n�n kh�ng th� s� d�ng ti�p ���c.")
                return 0
            end
        end
        if nType == 3 then
            if GetTask(tCheckTask[nType][1]) >= 2000 and (GetTask(tCheckTask[1][1]) < 4000 or GetTask(tCheckTask[2][1]) < 4000) then
                Talk(1, "", "��i hi�p ch�a s� d�ng K� Y�u v� L�u B�t �� m�c 4000 n�n kh�ng th� s� d�ng ti�p ���c.")
                return 0
            end
            if GetTask(tCheckTask[nType][1]) < 2000 and (GetTask(tCheckTask[1][1]) < 2000 or GetTask(tCheckTask[2][1]) < 2000) then
                Talk(1, "", "��i hi�p ch�a s� d�ng K� Y�u v� L�u B�t �� m�c 2000 n�n kh�ng th� s� d�ng ���c.")
                return 0
            end
        end
        --if _check_use_cnt(nType) == 1 then
        if GetTask(tCheckTask[nType][1]) >= 4000 then
            Talk(1, "", format("<color=yellow>%s<color>S� l�n d�ng �� ��t t�i �a", GetItemName(nIndex)))
            return 0
        end
        --end
    end

    local p = tConfig.tProducts
    --	if nType == 3 and (_check_use_cnt(1)==0 or _check_use_cnt(2)==0) then
    --		Talk(1, "", format("<color=gold>%s:<color> <color=yellow>%s<color> v� <color=yellow>%s<color> ��t t�i �a m�i ���c d�ng <color=yellow>%s<color>"
    --			, GetItemName(nIndex) , p[1][1], p[2][1], p[3][1]))
    --		return 0
    --	end
    --local t = tConfig.tProducts[nType][2]
    --local nItem = GetItemCount(t[1], t[2], t[3])
    --local nMax = min(nItem, 10)--һ�����ʹ��10��
    --AskClientForNumber(format("_handle_on_use_prduct%d", nType), 1, nMax, "ʹ�ö��ٸ�")
    _handle_on_use_prduct(nType, 1)--һ��ʹ��1��
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
    local szMsg = format("�� t�ch l�y d�ng %d/%d c�i", nUseCount, nMaxUseCount)
    Msg2Player(format("D�ng th�nh c�ng %d/%d c�i %s,%s", nSuc, nNum, t[1], szMsg))
    AddRuntimeStat(33, 2, nType, nSuc)
end
function _handle_on_use_prduct_once(nType)
    if isolate_in_date() ~= 1 then
        --Talk(1, "", "��ǰ������Ч��")
        return 0
    end
    if _check_use_cnt(nType) == 1 then
        --Talk(1, "", "ʹ�ô����Ѵ�����")
        return 0
    end
    local p = tConfig.tProducts
    --	if nType == 3 and (_check_use_cnt(1)==0 or _check_use_cnt(2)==0) then
    --Talk(1, "", format("<color=yellow>%s<color>��<color=yellow>%s<color>�ﵽ���޲���ʹ��<color=yellow>%s<color>", p[1][1], p[2][1], p[3][1]))
    --		return 0
    --	end
    local nUseCount = get_product_use_count(nType) + 1
    local szAward = tStaticConfig.tProductPrize[nType][1]
    if nUseCount >= tStaticConfig.nExtAwardBegin and mod(nUseCount, tStaticConfig.tProductsExtAward[nType]) == 0 then
        --�ﵽһ��ʹ��������ʹ�õڶ���������
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
            --������Ľ���
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
