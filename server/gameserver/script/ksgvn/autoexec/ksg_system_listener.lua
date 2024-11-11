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
        KsgAward:Give({ tbProp = { 2, 97, 379 }, nStatus = 4 }, "Th­ëng Mèc PB 5")
    end
    if mod(nJoinTimes, 10) == 0 then
        KsgAward:Give({ tbProp = { 2, 97, 378 }, nStatus = 4 }, "Th­ëng Mèc PB 10")
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
        [1] = { -- Th«n trang
            nEventBox = 10,
            nHuyChuong = 1,
        },
        [2] = { -- Th¶o cèc
            nEventBox = 10,
            nHuyChuong = 1,
        },
        [3] = { -- Thµnh tr×
            nEventBox = 15,
            nHuyChuong = 1,
        },
        [4] = { -- Nh¹n M«n Quan
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
        -- Th¾ng
        nBonusRate = 1 -- 100%
    end

    nAwardRate = nAwardRate + nBonusRate

    local tbAdditionAward = {
        { tbProp = { 2, 1, 30499 }, nStatus = 4, nStack = tbBattleAwardCfg.nHuyChuong * nAwardRate }, -- Huy ch­¬ng anh hïng
    }

    KsgAward:Give(tbAdditionAward, "Tèng Liªu - Th­ëng Thªm")
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
        -- Th¾ng
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
        -- Th¾ng x2
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
        -- Th¾ng x2
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
        -- Th¾ng x2
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
        { tbProp = { 2, 0, 554 }, nStack = 1, nStatus = 1, nExpiredTime = 7 * 24 * 3600, nRate = 5 }, --Tu ch©n yÕu quyÕt
        { tbProp = { 2, 1, 30311 }, nStack = 1, nStatus = 1, nRate = 40 }, --Th¸nh vËt s­ m«n
        { tbProp = { 2, 1, 50028 }, nStack = 1, nStatus = 1, nRate = 0.5, nQuality = "%s hoµn thµnh nhiÖm vô S­ M«n, ®­îc ch­ëng m«n ban tÆng %d %s!" }, --Cæ phæ - Tói tµn quyÓn
    }

    local nFaction = KsgPlayer:GetFaction()
    if g_tbFaction_LenhBaiSuMon[nFaction] then
        tinsert(tbAwardLuck, { tbProp = { 2, 0, g_tbFaction_LenhBaiSuMon[nFaction] }, nStack = 1, nStatus = 1, nRate = 30 }) -- lÖnh bµi s­ m«n
    end

    KsgAward:Give(tbAwardLuck, 'Nv S­ M«n-Th­ëng may m¾n')
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
        { tbProp = { 2, 5, 204 }, nStack = 1, nStatus = 1 }, --Thiªn Cang
        { tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 1 }, -- Thiªn M«n lÖnh
        --{ tbProp = { 2, 1, 50020 }, nCount = 1, nStatus = 1, nQuality = "%s anh hïng c¸i thÕ, ®¸nh b¹i BOSS §¹i Hoµng Kim nhËn ®­îc %d %s" }, -- Tói háa phông linh
        --{ tbProp = { 2, 1, 50028 }, nCount = 1, nStatus = 1, nQuality = "%s anh hïng c¸i thÕ, ®¸nh b¹i BOSS §¹i Hoµng Kim nhËn ®­îc %d %s" }, -- Tói cæ phæ
    }
    if KsgLib:IsRate(5) then
        tinsert(tbAward, { tbProp = { 0, 105, 150 }, nCount = 1, nStatus = 1 })
    end
    if KsgLib:IsRate(5) then
        tinsert(tbAward, { tbProp = { 2, 1, 31321 }, nCount = 1, nStatus = 1 })
    end
    KsgAward:Give(tbAward, "Th­ëng BOSS ThÕ Giíi-KÝch s¸t")
end

function _ksg_onActivityFinish_OpenSmallBox_WorldBoss(tEvent, data, para)
    local tbAward = {
        { tbProp = { 2, 1, 30425 }, nStack = 1, nStatus = 1 }, --HuyÕt Bå §Ò
        { tbProp = { 2, 1, 31241 }, nStack = 5, nStatus = 1 }, -- Bïa C­êng Hãa 13
        { tbProp = { 2, 1, 30847 }, nCount = 5, nStatus = 1 }, -- 5 Håi tiªn ®¬n
    }
    --KsgAward:DropEventBox(10)
    --KsgAward:TuiQua(10)
    KsgAward:Give(tbAward, "Më R­¬ng B¹c Boss ThÕ Giíi")
end

function _ksg_onActivityFinish_OpenGoldBox_WorldBoss(tEvent, data, para)
    --KsgAward:DropEventBox(20)
    --KsgAward:TuiQua(20)
    local tbAward = {
        { tbProp = { 2, 1, 31122 }, nStack = 1, nStatus = 1 }, -- m¶nh mËt tÞch
        { tbProp = { 2, 1, 31194 }, nStack = 1, nStatus = 1 }, -- Tói Háa Phông Linh
        { tbProp = { 2, 1, 30426 }, nStack = 2, nStatus = 1 }, -- Tói Háa Phông Linh
        { tbProp = { 2, 1, 30847 }, nStack = 10, nStatus = 1 }, -- Tói Háa Phông Linh
    }
    KsgAward:Give(tbAward, "Më R­¬ng Vµng Boss ThÕ Giíi")
end

function _ksg_GetPunishRate()
    local nPunishRate = 1
    if not KsgPlayer:IsVipAccount() then
        nPunishRate = 2
    end
    return nPunishRate
end
