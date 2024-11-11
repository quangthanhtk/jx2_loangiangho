Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\head.lua");
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function EnterMap()
    local nMapId, nX, nY = GetWorldPos();

    if MAP_ALLOW[nMapId] == nil then
        return 0;
    end

    SetDeathPunish(0);
    plant_create_map_trigger();
    Msg2Player("Trong b�n �� n�y hi�n kh�ng c� tr�ng ph�t PK.");
end

function LeaveMap()
    SetDeathPunish(1);
    plant_create_map_trigger();
end
