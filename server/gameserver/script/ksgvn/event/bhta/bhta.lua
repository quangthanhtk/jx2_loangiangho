Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\bhta\\bhta_head.lua")

LIB_txtData.szPattern = "[A-Za-z0-9����������Ƣ�����E����ѣ����������������������������������������������������Ʃ���������Ѫ������������������������������������������_]"

function bhta_Register()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p m�n ph�i, kh�ng th� b�o danh!")
    end

    if KsgPlayer:GetBigLevel() < BHTA_REGISTER_REQUIRE_LEADER_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("C�c h� ch�a ��t %s, kh�ng th� b�o danh!", KsgLib:Level2String(BHTA_REGISTER_REQUIRE_LEADER_LEVEL)))
    end

    if LIB_txtData:CheckString(GetTongName()) > 0 then
        return KsgNpc:Talk(g_szNpcName .. "T�n bang h�i c�c h� c� nhi�u ch� l� qu�, ta kh�ng bi�t ghi l�i nh� th� n�o n�a. Hay l� ��i bang kh�c �i nh�.")
    end

    if not KsgPlayer:IsBangChu() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� ��n g�p ta.")
    end

    if GetTongLevel() < BHTA_REGISTER_REQUIRE_TONG_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("Bang h�i c�c h� ch�a ��t ��n c�p %d, kh�ng th� ��ng k�.", BHTA_REGISTER_REQUIRE_TONG_LEVEL))
    end

    local nLastAssignTime = GetLastAssignTime()
    local nNow = GetTime()
    if (nNow - nLastAssignTime) < (BHTA_REGISTER_REQUIRE_LEADER_ASSIGN_TIME * 24 * 3600) then
        return KsgNpc:Talk(g_szNpcName .. format("Th�i gian t�i v� c�a c�c h� �t h�n %d ng�y, kh�ng th� ��ng k�.", BHTA_REGISTER_REQUIRE_LEADER_ASSIGN_TIME))
    end

    if _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. "Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng c�n ��ng k� th�m l�n n�a.")
    end

    local tbSay = {
        g_szNpcName .. format("Gi�i ��u Bang H�i Tinh Anh %d s�p b�t ��u kh�i tranh, ��i hi�p h�y nhanh ch�ng ��n b�o danh cho bang h�i c�a m�nh!!!", BHTA_SEASON)
    }
    tinsert(tbSay, "Ta mu�n b�o danh tham gia/bhta_RegisterConfirm")
    tinsert(tbSay, "\nTa mu�n suy ngh� th�m/no")
    KsgNpc:SayDialog(tbSay)

end

function bhta_RegisterConfirm()
    if _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. "Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng c�n ��ng k� th�m l�n n�a.")
    end

    local nPhe = "Tong"
    if GetTask(701) < 0 then
        nPhe = "Lieu"
    end
    local szTong = GetTongName()
    local szLogTong = szTong .. "	" .. GetAccount() .. "	" .. GetName() .. "	" .. GetLevel() .. "	" .. KsgPlayer:GetBigLevel() .. "	" .. nPhe .. "	" .. date("%Y-%m-%d %H:%M:%S")
    LIB_txtData:AddLine(szLogTong)
    KsgNpc:Talk(g_szNpcName .. format("Bang h�i c�c h� b�o danh Bang H�i Tinh Anh %d th�nh c�ng, xin ch�c m�ng.", BHTA_SEASON))
    AddGlobalNews(format("Ch�c m�ng bang h�i %s b�o danh th�nh c�ng Bang H�i Tinh Anh %d.", szTong, BHTA_SEASON))
    Msg2Global(format("Ch�c m�ng bang h�i %s b�o danh th�nh c�ng Bang H�i Tinh Anh %d.", szTong, BHTA_SEASON))
end

function _bhta_IsRegistered()
    LIB_txtData:Init(BHTA_REGISTER_FILE)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if GetTongName() == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName > 0 then
        return 1
    end
    return nil
end

function bhta_ViewRegister()
    local nTongLevel = IsTongMember() or 0
    if nTongLevel < 0 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p bang h�i, kh�ng th� xem t�nh h�nh ��ng k�.")
    end

    LIB_txtData:Init(BHTA_REGISTER_FILE)
    LIB_txtData:LoadMultiColumn()
    local nTongRegister = getn(LIB_txtData.tbTextData) or 0
    if (nTongRegister == nil or nTongRegister == 0) then
        return KsgNpc:Talk("Hi�n t�i ch�a c� bang h�i n�o ��ng k� tham gia.")
    end
    local tbSayDialog = {
        g_szNpcName .. format("Hi�n t�i c� <color=green>%d<color> bang h�i ��ng k� tham gia Bang H�i Tinh Anh %d", nTongRegister, BHTA_SEASON)
    }
    for i = 1, nTongRegister do
        tinsert(tbSayDialog, format("%d. %s", i, LIB_txtData.tbTextData[i][1]))
    end
    KsgNpc:PageSay(tbSayDialog, 2, 10)
