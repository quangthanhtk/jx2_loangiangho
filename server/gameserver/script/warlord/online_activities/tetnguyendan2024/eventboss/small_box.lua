----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: thùc thi khi ng­êi ch¬i më r­¬ng nhá r¬i ra tõ boss
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\event_head.lua");
Include("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function main()
    local nNpcIdx = GetTargetNpc();

    if WTask:Get(WTASKID_OPENBOX_BOSSTET2024_TODAY) >= 300 then
        WNpc:Talk(format("H«m nay <sex> ®· më tèi ®a %d r­¬ng!", WTask:Get(WTASKID_OPENBOX_BOSSTET2024_TODAY)));
        return WEnv.RETCODE_DENY;
    end

    local nWaitTime = 300 - (GetTime() - GetUnitCurStates(nNpcIdx, 6));
    if nWaitTime > 0 then
        WNpc:Talk(format("Cßn %d gi©y míi cã thÓ më r­¬ng!", nWaitTime));
        return WEnv.RETCODE_NOTOPEN;
    end

    local nDelayTime = 5 - (GetTime() - WTask:Get(WTASKID_OPENBOX_BOSSTET2024_LASTTIME));
    if nDelayTime > 0 then
        WNpc:Talk(format("Cßn %d gi©y míi cã thÓ më r­¬ng tiÕp theo!", nDelayTime));
        return WEnv.RETCODE_NOTOPEN;
    end
    if WPlayer:IsPKState() ~= WEnv.TRUE then
        WNpc:Talk("B¶o r­¬ng cÇn thªm s¸t khÝ, bËt chiÕn ®Êu míi cã thÓ më r­¬ng!", 1);
        return WEnv.RETCODE_ERROR;
    end
    WLib:OpenCaptcha(nil, main_ok, { nNpcIdx })
end

function main_ok(nNpcIdx)
    SetNpcRemoveScript(nNpcIdx, "");
    SetNpcScript(nNpcIdx, "");
    SetNpcLifeTime(nNpcIdx, 0);

    WTask:Set(WTASKID_OPENBOX_BOSSTET2024_LASTTIME, GetTime());
    WTask:Modify(WTASKID_OPENBOX_BOSSTNC_TODAY, 1);
    bosstet2024_give();
end
