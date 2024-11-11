Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\head.lua");
----------------------------------------------------------------------------------------------------
-- Replace:
-- self: EVENT_SINH_TO_LUA_MACH
-- function prefix: SinhToLuaMach_
----------------------------------------------------------------------------------------------------

function OnDeath(Launcher)
    local OldPlayerIndex = PlayerIndex;
    local KillerIndex = NpcIdx2PIdx(Launcher);
    local sName = GetName();
    local sKillerName = "";
    local nPlayerId = GetPlayerID();
    local tbPlants = {};
    local nMapID, nX, nY = GetWorldPos();

    local tbNpcs = GetMapNpcIdx(nMapID);
    if type(tbNpcs) == "table" then
        for k, v in tbNpcs do
            if GetUnitCurStates(v, 1) == nPlayerId then
                tinsert(tbPlants, { nItemP = GetUnitCurStates(v, 6), nNpcIdx = v });
            end
        end
    end

    if getn(tbPlants) < 1 then
        gf_WriteLog("SinhToLuaMach_plant", "Kh�ng t�m th�y c�y n�o.");
        SetDeathScript("");
        return 0;
    end

    for i = 1, getn(tbPlants) do
        if MATERIAL_ITEM[tbPlants[i].nItemP] == nil then
            gf_WriteLog("SinhToLuaMach_plant", "Kh�ng x�c ��nh ���c lo�i c�y: " .. tbPlants[i].nItemP);
            tremove(tbPlants, i);
            i = i - 1;
        end
    end

    if getn(tbPlants) < 1 then
        gf_WriteLog("SinhToLuaMach_plant", "Sau khi l�c, kh�ng t�m th�y c�y n�o.");
        SetDeathScript("");
        return 0;
    end

    PlayerIndex = KillerIndex;
    if PlayerIndex > 0 then
        sKillerName = GetName();

        if GetPKFlag() ~= 0 and GetPKEnmityState() == 0 and GetLevel() >= ROB_ITEM_LV_REQ then

            local szMsg = "��i hi�p v�a c��p ���c";
            for i = 1, getn(tbPlants) do
                local itemID=tbPlants[i].nItemP;
                if tbPlants[i].nItemP == 40133 then
                    itemID= 40135
                end
                if tbPlants[i].nItemP == 40134 then
                    itemID= 40136
                end
                if gf_AddItemEx2({ 2, 1, 40134, 1, 4 }, MATERIAL_ITEM[tbPlants[i].nItemP][1], "SinhToLuaMach_plant", "C��p ���c c�y t� " .. sName) == 1 then
                    szMsg = szMsg .. " x"..tonumber(MATERIAL_ITEM[tbPlants[i].nItemP][4]).. MATERIAL_ITEM[tbPlants[i].nItemP][3] .. ", ";
                else
                    gf_WriteLog("SinhToLuaMach_plant", "C��p c�y nh�ng ko add ���c v�t ph�m: nItemP: " .. tbPlants[i].nItemP);
                end
            end

            Msg2Player(szMsg .. " t� " .. sName);

            PlayerIndex = OldPlayerIndex;
            Msg2Player("C�y �ang tr�ng �� b� <" .. sKillerName .. "> c��p m�t.");
            gf_WriteLog("SinhToLuaMach_plant", "B� " .. sKillerName .. " c��p m�t c�y.");

            for i = 1, getn(tbPlants) do
                SetNpcScript(tbPlants[i].nNpcIdx, "");
                SetNpcLifeTime(tbPlants[i].nNpcIdx, 0);
                SetDeathScript("");
            end
        else
            Msg2Player("��i hi�p v�a h� g�c <" .. sName .. "> nh�ng ko c��p ���c c�y do ch�a �� �i�u ki�n.");
            Msg2Player("�i�u ki�n c��p c�y (c�p ".. ROB_ITEM_LV_REQ .." tr� l�n, tr�ng th�i PK, kh�ng t� v�).");

            PlayerIndex = OldPlayerIndex;
            Msg2Player("��i hi�p v�a b� t�n c��p h� g�c nh�ng ch�a c��p ���c c�y, h�y mau ch�ng l�i ch� c�y tr�ng �� b�o v�.");
            gf_WriteLog("SinhToLuaMach_plant", "B� " .. sKillerName .. " kill ch�t nh�ng ch�a c��p �c c�y.");

            for i = 1, getn(tbPlants) do
                local itemID=tbPlants[i].nItemP;
                if gf_AddItemEx2({ 2, 1, itemID, 1, 4 }, MATERIAL_ITEM[tbPlants[i].nItemP][1], "SinhToLuaMach_plant", "Refund") ~= 1 then
                    gf_WriteLog("SinhToLuaMach_plant", "Refund c�y nh�ng ko add ���c v�t ph�m: nItemP: " .. tbPlants[i].nItemP);
                end

                SetNpcScript(tbPlants[i].nNpcIdx, "");
                SetNpcLifeTime(tbPlants[i].nNpcIdx, 0);
                SetDeathScript("");
            end
        end
    end
end
