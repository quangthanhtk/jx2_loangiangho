Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\phutu_functions.lua")

MAX_EXP_IN_TU_LUYEN_CHAU = 100e9
MAX_LINHKHI_EXCHANGE = 50000
MAX_LUYENDON_PER_TIME = 20

EXCHANGE_CHANKHI_RATE = 2
EXCHANGE_CHANKHI_RATE_VIP = 3

EXCHANGE_TINHHON_RATE = 1 -- 1 Tinh H�n ��i 1 H�i Ti�n ��n
EXCHANGE_NGUYETPHACH_RATE = 1 -- 1 Nguy�t Ph�ch ��i 1 Linh Ph�ch ��n


g_szTitle = "<color=green>Tu Luy�n Ch�u: <color>"

_g_tbLuyenDon = {
    [1] = {
        szName = "Tinh H�n",
        nLinhKhi = 2000,
        nPopur = 1000,
        nBigLevel = 1099,
        tbProp = { 2, 95, 3855 },
    },
    [2] = {
        szName = "Nguy�t Ph�ch",
        nLinhKhi = 5000,
        nPopur = 5000,
        nBigLevel = 1099,
        tbProp = { 2, 102, 232 },
    },
}

function OnUse(nItemIndex)
    local tSay = {
        g_szTitle .. "Linh kh� t� ph��ng �� quy t� v�o vi�n Linh Ch�u n�y.",

    }

    --LongDaiKa: ��ng t�nh n�ng ph� tu m�n ph�i
    --for nRouteNum, tbCfg in g_tbPhuTuCfg do
    --    local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
    --    if KsgPlayer:GetRoute() ~= nRoute and nRoute > 0 then
    --        tinsert(tSay, format("Thay ��i ��n %s /#phutu_ChangeFactionRoute(%d)", KsgPlayer:GetRouteName(nRoute), nRouteNum))
    --    end
    --end
    --local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    --if nOriginRoute ~= 0 and KsgPlayer:GetRoute() ~= nOriginRoute then
    --    tinsert(tSay, format("\nThay ��i ��n %s (Ph�i ch� tu)/phutu_ChangeFactionRoute", KsgPlayer:GetRouteName(nOriginRoute)))
    --end

    --tinsert(tSay, "\nLuy�n Linh ��n/tuluyenchau_LuyenDon")
    --if KsgPlayer:GetBigLevel() == 1099 then
        --tinsert(tSay, format("��i %d Tinh H�n l�y 1 H�i Ti�n ��n/tuluyenchau_Exchange1", EXCHANGE_TINHHON_RATE))
        --tinsert(tSay, format("��i %d Nguy�t Ph�ch l�y 1 Linh Ph�ch ��n/tuluyenchau_Exchange2", EXCHANGE_NGUYETPHACH_RATE))
    --end
    tinsert(tSay, "Chuy�n h�a Linh kh�/tuluyenchau_ChuyenHoaLinhKhi")
    tinsert(tSay, "\nLi�n quan t�i Tu Luy�n Ch�u/tuluyenchau_Intro")
    tinsert(tSay, "\nK�t th�c ��i tho�i/no")
    KsgNpc:SayDialog(tSay)
end

function tuluyenchau_Exchange1()
    local nHTDCount = KsgItem:Count(2, 95, 3855)
    local nMax = floor(nHTDCount / EXCHANGE_TINHHON_RATE)
    AskClientForNumber("tuluyenchau_ExchangeHTD", 0, nMax, "Nh�p s� l��ng H�i Ti�n ��n:")
end

function tuluyenchau_Exchange2()
    local nLPDCount = KsgItem:Count(2, 102, 232)
    local nMax = floor(nLPDCount / EXCHANGE_NGUYETPHACH_RATE)
    AskClientForNumber("tuluyenchau_ExchangeLPD", 0, nMax, "Nh�p s� l��ng Linh Ph�ch ��n:")
end

