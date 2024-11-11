----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-02
--- Description: c�c h�m d�ng trong event t�t 2023 R��ng Qu� M�o
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
        local nNpcIndex = CreateNpc("tongbaoxiang", "R��ng Qu� M�o", nMapId, nX, nY);
        if nNpcIndex ~= 0 then
            SetNpcScript(nNpcIndex, "\\script\\warlord\\online_activities\\ruong_quy_mao\\npc_baoruong.lua");
        end
    end
    
    for i = 1, getn(self.tbBoxPosLocal) do
        local nMapId, nX, nY = WLib:UnPack(self.tbBoxPosLocal[i]);
        local nNpcIndex = CreateNpc("yinbaoxiang", "R��ng Qu� M�o-Th�", nMapId, nX, nY);
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
        return WNpc:Talk("<npcname>: Kh�ng th� ch�n h�nh th�c m� r��ng n�y!");
    end

    if WPlayer:IsDeath() == WEnv.TRUE then
        return WNpc:Talk("<npcname>: Tr�ng th�i hi�n t�i kh�ng th� m� r��ng.");
    end

    local nOpenedBox = WTask:GetPosValue(self.nTaskSave, 1, 4);
    if nOpenedBox >= self.nMaxOpenBoxCount then
        return WNpc:Talk(format("<npcname>: <sex> �� m� r��ng %d l�n r�i, kh�ng th� m� th�m n�a.", self.nMaxOpenBoxCount));
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
        return WNpc:Talk("<npcname>: Hi�n �� c� ng��i kh�c m� b�o r��ng!");
    end
end

function WRUONGQUYMAO:GiveAward()
    do return 0; end
    if self:CheckDateOpen() ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nOpenType = WTask:GetPosValue(self.nTaskSave, 5, 5);

    if self.tbExchanceBox[nOpenType] == WEnv.NULL then
        return WNpc:Talk("<npcname>: Kh�ng th� ch�n h�nh th�c m� r��ng n�y!");
    end

    if WPlayer:IsDeath() == WEnv.TRUE then
        return WNpc:Talk("<npcname>: Tr�ng th�i hi�n t�i kh�ng th� m� r��ng.");
    end

    if WLib:CheckInv(5, 500) == WEnv.FALSE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local nOpenedBox = WTask:GetPosValue(self.nTaskSave, 1, 4);
    if nOpenedBox >= self.nMaxOpenBoxCount then
        return WNpc:Talk(format("<npcname>: <sex> �� m� r��ng %d l�n r�i, kh�ng th� m� th�m n�a.", self.nMaxOpenBoxCount));
    end

    if WLib:PayMaterial(self.tbExchanceBox[nOpenType].tbCondition) == WEnv.TRUE then
        local nNextOpenBoxCount = nOpenedBox + 1;
        WTask:SetPosValue(self.nTaskSave, nNextOpenBoxCount, 1, 4);

        local tbRandomAward = WLib:Random(self.tbRandomAward);
        if tbRandomAward then
            WAward:Give(tbRandomAward, "R��ng Qu� M�o - Th��ng may m�n");
        end

        if self.tbAccumulateAward[nNextOpenBoxCount] then
            WAward:Give(self.tbAccumulateAward[nNextOpenBoxCount], "R��ng Qu� M�o - Th��ng m�c " .. nNextOpenBoxCount);
        end
    end
end
