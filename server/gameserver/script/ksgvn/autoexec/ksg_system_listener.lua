Import("\\script\\ksgvn\\lib.lua")

function _ksg_onActivityFinish_Online60Min(tEvent, data, para)
    --KsgAward:DropEventBox(5)
    --KsgAward:TuiQua(5)
end

function _ksg_onActivityFinish_Online180Min(tEvent, data, para)

end

function _ksg_onActivityFinish_LSB(tEvent, data, para)
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_VKT(tEvent, data, para)
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_KDYV(tEvent, data, para)
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_LuckyStar(tEvent, data, para)
    --KsgAward:TuiQua(10)
    --KsgAward:DropEventBox(50)
end

function _ksg_onActivityFinish_NuOa(tEvent, data, para)
    --KsgAward:TuiQua(10)
    --KsgAward:DropEventBox(50)
end

function _ksg_onActivityFinish_DHC(tEvent, data, para)
    --KsgAward:DropEventBox(5)
end

function _ksg_AwardFubenByJoinTimes(nJoinTimes)
    if mod(nJoinTimes, 5) == 0 then
        KsgAward:Give({ tbProp = { 2, 97, 379 }, nStatus = 4 }, "Th��ng M�c PB 5")
    end
    if mod(nJoinTimes, 10) == 0 then
        KsgAward:Give({ tbProp = { 2, 97, 378 }, nStatus = 4 }, "Th��ng M�c PB 10")
    end
end

function _ksg_onActivityFinish_TNT(tEvent, data, para)
    --KsgAward:DropEventBox(2)
end

function _ksg_onActivityFinish_TH(tEvent, data, para)
    --KsgAward:DropEventBox(2)
end

function _ksg_onActivityFinish_TK(tEvent, data, para)
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_TQC5(tEvent, data, para)

end

function _ksg_onActivityFinish_TQC6(tEvent, data, para)

end

function _ksg_onActivityFinish_TQC(tEvent, data, para)
    --KsgAward:DropEventBox(20)
end

function _ksg_onActivityFinish_NewBattle(tEvent, data, para)
    local nAwardType = data[2]
    local nResult = data[3]
    local nBattleType = data[4]
    local tbAwardCfg = {
        [1] = { -- Th�n trang
            nEventBox = 10,
            nHuyChuong = 1,
        },
        [2] = { -- Th�o c�c
            nEventBox = 10,
            nHuyChuong = 1,
        },
        [3] = { -- Th�nh tr�
            nEventBox = 15,
            nHuyChuong = 1,
        },
        [4] = { -- Nh�n M�n Quan
            nEventBox = 20,
            nHuyChuong = 2,
        },
    }

    local tbBattleAwardCfg = tbAwardCfg[nBattleType]
    if not tbBattleAwardCfg then
        return
    end

    local tbAwardTypeRate = {
        [1] = 2,
        [2] = 5,
        [3] = 10,
        [4] = 14,
    }

    local nAwardRate = 1
    local nBonusRate = 0

    if nAwardType > 0 then
        nAwardRate = tbAwardTypeRate[nAwardType]
    end

    if nResult == 1 then
        -- Th�ng
        nBonusRate = 1 -- 100%
    end

    nAwardRate = nAwardRate + nBonusRate

    local tbAdditionAward = {
        { tbProp = { 2, 1, 30499 }, nStatus = 4, nStack = tbBattleAwardCfg.nHuyChuong * nAwardRate }, -- Huy ch��ng anh h�ng
    }

    KsgAward:Give(tbAdditionAward, "T�ng Li�u - Th��ng Th�m")
    --KsgAward:DropEventBox(tbBattleAwardCfg.nEventBox * nAwardRate)
end