function tuluyenchau_ExchangeHTD(nCount, nConfirm)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "��i hi�p � tr�ng th�i b�t th��ng, kh�ng th� ti�n h�nh thao t�c n�y!")
    end
    if not nCount or nCount <= 0 then
        return
    end
    if not nConfirm then
        local tSay = {
            g_szTitle .. format("��i hi�p x�c nh�n mu�n ��i <color=green>%d H�i Ti�n ��n<color> l�y <color=gold>%d Tinh H�n<colo> sao?", nCount * EXCHANGE_TINHHON_RATE, nCount),
            format("��ng v�y/#tuluyenchau_ExchangeHTD(%d,1)", nCount, 1),
            "Ta suy ngh� l�i m�t l�t/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 95, 3855 }, nCount = nCount * EXCHANGE_TINHHON_RATE }
        },
        nBigLevel = 1099
    }
    if KsgLib:PayMaterial(tbCondition) then
        KsgAward:Give({ tbProp = { 2, 1, 30847 }, nStack = nCount, nStatus = 4 }, "��i Tinh H�n l�y H�i Ti�n ��n")
    end
end

function tuluyenchau_ExchangeLPD(nCount, nConfirm)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "��i hi�p � tr�ng th�i b�t th��ng, kh�ng th� ti�n h�nh thao t�c n�y!")
    end
    if not nCount or nCount <= 0 then
        return
    end
    if not nConfirm then
        local tSay = {
            g_szTitle .. format("��i hi�p x�c nh�n mu�n ��i <color=green>%d Linh Ph�ch ��n<color> l�y <color=gold>%d Nguy�t Ph�ch<colo> sao?", nCount * EXCHANGE_NGUYETPHACH_RATE, nCount),
            format("��ng v�y/#tuluyenchau_ExchangeHTD(%d,1)", nCount, 1),
            "Ta suy ngh� l�i m�t l�t/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 102, 232 }, nCount = nCount * EXCHANGE_NGUYETPHACH_RATE }
        },
        nBigLevel = 1099
    }
    if KsgLib:PayMaterial(tbCondition) then
        KsgAward:Give({ tbProp = { 2, 1, 31239 }, nStack = nCount, nStatus = 4 }, "��i Nguy�t Ph�ch l�y Linh Ph�ch ��n")
    end
end

function tuluyenchau_Intro()
    local talk1 = g_szTitle .. "S� d�ng Tu Luy�n Ch�u, ng��i ch�i c� th� ti�n h�nh ��a linh kh� v�o Linh Ch�u <color=yellow> M�i 1 tri�u �i�m kinh nghi�m s� ��i ���c 1 �i�m linh kh�<color>"
    talk1 = talk1 .. "<enter>Linh kh� c�ng c� th� r�t ra v� ��i th�nh �i�m kinh nghi�m t��ng �ng (1 linh kh� = 1 tri�u kinh nghi�m, m�i l�n r�t ra m�t 1 v�ng/1 �i�m linh kh� )"
    talk1 = talk1 .. "<enter>S� linh kh� t�i �a Linh Ch�u c� th� ch�a l� <color=green>100.000 �i�m (200.000 �i�m ��i v�i danh ph�n ��i Hi�p)<color> Khi linh kh� ��y s� kh�ng th� ch�a th�m."
    local talk2 = g_szTitle .. "Ngo�i ra S� D�ng Tu Luy�n Ch�u c�n c� th� luy�n ch� c�c lo�i �an D��c d�ng cho kinh nghi�m H�a C�nh."
    talk2 = talk2 .. "<enter>Luy�n <color=red>Tinh H�n<color> c�n <color=yellow>2.000 �i�m linh kh� v� 1000 �i�m tu luy�n<color> <color=gray>(Chuy�n sinh 10 c�p 99 m�i c� th� luy�n lo�i �an d��c n�y)<color>"
    talk2 = talk2 .. "<enter>Luy�n <color=red>Nguy�t Ph�ch<color> c�n <color=yellow>5.000 �i�m linh kh� v� 5000 �i�m tu luy�n<color> <color=gray>(Chuy�n sinh 10 c�p 99 m�i c� th� luy�n �an d��c n�y)<color>"
    talk2 = talk2 .. "<enter><color=yellow>�an D��c luy�n t� Tu Luy�n Ch�u s� kh�a v� kh�ng c� h�n s� d�ng."
    local talk3 = g_szTitle .. "Linh Kh� c�n c� th� chuy�n h�a th�nh Ch�n Kh� t�i �an �i�n, <color=yellow>M�i �i�m Linh Kh� c� th� chuy�n h�a t�i �a ���c 2 �i�m Ch�n Kh� (3 �i�m ��i v�i danh ph�n ��i Hi�p)"
    Talk(3, "", talk1, talk2, talk3)
end

