----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: §Þnh nghÜa c¸c tham sè cña ho¹t ®éng boss tµi nguyªn chiÕn
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

WBOSS_TNC = {
    bIsOpen = WEnv.TRUE,
    
    tbBossInfo = { "SF15_DFBB", "§«ng Ph­¬ng BÊt B¹i", DATETIME_SEC_ONE_HOUR },
    tbBossPos = {
        { 108, 1513, 3073 },
        { 108, 1485, 2931 },
        { 108, 1588, 3005 },
        --{ 606, 1218, 3129 },
        --{ 606, 1488, 2856 },
    },
    
    tbBoxInfo = { "tongbaoxiang", "§«ng Ph­¬ng B¶o H¹p", 10 * 60 },
    nDropBoxNum = 30,
    
    nOpenBoxWaitTime = 300,
    nOpenBoxDelay = 5,
    nOpenBoxPerDay = 6,
};

function WBOSS_TNC:CreateBoss()
    if self.bIsOpen ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end
    
    local nRandPosIdx = random(1, getn(self.tbBossPos));
    local nBossIdx = CreateNpc(self.tbBossInfo[1], self.tbBossInfo[2], unpack(self.tbBossPos[nRandPosIdx]));
    if nBossIdx ~= 0 then
        SetNpcDeathScript(nBossIdx, "\\script\\warlord\\online_activities\\boss_tai_nguyen_chien\\boss_death.lua");
        SetNpcRemoveScript(nBossIdx, "\\script\\warlord\\online_activities\\boss_tai_nguyen_chien\\boss_remove.lua");
        SetNpcLifeTime(nBossIdx, self.tbBossInfo[3]);
        local szMsg = "§«ng Ph­¬ng gi¸o chñ ®· xuÊt hiÖn trong B¾c TuyÒn Ch©u!";
        Msg2Global(szMsg);
        AddGlobalNews(szMsg);
        WriteLog("[WBOSS_TNC:CreateBoss] success!");
    else
        WriteLog("[WBOSS_TNC:CreateBoss] error!");
    end
end
