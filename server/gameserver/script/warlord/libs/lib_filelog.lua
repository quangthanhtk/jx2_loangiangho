----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: write log file
----------------------------------------------------------------------------------------------------
WFileLog = {
    szDirPath = "logs/warlord/",
};
----------------------------------------------------------------------------------------------------

function WFileLog:GetLogPrefix()
    local szLogTime = date("%Y-%m-%d %H:%M:%S");
    local szAccount = WPlayer:GetAccount() .. " ";
    local szRoleName = WPlayer:GetName() .. " ";
    local szTongName = WPlayer:GetTongName() .. " ";
    local nBigLevel = WPlayer:GetBigLevel();
    local nExp = WPlayer:GetExp();
    local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();
    local szLastLoginIP, szCurrentLoginIP = WPlayer:GetLoginIP();
    local szLastLoginMAC, szCurrentLoginMAC = WPlayer:GetLoginMAC();
    local szLogPrefix = WLib:Join({ szLogTime, szAccount, szRoleName, szTongName, nBigLevel, nExp, nMapId, nPosX, nPosY, szLastLoginIP, szCurrentLoginIP, szLastLoginMAC, szCurrentLoginMAC }, "\t");
    return szLogPrefix;
end

function WFileLog:WriteLog(szLogContent, szCategory)
    szCategory = szCategory or "common";
    local szDirPath = self.szDirPath .. szCategory .. "/" .. date("%Y_%m_%d") .. "/";
    local szFileName = szCategory .. "_" .. date("%H_00_00") .. ".log";
    local szLogPrefix = self:GetLogPrefix();
    local szFullLogContent = "";
    if type(szLogContent) == "table" then
        szFullLogContent = szLogPrefix .. "\t" .. WLib:Join(szLogContent, "\t");
    else
        szFullLogContent = szLogPrefix .. "\t" .. szLogContent;
    end

    local szDataFilePath = format("%s%s", szDirPath, szFileName);
    local pf = openfile(szDataFilePath, "a+");
    if pf == WEnv.NULL then
        execute(format("mkdir -p %q", szDirPath));
        pf = openfile(szDataFilePath, "a+");
    end
    write(pf, szFullLogContent .. "\n");
    closefile(pf);

    return szFullLogContent;
end

function WFileLog:WriteTabFile(szFilePath, tbContent, tbHeader)
    local szFullContent = "";
    if type(tbContent) == "table" then
        szFullContent = WLib:Join(tbContent, "\t");
    else
        szFullContent = tbContent or "";
    end

    -- xö lý ®­êng dÉn d¹ng \\ vµ bá \\ ë ®Çu
    szFilePath = WLib:Replace(szFilePath, "\\", "/");
    if strsub(szFilePath, 0, 1) == "/" then
        szFilePath = strsub(szFilePath, 2, strlen(szFilePath));
    end

    local pf = openfile(szFilePath, "a+");
    if pf == WEnv.NULL then
        local tbPathData = WLib:Split(szFilePath, "/");
        local szFileName = tbPathData[getn(tbPathData)];
        local szDirPath = WLib:Replace(szFilePath, szFileName, "");

        execute(format("mkdir -p %q", szDirPath));
        pf = openfile(szFilePath, "a+");

        --local szFullHeader = "";
        --if type(tbHeader) == "table" then
        --    szFullHeader = WLib:Join(tbHeader, "\t");
        --else
        --    szFullHeader = tbHeader or "";
        --end
        --
        --write(pf, szFullHeader.."\n");
    end

    write(pf, szFullContent .. "\n");
    closefile(pf);

    return szFullContent;
end
