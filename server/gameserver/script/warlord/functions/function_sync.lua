----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-09
--- Description: Trigger check nh©n vËt
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\fix\\fix_speedupreading.lua");
Include("\\script\\warlord\\fix\\fix_tyvo.lua");
Include("\\script\\warlord\\functions\\function_prison.lua");
Include("\\script\\warlord\\functions\\function_gm.lua");
----------------------------------------------------------------------------------------------------

function _w_sync_1s()
    --_w_SpeedUpReading_CheckStop(); -- 2022 kh«ng cÇn ®Õn
end

function _w_sync_2s()
    --_w_SpeedUpReading_CheckStart(); -- 2022 kh«ng cÇn ®Õn
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
    WTaskTemp:Set(WARLORD_TMPTASK_SYNC_MIN, nSyncMin + 1); -- L­u sè phót online, sÏ bÞ reset nÕu chuyÓn gs
    WTask:Modify(WTASKID_TREO_ONLINE_MIN_DAILY_COUNT, 1);
    
    if nSyncMin ~= 0 and mod(nSyncMin, 3) == 0 then
        -- Thùc thi mçi 3p online
        WWebService:CheckCode(WEnv.TRUE); -- Tin nh¾n SMS hç trî tµi kho¶n

        -- L­u nhËn h¹n chÕ lçi Crash GS mÊt data
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
