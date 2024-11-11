Import("\\script\\ksgvn\\lib.lua")

g_szNpcName = g_szNpcName or "<color=green>T�n Th� L�nh:<color> "
TASK_TEMP_WEAPONIDX = 153
_g_tbWeaponEffects = {
    [1] = "Thi�t C�t",
    [2] = "L�c H�",
    [3] = "B�ch Chi�n",
    [4] = "Ch��c Nh�t",
    [5] = "Tu�n D�t",
    [6] = "��o L�",
    [7] = "Danh T�c",
    [8] = "L�ng Ti�u",
    [9] = "Ph�n V�n",
    [10] = "�o�n Giao",
    [11] = "Tinh Di",
    [12] = "Ph� Qu�n",
    [13] = "H�o m�n",
}

_g_tbSoulPowers = {
    [1] = { 1, 1 },
    [2] = { 2, 2 },
    [3] = { 2, 2 },
    [4] = { 2, 2 },
    [5] = { 2, 2 },
    [6] = { 2, 2 },
    [7] = { 2, 2 },
    [8] = { 3, 3 },
    [9] = { 3, 3 },
    [10] = { 3, 3 },
    [11] = { 3, 3 },
    [12] = { 4, 4 },
    [13] = { 4, 4 },
}
function weaponEffect_Show()
    local nWeaponIndex = GetPlayerEquipIndex(2);
    SetTaskTemp(TASK_TEMP_WEAPONIDX, nWeaponIndex)
    local tSay = {
        g_szNpcName .. "H�y ch�n lo�i linh ph�ch m� c�c h� mu�n k�ch ho�t:<enter><color=red>L�u �: N�u v� kh� �� t�n t�i linh ph�ch th� linh ph�ch c� s� b� thay th�<color>",
    }

    for nEffectId, szEffectName in _g_tbWeaponEffects do
        tinsert(tSay, format("Linh Ph�ch-%s /#weaponEffect_Active(%d)", szEffectName, nEffectId))
    end
    tinsert(tSay, "T�m ch�a mu�n k�ch ho�t/no")
    KsgNpc:SayDialog(tSay)
end

function weaponEffect_Active(nEffectId, nBuyType)
    if not _g_tbWeaponEffects[nEffectId] then
        return KsgNpc:Talk("Linh Ph�ch n�y kh�ng t�n t�i!")
    end
    local tbTypeCfg = {
        [1] = {
            nDay = 7,
            tbCost = { tbProp = { 2, 1, 31507 }, nCount = 1 },
        },
        --[2] = {
        --    nDay = 7,
        --    tbCost = { tbProp = { 2, 1, 30230 }, nCount = 400 },
        --},
        --[3] = {
        --    nDay = 30,
        --    tbCost = { tbProp = { 2, 1, 30230 }, nCount = 1200 },
        --},
    }
    if nBuyType then
        if not tbTypeCfg[nBuyType] then
            return KsgNpc:Talk("Kh�ng th� gia h�n h�nh th�c n�y!")
        end
        if _weaponEffect_isWeaponChanged() then
            return
        end
        local tbCondition = {
            tbItems = {
                tbTypeCfg[nBuyType].tbCost,
            },
        }
        if not KsgLib:PayMaterial(tbCondition) then
            return
        end
        if BindWeaponEffect(_g_tbWeaponEffects[nEffectId], tbTypeCfg[nBuyType].nDay * 86400) == 1 then
            KsgNpc:Talk(g_szNpcName .. format("Ch�c m�ng c�c h� �� th�nh c�ng th�m ��c hi�u cho v� kh� <color=yellow>%s<color>! T�i <color=yellow>bi�u t��ng g�c d��i b�n tr�i c�a v� kh�<color>, b�m v�o n�t m�u �� �� ho�n linh, c� th� ��nh th�c <color=yellow>linh ph�ch<color>. Ph�m t�t �� th�c t�nh <color=yellow>linh ph�ch<color>: <color=red>F<color> !", _g_tbWeaponEffects[nEffectId]))
            AddGlobalNews(format("Giang h� ��n r�ng, %s d�ng t� ch�t thi�n b�m g�i t�nh linh ph�ch c�a v� kh�: %s, th�t kh�ng h� danh v�n v� song to�n!", GetName(), _g_tbWeaponEffects[nEffectId]))
        else
            return KsgNpc:Talk("X�y ra l�i, kh�ng th� th�c t�nh lo�i linh ph�ch n�y l�n v� kh� hi�n t�i!")
        end
        if AddWeaponEffectAttribute(8, _g_tbSoulPowers[nEffectId][1]) == 1 then
            gf_WriteLogEx("WeaponEffect", format("Th�m linh l�c th� %d c�p %d", 1, _g_tbSoulPowers[nEffectId][1]), 1, "", 1, "", "Th�nh c�ng");
        else
            gf_WriteLogEx("WeaponEffect", format("Th�m linh l�c th� %d c�p %d", 1, _g_tbSoulPowers[nEffectId][1]), 1, "", 0, "", "Th�t b�i");
        end
        if AddWeaponEffectAttribute(9, _g_tbSoulPowers[nEffectId][2]) == 1 then
            gf_WriteLogEx("WeaponEffect", format("Th�m linh l�c th� %d c�p %d", 2, _g_tbSoulPowers[nEffectId][2]), 1, "", 1, "", "Th�nh c�ng");
            return 1
        else
            gf_WriteLogEx("WeaponEffect", format("Th�m linh l�c th� %d c�p %d", 2, _g_tbSoulPowers[nEffectId][2]), 1, "", 0, "", "Th�t b�i");
            return 0
        end
        return
    end
    local tSay = {
        g_szNpcName .. format("%s �� ch�n linh ph�ch <color=yellow>%s<color>, %s mu�n l�u gi� linh ph�ch trong bao l�u?", gf_GetPlayerSexName(), _g_tbWeaponEffects[nEffectId], gf_GetPlayerSexName())
    }
    for nType, tbCfg in tbTypeCfg do
        local tbCost = tbCfg.tbCost
        tinsert(tSay, format("%d ng�y (T�n [%s] x %d)/#weaponEffect_Active(%d,%d)", tbCfg.nDay, KsgItem:GetName(tbCost.tbProp), tbCost.nCount, nEffectId, nType))
    end
    tinsert(tSay, "R�i �i/no")
    KsgNpc:SayDialog(tSay)
end

function _weaponEffect_isWeaponChanged()
    local nWeaponIndex = GetPlayerEquipIndex(2)
    local nWeaponIndexSaved = GetTaskTemp(TASK_TEMP_WEAPONIDX)
    if nWeaponIndex == 0 then
        KsgNpc:Talk(g_szNpcName .. "Tr��c ti�n ��i hi�p c�n trang b� m�t lo�i v� kh�!")
        return 1
    end
    if nWeaponIndexSaved ~= nWeaponIndex then
        KsgNpc:Talk(g_szNpcName .. "�y da... ��i hi�p tr�o ��i v� kh� nhanh th�t ��y, nh�ng kh�ng qua n�i m�t ta ��u! Th�n l� ��i hi�p quang minh l�i l�c th� ��ng n�n l�m nh�ng vi�c nh� v�y nh�!")
        return 1
    end
    return nil
end