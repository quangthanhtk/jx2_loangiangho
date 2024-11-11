Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\newbattles\\head.lua")
Include("\\script\\ksgvn\\functions\\battle_head.lua")
Import("\\script\\vng\\lib\\vnglib_textdata.lua")

g_szTitle = "<color=green>MÈ Binh Quan: <color>"

function battle_OpenMenu()
    local tSay = {
        g_szTitle .. "Ch‰n loπi chi’n tr≠Íng muËn mÎ.",
        "Nhπn M´n Quan-Chi’n tr≠Íng phÙ/battle_OpenNMQ_Sub",
        "ß„ng Nhπn M´n Quan-Chi’n tr≠Íng phÙ/battle_CloseNMQ_Sub",
        "Nhπn M´n Quan-Chi’n dﬁch ch›nh/battle_OpenNMQ",
        "ß„ng Nhπn M´n Quan-Chi’n dﬁch ch›nh/battle_CloseNMQ",
        "Ng‰c M´n Quan-Chi’n dﬁch ch›nh/battle_OpenNMQ_1",
        "X„a giÌi hπn vµo chi’n tr≠Íng/battle_Before_ClearSignUp",
        "\nK’t thÛc ÆËi thoπi/no",
    }
    KsgNpc:SayDialog(tSay)
end

function battle_Before_ClearSignUp(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "X∏c nhÀn thao t∏c mÎ chi’n tr≠Íng Nhπn M´n Quan-Chi’n dﬁch ch›nh?",
            "X∏c nhÀn/#battle_Before_ClearSignUp(1)",
            "TrÎ lπi/battle_OpenMenu",
            "\nK’t thÛc ÆËi thoπi/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    battle_ClearSignUp()
    KsgPlayer:Talk("ß∑ x„a d˜ li÷u giÌi hπn chi’n tr≠Íng trÀn hi÷n tπi ho∆c trÀn sæp tÌi.")
end

function battle_OpenNMQ(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "X∏c nhÀn thao t∏c mÎ chi’n tr≠Íng Nhπn M´n Quan-Chi’n dﬁch ch›nh?",
            "X∏c nhÀn/#battle_OpenNMQ(1)",
            "TrÎ lπi/battle_OpenMenu",
            "\nK’t thÛc ÆËi thoπi/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return 0
    end
    WriteLog("[NewBattle]:Initialize Main-Battle")
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nHour = tonumber(date("%H"))
        if SubWorldID2Idx(200) >= 0 then
            AddLocalNews("Th∏m m∑ hÂi b∏o, Nhπn M´n Quan-chi’n dﬁch ch›nh sæp khai chi’n, mÍi c∏c vﬁ anh hÔng nhanh ch„ng b∏o danh.")
            Msg2Global("Th∏m m∑ hÂi b∏o, Nhπn M´n Quan-chi’n dﬁch ch›nh sæp khai chi’n, mÍi c∏c vﬁ anh hÔng nhanh ch„ng b∏o danh.")
        end
        battle_ClearSignUp()
        local nOldSubWorld = SubWorld
        SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 3)    --…ËŒ™XX3£¨◊¢“‚£¨’‚¿ÔµƒXXø…ƒ‹∫Õ∏±’Ω≥°µƒXX≤ª“ª—˘≈∂
        SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2])
        if RANDOM_CAMP_PLACE == 1 then
            SetGlbValue(GLB_RANDOM_PLACE_MAIN, random(0, 1))
        end
        if SubWorld >= 0 then
            WriteLog("[NewBattle]:Opening Main-Battle")
            OpenMission(tBTMSInfo[MAINBATTLE_ID][1])
        else
            WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld))
        end
        SubWorld = nOldSubWorld
    end
end

