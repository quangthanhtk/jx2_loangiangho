----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-03
--- Description: Npc l�u manh th�nh th� cho ph�p ng��i ch�i v�o map �en
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

m_szNpcName = "<color=green>L�u manh th�nh th�<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_luumanhthanhthi.lua";

m_tbPos = {
    [301] = {
        tbEnterPos = { 1608, 3136 },
        tbOutPos = { 1588, 3143 },
    },
    [108] = {
        tbEnterPos = { 1385, 3164 },
        tbOutPos = { 1402, 3161 },
    },
}

function main()
    local nNpcIdx = GetTargetNpc();
    local nMapId, nPosX, nPosY = GetNpcWorldPos(nNpcIdx);

    if m_tbPos[nMapId] == WEnv.NULL then
        WNpc:Talk("<npcname>: Xu�t, ��ng c� n�i cho quan binh ta � ��y nghe ch�a!");
        return WEnv.RETCODE_NOTOPEN;
    end

    local tbEnterPos = m_tbPos[nMapId].tbEnterPos;
    local tbOutPos = m_tbPos[nMapId].tbOutPos;

    local tbSay = { "<npcname>: G�n ��y c� m�t l�i v�o khu v��n tr�n m�y, <sex> c� h�ng th� th� ��a ta 5 v�n l��ng ta s� ch� cho ng��i!",
                    format("%s/#_w_EnterBugMap(%d, %d)", "��a ta ��n �� �i", tbEnterPos[1], tbEnterPos[2]),
                    format("%s/#_w_GetOutBugMap(%d, %d)", "Ng��i h� �� g� v�y, mau ��a ta ra ngo�i", tbOutPos[1], tbOutPos[2]),
                    "Kh�ng c� g�, ta ch� h�i ch�i th�i/nothing",
    };
    WNpc:SayDialog(tbSay);
end

function _w_EnterBugMap(nPosX, nPosY)
    if WPlayer:PayGold(5) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Kh�ng c� ti�n l�m sao ta ch� ng��i ���c!");
        return 0;
    end
    SetPos(nPosX, nPosY);
end

function _w_GetOutBugMap(nPosX, nPosY)
    SetPos(nPosX, nPosY);
end
