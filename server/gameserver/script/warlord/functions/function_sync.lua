----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-09
--- Description: Trigger check nh�n v�t
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\fix\\fix_speedupreading.lua");
Include("\\script\\warlord\\fix\\fix_tyvo.lua");
Include("\\script\\warlord\\functions\\function_prison.lua");
Include("\\script\\warlord\\functions\\function_gm.lua");
----------------------------------------------------------------------------------------------------

function _w_sync_1s()
    --_w_SpeedUpReading_CheckStop(); -- 2022 kh�ng c�n ��n
end

function _w_sync_2s()
    --_w_SpeedUpReading_CheckStart(); -- 2022 kh�ng c�n ��n
end

function _w_sync_5s()
    _w_fix_TyVo_CheckPlayer();
    if WTask:GetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF) == 1 then
        _wgm_SetAdminState(1, 0);
    end
end

function _w_sync_10s()
    _w_prision_CheckPlayer();
end

function _w_sync_60s()
    WTask:ResetDaily();
    
    local nSyncMin = WTaskTemp:Get(WARLORD_TMPTASK_SYNC_MIN);
    WTaskTemp:Set(WARLORD_TMPTASK_SYNC_MIN, nSyncMin + 1); -- L�u s� ph�t online, s� b� reset n�u chuy�n gs
    WTask:Modify(WTASKID_TREO_ONLINE_MIN_DAILY_COUNT, 1);
    
    if nSyncMin ~= 0 and mod(nSyncMin, 3) == 0 then
        -- Th�c thi m�i 3p online
        WWebService:CheckCode(WEnv.TRUE); -- Tin nh�n SMS h� tr� t�i kho�n

        -- L�u nh�n h�n ch� l�i Crash GS m�t data
        local nMapId = GetWorldPos();
        if nMapId ~= 881
                and nMapId ~= 882
                and nMapId ~= 883
                and nMapId ~= 884
        then
            SaveNow();
        end
    end
end
