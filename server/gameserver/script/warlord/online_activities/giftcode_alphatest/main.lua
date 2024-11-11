----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-16
--- Description: ��nh ngh�a c�c h�m entrypoint �� t��ng t�c v�i h�m trong functions
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\giftcode_alphatest\\functions.lua");
----------------------------------------------------------------------------------------------------
function WGIFTCODE_ALPHATEST_Act1()
    if WLib:IsTestServer() ~= WEnv.TRUE then
        WNpc:Talk("S� ki�n n�y ch� di�n ra � m�y ch� th� nghi�m!", WEnv.TRUE);
        return WEnv.RETCODE_NOTOPEN;
    end

    local tbSay = { "Tham gia chi�n tr��ng ch�nh Nh�n M�n Quan 20h-21h c�c ng�y 21,22,23 v� ��t TOP 1-10 s� nh�n ���c 1 m� GiftCode t��ng �ng. H�y l�u l�i �� s� d�ng � server ch�nh th�c!" };
    tinsert(tbSay, format("%s/nothing", "�a t�, ta �� hi�u!"));
    WNpc:SayDialog(tbSay);
end

function WGIFTCODE_ALPHATEST_Act2(nTaskIdx)
    if WLib:IsTestServer() ~= WEnv.TRUE then
        WNpc:Talk("S� ki�n n�y ch� di�n ra � m�y ch� th� nghi�m!", WEnv.TRUE);
        return WEnv.RETCODE_NOTOPEN;
    end

    nTaskIdx = tonumber(nTaskIdx) or 0;

    local tbSay = { "Ho�n th�nh c�c nhi�m v� d��i ��y <sex> s� nh�n ���c 1 m� GiftCode t��ng �ng. H�y l�u l�i �� s� d�ng � server ch�nh th�c!" };

    if nTaskIdx == 0 then
        for i = 1, getn(WGIFTCODE_ALPHATEST.tbTaskReqAwardDef) do
            tinsert(tbSay, format("%s %d/#WGIFTCODE_ALPHATEST_Act2(%d)", "Xem ho�t ��ng AlphaTest m�c", i, i));
        end

        tinsert(tbSay, format("%s/nothing", "�a t�, ta �� hi�u!"));
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local bCompleteAll, tbTaskStatus = WGIFTCODE_ALPHATEST:GetAllTaskReqStatus(nTaskIdx);

    tbSay[1] = tbSay[1] .. "\n" .. WLib:Join(tbTaskStatus, "\n");

    if bCompleteAll == WEnv.TRUE then
        tinsert(tbSay, format("%s %d/#WGIFTCODE_ALPHATEST:GiveTaskReqAward(%d)", "Nh�n th��ng �� ho�n th�nh c�c m�c ti�u AlphaTest m�c", nTaskIdx, nTaskIdx));
        tinsert(tbSay, format("%s/nothing", "T�m th�i ch�a mu�n nh�n."));
    else
        tinsert(tbSay, format("%s/nothing", "�a t�, ta �� hi�u!"));
    end

    WNpc:SayDialog(tbSay);
end
