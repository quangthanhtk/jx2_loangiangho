----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-24
--- Description: Npc ti�n trang
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Ch� ti�n trang<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_chutientrang.lua";

function _w_NpcMain(nNpcIdx)
    local tbSay = { "<npcname>: Bi�n Kinh ph�n hoa l� ph�, <sex> mu�n ��i g� c� n�i?", };
    local nHonorcheck = WPlayer:GetHonor();
    if nHonorcheck>-1000000 and nHonorcheck<1000000 then
        tinsert(tbSay, "Nh�n c�ng tr�ng �� 1 tri�u (ti�u hao 1 Ho�ng Kim ��i Ng�n Phi�u)/_w_Nhan1TrieuCongTrang");
    end

    --tinsert(tbSay, "Th�m 1 l�n nh�n s�t tinh � th� t�n th� (ti�u hao 2 ��i Ng�n Phi�u)/_w_ResetNhanSatTinhTheTanThu");
    --tinsert(tbSay, "Th�m 1 l�n nh�n v� th�nh v� 900k ch�n kh� � th� t�n th� (ti�u hao 2 ��i Ng�n Phi�u)/_w_ResetNhanKinhMachTheTanThu");
    tinsert(tbSay, "��i 1 thi ph� L�nh H��ng L�ng (ti�u hao 5 Ho�ng Kim ��i H�ng Bao)/_w_MuaThiPhuLanhHuongLang");

    tinsert(tbSay, "\nKhi kh�c s� quay l�i.");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

function _w_Nhan1TrieuCongTrang()
    local nHonorBefore = WPlayer:GetHonor();
    local nHonorSet = 1000000;
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30490 }, nCount = 1 }, -- Ho�ng Kim ��i Ng�n Phi�u
        }
    };
    if nHonorBefore >= nHonorSet then
        WNpc:Talk("Ta ch� gi�p c�c nh�n s� c� c�ng tr�ng th�p h�n th�i!");
        return WEnv.RETCODE_CONSUMEERROR;
    else
        if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
            local nHonorAward = nHonorSet - nHonorBefore;
            WPlayer:ModifyHonor(nHonorSet);
            WPlayerLog:WriteBattleLog("npc_tientrang", "Nh�n nhanh 1 tri�u c�ng tr�ng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, nHonorAward, WPlayer:GetBattlePoint(), 0);
        else
            return WEnv.RETCODE_CONSUMEERROR;
        end
    end
end

function _w_ResetNhanSatTinhTheTanThu()
    if WTask:GetBit(WTASKID_NEWBIE_BIT_GIVE2_STATUS, WTASKID_NEWBIE_BIT_GIVE2_SATTINH) ~= 1 then
        WNpc:Talk("<sex> v�n c�n c� h�i, h�y ki�m tra l�i th� t�n th�!");
        return WEnv.RETCODE_ERROR;
    end

    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 199 }, nCount = 2 }, -- ��i ng�n phi�u
        }
    };

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE2_STATUS, WTASKID_NEWBIE_BIT_GIVE2_DANHHIEU, 0);
    WNpc:Talk("�� ho�n t�t, <sex> c� th� nh�n l�i b� trang b� S�t Tinh t�i th� t�n th�!", WEnv.TRUE);
end

function _w_ResetNhanKinhMachTheTanThu()
    if WTask:GetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS, WTASKID_NEWBIE_BIT_GIVE_KINHMACHVOTHANH) ~= 1 then
        WNpc:Talk("<sex> v�n c�n c� h�i, h�y ki�m tra l�i th� t�n th�!");
        return WEnv.RETCODE_ERROR;
    end

    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 199 }, nCount = 2 }, -- ��i ng�n phi�u
        }
    };

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS, WTASKID_NEWBIE_BIT_GIVE_KINHMACHVOTHANH, 0);
    WNpc:Talk("�� ho�n t�t, <sex> c� th� nh�n l�i kinh m�ch v� th�nh v� 900k �i�m ch�n kh� t�i th� t�n th�!", WEnv.TRUE);
end

function _w_MuaThiPhuLanhHuongLang()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 539 }, nCount = 5 }, -- Ho�ng Kim ��i H�ng Bao
        }
    };

    if WLib:CheckInv(3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local tbAward = {
        { tbProp = { 1, 6, 150 }, nStack = 1 } -- L�nh H��ng L�ng
    };
    WAward:Give(tbAward, "Mua t�i ch� ti�n trang");
end