end

function bhta_GetFlags()
    local nTongLevel = IsTongMember() or 0
    if nTongLevel < 0 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p bang h�i, kh�ng th� xem t�nh h�nh ��ng k�.")
    end
    if nTongLevel ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "Ch� c� bang ch� c�a bang h�i ��i di�n cho bang, m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>")
    end

    if not _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. format("Bang h�i c�c h� ch�a ��ng k� tham gia Bang H�i Tinh Anh %d.", BHTA_SEASON))
    end

    if not KsgLib:HasEnoughBagRoom(2, 300) then
        return
    end
    local nFlagCount = gf_GetTaskByte(TASKID_BHTA, TASKID_BHTA_BYTE_GET_FLAG)
    if nFlagCount >= BHTA_MAX_FLAG_NUM then
        return KsgNpc:Talk(g_szNpcName .. format("Qu� bang �� nh�n �� %d Tinh Anh L�nh K�!", BHTA_MAX_FLAG_NUM))
    end

    KsgAward:Give({ tbProp = { 2, 0, 30000 }, nStatus = 1, nCount = 1, nExpiredTime = 3 * 24 * 3600 }, format('Ho�n th�nh nh�n Tinh Anh L�nh K� BHTA %d', BHTA_SEASON))
    KsgTask:SetByte(TASKID_BHTA, TASKID_BHTA_BYTE_GET_FLAG, nFlagCount + 1)
    main()
end