function _ksg_onActivityFinish_TMT(tEvent, data, para)
    local nAwardType = data[2]
    local bIsWin = data[3]
    local nEventBox = 10
    local tbAwardTypeRate = {
        [1] = 2,
        [2] = 5,
        [3] = 10,
        [4] = 14,
    }

    local nAwardRate = 1

    if bIsWin == 1 then
        -- Th�ng
        nAwardRate = nAwardRate * 2
    end

    if nAwardType > 0 then
        nAwardRate = nAwardRate + tbAwardTypeRate[nAwardType]
    end

    --KsgAward:DropEventBox(nEventBox * nAwardRate)
end

function _ksg_onActivityFinish_PDLSV(tEvent, data, para)
    local nAwardType = data[2]
    local nResult = data[3]
    local nEventBox = 20
    local tbAwardTypeRate = {
        [1] = 2,
        [2] = 5,
        [3] = 10,
        [4] = 14,
    }

    local nAwardRate = 1

    if nResult == 1 then
        -- Th�ng x2
        nAwardRate = nAwardRate * 2
    end

    if nAwardType > 0 then
        nAwardRate = nAwardRate + tbAwardTypeRate[nAwardType]
    end

    --KsgAward:DropEventBox(nEventBox * nAwardRate)
end

function _ksg_onActivityFinish_TMTLSV(tEvent, data, para)
    local nAwardType = data[2]
    local nResult = data[3]
    local nEventBox = 20
    local tbAwardTypeRate = {
        [1] = 2,
        [2] = 5,
        [3] = 10,
        [4] = 14,
    }

    local nAwardRate = 1

    if nResult == 2 then
        -- Th�ng x2
        nAwardRate = nAwardRate * 2
    end

    if nAwardType > 0 then
        nAwardRate = nAwardRate + tbAwardTypeRate[nAwardType]
    end

    --KsgAward:DropEventBox(nEventBox * nAwardRate)
end

function _ksg_onActivityFinish_HiepLo(tEvent, data, para)
    local nAwardType = data[2]
    local nResult = data[3]
    local nEventBox = 30
    local tbAwardTypeRate = {
        [1] = 2,
        [2] = 5,
        [3] = 10,
        [4] = 14,
    }

    local nAwardRate = 1

    if nResult == 2 then
        -- Th�ng x2
        nAwardRate = nAwardRate * 2
    end

    if nAwardType > 0 then
        nAwardRate = nAwardRate + tbAwardTypeRate[nAwardType]
    end

    --KsgAward:DropEventBox(nEventBox * nAwardRate)
end

function _ksg_onActivityFinish_VanTieu(tEvent, data, para)
    --KsgAward:TuiQua(5)
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_CuopTieu(tEvent, data, para)
    --KsgAward:TuiQua(5)
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_TuiHG(tEvent, data, para)
    --KsgAward:DropEventBox(2)
end

function _ksg_onActivityFinish_BNL(tEvent, data, para)
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_BNN(tEvent, data, para)
    --KsgAward:DropEventBox(2)
end

function _ksg_onActivityFinish_CayTuLinh(tEvent, data, para)
    --KsgAward:DropEventBox(2)
end

function _ksg_onActivityFinish_ThuongHoi(tEvent, data, para)
    --KsgAward:DropEventBox(2)
end

function _ksg_onActivityFinish_NhiemVuSuMon(tEvent, data, para)
    local tbAwardLuck = {
        { tbProp = { 2, 0, 554 }, nStack = 1, nStatus = 1, nExpiredTime = 7 * 24 * 3600, nRate = 5 }, --Tu ch�n y�u quy�t
        { tbProp = { 2, 1, 30311 }, nStack = 1, nStatus = 1, nRate = 40 }, --Th�nh v�t s� m�n
        { tbProp = { 2, 1, 50028 }, nStack = 1, nStatus = 1, nRate = 0.5, nQuality = "%s ho�n th�nh nhi�m v� S� M�n, ���c ch��ng m�n ban t�ng %d %s!" }, --C� ph� - T�i t�n quy�n
    }

    local nFaction = KsgPlayer:GetFaction()
    if g_tbFaction_LenhBaiSuMon[nFaction] then
        tinsert(tbAwardLuck, { tbProp = { 2, 0, g_tbFaction_LenhBaiSuMon[nFaction] }, nStack = 1, nStatus = 1, nRate = 30 }) -- l�nh b�i s� m�n
    end

    KsgAward:Give(tbAwardLuck, 'Nv S� M�n-Th��ng may m�n')
    --KsgAward:DropEventBox(5)
