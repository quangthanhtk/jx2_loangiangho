----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c hµm liªn quan ®Õn tæ ®éi
----------------------------------------------------------------------------------------------------
WTeam = {};
----------------------------------------------------------------------------------------------------

function WTeam:GetTeamId()
    return GetTeamID();
end

function WTeam:GetTeamate()
    return GetTeamMemberIndex(self:GetTeamId()) or {};
end

function WTeam:DoFunction(func, ...)
    if type(func) ~= "function" then
        return WEnv.RETCODE_ERROR;
    end

    local tbTeamate = self:GetTeamate();
    local nTeamSize = getn(tbTeamate);
    if nTeamSize < 1 then
        func(WLib:UnPack(arg));
    else
        local nOldPlayerIndex = PlayerIndex;
        for i = 1, nTeamSize do
            PlayerIndex = tbTeamate[i];
            func(WLib:UnPack(arg));
            PlayerIndex = nOldPlayerIndex;
        end
        PlayerIndex = nOldPlayerIndex;
    end
    return WEnv.RETCODE_SUCCESS;
end

---KiÓm tra tinh tùc cña c¸c thµnh viªn
---@param nEnergy number Sè tinh lùc cÇn kiÓm tra
---@return number, table return1: WEnv.TRUE lµ pass, WEnv.FALSE lµ cã member kh«ng ®ñ tinh lùc; return2 lµ danh s¸ch tªn nh©n vËt kh«ng ®ñ ®iÒu kiÖn
function WTeam:CheckMemberHaveEnergy(nEnergy, bShowMsg)
    nEnergy = tonumber(nEnergy) or 0;
    bShowMsg = bShowMsg or WEnv.FALSE;

    local bResult = WEnv.TRUE;
    local tbRoleNotEnought = {};
    local tbTeamate = self:GetTeamate();
    local nOldPlayerIndex = PlayerIndex;

    for i = 1, getn(tbTeamate) do
        PlayerIndex = tbTeamate[i];
        local nCurrentEnergy = ModifyEnergy(0, 1);
        if nCurrentEnergy < nEnergy then
            bResult = WEnv.FALSE;
            tinsert(tbRoleNotEnought, WPlayer:GetName());

            if bShowMsg == WEnv.TRUE then
                self:DoFunction(WPlayer.Msg, WPlayer, format("%s kh«ng cã ®ñ tinh lùc!", WPlayer:GetName()));
                --WPlayer:Msg(format("<sex> kh«ng cã ®ñ %d tinh lùc!", nEnergy));
            end
        end
        PlayerIndex = nOldPlayerIndex;
    end
    PlayerIndex = nOldPlayerIndex;

    return bResult, tbRoleNotEnought;
end

function WTeam:ModifyEnergy(nEnergy)
    nEnergy = tonumber(nEnergy) or 0;


    local bResult = WEnv.TRUE;
    local tbRoleNotEnought = {};

    if self:CheckMemberHaveEnergy(nEnergy, WEnv.TRUE) == WEnv.FALSE then
        bResult = WENV.FALSE;
        return bResult, tbRoleNotEnought;
    end

    local tbTeamate = self:GetTeamate();
    local nOldPlayerIndex = PlayerIndex;

    for i = 1, getn(tbTeamate) do
        PlayerIndex = tbTeamate[i];
        if ModifyEnergy(nEnergy, 1) == -1 then
            bResult = WEnv.FALSE;
            tinsert(tbRoleNotEnought, WPlayer:GetName());

            self:DoFunction("WPlayer:Msg", "<playername> kh«ng cã ®ñ tinh lùc!");
        end
        PlayerIndex = nOldPlayerIndex;
    end
    PlayerIndex = nOldPlayerIndex;

    return bResult, tbRoleNotEnought;
end
