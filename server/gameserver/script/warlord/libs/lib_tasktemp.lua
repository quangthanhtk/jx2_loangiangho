----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c hµm liªn quan ®Õn task t¹m thêi, khi trë l¹i hoÆc chuyÓn gs sÏ mÊt, define taskid t¹i \script\warlord\defines\define_task.lua
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\defines\\define_task_temp.lua");
----------------------------------------------------------------------------------------------------
WTaskTemp = {};
----------------------------------------------------------------------------------------------------

function WTaskTemp:Modify(nTaskId, nValue)
    self:Set(nTaskId, self:Get(nTaskId) + nValue);
    return WEnv.RETCODE_SUCCESS;
end

function WTaskTemp:GetByte(nTaskId, nByte)
    return GetByte(self:Get(nTaskId), nByte)
end

function WTaskTemp:SetByte(nTaskID, nByte, nValue)
    if nValue == WEnv.NULL or nValue > 255 then
        print("WTaskTemp:SetByte nValue > 255 or nil");
        return WEnv.RETCODE_ERROR;
    end
    self:Set(nTaskID, SetByte(self:Get(nTaskID), nByte, nValue));
    return WEnv.RETCODE_SUCCESS;
end

function WTaskTemp:Set(nTaskId, nValue)
    SetTaskTemp(nTaskId, nValue);
    return WEnv.RETCODE_SUCCESS;
end

function WTaskTemp:Get(nTaskId)
    return GetTaskTemp(nTaskId);
end

function WTaskTemp:SetBit(nTaskID, nBit, nValue)
    if nValue == WEnv.NULL or nValue > 1 then
        print("ERROR:WTaskTemp:SetBit nValue > 1 or nil");
        return WEnv.RETCODE_ERROR;
    end
    self:Set(nTaskID, SetBit(self:Get(nTaskID), nBit, nValue));
    return WEnv.RETCODE_SUCCESS;
end

function WTaskTemp:GetBit(nTaskID, nBit)
    return GetBit(self:Get(nTaskID), nBit);
end