function bhta_RegisterFight(nFlagType)

    local szTong = GetTongName() or ""
    if szTong == "" then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p b�t k� bang n�o. Kh�ng th� ��ng k� thi ��u.")
    end

    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p m�n ph�i, kh�ng th� ��ng k� thi ��u!")
    end

    if KsgPlayer:GetBigLevel() < BHTA_REGISTER_REQUIRE_MEMBER_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("C�c h� ch�a ��t %s, kh�ng th� ��ng k� thi ��u!", KsgLib:Level2String(BHTA_REGISTER_REQUIRE_MEMBER_LEVEL)))
    end

    local nJoinTime = GetJoinTongTime()
    local nDayCount = floor((GetTime() - nJoinTime) / (BHTA_REGISTER_REQUIRE_MEMBER_ASSIGN_TIME * 24 * 3600))
    if nDayCount <= 1 then
        return KsgNpc:Talk(g_szNpcName .. format("Th�i gian gia nh�p bang c�a c�c h� �t h�n %d ng�y, kh�ng th� ��ng k� thi ��u!", BHTA_REGISTER_REQUIRE_MEMBER_ASSIGN_TIME))
    end

    if not _bhta_IsRegistered() then
        return KsgNpc:Talk(g_szNpcName .. "Bang h�i c�a c�c h� kh�ng c� trong danh s�ch thi ��u.")
    end

    if KsgTask:GetByte(TASKID_BHTA, TASKID_BHTA_BYTE_REGISTER_FIGHT) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� ��ng k� tham gia thi ��u r�i!")
    end

    if KsgItem:Count(2, 0, 30000) == 0 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� l� ai? Trong tay kh�ng c� Tinh Anh L�nh K�, ch� ��n xem n�o nhi�t �?")
    end

    --- Check ��ng k� v� s� l��ng �a ��ng k� ---
    local szAccount = GetAccount()
    local szPlayerName = GetName()
    local nMember = 0
    local nRegisterCheck = 0
    LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
    LIB_txtData:LoadMultiColumn()
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] and szAccount == LIB_txtData.tbTextData[i][2] then
            nRegisterCheck = 1
            break
        end
        if szTong == LIB_txtData.tbTextData[i][1] then
            nMember = nMember + 1
        end
    end
    if nRegisterCheck == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� c� t�n trong danh s�ch thi ��u, kh�ng c�n ��ng k� n�a.")
    end

    if nMember >= BHTA_MAX_FLAG_NUM then
        return KsgNpc:Talk(g_szNpcName .. format("Ta �� c� trong tay danh s�ch %d ng��i tham d� c�a qu� Bang, r�t ti�c c�c h� �� ��n tr�...", BHTA_MAX_FLAG_NUM))
    end

    --- Check s� l��ng h� ph�i ---
    local nRoute = GetPlayerRoute()
    local nRouteCount = 0
    LIB_txtData:Init(BHTA_CHECKROUTE_FILE)
    LIB_txtData:LoadMultiColumn()

    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] and tonumber(nRoute) == tonumber(LIB_txtData.tbTextData[i][2]) then
            nRouteCount = nRouteCount + 1
        end
    end

    if nRouteCount >= BHTA_MAX_ROUTER_MEMBER then
        return KsgNpc:Talk(g_szNpcName .. format("�� �� %d cao th� thu�c h� ph�i nh� c�c h�, kh�ng th� ��ng k� th�m.", BHTA_MAX_ROUTER_MEMBER))
    end

    --- Check s� l��ng nguy�n so�i ---
    local nTeamSize = GetTeamSize()
    local nNguyenSoaiCount = 0
    LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
    LIB_txtData:LoadMultiColumn()

    if nFlagType == BHTA_FLAG_TYPE_NGUYEN_SOAI then
        for i = 1, getn(LIB_txtData.tbTextData) do
            if LIB_txtData.tbTextData[i][7] == "NguyenSoai" then
                nNguyenSoaiCount = nNguyenSoaiCount + 1
            end
        end

        if nNguyenSoaiCount >= BHTA_MAX_NGUYENSOAI_NUMBER then
            return KsgNpc:Talk(g_szNpcName .. format("Bang h�i c�c h� �� ��ng k� �� %d Nguy�n So�i.", BHTA_MAX_NGUYENSOAI_NUMBER))
        end

        ----Check t� ��i v�i bang ch� khi ��ng k�
        if nTeamSize > BHTA_MAX_NGUYENSOAI_NUMBER + 1 then
            return KsgNpc:Talk(g_szNpcName .. format("T�i �a ch� ���c t� ��i %d ng��i, v� ch� ���c c� %d ng��i s� h�u trang b� Nguy�n So�i.", BHTA_MAX_NGUYENSOAI_NUMBER + 1, BHTA_MAX_NGUYENSOAI_NUMBER))
        end
        if IsTongMaster() == 0 then
            local nOldIndex = PlayerIndex
            local nTongMaster = 0
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i)
                if IsTongMaster() == 1 then
                    nTongMaster = 1
                    break
                end
            end
            PlayerIndex = nOldIndex

            if nTongMaster == 0 then
                return KsgNpc:Talk(g_szNpcName .. "C�c h� c�n t� ��i v�i Bang ch�")
            end
        end
    end

    if DelItem(2, 0, 30000, 1) == 1 then
        LIB_txtData:Init(BHTA_CHECKROUTE_FILE)
        LIB_txtData:LoadMultiColumn()
        LIB_txtData:AddLine(szTong .. "	" .. nRoute)

        LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
        LIB_txtData:LoadMultiColumn()
        local szPhe = "Tong"
        if GetTask(701) < 0 then
            szPhe = "Lieu"
        end
        local szData = ""
        if nFlagType == BHTA_FLAG_TYPE_NGUYEN_SOAI then
            szData = szTong .. "	" .. szAccount .. "	" .. szPlayerName .. "	" .. nRoute .. "	" .. KsgPlayer:GetBigLevel() .. "	" .. szPhe .. "	" .. "NguyenSoai"
        elseif nFlagType == BHTA_FLAG_TYPE_NORMAL then
            szData = szTong .. "	" .. szAccount .. "	" .. szPlayerName .. "	" .. nRoute .. "	" .. KsgPlayer:GetBigLevel() .. "	" .. szPhe .. "	" .. "Thuong"
        end
        LIB_txtData:AddLine(szData)

        KsgTask:SetByte(TASKID_BHTA, TASKID_BHTA_BYTE_REGISTER_FIGHT, 1) -- Set �� ��ng k�
        KsgAward:Give({ tbProp = { 2, 0, 30001 }, nStatus = 1, nCount = 1, nExpiredTime = 30 * 24 * 3600 }, 1, 'Nh�n V� l�m th�p nh� s�')
        KsgNpc:Talk(g_szNpcName .. format("Ch�c m�ng ��i hi�p ��ng k� thi ��u Bang H�i Tinh Anh %d th�nh c�ng. H�y c� g�ng l�n nh�!", BHTA_SEASON))
        AddGlobalNews(format("Ch�c m�ng ��i hi�p <color=yellow>%s<color> �� b�o danh <color=yellow>Bang H�i Tinh Anh %d<color> th�nh c�ng.", szPlayerName, BHTA_SEASON))
        Msg2Global(format("Ch�c m�ng ��i hi�p %s �� b�o danh Bang H�i Tinh Anh %d th�nh c�ng.", szPlayerName, BHTA_SEASON))
    end
end

