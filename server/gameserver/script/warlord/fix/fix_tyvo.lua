----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2020-11-23
--- Description: Fix bug lçi tû vâ trong thµnh bËt ®å s¸t
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
function _w_fix_TyVo_CheckMap()
    local tbMap = {
        [200] = 'BiÖn Kinh',
        [100] = 'TuyÒn Ch©u',
        [300] = 'Thµnh §«',
        [350] = 'T­¬ng D­¬ng',
        [150] = 'D­¬ng Ch©u',
        [400] = '§¹i Lý',
        [500] = 'Ph­îng T­êng',
    };
    local nMapId = GetWorldPos();
    if tbMap[nMapId] then
        return WEnv.TRUE;
    end
    return WEnv.FALSE;
end

function _w_fix_TyVo_CheckPlayer()
    if _w_fix_TyVo_CheckMap() ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nPKEnmityState = GetPKEnmityState();
    if nPKEnmityState ~= 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if nPKEnmityState == 0 and GetFightState() ~= 0 then
        SetFightState(0);
    end

    return WEnv.RETCODE_SUCCESS;
end
