--宝石袋
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\task_access_code_def.lua")
Include("\\script\\item\\skill_app_box.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

--注意：settings\路径下的脚本会打包限制修改，开关须设到script\路径下的脚本中
--GEM_RELEASE_WORK = 0 --发布控制 0:close 1:open

if GEM_RELEASE_WORK == 0 then
    G_MAX_GEM_LEVEL = 7
else
    G_MAX_GEM_LEVEL = 8
end

g_szItemNameGemBox = "C萴 Nang Ц Qu�";
g_szTitle = "<color=green>C萴 Nang Ц Qu�<color>";

G_MAX_GEM_STORE = 255
assert(G_MAX_GEM_STORE > 0 and G_MAX_GEM_STORE <= 255);
G_COMPOSE_NEED_GEM_NUM = 4
g_tGemInfo = {
    --type,name
    [1] = { 1, "Huy誸 Tr輈h Th筩h" },
    [2] = { 2, "Nguy謙 B筩h Th筩h" },
    [3] = { 3, "H� Ph竎h Th筩h" },
    [4] = { 4, "H綾 Di謚 Th筩h" },
}
g_tComposeConsume = {
    { 0 },
    { 1 }, --{need_gold}
    { 4 },
    { 20 },
    { 100 },
    { 1000 },
    { 4000 },
    { 10000 },
}

g_tGemTaskList = {
    --task_id, task_byte, access_code
    [101] = { 3245, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [102] = { 3246, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [103] = { 3247, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [104] = { 3248, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [105] = { 3249, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [106] = { 3250, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [201] = { 3245, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [202] = { 3246, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [203] = { 3247, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [204] = { 3248, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [205] = { 3249, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [206] = { 3250, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [301] = { 3245, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [302] = { 3246, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [303] = { 3247, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [304] = { 3248, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [305] = { 3249, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [306] = { 3250, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [401] = { 3245, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
    [402] = { 3246, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
    [403] = { 3247, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
    [404] = { 3248, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
    [405] = { 3249, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
    [406] = { 3250, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
    [107] = { 3480, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [207] = { 3480, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [307] = { 3480, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [407] = { 3480, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
    [108] = { 3598, 1, TASK_ACCESS_CODE_GEM_SYSTEM },
    [208] = { 3598, 2, TASK_ACCESS_CODE_GEM_SYSTEM },
    [308] = { 3598, 3, TASK_ACCESS_CODE_GEM_SYSTEM },
    [408] = { 3598, 4, TASK_ACCESS_CODE_GEM_SYSTEM },
};

function OnOpen_GemBox_FromNpc(nItemIdx)
    AddRuntimeStat(21, 1, 1, 1)
    OnUse_GemBox(nItemIdx)
end
function OnOpen_GemBox_FromItem(nItemIdx)
    AddRuntimeStat(21, 1, 0, 1)
    OnUse_GemBox(nItemIdx)
end

function OnUse_GemBox(nItemIdx)
    if IsGemSystemOpen(2) ~= 1 then
        return
    end

    local szTitle = format("%s: %s", g_szTitle, "M鏸 lo筰  qu� c� th� c蕋 gi� 255 c竔, ta c� th� gi髉 頲 g�?")
    local tbSay = {}

    tinsert(tbSay, format("%s/_checkin_all_gem", "B� t蕋 c�  qu� v祇 trong t骾"))
    tinsert(tbSay, format("%s/_checkout_gem", "Ta mu鑞 r髏  qu�"))
    --tinsert(tbSay, format("%s/_compose_gem", "Ta mu鑞 gh衟  qu�")) --LongDaiKa: ng t輓h n╪g  qu�
    --tinsert(tbSay, format("%s/OnUse_SKillAppBox", "技能石锦囊"))
    tinsert(tbSay, format("%s/nothing", "Ra kh醝"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _checkin_all_gem(bConfirm)
    if not bConfirm then
        local szTitle = format("%s:%s", g_szTitle, "M鏸 lo筰  qu� c� th� c蕋 gi� 255 c竔, ng � c蕋 v祇 kh玭g?")
        local tbSay = {}

        tinsert(tbSay, format("%s/#_checkin_all_gem(1)", "уng �"))
        tinsert(tbSay, format("%s/OnUse_GemBox", "tr� l筰"))
        tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

    local tItems = GetRoomItems(pos_equiproom)
    local tProcessed = {}
    for i, item_idx in tItems do
        local nG, nD, nP = GetItemInfoByIndex(item_idx);
        if nG == item_other and nD == enumOD_GEM and not tProcessed[nP] then
            local nType = floor(nP / 100)
            local nLevel = mod(nP, 100)
            local nItemCnt = GetItemCount(nG, nD, nP)
            local nGemCnt = _get_gem_num(nType, nLevel)
            local nCnt = G_MAX_GEM_STORE - nGemCnt
            nCnt = min(nCnt, nItemCnt)
            if nCnt > 0 then
                tProcessed[nP] = { nCnt, nItemCnt }
            end
        end
    end

    for k, v in tProcessed do
        local nType = floor(k / 100)
        local nLevel = mod(k, 100)
        local nCnt = v[1]
        if v[2] > v[1] then
            local szItemName = GetItemName(item_other, enumOD_GEM, k)
            Msg2Player(format("%s-%s  t gi韎 h筺 %d, h穣 gh衟 th祅h  qu� c蕄 cao r錳 c蕋 v祇", g_szItemNameGemBox, szItemName, G_MAX_GEM_STORE))
        end
        if 1 == DelItem(item_other, enumOD_GEM, k, nCnt) then
            --			WriteLog(format("[%s][_checkin_all_gem][%s][%s][DelItem][gdp:%d,%d,%d][num:%d]",
            --				g_szItemNameGemBox, GetAccount(), GetName(), nG, nD, nP, nCnt));
            _modify_gem_num(nType, nLevel, nCnt)
        end
    end
end

function _checkout_gem()
    local szTitle = format("%s:%s", g_szTitle, "L蕐 lo筰  qu� n祇?")
    local tbSay = {}

    for i, v in g_tGemInfo do
        tinsert(tbSay, format("%s/#_checkout_gem_type(%d)", v[2], v[1]))
    end
    tinsert(tbSay, format("%s/OnUse_GemBox", "tr� l筰"))
    tinsert(tbSay, format("%s/nothing", "Ra kh醝"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _checkout_gem_type(nType)
    local szTitle = format("%s: %s", g_szTitle, "Чi hi謕 mu鑞 l蕐  qu� c蕄 m蕐?")
    local tbSay = {}

    local tType = g_tGemInfo[nType]
    for lv = 1, G_MAX_GEM_LEVEL do
        local nCnt = _get_gem_num(nType, lv)
        if nCnt > 0 then
            tinsert(tbSay, format("%s c蕄 %d (%d)/#_checkout_gem_type_lv(%d,%d)", tType[2], lv, nCnt, nType, lv))
        end

    end
    tinsert(tbSay, format("%s/_checkout_gem", "tr� l筰"))
    tinsert(tbSay, format("%s/nothing", "Ra kh醝"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _checkout_gem_type_lv(nType, nLevel)
    local nMaxCnt = _get_gem_num(nType, nLevel)
    local szFunc = format("_checkout_gem_callback_%d_%d", nType, nLevel)
    AskClientForNumber(szFunc, 1, nMaxCnt, "Mu鑞 l蕐 ra bao nhi猽 c竔?");
end

function _checkout_gem_callback_1_1(nNum)
    return _checkout_gem_type_lv_num(1, 1, nNum)
end
function _checkout_gem_callback_1_2(nNum)
    return _checkout_gem_type_lv_num(1, 2, nNum)
end
function _checkout_gem_callback_1_3(nNum)
    return _checkout_gem_type_lv_num(1, 3, nNum)
end
function _checkout_gem_callback_1_4(nNum)
    return _checkout_gem_type_lv_num(1, 4, nNum)
end
function _checkout_gem_callback_1_5(nNum)
    return _checkout_gem_type_lv_num(1, 5, nNum)
end
function _checkout_gem_callback_1_6(nNum)
    return _checkout_gem_type_lv_num(1, 6, nNum)
end
function _checkout_gem_callback_2_1(nNum)
    return _checkout_gem_type_lv_num(2, 1, nNum)
end
function _checkout_gem_callback_2_2(nNum)
    return _checkout_gem_type_lv_num(2, 2, nNum)
end
function _checkout_gem_callback_2_3(nNum)
    return _checkout_gem_type_lv_num(2, 3, nNum)
end
function _checkout_gem_callback_2_4(nNum)
    return _checkout_gem_type_lv_num(2, 4, nNum)
end
function _checkout_gem_callback_2_5(nNum)
    return _checkout_gem_type_lv_num(2, 5, nNum)
end
function _checkout_gem_callback_2_6(nNum)
    return _checkout_gem_type_lv_num(2, 6, nNum)
end
function _checkout_gem_callback_3_1(nNum)
    return _checkout_gem_type_lv_num(3, 1, nNum)
end
function _checkout_gem_callback_3_2(nNum)
    return _checkout_gem_type_lv_num(3, 2, nNum)
end
function _checkout_gem_callback_3_3(nNum)
    return _checkout_gem_type_lv_num(3, 3, nNum)
end
function _checkout_gem_callback_3_4(nNum)
    return _checkout_gem_type_lv_num(3, 4, nNum)
end
function _checkout_gem_callback_3_5(nNum)
    return _checkout_gem_type_lv_num(3, 5, nNum)
end
function _checkout_gem_callback_3_6(nNum)
    return _checkout_gem_type_lv_num(3, 6, nNum)
end
function _checkout_gem_callback_4_1(nNum)
    return _checkout_gem_type_lv_num(4, 1, nNum)
end
function _checkout_gem_callback_4_2(nNum)
    return _checkout_gem_type_lv_num(4, 2, nNum)
end
function _checkout_gem_callback_4_3(nNum)
    return _checkout_gem_type_lv_num(4, 3, nNum)
end
function _checkout_gem_callback_4_4(nNum)
    return _checkout_gem_type_lv_num(4, 4, nNum)
end
function _checkout_gem_callback_4_5(nNum)
    return _checkout_gem_type_lv_num(4, 5, nNum)
end
function _checkout_gem_callback_4_6(nNum)
    return _checkout_gem_type_lv_num(4, 6, nNum)
end
function _checkout_gem_callback_1_7(nNum)
    return _checkout_gem_type_lv_num(1, 7, nNum)
end
function _checkout_gem_callback_2_7(nNum)
    return _checkout_gem_type_lv_num(2, 7, nNum)
end
function _checkout_gem_callback_3_7(nNum)
    return _checkout_gem_type_lv_num(3, 7, nNum)
end
function _checkout_gem_callback_4_7(nNum)
    return _checkout_gem_type_lv_num(4, 7, nNum)
end
function _checkout_gem_callback_1_8(nNum)
    return _checkout_gem_type_lv_num(1, 8, nNum)
end
function _checkout_gem_callback_2_8(nNum)
    return _checkout_gem_type_lv_num(2, 8, nNum)
end
function _checkout_gem_callback_3_8(nNum)
    return _checkout_gem_type_lv_num(3, 8, nNum)
end
function _checkout_gem_callback_4_8(nNum)
    return _checkout_gem_type_lv_num(4, 8, nNum)
end
function _checkout_gem_type_lv_num(nType, nLevel, nNum)
    local nMaxCnt = _get_gem_num(nType, nLevel)
    if nNum >= 1 and nNum <= nMaxCnt then
        local nP = nType * 100 + nLevel

        if 1 ~= gf_JudgeRoomWeight(2, 0, g_szTitle) then
            return
        end

        if 1 == _modify_gem_num(nType, nLevel, -1 * nNum) then
            gf_SetLogCaption(g_szItemNameGemBox);
            local tType = g_tGemInfo[nType]
            gf_AddItemEx({ item_other, enumOD_GEM, nP, nNum }, format("%s c蕄 %d", tType[2], nLevel));
            gf_SetLogCaption("");
        end
    end
end

function _compose_gem()
    WLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_DAQUY);
    if WPlayer:IsNewbie() == WEnv.TRUE then
        WNpc:Talk("<npcname>: Nghe n鉯 <color=green>Ti猽 Vi詎 L﹗<color> � Bi謓 Kinh ph� c� r蕋 nhi襲 T骾 Ц Qu� C蕄 1, t譵 y  h醝.");
    end
    do return 0; end --LongDaiKa: ng kh玭g d飊g n c玭g th鴆 gh衟  qu� c馻 vng

    local szTitle = format("%s:%s", g_szTitle, "Ti猽 hao 4  qu� c蕄 th蕄 s� gh衟 th祅h 1  qu� c蕄 cao, mu鑞 gh衟 lo筰  qu� n祇?")
    local tbSay = {}

    for i, v in g_tGemInfo do
        tinsert(tbSay, format("%s/#_compose_gem_type(%d)", v[2], v[1]))
    end
    tinsert(tbSay, format("%s/OnUse_GemBox", "tr� l筰"))
    tinsert(tbSay, format("%s/nothing", "Ra kh醝"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _compose_gem_type(nType)
    local szTitle = format("%s:%s", g_szTitle, "Ti猽 hao 4  qu� c蕄 th蕄 s� gh衟 th祅h 2  qu� c蕄 cao, i hi謕 mu鑞 gh衟  qu� c蕄 m蕐?")
    local tbSay = {}

    local tType = g_tGemInfo[nType]
    local tGem, _ = _get_gem_nums(nType)
    for lv = 1, G_MAX_GEM_LEVEL do
        local t = tGem[lv]
        local nMaxCnt = t[3]
        local nUpperLv = lv
        local nUpCnt = t[2]
        --if nMaxCnt > 0 then
        tinsert(tbSay, format("%s c蕄 %d (C� th� gh衟 %d,  c� %d)/#_compose_gem_type_lv(%d,%d)", tType[2], nUpperLv, nMaxCnt, nUpCnt, nType, nUpperLv))
        --end

    end
    tinsert(tbSay, format("Gh衟 to祅 b� %s/#_compose_gem_type_lv(%d,%d)", tType[2], nType, 0))
    tinsert(tbSay, format("%s/_compose_gem", "tr� l筰"))
    tinsert(tbSay, format("%s/nothing", "Ra kh醝"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _get_compose_need_gold(nType, nLevel)
    if g_tGemInfo[nType] and g_tComposeConsume[nLevel] then
        return g_tComposeConsume[nLevel][1]
    end
    return -1
end
function _get_max_compose_count_by_gold(nType, nLevel)
    local nMaxComposeByGold = -1
    local nNeedGold = _get_compose_need_gold(nType, nLevel)
    if nNeedGold >= 0 then
        nMaxComposeByGold = G_MAX_GEM_STORE
        if nNeedGold > 0 then
            nMaxComposeByGold = floor(GetCash() / (10000 * nNeedGold))
        end
    end
    return nMaxComposeByGold
end
function _get_can_compose_cnt(nType, nLevel)
    local nMaxComposeByGold = _get_max_compose_count_by_gold(nType, nLevel)
    if nLevel <= 1 or nMaxComposeByGold <= 0 then
        return 0
    end
    local nUpperCurNum = _get_gem_num(nType, nLevel)
    local nLowerCurNum = _get_gem_num(nType, nLevel - 1)
    local nMaxCompose = floor(nLowerCurNum / G_COMPOSE_NEED_GEM_NUM)
    local nCurCap = G_MAX_GEM_STORE - nUpperCurNum
    local nRealMaxCompose = min(nCurCap, nMaxCompose)

    local nRealCompose = min(nMaxComposeByGold, nRealMaxCompose)

    return nRealCompose
end

function _compose_gem_type_lv(nType, nLevel)
    local tGem, nNeedGold = _get_gem_nums(nType)
    if nLevel >= 1 and nLevel <= G_MAX_GEM_LEVEL then
        local t = tGem[nLevel]
        --		local nMaxComposeByGold = _get_max_compose_count_by_gold(nType, nLevel)
        --    	if nMaxComposeByGold <= 0 then
        --    		Talk(1,"","金子不足，暂时不能合成该等级")
        --    		return
        --    	end

        local nMaxCnt = min(G_MAX_GEM_STORE - t[2], t[3])
        if nMaxCnt <= 0 then
            Talk(1, "", "T筸 th阨 kh玭g th� gh衟 th祅h ng c蕄 n祔")
            return
        end
        local szFunc = format("_compose_gem_callback_%d_%d", nType, nLevel)
        AskClientForNumber(szFunc, 1, nMaxCnt, "Gh衟 bao nhi猽 c竔?");
    else
        local szName = g_tGemInfo[nType][2]
        tGem, nNeedGold = _get_new_nums(nType, 0, 0, tGem)
        local nMaxLv, nCnt = _get_max_level_compose(tGem)
        local szMsg = format("Gh衟 to祅 b� %s s� mang t蕋 c� %s gh衟 th祅h c蕄 cao nh蕋, l莕 n祔 d� ki課 c� th� gh衟 頲 %d vi猲 %d c蕄 %s, l莕 gh衟 n祔 c莕 t鑞 %d v祅g, ng � kh玭g?"
        , szName, szName, nCnt, nMaxLv, szName, nNeedGold)
        local szTitle = format("%s:%s", g_szTitle, szMsg)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_compose_gem_type_lv_num(%d,%d,%d,%d)", "уng �", nType, 0, 0, 1))
        tinsert(tbSay, format("%s/#_compose_gem_type(%d)", "tr� l筰", nType))
        tinsert(tbSay, format("%s/nothing", "T� b�"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

end

function _compose_gem_callback_1_1(nNum)
    return _compose_gem_type_lv_num(1, 1, nNum)
end
function _compose_gem_callback_1_2(nNum)
    return _compose_gem_type_lv_num(1, 2, nNum)
end
function _compose_gem_callback_1_3(nNum)
    return _compose_gem_type_lv_num(1, 3, nNum)
end
function _compose_gem_callback_1_4(nNum)
    return _compose_gem_type_lv_num(1, 4, nNum)
end
function _compose_gem_callback_1_5(nNum)
    return _compose_gem_type_lv_num(1, 5, nNum)
end
function _compose_gem_callback_1_6(nNum)
    return _compose_gem_type_lv_num(1, 6, nNum)
end
function _compose_gem_callback_2_1(nNum)
    return _compose_gem_type_lv_num(2, 1, nNum)
end
function _compose_gem_callback_2_2(nNum)
    return _compose_gem_type_lv_num(2, 2, nNum)
end
function _compose_gem_callback_2_3(nNum)
    return _compose_gem_type_lv_num(2, 3, nNum)
end
function _compose_gem_callback_2_4(nNum)
    return _compose_gem_type_lv_num(2, 4, nNum)
end
function _compose_gem_callback_2_5(nNum)
    return _compose_gem_type_lv_num(2, 5, nNum)
end
function _compose_gem_callback_2_6(nNum)
    return _compose_gem_type_lv_num(2, 6, nNum)
end
function _compose_gem_callback_3_1(nNum)
    return _compose_gem_type_lv_num(3, 1, nNum)
end
function _compose_gem_callback_3_2(nNum)
    return _compose_gem_type_lv_num(3, 2, nNum)
end
function _compose_gem_callback_3_3(nNum)
    return _compose_gem_type_lv_num(3, 3, nNum)
end
function _compose_gem_callback_3_4(nNum)
    return _compose_gem_type_lv_num(3, 4, nNum)
end
function _compose_gem_callback_3_5(nNum)
    return _compose_gem_type_lv_num(3, 5, nNum)
end
function _compose_gem_callback_3_6(nNum)
    return _compose_gem_type_lv_num(3, 6, nNum)
end
function _compose_gem_callback_4_1(nNum)
    return _compose_gem_type_lv_num(4, 1, nNum)
end
function _compose_gem_callback_4_2(nNum)
    return _compose_gem_type_lv_num(4, 2, nNum)
end
function _compose_gem_callback_4_3(nNum)
    return _compose_gem_type_lv_num(4, 3, nNum)
end
function _compose_gem_callback_4_4(nNum)
    return _compose_gem_type_lv_num(4, 4, nNum)
end
function _compose_gem_callback_4_5(nNum)
    return _compose_gem_type_lv_num(4, 5, nNum)
end
function _compose_gem_callback_4_6(nNum)
    return _compose_gem_type_lv_num(4, 6, nNum)
end
function _compose_gem_callback_1_7(nNum)
    return _compose_gem_type_lv_num(1, 7, nNum)
end
function _compose_gem_callback_2_7(nNum)
    return _compose_gem_type_lv_num(2, 7, nNum)
end
function _compose_gem_callback_3_7(nNum)
    return _compose_gem_type_lv_num(3, 7, nNum)
end
function _compose_gem_callback_4_7(nNum)
    return _compose_gem_type_lv_num(4, 7, nNum)
end
function _compose_gem_callback_1_8(nNum)
    return _compose_gem_type_lv_num(1, 8, nNum)
end
function _compose_gem_callback_2_8(nNum)
    return _compose_gem_type_lv_num(2, 8, nNum)
end
function _compose_gem_callback_3_8(nNum)
    return _compose_gem_type_lv_num(3, 8, nNum)
end
function _compose_gem_callback_4_8(nNum)
    return _compose_gem_type_lv_num(4, 8, nNum)
end
function _compose_gem_type_lv_num(nType, nLevel, nNum, bConfirm)
    if nLevel > 0 and nNum and nNum <= 0 then
        _compose_gem_type(nType)
        return
    end

    local tGem, nNeedGoldAll = _get_gem_nums(nType)
    tGem, nNeedGoldAll = _get_new_nums(nType, nLevel, nNum, tGem)
    local szName = g_tGemInfo[nType][2]
    if nNeedGoldAll <= 0 then
        return
    end

    --	local nMaxComposeCnt = _get_can_compose_cnt(nType, nLevel)
    --	local nRealCompose = min(nNum, nMaxComposeCnt)
    --	if nRealCompose <= 0 then
    --		return
    --	end
    --	local nNeedGold = _get_compose_need_gold(nType, nLevel)
    --	if nNeedGold < 0 then
    --		return
    --	end
    --	local nNeedGoldAll = nNeedGold

    if not bConfirm or bConfirm ~= 1 then
        local nPUpper = nType * 100 + nLevel
        local szItemName = GetItemName(item_other, enumOD_GEM, nPUpper)
        local szMsg = format("Gh衟 th祅h %d c竔 %s c莕 ti猽 hao %d v祅g, x竎 nh薾 kh玭g?", nNum, szItemName, nNeedGoldAll)
        local szTitle = format("%s:%s", g_szTitle, szMsg)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_compose_gem_type_lv_num(%d,%d,%d,1)", "уng �", nType, nLevel, nNum))
        tinsert(tbSay, format("%s/#_compose_gem_type(%d)", "tr� l筰", nType))
        tinsert(tbSay, format("%s/nothing", "T� b�"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

    --	if nRealCompose < nNum then
    --		Msg2Player(format("%s中%s已达上限%d,请合成高级宝石", g_szItemNameGemBox, szItemName, G_MAX_GEM_STORE))
    --	end
    local nNeedMoneyAll = nNeedGoldAll * 10000
    if GetCash() < nNeedMoneyAll then
        Talk(1, "", format("V祅g kh玭g  %d", nNeedGoldAll))
        return
    end
    if 1 == Pay(nNeedMoneyAll) then
        local szMsg = format("%s gh衟 ho祅 t蕋, ti猽 hao v祅g %d, t譶h tr筺g  qu� nh� sau\n%-8s %-8s %-8s %-8s %-8s", szName, nNeedGoldAll, "C蕄", "Х c�", "H頿 th祅h", "Ti猽 hao ", "C遪 ")
        for i = 1, getn(tGem) do
            local t = tGem[i]
            local nNewNum = t[4] - t[5]
            local nNewTotal = t[2] + nNewNum
            if 1 ~= _modify_gem_num(nType, i, nNewNum) then
            end
            --print("_modify_gem_num",nType, i, nNewNum)
            szMsg = format("%s\n%-8d %-8d %-8d %-8d %-8d", szMsg, i, t[2], t[4], t[5], nNewTotal)
            --AddRuntimeStat(21, 2, nPUpper, nNum)
        end
        Talk(1, "", szMsg)
        --		if 1==_modify_gem_num(nType, nLevel-1, -1*nRealCompose*G_COMPOSE_NEED_GEM_NUM) then
        --    		if 1 == _modify_gem_num(nType, nLevel, nRealCompose) then
        --    			AddRuntimeStat(21, 2, nPUpper, nRealCompose)
        --    			WriteLog(format("[%s][compose_gem][%s][%s][Type:%d][Level:%d][num:%d]",
        --    				g_szItemNameGemBox, GetAccount(), GetName(), nType, nLevel, nRealCompose));
        --    			local szMsg = format("成功合成%d颗%d级%s", nRealCompose, nLevel, g_tGemInfo[nType][2])
        --    			Msg2Player(szMsg)
        --    		end
        --    	end
    end
end

function _get_gem_num(nType, nLevel)
    local nRet = -1
    local nG = nType * 100 + nLevel
    local tTask = g_tGemTaskList[nG]
    if tTask then
        return gf_SafeGetTaskByte(tTask[1], tTask[2])
    end
    return nRet

end
function _modify_gem_num(nType, nLevel, nNum)
    local nRet = 0
    local nG = nType * 100 + nLevel
    local tTask = g_tGemTaskList[nG]
    if tTask then
        local nCur = _get_gem_num(nType, nLevel)
        local nNew = nCur + nNum
        if nNew >= 0 and nNew <= G_MAX_GEM_STORE then
            gf_SafeSetTaskByte(tTask[1], tTask[2], nNew, tTask[3])
            WriteLog(format("[%s][modify_gem_num][%s][%s][Type:%d][Level:%d][num:%d->%d]",
                    g_szItemNameGemBox, GetAccount(), GetName(), nType, nLevel, nNum, _get_gem_num(nType, nLevel)));
            nRet = 1
        end
    end
    return nRet
end

----------------------------------------------------------------------------------------------------新的合成方案

--合成指定类型指定等级的宝石
--nLevel<=0或者nil表示合成所有
--function do_compose_gem(nType, nLevel, nNum)
--	local tGem,nNeedGold = _get_gem_nums(nType)
--	tGem,nNeedGold = _get_new_nums(nType, nLevel, nNum, tGem)
--end


function _get_gem_nums(nType)
    local t = {}
    for i = 1, G_MAX_GEM_LEVEL do
        --level, cur_num, max_compose_from_lower, compose_num, consumme_num,
        local max_compose_from_lower = 0
        if i > 1 then
            tl = t[i - 1]
            max_compose_from_lower = floor((tl[2] + tl[3]) / G_COMPOSE_NEED_GEM_NUM) --最多可以从下层合成多少个
        end
        t[i] = { i, _get_gem_num(nType, i), max_compose_from_lower, 0, 0 }
    end
    return t, 0
end

function _get_new_nums(nType, nLevel, nNum, tGem)
    local nNeedGold = 0
    if not nLevel or nLevel <= 0 then
        nLevel = G_MAX_GEM_LEVEL
        nNum = G_MAX_GEM_STORE + 1
    end
    local nCurCompose = nNum
    local nCurConsume = 0
    for i = nLevel, 1, -1 do
        local nRealCompose = 0
        local nRealCosumme = nCurConsume
        local t = tGem[i]
        if nCurCompose > G_MAX_GEM_STORE then
            nRealCompose = t[3]
        else
            if nCurConsume > 0 then
                nRealCompose = max(nCurConsume - t[2], 0)--需要合成这么多
            else
                nRealCompose = nCurCompose
            end
        end
        nRealCompose = min(G_MAX_GEM_STORE - t[2] + nRealCosumme, nRealCompose)--最大存储空间确认

        tGem[i][4] = nRealCompose
        tGem[i][5] = nRealCosumme
        nNeedGold = nNeedGold + nRealCompose * g_tComposeConsume[i][1]
        --print(nType, nLevel, nNum,nRealCompose,nRealCosumme,nNeedGold)
        nCurConsume = nRealCompose * G_COMPOSE_NEED_GEM_NUM --下一级需要的消耗
        if nRealCompose == 0 and nCurCompose < G_MAX_GEM_STORE then
            --不需要下层再合并了
            break
        end
    end
    return tGem, nNeedGold
end

function _get_max_level_compose(tGem)
    for i = G_MAX_GEM_LEVEL, 2, -1 do
        local t = tGem[i]
        if t[3] > 0 then
            return i, t[3]
        end
    end
    return 0, 1
end