function battle_CloseNMQ(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "X∏c nhÀn thao t∏c mÎ chi’n tr≠Íng Nhπn M´n Quan-Chi’n dﬁch ch›nh?",
            "X∏c nhÀn Æ„ng/#battle_CloseNMQ(1)",
            "TrÎ lπi/battle_OpenMenu",
            "\nK’t thÛc ÆËi thoπi/no",
        }
        KsgNpc:SayDialog(tSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    local _, nCurGs = GetRealmType();
    if nCurGs == 1 then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nRetCode = WEnv.RETCODE_ERROR;
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
        if nGlobalState ~= 0 then
            local nOldSubWorld = SubWorld;
            SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
            if SubWorld >= 0 then
                WriteLog("[NewBattle]: Admin close Main-Battle");
                CloseMission(tBTMSInfo[MAINBATTLE_ID][1]);
                nRetCode = WEnv.RETCODE_SUCCESS;
            else
                WriteLog("[NewBattle]: Admin fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[MAINBATTLE_ID][2])..",SubWorld ID:"..tostring(SubWorld));
            end
            SubWorld = nOldSubWorld;
        end
    end
    return nRetCode;
end

function battle_OpenNMQ_1(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "X∏c nhÀn thao t∏c mÎ chi’n tr≠Íng Ng‰c M´n Quan-Chi’n dﬁch ch›nh?",
            "X∏c nhÀn/#battle_OpenNMQ_1(1)",
            "TrÎ lπi/battle_OpenMenu",
            "\nK’t thÛc ÆËi thoπi/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return 0
    end
    WriteLog("[NewBattle]:Initialize Main-Battle")
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nHour = tonumber(date("%H"))
        if SubWorldID2Idx(500) >= 0 then
            AddLocalNews("Th∏m m∑ hÂi b∏o, Ng‰c M´n Quan-chi’n dﬁch ch›nh sæp khai chi’n, mÍi c∏c vﬁ anh hÔng nhanh ch„ng b∏o danh.")
            Msg2Global("Th∏m m∑ hÂi b∏o, Ng‰c M´n Quan-chi’n dﬁch ch›nh sæp khai chi’n, mÍi c∏c vﬁ anh hÔng nhanh ch„ng b∏o danh.")
        end
        battle_ClearSignUp()
        local nOldSubWorld = SubWorld
        SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 3)    --…ËŒ™XX3£¨◊¢“‚£¨’‚¿ÔµƒXXø…ƒ‹∫Õ∏±’Ω≥°µƒXX≤ª“ª—˘≈∂
        SubWorld = SubWorldID2Idx(tBTMSInfo[PRIMARY_MAINBATTLE_ID][2])
        if RANDOM_CAMP_PLACE == 1 then
            SetGlbValue(GLB_RANDOM_PLACE_MAIN, random(0, 1))
        end
        if SubWorld >= 0 then
            WriteLog("[NewBattle]:Opening Main-Battle")
            OpenMission(tBTMSInfo[PRIMARY_MAINBATTLE_ID][1])
        else
            WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[PRIMARY_MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld))
        end
        SubWorld = nOldSubWorld
    end
end

function battle_OpenNMQ_Sub(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "X∏c nhÀn thao t∏c mÎ chi’n tr≠Íng Nhπn M´n Quan-Chi’n tr≠Íng phÙ?",
            "X∏c nhÀn/#battle_OpenNMQ_Sub(1)",
            "TrÎ lπi/OnUse",
            "ß„ng/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return 0
    end
    WriteLog("[NewBattle]:Initialize Sub-Battle")
    SetGlbValue(GLB_VILLAGE, 0)    --≤ªπ‹‘ı—˘£¨∂º∞—’Ω≥°µƒΩ·π˚«ÂµÙ
    SetGlbValue(GLB_RESOURCE, 0)
    SetGlbValue(GLB_EMPLACEMENT, 0)
    SetGlbValue(GLB_MAINBATTLE, 0)
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE)
        local nHour = tonumber(date("%H"))
        if nGlobalState == 0 then
            if SubWorldID2Idx(200) >= 0 then
                AddGlobalNews("Chi’n tr≠Íng Nhπn M´n Quan sæp khai chi’n, mÍi c∏c vﬁ anh hÔng nhanh ch„ng b∏o danh.")
                Msg2Global("Chi’n tr≠Íng Nhπn M´n Quan sæp khai chi’n, mÍi c∏c vﬁ anh hÔng nhanh ch„ng b∏o danh.")
            end
            battle_ClearSignUp()
            local nOldSubWorld = SubWorld
            SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 1)    --…ËŒ™XX1
            if RANDOM_CAMP_PLACE == 1 then
                SetGlbValue(GLB_RANDOM_PLACE_VILL, random(0, 1))
                SetGlbValue(GLB_RANDOM_PLACE_RESO, random(0, 1))
                SetGlbValue(GLB_RANDOM_PLACE_EMPL, random(0, 1))
            end
            for i = 1, 3 do
                SubWorld = SubWorldID2Idx(tBTMSInfo[i][2])
                if SubWorld >= 0 then
                    WriteLog("[NewBattle]:Opening Sub-Battle")
                    OpenMission(tBTMSInfo[i][1])
                else
                    WriteLog("[NewBattle]: Admin fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[i][2]) .. ",SubWorld ID:" .. tostring(SubWorld))
                end
            end
            SubWorld = nOldSubWorld
        else
            WriteLog("[NewBattle]:Global state error,value:" .. tostring(nGlobalState))
        end
    end
end

function battle_CloseNMQ_Sub(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "X∏c nhÀn thao t∏c Æ„ng chi’n tr≠Íng Nhπn M´n Quan-Chi’n tr≠Íng phÙ?",
            "X∏c nhÀn Æ„ng/#battle_CloseNMQ_Sub(1)",
            "TrÎ lπi/OnUse",
            "ß„ng/no",
        };
        KsgNpc:SayDialog(tSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    local _, nCurGs = GetRealmType();
    if nCurGs == 1 then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nRetCode = WEnv.RETCODE_ERROR;
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
        if nGlobalState ~= 0 then
            local nOldSubWorld = SubWorld;
            for i=1,3 do
                SubWorld = SubWorldID2Idx(tBTMSInfo[i][2]);
                if SubWorld >= 0 then
                    WriteLog("[NewBattle]: Admin close Sub-Battle");
                    CloseMission(tBTMSInfo[i][1]);
                    nRetCode = WEnv.RETCODE_SUCCESS;
                else
                    WriteLog("[NewBattle]: Admin fail to close Sub-Battle,Map ID:"..tostring(tBTMSInfo[i][2])..",SubWorld ID:"..tostring(SubWorld));
                end
            end
            SubWorld = nOldSubWorld;
        end
    end
    return nRetCode;
end

function battle_CanSignUp(nBattleType)
    if TONGLIEU_LIMIT_OPEN == 0 then
        return 1
    end
    LIB_txtData:Init(TONGLIEU_LIMIT_FILENAME)
    LIB_txtData:LoadMultiColumn()
    local nCurMacAddress = GetCurrentMacAddress()
    local nMacIdx = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        print(LIB_txtData.tbTextData[i][1])
        if "MAC_" .. nCurMacAddress == LIB_txtData.tbTextData[i][1] then
            nMacIdx = i
            break
        end
    end
    if nMacIdx == 0 then
        local szLog = "MAC_" .. nCurMacAddress .. "	" .. GetAccount() .. "	" .. nBattleType .. "	0"
        LIB_txtData:AddLine(szLog)
        return 1
    end
    if tonumber(LIB_txtData.tbTextData[nMacIdx][4]) >= TONGLIEU_MAX_PLAYER_SIGNUP then
        KsgNpc:Talk(format(g_szTitle .. "Hi÷n mÁi trÀn chÿ cho ph–p <color=gold>%d nh©n vÀt<color> b∏o danh tham gia TËng Li™u. Xin h∑y tham gia ti’p vµo trÀn sau.", TONGLIEU_MAX_PLAYER_SIGNUP))
        return nil
    end
    return 1
end

function battle_LogSignUp(nBattleType, nCamp)
    if TONGLIEU_LIMIT_OPEN == 0 then
        return 1
    end
    LIB_txtData:Init(TONGLIEU_LIMIT_FILENAME)
    LIB_txtData:LoadMultiColumn()
    local nCurMacAddress = GetCurrentMacAddress()
    local nMaxIdx = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if "MAC_" .. nCurMacAddress == LIB_txtData.tbTextData[i][1] then
            nMaxIdx = i
            break
        end
    end
    if nMaxIdx == 0 then
        local szLog = "MAC_" .. nCurMacAddress .. "	" .. GetAccount() .. "	" .. nBattleType .. "	0"
        LIB_txtData:AddLine(szLog)
        return 1
    end
    if tonumber(LIB_txtData.tbTextData[nMaxIdx][4]) >= 30 then
        return 0
    end
    LIB_txtData.tbTextData[nMaxIdx][4] = LIB_txtData.tbTextData[nMaxIdx][4] + 1
    LIB_txtData:SaveMultiColumn()
    return 1
end

function battle_ClearSignUp()
    LIB_txtData:Init(TONGLIEU_LIMIT_FILENAME)
    LIB_txtData:LoadMultiColumn()
    for i = 1, getn(LIB_txtData.tbTextData) do
        LIB_txtData.tbTextData[i][4] = 0
    end
    LIB_txtData:SaveMultiColumn()
end

function battle_ChangeTitle()
    local tSay = { "Thay ÆÊi qu©n hµm" }
    local nMax = 5
    if KsgPlayer:IsGM() then
        nMax = 6
    end
    for i = 3, nMax do
        local nBattleTitle = KsgLib:BattleRank2Title(i)
        if nBattleTitle then
            tinsert(tSay, format("ßÊi qu©n hµm thµnh %s/#battle_ChangeTitle_SelectCamp(%d)", nBattleTitle, i))
        end
    end
    tinsert(tSay, "\nRÍi kh·i/no")
    KsgNpc:SayDialog(tSay)
end

function battle_ChangeBattleRank(nCamp, nLevel, nConfirm)
    if nConfirm then
        nLevel = nLevel or 3
        local levelMap = {
            [3] = 50000,
            [4] = 80000,
            [5] = 120000,
            [6] = 240000,
        }
        local nPoint = levelMap[nLevel]
        local nTitle = KsgLib:BattleRank2Title(nLevel)
        if not nPoint or not nTitle then
            return
        end
        if (nCamp == 1) then
            --Gia nhÀp TËng≥
            SetTask(701, nPoint)    --Set Æi”m qu©n c´ng phe TËng
            SetTask(704, nLevel)    --Set qu©n hµm
            SetTask(745, nLevel)    --Set qu©n hµm cao nh t
            SetTask(702, nPoint)    --Set qu©n c´ng phe TËng cao nh t
            KsgPlayer:Msg("NhÀn Æ≠Óc qu©n hµm TËng " .. nTitle)
        elseif (nCamp == 2) then
            --Gia nhÀp li™u
            SetTask(701, -nPoint)    --Set Æi”m qu©n c´ng phe Li™u
            SetTask(704, -nLevel)    --Set qu©n hµm
            SetTask(746, -nLevel)    --Set qu©n hµm cao nh t
            SetTask(703, nPoint)    --Set qu©n c´ng phe Li™u cao nh t
            KsgPlayer:Msg("NhÀn Æ≠Óc qu©n hµm Li™u " .. nTitle)
        end
        return
    end
    local nTitle = KsgLib:BattleRank2Title(nLevel)
    if not nTitle then
        return KsgNpc:Talk("C p qu©n hµm l˘a ch‰n kh´ng hÓp l÷.")
    end
    local szMsg = 'Li™u '
    if nCamp == 1 then
        szMsg = "TËng "
    end
    szMsg = szMsg .. nTitle
    local tSay = {
        format("X∏c nhÀn thay ÆÊi qu©n hµm thµnh %s?", szMsg, nLevel),
        format("X∏c nhÀn/#battle_ChangeBattleRank(%d, %d, 1)", nCamp, nLevel),
        "Suy ngh‹ lπi mÈt chÛt/no"
    }
    return KsgNpc:SayDialog(tSay)
end

function battle_ChangeTitle_SelectCamp(nLevel)
    local nTitle = KsgLib:BattleRank2Title(nLevel)
    if nTitle then
        local tSay = {
            "Ch‰n phe gia nhÀp:",
            format("%s phe TËng/#battle_ChangeBattleRank(%d,%d)", nTitle, 1, nLevel),
            format("%s phe Li™u/#battle_ChangeBattleRank(%d,%d)", nTitle, 2, nLevel),
            "\nRÍi kh·i/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    KsgNpc:Talk("C p qu©n hµm l˘a ch‰n kh´ng hÓp l÷.")
end

function battle_CheckBattleEquipState(nItemIdx)
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx)
    local nEquipCamp, nRequireQuanHam, nRequireCongTrang, nEquipIdx = battle_GetBattleEquipInfo(nGenre, nDetail, nParticular)
    return battle_CheckBattleEquip(nEquipCamp, nRequireQuanHam, nRequireCongTrang, nEquipIdx)
end

function battle_GetBattleEquipInfo(nGenre, nDetail, nParticular)
    for nCamp, tbCampEquipCfg in g_tbBattleEquip do
        for nIndex, tbEquipCfg in tbCampEquipCfg do
            if nGenre == 0 and KsgLib:IsInTable(nDetail, tbEquipCfg.tbDetail) then
                for k = 1, getn(tbEquipCfg.tbRange) do
                    local nStartId = tbEquipCfg.tbRange[k][1]
                    local nEndId = tbEquipCfg.tbRange[k][2]
                    if nParticular >= nStartId and nParticular <= nEndId then
                        return nCamp, tbEquipCfg.nRequireQuanHam, tbEquipCfg.nRequireCongTrang, PackItemId(nGenre, nDetail, nParticular)
                    end
                end
            end
        end
    end
    return 0, 0, 0, 0
end

function battle_CheckBattleEquip(nEquipCamp, nRequireQuanHam, nRequireCongTrang, nEquipIdx)
    local nCurRank = KsgPlayer:GetBattleRank(1)
    local nCurRankPoint = KsgPlayer:GetHonor(1)
    local nPlayerCamp = 0
    if nEquipCamp == 0 then
        return -1
    end
    local szEquipName = GetItemName(UnPackItemId(nEquipIdx))
    if nCurRank < 0 then
        nPlayerCamp = LIAO_ID
    elseif nCurRank > 0 then
        nPlayerCamp = SONG_ID
    end
    if nPlayerCamp == ALL_ID then
        Msg2Player("Qu©n hµm cÒa bπn hi÷n mÌi lµ Binh s‹, kh´ng th” m∆c trang bﬁ " .. szEquipName)
        return 0
    end
    if (nEquipCamp ~= nPlayerCamp) then
        if nPlayerCamp == SONG_ID then
            Msg2Player("Ng≠¨i lµ phe TËng, kh´ng th” m∆c trang bﬁ phe Li™u")
        else
            Msg2Player("Ng≠¨i lµ phe Li™u, kh´ng th” m∆c trang bﬁ phe TËng")
        end
        return 0
    end
    local nEverRank = 0
    if GetTask(765) >= 15 then
        nEverRank = 6
    elseif GetTask(766) + GetTask(765) >= 10 then
        nEverRank = 5
    elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
        nEverRank = 4
    end
    nCurRank = abs(nCurRank)
    nCurRankPoint = abs(nCurRankPoint)

    if nCurRank < nEverRank then
        nCurRank = nEverRank
    end
    if nCurRank >= nRequireQuanHam
            or nCurRankPoint >= nRequireCongTrang --LongDaiKa: b· t›nh n®ng ÆÒ Æi”m lµ Æ≠Óc m∆c tπi Æ©y
    then
        return 1;
    end

    if nCurRank >= nRequireQuanHam and nRequireCongTrang == 1000000 then --LongDaiKa: mod c„ th” m∆c Thanh Long T≠Ìng
        return 1;
    end

    Msg2Player("Qu©n hµm cÒa bπn qu∏ th p, kh´ng th” m∆c " .. szEquipName)
    return 0;
end
