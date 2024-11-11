----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-03
--- Description: Npc l­u manh thµnh thÞ cho phÐp ng­êi ch¬i vµo map ®en
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

m_szNpcName = "<color=green>L­u manh thµnh thÞ<color>: ";
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
        WNpc:Talk("<npcname>: Xuþt, ®õng cã nãi cho quan binh ta ë ®©y nghe ch­a!");
        return WEnv.RETCODE_NOTOPEN;
    end

    local tbEnterPos = m_tbPos[nMapId].tbEnterPos;
    local tbOutPos = m_tbPos[nMapId].tbOutPos;

    local tbSay = { "<npcname>: GÇn ®©y cã mét lèi vµo khu v­ên trªn m©y, <sex> cã høng thó th× ®­a ta 5 v¹n l­îng ta sÏ chØ cho ng­¬i!",
                    format("%s/#_w_EnterBugMap(%d, %d)", "§­a ta ®Õn ®ã ®i", tbEnterPos[1], tbEnterPos[2]),
                    format("%s/#_w_GetOutBugMap(%d, %d)", "Ng­¬i hå ®å g× vËy, mau ®­a ta ra ngoµi", tbOutPos[1], tbOutPos[2]),
                    "Kh«ng cã g×, ta chØ hái ch¬i th«i/nothing",
    };
    WNpc:SayDialog(tbSay);
end

function _w_EnterBugMap(nPosX, nPosY)
    if WPlayer:PayGold(5) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Kh«ng cã tiÒn lµm sao ta chØ ng­¬i ®­îc!");
        return 0;
    end
    SetPos(nPosX, nPosY);
end

function _w_GetOutBugMap(nPosX, nPosY)
    SetPos(nPosX, nPosY);
end
