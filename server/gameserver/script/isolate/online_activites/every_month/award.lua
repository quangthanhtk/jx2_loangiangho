--�����������

Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Include("\\script\\isolate\\online_activites\\base\\activity_award_base.lua")

T_FinalAward = {
    room_weight = { 6, 100 },
    --name, room,content,award
    ["exp2g"] = { "Kinh nghi�m", 1, {
        { "Exp", -3, 0, 0, 2000000000 },
    } },
    ["finish_pet_task"] = { "Ho�n th�nh nhi�m v� ph�c sinh b�n ��ng h�nh", 1, {
        { "Ho�n th�nh nhi�m v� ph�c sinh b�n ��ng h�nh", act_finish_pet_task, {}, 0, 0 },
    } },
    ["exp1g_yuntielinshi"] = { "Kinh nghi�m + Thi�n Th�ch Linh Th�ch", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "Thi�n Th�ch linh th�ch", 2, 1, 1068, 1, 1, 15 },
    } },
    ["exp1g_zhenqi"] = { "Kinh nghi�m + Ch�n kh�", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "Ch�n kh�", -4, 0, 0, 50000 },
    } },
    ["exp1g_shengwang10k_shimen10k"] = { "Kinh nghi�m + Danh v�ng + �i�m s� m�n", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "Danh v�ng", -5, 0, 0, 10000 },
        { "�i�m s� m�n", -6, 0, 0, 10000 },
    } },
    ["exp2g_shengwang10k_shimen10k"] = { "EXP + Danh v�ng + �i�m s� m�n", 1, {
        { "Exp", -3, 0, 0, 2000000000 },
        { "Danh v�ng", -5, 0, 0, 10000 },
        { "�i�m s� m�n", -6, 0, 0, 10000 },
    } },
    ["exp1g_dinghunyuntieshenshi"] = { "Kinh nghi�m + ��nh H�n Thi�n Th�ch Th�n Th�ch", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "��nh H�n Thi�n Th�ch Th�n Th�ch", 2, 1, 1067, 1, 1, 15 },
    } },
    ["ib_final1"] = { "Ph�n th��ng cu�i phong ph�", 7, {
        { "Exp", -3, 0, 0, 2000000000 },
        { "M�nh Th�i D�ch", 2, 0, 1082, 4000 },
        { "M�t T�ch Cao C�p", act_give_gaoji_zhenjuan, { 1, 1, 1, 2 }, 0, 0 },
        { "Th�n T�i B�o R��ng", 2, 1, 30344, 3 },
        --{"������ʯ", 2, 1, 1068, 1, 1, 15},
        { "��i ��nh H�n ", 2, 1, 1113, 1, 1, 15 },
        { "��nh H�n Thi�n Th�ch Th�n Th�ch", 2, 1, 1067, 1, 1, 15 },
    } },
    ["exp1g_500MMT"] = { "Kinh nghi�m + 500 M�nh M�t T�ch", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { " M�nh M�t T�ch", 2, 1, 30669, 500, 4 },
    } },
}
T_VNG_AWARD = {
    finish_pet_task = 1,
}

function get_award_name(szAward)
    local t = T_FinalAward[szAward]
    if t then
        return t[1]
    end
    return ""
end

function get_award_desc(szAward)
    local t = T_FinalAward[szAward]
    if t then
        return get_list_content(t[3])
    end
    return ""
end

function get_award(szAward, nTaskId, nBitIdx)
    local t = T_FinalAward[szAward]
    if t then
        if gf_Judge_Room_Weight(t[2], T_FinalAward.room_weight[2], "") ~= 1 then
            return 0
        end
        check_get_award(szAward, 1)
        local r = award_by_list(t[3], 1, 1, nTaskId, nBitIdx)
        return r
    end
    return 0
end

function check_get_award(szAward, bNotify)
    local t = T_FinalAward[szAward]
    if t then
        local r, msg = check_award_by_list(t[3], bNotify)
        return r, msg
    end
    return 0, ""
end

function check_is_vng_award(szAward)
    return T_VNG_AWARD[szAward] or 0
end