function bhta_ViewRegisterFightList(nViewId)
    LIB_txtData:Init(BHTA_REGISTER_FIGHT_FILE)
    LIB_txtData:LoadMultiColumn()
    local tbListBaoDanh = {}
    for i = 1, getn(LIB_txtData.tbTextData) do
        if tbListBaoDanh[LIB_txtData.tbTextData[i][1]] then
            tinsert(tbListBaoDanh[LIB_txtData.tbTextData[i][1]], LIB_txtData.tbTextData[i][3])
        else
            tbListBaoDanh[LIB_txtData.tbTextData[i][1]] = { LIB_txtData.tbTextData[i][3] }
        end
    end
    local tbSay = {
        format(g_szNpcName .. "Danh s�ch bang h�i v� th�nh vi�n ��ng k� tham gia Bang H�i Tinh Anh %d", BHTA_SEASON)
    }
    local nIdx = 0
    for k, v in pairs(tbListBaoDanh) do
        nIdx = nIdx + 1
        local nMember = 0
        local szListName = ""
        for i = 1, getn(v) do
            local szJoin = ", "
            if i == getn(v) then
                szJoin = ""
            end
            nMember = nMember + 1
            szListName = szListName .. v[i] .. szJoin
        end
        if nViewId == nIdx then
            return KsgNpc:Talk(format(g_szNpcName .. "Danh s�ch <color=red>%d/%d<color> th�nh vi�n ��ng k� tham gia thi ��u Bang H�i Tinh Anh %d c�a bang <color=gold>%s<color> bao g�m:<enter><color=yellow>%s<color>", nMember, BHTA_MAX_FLAG_NUM, BHTA_SEASON, k, szListName), nil, "bhta_ViewRegisterFightList")
        end
        tinsert(tbSay, format("Bang h�i %s �� ��ng k� %d th�nh vi�n (nh�n xem chi ti�t)/#bhta_ViewRegisterFightList(%d)", k, nMember, nIdx))
    end

    KsgNpc:PageSay(tbSay, 2, 10)

end

function bhta_About(page)
    local msgs = {
        {
            format("<color=green>Long H� S�<color>: T� <color=yellow> %s ��n h�t %s<color>, c�c bang ch� c�a bang h�i ��i di�n cho m�i bang c� th� ��n g�p Long H� S� �� nh�n <color=green>%d Tinh Anh L�nh K�<color>.\n", KsgDate:ToString(BHTA_GIVE_FLAG_START_DATE), KsgDate:ToString(BHTA_GIVE_FLAG_END_DATE), BHTA_MAX_FLAG_NUM),
            "Bang ch� c� tr�ch nhi�m ph�n ph�t Tinh Anh L�nh K� cho c�c th�nh vi�n tham gia gi�i ��u Bang H�i Tinh Anh. C�c th�nh vi�n c�a bang h�i khi ��ng k� ph�i c� �t nh�t <color=red>1 Tinh Anh L�nh K�<color> trong h�nh trang c�a m�nh, v� ph�i gia nh�p Bang �t nh�t <color=red>3 ng�y<color>\n",
        },
        {
            "Ch� �: \n",
            " - Ch� c� bang ch� c�a bang h�i ��i di�n cho m�i bang m�i c� th� nh�n Tinh Anh L�nh K�.\n",
            format(" - M�i bang h�i ch� c� th� nh�n t�i �a <color=red>%d Tinh Anh L�nh K�<color> t� Long H� S�.\n", BHTA_MAX_FLAG_NUM),
            format(" - M�i bang h�i ch� ���c ��ng k� t�i �a <color=red>%d<color> nh�n v�t c� qu�n h�m <color=red>Nguy�n So�i.<color>\n", BHTA_MAX_NGUYENSOAI_NUMBER)
        },
        {
            " - M�i Tinh Anh L�nh K� l� 1 t�m v� �� ��ng k� tham gia gi�i ��u Bang H�i Tinh Anh. V� v�y, bang ch� ph�i c� tr�ch nhi�m khi ph�n ph�t Tinh Anh L�nh K� cho c�c th�nh vi�n tham gia thi ��u gi�i.\n",
            " - Khi n�p th�nh c�ng <color=green>1 Tinh Anh L�nh K�<color> cho Long H� S�, h� th�ng s� t� ��ng ghi nh�n c�c th�ng tin c�a nh�n v�t.\n",
            format(" - N�p <color=green>Tinh Anh L�nh K� Nguy�n So�i<color> th� c�n ph�i t� ��i v�i bang ch�, t� ��i ch� ���c t�i �a %d ng��i v�i t�i �a %d ng��i s� h�u trang b� Nguy�n So�i.\n", BHTA_MAX_NGUYENSOAI_NUMBER + 1, BHTA_MAX_NGUYENSOAI_NUMBER),
            " - M�i nh�n v�t ch� c� th� n�p t�i �a 1 Tinh Anh L�nh K� cho Long H� S�.\n",
        },
    }
    local tCallback = { "#bhta_About(2)", "#bhta_About(3)", "main" };
    local msg = "";
    for k, v in msgs[page] do
        msg = msg .. v;
    end
    Talk(1, tCallback[page], msg)
end