function tuluyenchau_LuyenDon(nLinhDonIndex)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "��i hi�p � tr�ng th�i b�t th��ng, kh�ng th� ti�n h�nh thao t�c n�y!")
    end
    if nLinhDonIndex and _g_tbLuyenDon[nLinhDonIndex] then
        local tbLuyenDon = _g_tbLuyenDon[nLinhDonIndex]
        local tSay = {
            g_szTitle .. format("Luy�n 1 <color=gold>%s<color> c�n c� �� <color=red>%d Linh Kh�, %d �i�m Tu Luy�n v� ��t %s<color> ��i hi�p x�c ��nh mu�n luy�n ch�?", tbLuyenDon.szName, tbLuyenDon.nLinhKhi, tbLuyenDon.nPopur, KsgLib:Level2String(tbLuyenDon.nBigLevel)),
            format("��ng v�y/#tuluyenchau_LuyenDon_Submit(%d)", nLinhDonIndex),
            format("\nTa suy ngh� l�i m�t l�t/no"),
        }
        return KsgNpc:SayDialog(tSay)
    end
    local tSay = {
        g_szTitle .. "��i Hi�p mu�n luy�n lo�i linh ��n n�o.",
    }
    for nIndex, tbCfg in _g_tbLuyenDon do
        tinsert(tSay, format("Ta mu�n luy�n %s/#tuluyenchau_LuyenDon(%d)", tbCfg.szName, nIndex))
    end
    tinsert(tSay, "\nT�m th�i ch�a mu�n luy�n/no")
    KsgNpc:SayDialog(tSay)
end

function tuluyenchau_LuyenDon_Submit(nIndex, nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "��i hi�p � tr�ng th�i b�t th��ng, kh�ng th� ti�n h�nh thao t�c n�y!")
    end
    if not _g_tbLuyenDon[nIndex] then
        return
    end
    local tbLuyenDon = _g_tbLuyenDon[nIndex]
    if nNumber and nNumber > 0 then
        local tbCondition = {
            nLinhKhi = tbLuyenDon.nLinhKhi * nNumber,
            nPopur = tbLuyenDon.nPopur * nNumber,
            nBigLevel = tbLuyenDon.nBigLevel
        }
        if KsgLib:PayMaterial(tbCondition) then
            KsgAward:Give({
                tbProp = tbLuyenDon.tbProp, nStack = nNumber, nStatus = 4,
            }, "Luy�n " .. tbLuyenDon.szName)
        end
        return
    end
    local nLinhKhiCounter = floor(KsgPlayer:GetLinhKhiPoint() / tbLuyenDon.nLinhKhi)
    local nPopurCounter = floor(KsgPlayer:GetPopur() / tbLuyenDon.nPopur)
    local nMax = min(nLinhKhiCounter, nPopurCounter)
    if nMax > MAX_LUYENDON_PER_TIME then
        nMax = MAX_LUYENDON_PER_TIME
    end
    if nMax == 0 then
        local szNotice = "\n"
        if nLinhKhiCounter == 0 then
            szNotice = szNotice .. "<color=red>Kh�ng �� �i�m linh kh�<color>\n"
        end
        if nPopurCounter == 0 then
            szNotice = szNotice .. "<color=red>Kh�ng �� �i�m tu luy�n<color>\n"
        end
        return KsgNpc:Talk(g_szTitle .. "��i hi�p ch�a chu�n b� �� �i�u ki�n luy�n ��n, kh�ng th� ti�n h�nh luy�n." .. szNotice)
    end
    AskClientForNumber(format("tuluyenchau_LuyenDon%d", nIndex), 0, nMax, "Nh�p s� l��ng mu�n luy�n:");
end

function tuluyenchau_LuyenDon1(nNumber)
    if nNumber <= 0 then
        return
    end
    tuluyenchau_LuyenDon_Submit(1, nNumber)
end

function tuluyenchau_LuyenDon2(nNumber)
    if nNumber <= 0 then
        return
    end
    tuluyenchau_LuyenDon_Submit(2, nNumber)
end

