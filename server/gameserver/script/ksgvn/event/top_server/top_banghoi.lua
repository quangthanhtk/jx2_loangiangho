Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\top_server\\top_server_head.lua")

LIB_txtData.szPattern = "[A-Za-z0-9����������Ƣ�����E����ѣ����������������������������������������������������Ʃ���������Ѫ������������������������������������������_]"
g_szLogTitle = "�ua Top Bang"

function eventTop_ShowMenuTopBang()

    local szTong = KsgPlayer:GetTongName()
    if not szTong then
        return KsgNpc:FormalTalk(g_szNpcName ,  "ch�a gia nh�p bang h�i, kh�ng th� tham gia ho�t ��ng n�y.")
    end

    local nDate = KsgDate:Today()
    local nGetTongAwardDate = KsgLib:GetSrvCfg('tbTimeTop').nGetTongAwardDate
    local tbSay = {
        g_szNpcName .. format("<color=gold>%s<color> �� khai m�, tri�u ��nh giao cho ta tr�ng tr�ch ph�t th��ng cho c�c Bang h�i c� c�ng hi�n l�n ��ng th�i �� c�c bang h�i c� c� h�i c�ng nhau tranh t�i. C�c h� c� mu�n tham gia kh�ng?<enter>(Th�i gian nh�n th��ng l� <color=green>%s<color>)", KsgLib:GetSrvCfg('szName'), KsgDate:ToString(nGetTongAwardDate))
    }
    if KsgLib:IsInDualTopTime() then
        tinsert(tbSay, "Ta mu�n ��ng k� �ua top c�ng hi�n bang h�i/register")
        tinsert(tbSay, "Ta mu�n c�ng hi�n cho bang h�i h�ng m�nh/showMenuContribute")
    end
    tinsert(tbSay, "Xem �i�m c�ng hi�n c�a c�c bang h�i/checkRank")
    if nDate == nGetTongAwardDate or KsgPlayer:IsGM() then
        tinsert(tbSay, format("Th�nh vi�n nh�n th��ng bang h�i h�ng 1,2,3/#getAward(%d)", TOP_BANG_AWARD_TYPE_MEMBER))
        if KsgPlayer:IsBangChu() then
            tinsert(tbSay, format("Bang ch� nh�n th��ng bang h�i h�ng 1,2,3/#getAward(%d)", TOP_BANG_AWARD_TYPE_LEADER))
        end
    end
    tinsert(tbSay, "\nTa ch� ng� qua th�i/no")
    KsgNpc:SayDialog(tbSay)
end

function register()
    local szTong = GetTongName()
    local szAcc = GetAccount()
    local szRole = GetName()
    local nLevel = GetLevel()
    if nLevel < TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("��ng c�p c�a c�c h� kh�ng �� %d, kh�ng th� ��ng k� tham gia!", TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL))
    end
    if not KsgPlayer:IsMaxSkill55() then
        return KsgNpc:Talk(g_szNpcName .. "K� n�ng skill 55 c�a c�c h� ch�a ��. N�u mu�n ��ng k� tham gia, h�y n�ng c�p k� n�ng c�p 55 r�i ��n g�p ta.");
    end
    if not KsgPlayer:IsBangChu() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� c�c h� ��n g�p ta.")
    end
    if LIB_txtData:CheckString(szTong) > 0 then
        return KsgNpc:Talk(g_szNpcName .. "T�n bang h�i c�c h� c� nhi�u ch� l� qu�, ta kh�ng bi�t ghi l�i nh� th� n�o n�a. Hay l� ��i bang kh�c �i nh�.")
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName > 0 then
        return KsgNpc:Talk(g_szNpcName .. "Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng c�n ��ng k� th�m l�n n�a.")
    end
    local szLogAward = szTong .. "	" .. szAcc .. "	" .. szRole .. "	0"
    LIB_txtData:AddLine(szLogAward)
    KsgNpc:Talk(g_szNpcName .. "Xin ch�c m�ng! Bang h�i c�c h� b�o danh th�nh c�ng v�o cu�c �ua vinh danh bang h�i danh gi� , h�y b�o tin cho c�c th�nh vi�n t�ch c�c x�y d�ng danh ti�ng bang h�i.")
    gf_WriteLogEx(g_szLogTitle, "nh�n", 1, "��ng k� th�nh c�ng")
end

