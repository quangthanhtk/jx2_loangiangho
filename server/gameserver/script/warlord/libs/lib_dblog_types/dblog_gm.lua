----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-23
--- Description: Ghi log sö dông gm vµo database, ®ång thêi sÏ cã 1 b¶n txt ghi vµo logs/warlord/...
----------------------------------------------------------------------------------------------------
enumWGMLogTypes = {
    SEND_CMD = 1,
    RECEIVE_CMD = 2,
    EXECUTE_CMD = 3,
};
WGMLog = WDbLog:RegType("warlord_gm", {
    fnDebug = nothing,
});

function WGMLog:WriteRevCmdLog(szLogTitle, szLogAction, szFuncName, szName, szCommand, szResult, tbExtendData, szSenderName)
    tbExtendData = tbExtendData or {};
    self:WriteDbLog(
            enumWGMLogTypes.RECEIVE_CMD,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ",
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                        (szFuncName or "") .. " ",
                        (szName or "") .. " ",
                        szCommand or "",
                        szResult or "",
                    },
                    tbExtendData or {}
            ),
            szSenderName
    );
end

function WGMLog:WriteExeCmdLog(szLogTitle, szLogAction, szFuncName, szName, szCommand, szResult, tbExtendData)
    tbExtendData = tbExtendData or {};
    self:WriteDbLog(
            enumWGMLogTypes.EXECUTE_CMD,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ",
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                        (szFuncName or "") .. " ",
                        (szName or "") .. " ",
                        szCommand or "",
                        szResult or "",
                    },
                    tbExtendData or {}
            ),
            WPlayer:GetName()
    );
end