function tuluyenchau_ChuyenHoaLinhKhi()
    local nCurrentLinhKhi = KsgPlayer:GetLinhKhiPoint()
    local talkHead = format("Trong Linh Ch�u ch�a c� ch�t linh kh� n�o, ng��i �ang mu�n ��a linh kh� v�o Linh Ch�u sao?")
    local nMaxLinhKhi = tuluyenchau_GetMaxLinhKhi()
    if nCurrentLinhKhi > 0 then
        talkHead = format("Trong Linh Ch�u �ang ch�a <color=yellow>%d/%d<color> �i�m Linh Kh�, c� th� r�t ra..", nCurrentLinhKhi, nMaxLinhKhi)
    end
    talkHead = talkHead .. format("<enter><color=yellow>(M�i �i�m linh kh� t��ng �ng v�i 1 tri�u �i�m kinh nghi�m, t�i �a c� th� ��a v�o %d �i�m Linh Kh�)<color><enter><color=green>��i Hi�p V� L�m c� th� tr� ���c nhi�u h�n<color>", nMaxLinhKhi)
    local tSay = {
        g_szTitle .. talkHead,
        "Ta mu�n ��a linh kh� v�o Linh Ch�u/tuluyenchau_PutLinhKhi",
    }
    if nCurrentLinhKhi > 0 then
        tinsert(tSay, "Ta mu�n h�t linh kh� t� Linh Ch�u/tuluyenchau_HutLinhKhi")
        tinsert(tSay, "Ta mu�n chuy�n h�a Linh Kh� th�nh Ch�n Kh�/tuluyenchau_ExchangeChanKhi")
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function tuluyenchau_GetLinhKhiRemaining()
    return tuluyenchau_GetMaxLinhKhi() - KsgPlayer:GetLinhKhiPoint()
end

function tuluyenchau_GetMaxLinhKhi()
    local nMaxExp = MAX_EXP_IN_TU_LUYEN_CHAU
    if KsgPlayer:IsVipAccount() then
        nMaxExp = nMaxExp * 2
    end
    return floor(nMaxExp / 1e6)
end

