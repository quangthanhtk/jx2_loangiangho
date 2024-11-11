Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

MV_BOSS_COUNT 	= CUSTOM_MV_BEGIN + 1;
MV_XUANJU_COUNT = CUSTOM_MV_BEGIN + 2;
MV_SP_BOSS_LV	= CUSTOM_MV_BEGIN + 3;
MV_SP_DAYE		= CUSTOM_MV_BEGIN + 4;
MV_SP_LOOT_ID	= CUSTOM_MV_BEGIN + 5;
MV_L1_SPE_FLAG	= CUSTOM_MV_BEGIN + 6;
MV_KILLED_NPC	= CUSTOM_MV_BEGIN + 7;
MV_STEP_XX_RUN	= CUSTOM_MV_BEGIN + 8;
MV_LIVED_RUNNER = CUSTOM_MV_BEGIN + 9;
MV_L2_SCORE		= CUSTOM_MV_BEGIN + 10;
MV_S2_GGG_FLAG	= CUSTOM_MV_BEGIN + 11;

MV_LOOT_ID_2	= CUSTOM_MV_BEGIN + 12;
MV_DAYE_2   	= CUSTOM_MV_BEGIN + 13;
MV_LAO_ER_2 	= CUSTOM_MV_BEGIN + 14;

MV_SP_BOX_LV    = CUSTOM_MV_BEGIN + 25;


--¼ÇÂ¼¿ª¹ý¾«Á¦±¦Ïä
MV_IS_OPENED_BOX_BEGIN = CUSTOM_MV_BEGIN + 15;
MV_IS_OPENED_BOX_END = CUSTOM_MV_BEGIN + 22;

MV_DXG_ROUTE_CNT = CUSTOM_MV_BEGIN + 23;--Á÷ÅÉ¸öÊý
MV_DXG_STAGE_CNT = CUSTOM_MV_BEGIN + 24--µÚ¼¸¹Ø

--MV_SP_BOX_LV    = CUSTOM_MV_BEGIN + 25; --//

DXG_EXP_EXT_ADD_RATE = min(VNG_CFG_DXG_EXP_EXT_ADD_RATE or 0, 2)


N_DXG_JOIN_REBORN_COUNT_MIN = g_WCFG_DIAHUYENCUNG.nRebornMinReq; --8 --×ªÉú --LongDaiKa: mod yªu cÇu chuyÓn sinh, mÆc ®Þnh =8
N_DXG_JOIN_LEVEL_MIN = g_WCFG_DIAHUYENCUNG.nLevelMinReq; --90 --µÈ¼¶ --LongDaiKa: mod yªu cÇu cÊp vµo, mÆc ®Þnh =90



function setCurStage(nStage)
    SetMissionV(MV_DXG_STAGE_CNT, nStage)
end
T_ROUTE_CNT_EXP_ADD_RATE = {
    0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
    local tRoute = {}
    local nRouteCnt = 0
    local OldPlayerIndex = PlayerIndex;
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i);
        if PlayerIndex > 0 then
            local nRoute = GetPlayerRoute();
            if not tRoute[nRoute] then
                tRoute[nRoute] = 1
                nRouteCnt = nRouteCnt + 1
            end
        end
    end
    PlayerIndex = OldPlayerIndex
    return nRouteCnt
end
--Ã¿¹Ø¾­Ñé½±Àø
T_LS_AWARD_EXP_STAGE = {
    [1] = 2500000,
    [2] = 3000000,
    [3] = 3500000,
    [5] = 4000000,
    [6] = 4500000,
    [7] = 5000000,
    [8] = 5500000,
}
function giveStageExpAward(nStage)
    if not nStage then
        nStage = GetMissionV(MV_DXG_STAGE_CNT)
    end

    --LongDaiKa: mod ®­a phÇn th­ëng vÒ 1 hµm WAward:DiaHuyenCung_KillBoss
    local nBossCount = GetTask(WMISSION_TASK_BOSS_DHC_CHECK) or 0;
    SetTask(WMISSION_TASK_BOSS_DHC_CHECK, nBossCount+1) ;
    WAward:DiaHuyenCung_KillBoss(nStage);
    --LongDaiKa: d­íi nµy kh«ng ch¹y n÷a
    do return 0; end

    local nType, nTime, nSpeed = GetExistXclInfo()
    local nBongLaiAddRate = 0
    if nTime > 0 then
        nBongLaiAddRate = nSpeed / 100
    end
    local ExpAddRate = (1 + nBongLaiAddRate + GetVipCardParam() + T_ROUTE_CNT_EXP_ADD_RATE[GetMissionV(MV_DXG_ROUTE_CNT)]) * (1 + DXG_EXP_EXT_ADD_RATE)
    local nExp = T_LS_AWARD_EXP_STAGE[nStage] or 0;
    --	print(MV_DXG_STAGE_CNT, nStage, nExp)
    if nExp > 0 then
        nExp = nExp * ExpAddRate
        gf_Modify("Exp", floor(nExp));
    end
end


N_JOIN_ENERGY_NEED = g_WCFG_DIAHUYENCUNG.nConsumeEnergy;
N_JOIN_TIANJIAOLING_NEED = 0
N_CALL_BOSS_TIANJIAOLING_NEED = 0
T_TIANJIAOLING = {2, 97, 236, "Thiªn Kiªu LÖnh"}
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
        if msgtype == 2 then
            Talk(1, "", msg)
        elseif msgtype == 1 then
            Say(msg, 0)
        else
            Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
        if msgtype == 2 then
            Talk(1, "", msg)
        elseif msgtype == 1 then
            Say(msg, 0)
        else
            Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end
function join_consume(bTianJiaolingMode, bDelete)
    --	if 1 == bDelete then
    --		AddRuntimeStat(1,1,bTianJiaolingMode,1)
    --	end
    if 1 == bTianJiaolingMode and g_WCFG_DIAHUYENCUNG.bConsumeToFree ~= WEnv.TRUE then
        if GetTeamMember(0) == PlayerIndex then
            if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
                Msg2Player(format("Trªn ng­êi kh«ng ®ñ %s",T_TIANJIAOLING[4]))
                return 0
            end
            if bDelete and bDelete == 1 then
                --É¾³ýÎïÆ·
                if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
                    return 0
                end
                --Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
                FireEvent("event_ib_cost", T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED)
                --AddRuntimeStat(1,13,0,1)
            end
        else
            return 0
        end
    else
        local OldPlayerIndex = PlayerIndex;
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex > 0 then
                local nCur,_ = ModifyEnergy(0, 1)
                if nCur < N_JOIN_ENERGY_NEED then
                    MU_Msg2Team(format("[%s] tinh lùc kh«ng ®ñ [%d] ®iÓm", GetName(), N_JOIN_ENERGY_NEED))
                    return 0
                end
            end
        end
        if bDelete and bDelete == 1 then
            for i = 1, GetTeamSize() do
                PlayerIndex = GetTeamMember(i);
                if PlayerIndex > 0 then
                    ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
                end
            end
        end
        PlayerIndex = OldPlayerIndex
    end
    return 1
end
