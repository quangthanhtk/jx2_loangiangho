----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-24
--- Description: Npc ti“n trang
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>ChÒ ti“n trang<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_chutientrang.lua";

function _w_NpcMain(nNpcIdx)
    local tbSay = { "<npcname>: Bi÷n Kinh phÂn hoa l÷ phË, <sex> muËn ÆÊi g◊ c¯ n„i?", };
    local nHonorcheck = WPlayer:GetHonor();
    if nHonorcheck>-1000000 and nHonorcheck<1000000 then
        tinsert(tbSay, "NhÀn c´ng trπng ÆÒ 1 tri÷u (ti™u hao 1 Hoµng Kim ßπi Ng©n Phi’u)/_w_Nhan1TrieuCongTrang");
    end

    --tinsert(tbSay, "Th™m 1 l«n nhÀn s∏t tinh Î thŒ t©n thÒ (ti™u hao 2 ßπi Ng©n Phi’u)/_w_ResetNhanSatTinhTheTanThu");
    --tinsert(tbSay, "Th™m 1 l«n nhÀn v‚ th∏nh vµ 900k ch©n kh› Î thŒ t©n thÒ (ti™u hao 2 ßπi Ng©n Phi’u)/_w_ResetNhanKinhMachTheTanThu");
    tinsert(tbSay, "ßÊi 1 thi phÔ L∑nh H≠¨ng L®ng (ti™u hao 5 Hoµng Kim ßπi HÂng Bao)/_w_MuaThiPhuLanhHuongLang");

    tinsert(tbSay, "\nKhi kh∏c sœ quay lπi.");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

function _w_Nhan1TrieuCongTrang()
    local nHonorBefore = WPlayer:GetHonor();
    local nHonorSet = 1000000;
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30490 }, nCount = 1 }, -- Hoµng Kim ßπi Ng©n Phi’u
        }
    };
    if nHonorBefore >= nHonorSet then
        WNpc:Talk("Ta chÿ giÛp c∏c nh©n s‹ c„ c´ng trπng th p h¨n th´i!");
        return WEnv.RETCODE_CONSUMEERROR;
    else
        if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
            local nHonorAward = nHonorSet - nHonorBefore;
            WPlayer:ModifyHonor(nHonorSet);
            WPlayerLog:WriteBattleLog("npc_tientrang", "NhÀn nhanh 1 tri÷u c´ng trπng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, nHonorAward, WPlayer:GetBattlePoint(), 0);
        else
            return WEnv.RETCODE_CONSUMEERROR;
        end
    end
end

function _w_ResetNhanSatTinhTheTanThu()
    if WTask:GetBit(WTASKID_NEWBIE_BIT_GIVE2_STATUS, WTASKID_NEWBIE_BIT_GIVE2_SATTINH) ~= 1 then
        WNpc:Talk("<sex> v…n cﬂn c¨ hÈi, h∑y ki”m tra lπi thŒ t©n thÒ!");
        return WEnv.RETCODE_ERROR;
    end

    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 199 }, nCount = 2 }, -- ßπi ng©n phi’u
        }
    };

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE2_STATUS, WTASKID_NEWBIE_BIT_GIVE2_DANHHIEU, 0);
    WNpc:Talk("ß∑ hoµn t t, <sex> c„ th” nhÀn lπi bÈ trang bﬁ S∏t Tinh tπi thŒ t©n thÒ!", WEnv.TRUE);
end

function _w_ResetNhanKinhMachTheTanThu()
    if WTask:GetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS, WTASKID_NEWBIE_BIT_GIVE_KINHMACHVOTHANH) ~= 1 then
        WNpc:Talk("<sex> v…n cﬂn c¨ hÈi, h∑y ki”m tra lπi thŒ t©n thÒ!");
        return WEnv.RETCODE_ERROR;
    end

    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 199 }, nCount = 2 }, -- ßπi ng©n phi’u
        }
    };

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS, WTASKID_NEWBIE_BIT_GIVE_KINHMACHVOTHANH, 0);
    WNpc:Talk("ß∑ hoµn t t, <sex> c„ th” nhÀn lπi kinh mπch v‚ th∏nh vµ 900k Æi”m ch©n kh› tπi thŒ t©n thÒ!", WEnv.TRUE);
end

function _w_MuaThiPhuLanhHuongLang()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 539 }, nCount = 5 }, -- Hoµng Kim ßπi HÂng Bao
        }
    };

    if WLib:CheckInv(3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local tbAward = {
        { tbProp = { 1, 6, 150 }, nStack = 1 } -- L∑nh H≠¨ng L®ng
    };
    WAward:Give(tbAward, "Mua tπi chÒ ti“n trang");
end