function tuluyenchau_ExchangeChanKhi(nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk("��i hi�p � tr�ng th�i b�t th��ng, kh�ng th� ti�n h�nh thao t�c n�y!")
    end
    if nNumber and nNumber <= 0 then
        return
    end
    if nNumber then
        return tuluyenchau_ConvertLinhKhi2ChanKhi(nNumber)
    end
    return AskClientForNumber("tuluyenchau_ExchangeChanKhi", 0, tonumber(KsgPlayer:GetLinhKhiPoint()), "Nh�p s� Linh kh�:")
end

function tuluyenchau_AddLinhKhi(nLinhKhi)
    if nLinhKhi <= 0 then
        return
    end
    local nExpRequire = nLinhKhi * 1e6
    if GetExp() < nExpRequire then
        return KsgNpc:Talk(format("Hi�n ng��i kh�ng c� �� <color=red>%s<color>, kh�ng th� chuy�n h�a th�nh linh kh�!", KsgLib:Exp2String(nExpRequire)))
    end
    local nCurrentLinhKhi = KsgPlayer:GetLinhKhiPoint()
    local nMaxLinhKhi = tuluyenchau_GetMaxLinhKhi()
    if (nCurrentLinhKhi + nLinhKhi) <= nMaxLinhKhi then
        KsgPlayer:BigDelExp(nExpRequire)
        KsgPlayer:ModifyLinhKhiPoint(nLinhKhi)
        KsgPlayer:Msg(format("�� chuy�n h�a %s v�o Tu Luy�n Ch�u", KsgLib:Exp2String(nExpRequire)))
        KsgNpc:Talk(format("�i�m linh kh� Tu Luy�n Ch�u <color=green>t�ng %d �i�m<color><enter>Linh kh� hi�n t�i: <color=yellow>%d/%d<color>", nLinhKhi, KsgPlayer:GetLinhKhiPoint(), tuluyenchau_GetMaxLinhKhi()))
    else
        local nRemaining = nMaxLinhKhi - nCurrentLinhKhi
        KsgNpc:Talk(g_szTitle .. format("Linh kh� c�a Tu Luy�n Ch�u �� ��y, kh�ng th� ch�a th�m, t�i �a ch� c� th� ch�a th�m %d �i�m linh kh�!", nRemaining))
    end
end

function tuluyenchau_PutLinhKhi(nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szTitle .. "��i hi�p � tr�ng th�i b�t th��ng, kh�ng th� ti�n h�nh thao t�c n�y!")
    end
    if nNumber and nNumber > 0 then
        return tuluyenchau_AddLinhKhi(nNumber)
    end
    if tuluyenchau_GetLinhKhiRemaining() == 0 then
        return KsgNpc:Talk("Linh kh� trong Linh Ch�u �� ��y, kh�ng th� nh�n th�m")
    end
    if not nNumber then
        local nMax = floor(GetExp() / 1e6)
        if nMax > tuluyenchau_GetLinhKhiRemaining() then
            nMax = tuluyenchau_GetLinhKhiRemaining()
        end
        if nMax > MAX_LINHKHI_EXCHANGE then
            nMax = MAX_LINHKHI_EXCHANGE
        end
        AskClientForNumber("tuluyenchau_PutLinhKhi", 0, tonumber(nMax), "Nh�p s� Linh kh�?")
    end
end

function tuluyenchau_HutLinhKhi(nNumber)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk("��i hi�p � tr�ng th�i b�t th��ng, kh�ng th� ti�n h�nh thao t�c n�y!")
    end
    if nNumber and nNumber > 0 then
        return tuluyenchau_Convert2LinhKhi(nNumber)
    end
    if not nNumber then
        local nMax = KsgPlayer:GetLinhKhiPoint()
        if nMax > MAX_LINHKHI_EXCHANGE then
            nMax = MAX_LINHKHI_EXCHANGE
        end
        AskClientForNumber("tuluyenchau_HutLinhKhi", 0, tonumber(nMax), "Nh�p s� Linh kh�?");
    end
end

function tuluyenchau_Convert2LinhKhi(nLinhKhi)
    if GetCash() < nLinhKhi * 10000 then
        return KsgNpc:Talk(format("R�t <color=yellow>%d linh kh�<color> c�n ti�u hao <color=green>%d v�ng<color>, n�u kh�ng c� �� kh�ng th� r�t ra!", nLinhKhi, nLinhKhi))
    end
    if nLinhKhi > KsgPlayer:GetLinhKhiPoint() then
        return KsgNpc:Talk(format("Linh kh� trong Tu Luy�n Ch�u kh�ng �� %d �i�m, kh�ng th� chuy�n h�a th�nh kinh nghi�m!", nLinhKhi))
    end
    local nGainExp = nLinhKhi * 1e6
    Pay(nLinhKhi * 10000)
    KsgPlayer:BigAddExp(nGainExp)
    KsgPlayer:ModifyLinhKhiPoint(-nLinhKhi)

    KsgNpc:Talk(format("Chuy�n h�a th�nh c�ng <color=green>%d �i�m linh kh� thu ���c %s<color><enter>S� linh kh� c�n l�i l�:<color=yellow> %d/%d<color> �i�m", nLinhKhi, KsgLib:Exp2String(nGainExp), KsgPlayer:GetLinhKhiPoint(), tuluyenchau_GetMaxLinhKhi()))
end

function tuluyenchau_ConvertLinhKhi2ChanKhi(nLinhKhi)
    if KsgPlayer:GetMeridianLevel() < 1 then
        return KsgNpc:Talk("��i hi�p ch�a khai th�ng kinh m�ch, kh�ng th� chuy�n h�a Ch�n Kh�.")
    end
    if MeridianGetLeftGenuineQiCapcity() <= 0 then
        return KsgNpc:Talk("�i�m ch�n kh� c�a ��i hi�p �� ��t gi�i h�n, kh�ng th� chuy�n h�a th�m.")
    end
    if nLinhKhi > KsgPlayer:GetLinhKhiPoint() then
        return KsgNpc:Talk(format("Linh kh� trong Tu Luy�n Ch�u kh�ng �� %d �i�m, kh�ng th� chuy�n h�a th�nh Ch�n Kh� !", nLinhKhi))
    end
    KsgPlayer:ModifyLinhKhiPoint(-nLinhKhi)
    local nRate = EXCHANGE_CHANKHI_RATE
    if KsgPlayer:IsVipAccount() then
        nRate = EXCHANGE_CHANKHI_RATE_VIP
    end
    AwardGenuineQi(nLinhKhi * nRate)
    KsgPlayer:Msg(format("Chuy�n h�a th�nh c�ng, ti�u hao %d �i�m linh kh�", nLinhKhi))
    KsgNpc:Talk(format("Chuy�n h�a th�nh c�ng <color=green>%d �i�m linh kh� thu ���c %d �i�m Ch�n kh�<color><enter>S� linh kh� c�n l�i l�:<color=yellow> %d/%d<color> �i�m", nLinhKhi, nLinhKhi * nRate, KsgPlayer:GetLinhKhiPoint(), tuluyenchau_GetMaxLinhKhi()))
end