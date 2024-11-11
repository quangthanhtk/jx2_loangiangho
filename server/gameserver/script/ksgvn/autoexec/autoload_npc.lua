Include("\\script\\ksgvn\\autoexec\\autoexec_head.lua")
Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong.lua')

g_tbKsgNpcList = {
    { 200, 1332, 2794, "\\script\\ksgvn\\npc\\npc_lienchi.lua", "Ch� qu�n H�a Kh� ph�ng", "Li�n Chi", }, --LongDaiKa: ��ng t�nh n�ng event h�ng th�ng
    { 509, 1506, 3518, "\\script\\ksgvn\\npc\\npc_caonhanoan.lua", "C� gi�", "Cao Nh�n � �n", },
    { 200, 1469, 2752, "\\script\\function\\rename\\rename_npc.lua", "Quan s�-trung ni�n1", "H� B� Th� Lang", }, -- rename NPC --LongDaiKa: ��ng npc ��i t�n
    --{ 100, 1416, 3023, "\\script\\ksgvn\\npc\\npc_longhosu.lua", "V� L�m Minh Ch�1", "Long H� S�", }, -- BHTA --LongDaiKa: ��ng t�nh n�ng BHTA
}

g_tbKsgNpcTopList = {
    --[1] = {
    --    { 200, 1408, 2848, "\\script\\ksgvn\\npc\\npc_top_server.lua", "��i H�", "B�ch H�" }
    --},
    --[2] = {
    --    { 200, 1408, 2848, "\\script\\ksgvn\\npc\\npc_top_server.lua", "��i Long", "Thanh Long" }
    --},
    --[3] = {
    --    { 200, 1408, 2848, "\\script\\ksgvn\\npc\\npc_top_server.lua", "��i �ng", "Phi �ng" }
    --}, 
    --[4] = {
    --    { 200, 1408, 2848, "\\script\\ksgvn\\npc\\npc_top_server.lua", "��i Long", "T�ng Long" }
    --}, 
    --[6] = {
    --    { 200, 1408, 2848, "\\script\\ksgvn\\npc\\npc_top_server.lua", "��i H�", "Ng�a H�" }
    --},
}

function AddDialogNpc(config)
    for i = 1, getn(config) do
        local tbNpcConfig = config[i]
        local nMapId = tbNpcConfig[1]
        local nSubWorldIdx = SubWorldID2Idx(nMapId);
        if (nSubWorldIdx >= 0) then
            local szNpcTemplate = tbNpcConfig[5]
            local szNpcName = tbNpcConfig[6]
            local szScriptFile = tbNpcConfig[4] or ""
            local nNpcPosX = tbNpcConfig[2]
            local nNpcPosY = tbNpcConfig[3]
            local nNpcIdx = CreateNpc(szNpcTemplate, szNpcName, nMapId, nNpcPosX, nNpcPosY);
            SetNpcScript(nNpcIdx, szScriptFile);
        end
    end
end

function KSGNpcLoader()
    local nServerId = KsgLib:GetServerId()
    if g_tbKsgNpcTopList[nServerId] then
        AddDialogNpc(g_tbKsgNpcTopList[nServerId])
    end
    AddDialogNpc(g_tbKsgNpcList)
    bachbaoruong_CreateBoxes()
end

AutoFunctions:Add(KSGNpcLoader)
