----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-12
--- Description: Npc trao th��ng �ua top
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\dua_top_bxh\\functions.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Ho�ng Huynh<color>: ";

function main()
    local tbSay = { "<color=yellow>Ho�t ��ng �ua top di�n ra t� 19h00 ng�y 31/12/2022 ��n 21h00 ng�y 14/01/2023<color>\n" ..
                            "<color=green> - Top 5 T�ng Li�u s� ch�t danh s�ch d�a tr�n BXH c�ng tr�ng v�o 21h00 ng�y 14/01/2023<color>\n" ..
                            --"<color=green> - Top 10 c�p to�n server s� ch�t danh s�ch d�a tr�n BXH c�p v�o 24h00 ng�y 15/10/2023<color>\n" ..
                            "<color=red> *** L�u �: Trao th��ng s� b�t ��u v�o l�c " .. WDate:ToString(WDUATOPBXH.nGiveAwardTime, WEnv.TRUE) .. ". Qu� nh�n s� n�u c� khi�u n�i v� k qu� vui l�ng inbox Fanpage �� ���c gi�i quy�t s�m!<color>\n" ..
                            --"<color=red> *** L�u �: m�i nh�n v�t ch� ���c nh�n 1 top duy nh�t, trong tr��ng h�p nh�n v�t ���c c� 2 top c�ng l�c th� s� nh�n top c�ng tr�ng, top c�p s� chuy�n cho ng��i ti�p theo<color>" ..
                            "" };

    for i = 1, getn(WDUATOPBXH.tbTopDef) do
        tinsert(tbSay, format("Xem %s/#WDUATOPBXH:ShowAwardList(%d)", WDUATOPBXH.tbTopDef[i].szName, i));
    end

    if WPlayer:IsSuperAdmin() == WEnv.TRUE then
        tinsert(tbSay, "\nL�y danh s�ch top c�ng tr�ng/#WDUATOPBXH:GetData_TopMerrit()");
    end

    tinsert(tbSay, "\nTa ch� xem qua th�i./nothing");
    WNpc:SayDialog(tbSay);
end
