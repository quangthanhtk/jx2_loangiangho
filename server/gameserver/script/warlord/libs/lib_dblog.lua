----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: th­ viÖn hç trî ghi log vµo database
----------------------------------------------------------------------------------------------------
WDBLogBase = {
    fnDebug = print,
    szKey = "WDBLogBase",
    szDataName = "jx2ib_log", -- Tªn c¬ së d÷ liÖu
    szTableName = "WDBLogBase_log", -- Tªn b¶ng d÷ liÖu sÏ thao t¸c ®Õn
    nGroupName = 1, -- Khai b¸o group cña server

    -- write file log
    szDirPath = "logs/warlord/dblog/",
    szFileName = "WDBLogBase_log.log",
};
m_szIniRelayCfg = "..\\..\\gateway\\relay\\relay.ini";
if IniFile_Load(m_szIniRelayCfg) == 1 then
    WDBLogBase.szDataName = IniFile_GetData(m_szIniRelayCfg, "DataBase", "LogDBName");
    IniFile_Unload(m_szIniRelayCfg);
end
--print("WDBLogBase.szDataName=", WDBLogBase.szDataName);
----------------------------------------------------------------------------------------------------
function WDBLogBase:WriteDbLog(nLogType, szLogContent, szObjName, nFlag, nEditable)
    nLogType = tonumber(nLogType) or 0;
    szLogContent = szLogContent or "";
    szObjName = szObjName or WPlayer:GetName();
    nFlag = tonumber(nFlag) or 2;
    nEditable = tonumber(nEditable) or 0;

    local szFullLogContent = WFileLog:WriteLog(szLogContent, self.szTableName);

    local szQuery = format([[INSERT INTO %s.%s (GroupName, LogType, LogContent, ObjName, Flag, Editable) VALUES (%d, %d, %q, %q, %d, %d);]],
            self.szDataName, self.szTableName, self.nGroupName, nLogType, szFullLogContent,
            szObjName,
            nFlag, nEditable);
    self.fnDebug("WDbLog.WriteDbLog", self.szKey, "szQuery=" .. szQuery);
    SendGlbDBData(0, szQuery);
    return szFullLogContent;
end
----------------------------------------------------------------------------------------------------
WDbLog = {};
WDbLog.TYPES = {};
function WDbLog:RegType(szKey, tbClass)
    if self.TYPES[szKey] == WEnv.NULL then
        tbClass.szKey = szKey;
        tbClass.szTableName = tbClass.szTableName or tbClass.szKey .. "_log";
        tbClass.szFileName = tbClass.szTableName .. ".log";
        self.TYPES[szKey] = inherit(WDBLogBase, tbClass);
        local szQuery = format([[CREATE TABLE IF NOT EXISTS %s.%s (
                                          ID int(11) NOT NULL AUTO_INCREMENT,
                                          LogTime timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
                                          GroupName varchar(32) NULL DEFAULT NULL,
                                          LogType int(10) UNSIGNED NULL DEFAULT NULL,
                                          LogContent blob NULL DEFAULT NULL,
                                          ObjName varchar(255) NULL DEFAULT NULL,
                                          Flag tinyint(3) UNSIGNED NULL DEFAULT NULL,
                                          Editable int(10) UNSIGNED NULL DEFAULT NULL,
                                          PRIMARY KEY (ID) USING BTREE,
                                          INDEX LogTime(LogTime) USING BTREE,
                                          INDEX GroupName(GroupName) USING BTREE,
                                          INDEX LogType(LogType) USING BTREE,
                                          INDEX ObjName(ObjName) USING BTREE
                                        ) ENGINE = MyISAM AUTO_INCREMENT = 0 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;]],
                tbClass.szDataName, tbClass.szTableName);
        SendGlbDBData(0, szQuery);
    end

    return self.TYPES[szKey];
end
----------------------------------------------------------------------------------------------------
--testlog = WDbLog:RegType("test", {
--    fnDebug = nothing,
--    --szTableName = "test2test_log",
--});
--testlog:WriteDbLog(1, "§©y lµ néi dung test log", "gameserver");
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\libs\\lib_dblog_types\\dblog_gm.lua");
Include("\\script\\warlord\\libs\\lib_dblog_types\\dblog_player.lua");