function showMenuContribute()
    local szTong = KsgPlayer:GetTongName()
    if not szTong then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� kh�ng c� trong danh s�ch b�t k� bang n�o. H�y t�m ch� gia nh�p tr��c �� nh�.")
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName == 0 then
        return KsgNpc:Talk(g_szNpcName .. "Bang h�i c�c h� kh�ng c� trong danh s�ch ��ng k� vinh danh.")
    end
    local tbSay = { g_szNpcName .. "��ng ng��i th�m s�c m�nh. Ng��i h�y c�ng hi�n cho bang h�i b�ng h�t kh� n�ng m�nh c�." }
    for nIndex, tbContribCfg in g_tbTopBangMaterialCfg do
        tinsert(tbSay, tbContribCfg.szDesc .. "/#contribute(" .. nIndex .. ")")
    end
    tinsert(tbSay, "\nTa ch� ng� qua th�i/no")
    KsgNpc:SayDialog(tbSay)
end

function contribute(nOption)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk("Tr�ng th�i hi�n t�i kh�ng th� c�ng hi�n.")
    end
    if KsgPlayer:GetLevel() < TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("��ng c�p c�a c�c h� kh�ng �� %d, kh�ng th� tham gia c�ng hi�n!", TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL))
    end
    if not KsgPlayer:IsMaxSkill55() then
        return KsgNpc:Talk(g_szNpcName .. "K� n�ng skill 55 c�a c�c h� ch�a ��, kh�ng th� tham gia c�ng hi�n!");
    end
    local szName = GetName()
    local szTong = GetTongName() or ""
    local nPoint = KsgTask:GetPosValue(TASKID_TOP_BANG, 1, 4)
    local nAddPoint = g_tbTopBangMaterialCfg[nOption].nPoint
    if (nPoint + nAddPoint) > MAX_CONTRIBUTE_POINT_PER_DAY then
        return KsgNpc:Talk(g_szNpcName .. "M�c c�ng hi�n ng��i ch�n v��t qu� s� �i�m t�i �a m�i ng�y. H�y ch�n m�c kh�c ho�c mai quay l�i nh�.")
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nBang = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nBang = i
            break
        end
    end
    if nBang == 0 then
        return
    end
    if not KsgLib:PayMaterial(g_tbTopBangMaterialCfg[nOption].tbCondition) then
        return
    end
    KsgTask:SetPosValue(TASKID_TOP_BANG, (nPoint + nAddPoint), 1, 4)
    LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + nAddPoint
    sort(LIB_txtData.tbTextData, function(x, y)
        return tonumber(x[4]) > tonumber(y[4])
    end)
    LIB_txtData:SaveMultiColumn()
    if nAddPoint == 100 then
        AddGlobalNews(szName .. " �� c�ng hi�n 100 �i�m cho bang " .. szTong .. ". M�nh Th��ng Qu�n �� xu�t hi�n t�i bang " .. szTong .. ".")
    end
    local nNewRank = 10000
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nNewRank = i
            break
        end
    end
    if nBang >= nNewRank then
        if LIB_txtData.tbTextData[(nNewRank + 1)] ~= nil then
            AddGlobalNews(szName .. " �� gi�p bang h�i " .. LIB_txtData.tbTextData[nNewRank][1] .. " v��t qua bang h�i " .. LIB_txtData.tbTextData[(nNewRank + 1)][1] .. ". D��ng nh� bang " .. LIB_txtData.tbTextData[(nNewRank + 1)][1] .. " c� bi�u hi�n �u�i s�c.")
        end
    end
    KsgPlayer:Msg("B�n �� c�ng hi�n " .. nAddPoint .. " �i�m cho bang h�i.")
    gf_WriteLogEx(g_szLogTitle, "th�m", 1, "C�ng hi�n " .. nAddPoint .. " �i�m")
    showMenuContribute()
end

function checkRank()
    local tbData = {}
    tinsert(tbData, g_szNpcName .. "X�p h�ng Top c�ng hi�n c�a c�c Bang H�i hi�n t�i:\n")
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    for i = 1, getn(LIB_txtData.tbTextData) do
        local nIndex = floor(i / 9) + 1
        if tbData[nIndex] == nil then
            tinsert(tbData, g_szNpcName .. "X�p h�ng Top c�ng hi�n c�a c�c Bang H�i hi�n t�i:\n")
        end
        tbData[nIndex] = tbData[nIndex] .. "H�ng " .. i .. " - " .. "<color=yellow>" .. LIB_txtData.tbTextData[i][1] .. "<color>: <color=red>" .. LIB_txtData.tbTextData[i][4] .. " �i�m<color>\n"
    end
    for i = 1, getn(tbData) do
        KsgNpc:Talk(tbData[i])
    end
end