end

function _ksg_onActivityFinish_NhiemVuSuMon_New(tEvent, data, para)
    _ksg_onActivityFinish_NhiemVuSuMon(tEvent, data, para)
end

function _ksg_onActivityFinish_NewResBattle(tEvent, data, para)
    --KsgAward:DropEventBox(20)
end

function _ksg_onActivityFinish_KillWorldBoss(tEvent, data, para)
    --KsgAward:DropEventBox(50)
    --KsgAward:TuiQua(50)
    local tbAward = {
        { tbProp = { 2, 5, 204 }, nStack = 1, nStatus = 1 }, --Thi�n Cang
        { tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 1 }, -- Thi�n M�n l�nh
        --{ tbProp = { 2, 1, 50020 }, nCount = 1, nStatus = 1, nQuality = "%s anh h�ng c�i th�, ��nh b�i BOSS ��i Ho�ng Kim nh�n ���c %d %s" }, -- T�i h�a ph�ng linh
        --{ tbProp = { 2, 1, 50028 }, nCount = 1, nStatus = 1, nQuality = "%s anh h�ng c�i th�, ��nh b�i BOSS ��i Ho�ng Kim nh�n ���c %d %s" }, -- T�i c� ph�
    }
    if KsgLib:IsRate(5) then
        tinsert(tbAward, { tbProp = { 0, 105, 150 }, nCount = 1, nStatus = 1 })
    end
    if KsgLib:IsRate(5) then
        tinsert(tbAward, { tbProp = { 2, 1, 31321 }, nCount = 1, nStatus = 1 })
    end
    KsgAward:Give(tbAward, "Th��ng BOSS Th� Gi�i-K�ch s�t")
end

function _ksg_onActivityFinish_OpenSmallBox_WorldBoss(tEvent, data, para)
    local tbAward = {
        { tbProp = { 2, 1, 30425 }, nStack = 1, nStatus = 1 }, --Huy�t B� ��
        { tbProp = { 2, 1, 31241 }, nStack = 5, nStatus = 1 }, -- B�a C��ng H�a 13
        { tbProp = { 2, 1, 30847 }, nCount = 5, nStatus = 1 }, -- 5 H�i ti�n ��n
    }
    --KsgAward:DropEventBox(10)
    --KsgAward:TuiQua(10)
    KsgAward:Give(tbAward, "M� R��ng B�c Boss Th� Gi�i")
end

function _ksg_onActivityFinish_OpenGoldBox_WorldBoss(tEvent, data, para)
    --KsgAward:DropEventBox(20)
    --KsgAward:TuiQua(20)
    local tbAward = {
        { tbProp = { 2, 1, 31122 }, nStack = 1, nStatus = 1 }, -- m�nh m�t t�ch
        { tbProp = { 2, 1, 31194 }, nStack = 1, nStatus = 1 }, -- T�i H�a Ph�ng Linh
        { tbProp = { 2, 1, 30426 }, nStack = 2, nStatus = 1 }, -- T�i H�a Ph�ng Linh
        { tbProp = { 2, 1, 30847 }, nStack = 10, nStatus = 1 }, -- T�i H�a Ph�ng Linh
    }
    KsgAward:Give(tbAward, "M� R��ng V�ng Boss Th� Gi�i")
end

function _ksg_GetPunishRate()
    local nPunishRate = 1
    if not KsgPlayer:IsVipAccount() then
        nPunishRate = 2
    end
    return nPunishRate
end
