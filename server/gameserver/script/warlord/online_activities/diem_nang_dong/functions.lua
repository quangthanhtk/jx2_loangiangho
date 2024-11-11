----------------------------------------------------------------------------------------------------
--- Author: Quang Thanh
--- Modified: 2022-12-02
--- Description: �i�m n�ng ��ng
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\diem_nang_dong\\head.lua");
----------------------------------------------------------------------------------------------------

function WDIEMNANGDONG:CheckDateOpen()
    if WLib:IsInRange(WDate:Today(), self.nDateOpen, self.nDateClose) ~= WEnv.TRUE then
        return WEnv.TRUE;
    end

    return WEnv.FALSE;
end

------------Mennu----------------------------------
function _w__OpenMenu_DiemNangDong()
    local tbSay = { "Ho�t ��ng �i�m n�ng ��ng. Khi ho�n th�nh c�c nhi�m v� h�ng ng�y ��i hi�p s� nh�n ���c �i�m n�ng ��ng" };
    tinsert(tbSay, format("%s/#ThienKieuLenh_DiemNangDong()", "Thi�n ki�u l�nh ��i �i�m  n�ng ��ng"));
    tinsert(tbSay, format("%s/#NhanThuong_DiemNangDong()", "�i�m n�ng ��ng ��i ph�n th��ng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function NhanThuong_DiemNangDong(nIndex)
    local g_szNangDongNpcName = "<color=green>S� Gi� Ho�t ��ng<color>: "
    local nNangDongCount = WTask:Get(WMISSION_AWARD_NANGDONG);
    local szNangDongCount = format("<enter>(S� �i�m n�ng ��ng c�a ��i hi�p hi�n t�i l� <color=green>%d<color> l�n)", nNangDongCount)
    if nIndex then

        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_CHECK, nIndex)
        if not tbNangDong_AccumulateAward[nIndex] then
            return KsgNpc:FormalTalk(g_szNangDongNpcName, "H�nh nh� ch�n sai r�i, ph�n th��ng n�y hi�n kh�ng c� � ch� ta")
        end

        local tbAccumulate = tbNangDong_AccumulateAward[nIndex]
        if nNangDongCount < tbAccumulate.nRequireNum then
            return KsgNpc:FormalTalk(g_szNangDongNpcName, format("ch�a ��t �� %d �i�m n�ng ��ng, kh�ng th� nh�n ph�n th��ng m�c n�y %s", tbAccumulate.nRequireNum, szNangDongCount))
        end
        if nStatus == 1 then
            return KsgNpc:FormalTalk(g_szNangDongNpcName, "�� nh�n ph�n th��ng n�y r�i.")
        end
        if not KsgLib:HasEnoughBagRoom(10, 10, g_szNangDongNpcName) then
            return
        end

        WTask:SetBit(WMISSION_AWARD_NANGDONG_CHECK, nIndex, 1)
        KsgAward:Give(tbAccumulate.tbAward, "Nh�n th��ng �i�m n�ng ��ng " .. nIndex)

    end

    local szTitle = g_szNangDongNpcName .. "T�ch L�y �� �i�m nh�t ��nh th� ��i hi�p s� nh�n ���c ph�n th��ng"
    local tbStatus = { "Ch�a nh�n", "�� nh�n" }
    local tSay = {
        szTitle .. szNangDongCount
    }
    for nAwardIndex, tbAccumulate in tbNangDong_AccumulateAward do
        --local nStatus = GetBit(TASKID_LUCKYBOX_AWARD, 2 + nAwardIndex) + 1
        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_CHECK,nAwardIndex) + 1
        local szStatus = tbStatus[nStatus]
        tinsert(tSay, format("T�ch l�y  %d �i�m nh�n ���c %s (%s)/#NhanThuong_DiemNangDong(%d)", tbAccumulate.nRequireNum, tbAccumulate.szName, szStatus, nAwardIndex))
    end
    tinsert(tSay, "\nTa ch� xem qua th�i/no")
    WNpc:SayDialog(tSay)
end

------------------Thi�n ki�u l�nh ��i �i�m-----------------------
function ThienKieuLenh_DiemNangDong(nIndex)
    local nNangDongCount = WTask:Get(WMISSION_AWARD_NANGDONG);
    local tbSay = { "D�ng thi�n ki�u l�nh �� ��i �i�m n�ng ��ng. S� �i�m hi�n c�: "..nNangDongCount };
    if nIndex then
        nCount= nIndex*500;
        local tbConsume = {
            tbItems = {
                { tbProp = { 2, 97, 236 }, nCount = nCount}, -- Thi�n Ki�u L�nh
            }
        };
        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_TKL_CHECK,nIndex)
        if nStatus == 1 then
            return KsgNpc:FormalTalk("��i s� ho�t ��ng: ", "B�n �� ��i ph�n th��ng n�y r�i.")
        end
        if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
            return WEnv.RETCODE_CONSUMEERROR;
        end
        WTask:Set(WMISSION_AWARD_NANGDONG,nNangDongCount+1000);
        WTask:SetBit(WMISSION_AWARD_NANGDONG_TKL_CHECK, nIndex, 1)
    end

    local tbStatus = { "Ch�a nh�n", "�� nh�n" }
    for nAwardIndex, tbAccumulate in tbTKL_DoiThuong do
        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_TKL_CHECK,nAwardIndex) +1;
        local szStatus = tbStatus[nStatus];
        tinsert(tbSay, format(nAwardIndex.."--%d Thi�n Ki�u L�nh ��i  %s (%s)/#ThienKieuLenh_DiemNangDong(%d)", tbAccumulate.nRequireNum, tbAccumulate.szName, szStatus, nAwardIndex))
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end



