----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-02
--- Description: c¸c hµm dïng trong event tÕt 2023 R­¬ng Quý M·o
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\ruong_quy_mao\\head.lua");
----------------------------------------------------------------------------------------------------

function WRUONGQUYMAO:CheckDateOpen()
    if WLib:IsInRange(WDate:Today(), self.nDateOpen, self.nDateClose) ~= WEnv.TRUE then
        return WEnv.TRUE;
    end

    return WEnv.FALSE;
end

function WRUONGQUYMAO:CreateBoxes()
    do return 0; end
    if self:CheckDateOpen() ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    for i = 1, getn(self.tbBoxPos) do
        local nMapId, nX, nY = WLib:UnPack(self.tbBoxPos[i]);
        local nNpcIndex = CreateNpc("tongbaoxiang", "R­¬ng Quý M·o", nMapId, nX, nY);
        if nNpcIndex ~= 0 then
            SetNpcScript(nNpcIndex, "\\script\\warlord\\online_activities\\ruong_quy_mao\\npc_baoruong.lua");
        end
    end
    
    for i = 1, getn(self.tbBoxPosLocal) do
        local nMapId, nX, nY = WLib:UnPack(self.tbBoxPosLocal[i]);
        local nNpcIndex = CreateNpc("yinbaoxiang", "R­¬ng Quý M·o-ThÞ", nMapId, nX, nY);
        if nNpcIndex ~= 0 then
            SetNpcScript(nNpcIndex, "\\script\\warlord\\online_activities\\ruong_quy_mao\\npc_baoruong.lua");
        end
    end
end

function WRUONGQUYMAO:OpenBox(nOpenType)
    do return 0; end
    if self:CheckDateOpen() ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    if self.tbExchanceBox[nOpenType] == WEnv.NULL then
        return WNpc:Talk("<npcname>: Kh«ng thÓ chän h×nh thøc më r­¬ng nµy!");
    end

    if WPlayer:IsDeath() == WEnv.TRUE then
        return WNpc:Talk("<npcname>: Tr¹ng th¸i hiÖn t¹i kh«ng thÓ më r­¬ng.");
    end

    local nOpenedBox = WTask:GetPosValue(self.nTaskSave, 1, 4);
    if nOpenedBox >= self.nMaxOpenBoxCount then
        return WNpc:Talk(format("<npcname>: <sex> ®· më r­¬ng %d lÇn råi, kh«ng thÓ më thªm n÷a.", self.nMaxOpenBoxCount));
    end

    if WLib:CheckInv(5, 500) == WEnv.FALSE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WLib:CheckMaterial(self.tbExchanceBox[nOpenType].tbCondition) == WEnv.FALSE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local nBoxIndex = GetTargetNpc();

    if GetUnitCurStates(nBoxIndex, 2) ~= 1 or (GetTime() - GetUnitCurStates(nBoxIndex, 1)) > 3 then
        WTask:SetPosValue(self.nTaskSave, nOpenType, 5, 5);
        WLib:SetUnitCurStates(nBoxIndex, 1, GetTime());
        WLib:SetUnitCurStates(nBoxIndex, 2, 1);
        DoWait(252, 253, self.nOpenWaitTime);
    else
        return WNpc:Talk("<npcname>: HiÖn ®· cã ng­êi kh¸c më b¶o r­¬ng!");
    end
end

function WRUONGQUYMAO:GiveAward()
    do return 0; end
    if self:CheckDateOpen() ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nOpenType = WTask:GetPosValue(self.nTaskSave, 5, 5);

    if self.tbExchanceBox[nOpenType] == WEnv.NULL then
        return WNpc:Talk("<npcname>: Kh«ng thÓ chän h×nh thøc më r­¬ng nµy!");
    end

    if WPlayer:IsDeath() == WEnv.TRUE then
        return WNpc:Talk("<npcname>: Tr¹ng th¸i hiÖn t¹i kh«ng thÓ më r­¬ng.");
    end

    if WLib:CheckInv(5, 500) == WEnv.FALSE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local nOpenedBox = WTask:GetPosValue(self.nTaskSave, 1, 4);
    if nOpenedBox >= self.nMaxOpenBoxCount then
        return WNpc:Talk(format("<npcname>: <sex> ®· më r­¬ng %d lÇn råi, kh«ng thÓ më thªm n÷a.", self.nMaxOpenBoxCount));
    end

    if WLib:PayMaterial(self.tbExchanceBox[nOpenType].tbCondition) == WEnv.TRUE then
        local nNextOpenBoxCount = nOpenedBox + 1;
        WTask:SetPosValue(self.nTaskSave, nNextOpenBoxCount, 1, 4);

        local tbRandomAward = WLib:Random(self.tbRandomAward);
        if tbRandomAward then
            WAward:Give(tbRandomAward, "R­¬ng Quý M·o - Th­ëng may m¾n");
        end

        if self.tbAccumulateAward[nNextOpenBoxCount] then
            WAward:Give(self.tbAccumulateAward[nNextOpenBoxCount], "R­¬ng Quý M·o - Th­ëng mèc " .. nNextOpenBoxCount);
        end
    end
end