function getAward(nType)
    local szTong = GetTongName() or ""
    if szTong == "" then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p bang h�i, kh�ng th� nh�n th��ng.")
    end
    if nType == TOP_BANG_AWARD_TYPE_MEMBER then
        if KsgTask:GetPosValue(TASKID_TOP_BANG, 5, 5) == 1 then
            return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n th��ng, kh�ng th� nh�n th�m l�n n�a.")
        end
    else
        if KsgTask:GetPosValue(TASKID_TOP_BANG, 6, 6) == 1 then
            return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n th��ng, kh�ng th� nh�n th�m l�n n�a.")
        end
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 10000
    local nDiemCongHien = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            nDiemCongHien = LIB_txtData.tbTextData[i][4]
            break
        end

    end

    if tonumber(nDiemCongHien) < TOP_BANG_CONTRIBUTE_POINT_MIN then
        return KsgNpc:Talk(g_szNpcName .. format("�i�m c�ng hi�n kh�ng �� %d kh�ng th� nh�n th��ng �ua top.", TOP_BANG_CONTRIBUTE_POINT_MIN))
    end

    if nType == TOP_BANG_AWARD_TYPE_MEMBER then
        if nCheckTongName <= 3 then
            GetMemberAward(nCheckTongName)
        else
            KsgNpc:Talk(g_szNpcName .. "Bang h�i c�c h� kh�ng c� trong danh s�ch nh�n th��ng.")
        end
    else
        if nCheckTongName <= 3 then
            GetLeaderAward(nCheckTongName)
        else
            KsgNpc:Talk(g_szNpcName .. "Bang h�i c�c h� kh�ng c� trong danh s�ch nh�n th��ng.")
        end
    end
end

function canReceiveAward()
    local szTong = GetTongName() or ""
    if szTong == "" then
        return nil
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 10000
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName <= 3 then
        return 1
    end
    return nil
end

function GetMemberAward(nRank)

    if not canReceiveAward() then
        return KsgNpc:Talk("C�c h� kh�ng c� t�n trong danh s�ch nh�n th��ng!")
    end

    if not KsgLib:HasEnoughBagRoom(15, 300) then
        return
    end

    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.")
    end

    if KsgPlayer:GetBigLevel() < TOP_BANG_AWARD_REQUIRE_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("C�c h� ch�a ��t <color=red>%s<color>, kh�ng th� nh�n ph�n th��ng n�y!", KsgLib:Level2String(TOP_BANG_AWARD_REQUIRE_LEVEL)))
    end

    local nJoinTime = GetJoinTongTime()
    local nNow = GetTime()
    if KsgDate:DateDiff(nJoinTime, nNow) < TOP_BANG_MEMBER_AWARD_REQUIRE_JOIN_DAY then
        return KsgNpc:Talk(g_szNpcName .. format("Th�i gian gia nh�p c�a c�c h� �t h�n %d ng�y, kh�ng th� nh�n th��ng!", TOP_BANG_MEMBER_AWARD_REQUIRE_JOIN_DAY))
    end

    KsgAward:Give(g_tbTopBangAwardCfg.Member[nRank], "[Top Bang] Ph�n th��ng th�nh vi�n bang h�i h�ng " .. nRank)
    KsgTask:SetPosValue(TASKID_TOP_BANG, 1, 5, 5)
    KsgNpc:Talk(g_szNpcName .. "Nh�n th�nh c�ng ph�n t��ng d�nh cho th�nh vi�n bang h�ng " .. nRank)
end

function GetLeaderAward(nRank)
    if not KsgLib:HasEnoughBagRoom(25, 300) then
        return
    end

    if not KsgPlayer:IsBangChu() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� kh�ng ph�i bang ch�. N�u mu�n nh�n th��ng, h�y m�i bang ch� c�c h� ��n g�p ta.")
    end

    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.")
    end

    local nLastAssignTime = GetLastAssignTime()
    local nNow = GetTime()
    if KsgDate:DateDiff(nLastAssignTime, nNow) < TOP_BANG_LEADER_AWARD_REQUIRE_ASSIGN_DAY then
        return KsgNpc:Talk(g_szNpcName .. format("Th�i gian t�i v� c�a c�c h� �t h�n %d ng�y, kh�ng th� nh�n th��ng!", TOP_BANG_LEADER_AWARD_REQUIRE_ASSIGN_DAY))
    end

    KsgAward:Give(g_tbTopBangAwardCfg.Leader[nRank], "[Top Bang] Ph�n th��ng bang ch� bang h�i h�ng " .. nRank)
    KsgTask:SetPosValue(TASKID_TOP_BANG, 1, 6, 6)
    KsgNpc:Talk(g_szNpcName .. "Nh�n th�nh c�ng ph�n t��ng d�nh cho bang h�ng " .. nRank)
end


