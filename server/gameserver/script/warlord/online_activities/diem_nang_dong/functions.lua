----------------------------------------------------------------------------------------------------
--- Author: Quang Thanh
--- Modified: 2022-12-02
--- Description: §iÓm n¨ng ®éng
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
    local tbSay = { "Ho¹t ®éng ®iÓm n¨ng ®éng. Khi hoµn thµnh c¸c nhiÖm vô hµng ngµy ®¹i hiÖp sÏ nhËn ®­îc ®iÓm n¨ng ®éng" };
    tinsert(tbSay, format("%s/#ThienKieuLenh_DiemNangDong()", "Thiªn kiªu lÖnh ®æi ®iÓm  n¨ng ®éng"));
    tinsert(tbSay, format("%s/#NhanThuong_DiemNangDong()", "§iÓm n¨ng ®éng ®æi phÇn th­ëng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function NhanThuong_DiemNangDong(nIndex)
    local g_szNangDongNpcName = "<color=green>Sø Gi¶ Ho¹t §éng<color>: "
    local nNangDongCount = WTask:Get(WMISSION_AWARD_NANGDONG);
    local szNangDongCount = format("<enter>(Sè ®iÓm n¨ng ®éng cña ®¹i hiÖp hiÖn t¹i lµ <color=green>%d<color> lÇn)", nNangDongCount)
    if nIndex then

        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_CHECK, nIndex)
        if not tbNangDong_AccumulateAward[nIndex] then
            return KsgNpc:FormalTalk(g_szNangDongNpcName, "H×nh nh­ chän sai råi, phÇn th­ëng nµy hiÖn kh«ng cã ë chç ta")
        end

        local tbAccumulate = tbNangDong_AccumulateAward[nIndex]
        if nNangDongCount < tbAccumulate.nRequireNum then
            return KsgNpc:FormalTalk(g_szNangDongNpcName, format("ch­a ®¹t ®ñ %d ®iÓm n¨ng ®éng, kh«ng thÓ nhËn phÇn th­ëng mèc nµy %s", tbAccumulate.nRequireNum, szNangDongCount))
        end
        if nStatus == 1 then
            return KsgNpc:FormalTalk(g_szNangDongNpcName, "®· nhËn phÇn th­ëng nµy råi.")
        end
        if not KsgLib:HasEnoughBagRoom(10, 10, g_szNangDongNpcName) then
            return
        end

        WTask:SetBit(WMISSION_AWARD_NANGDONG_CHECK, nIndex, 1)
        KsgAward:Give(tbAccumulate.tbAward, "NhËn th­ëng ®iÓm n¨ng ®éng " .. nIndex)

    end

    local szTitle = g_szNangDongNpcName .. "TÝch Lòy ®ñ ®iÓm nhÊt ®Þnh th× ®¹i hiÖp sÏ nhËn ®­îc phÇn th­ëng"
    local tbStatus = { "Ch­a nhËn", "§· nhËn" }
    local tSay = {
        szTitle .. szNangDongCount
    }
    for nAwardIndex, tbAccumulate in tbNangDong_AccumulateAward do
        --local nStatus = GetBit(TASKID_LUCKYBOX_AWARD, 2 + nAwardIndex) + 1
        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_CHECK,nAwardIndex) + 1
        local szStatus = tbStatus[nStatus]
        tinsert(tSay, format("TÝch lòy  %d ®iÓm nhËn ®­îc %s (%s)/#NhanThuong_DiemNangDong(%d)", tbAccumulate.nRequireNum, tbAccumulate.szName, szStatus, nAwardIndex))
    end
    tinsert(tSay, "\nTa chØ xem qua th«i/no")
    WNpc:SayDialog(tSay)
end

------------------Thiªn kiªu lÖnh ®æi ®iÓm-----------------------
function ThienKieuLenh_DiemNangDong(nIndex)
    local nNangDongCount = WTask:Get(WMISSION_AWARD_NANGDONG);
    local tbSay = { "Dïng thiªn kiªu lÖnh ®Ó ®æi ®iÓm n¨ng ®éng. Sè ®iÓm hiÖn cã: "..nNangDongCount };
    if nIndex then
        nCount= nIndex*500;
        local tbConsume = {
            tbItems = {
                { tbProp = { 2, 97, 236 }, nCount = nCount}, -- Thiªn Kiªu LÖnh
            }
        };
        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_TKL_CHECK,nIndex)
        if nStatus == 1 then
            return KsgNpc:FormalTalk("§¹i sø ho¹t ®éng: ", "B¹n ®· ®æi phÇn th­ëng nµy råi.")
        end
        if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
            return WEnv.RETCODE_CONSUMEERROR;
        end
        WTask:Set(WMISSION_AWARD_NANGDONG,nNangDongCount+1000);
        WTask:SetBit(WMISSION_AWARD_NANGDONG_TKL_CHECK, nIndex, 1)
    end

    local tbStatus = { "Ch­a nhËn", "§· nhËn" }
    for nAwardIndex, tbAccumulate in tbTKL_DoiThuong do
        local nStatus = WTask:GetBit(WMISSION_AWARD_NANGDONG_TKL_CHECK,nAwardIndex) +1;
        local szStatus = tbStatus[nStatus];
        tinsert(tbSay, format(nAwardIndex.."--%d Thiªn Kiªu LÖnh ®æi  %s (%s)/#ThienKieuLenh_DiemNangDong(%d)", tbAccumulate.nRequireNum, tbAccumulate.szName, szStatus, nAwardIndex))
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end



