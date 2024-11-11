--=============================================
--create by baiyun 2009.11.13
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯±ùÀäÎ×Ê¦ËÀÍö½Å±¾
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function OnDeath(nNpcIndex)
		SetNpcLifeTime(nNpcIndex, 0);
    --Ë¢Ê¥µ®Ê÷
    local nNewIndex = CreateNpc("aoyunshenghuotai", "Háa ®µn thu ho¹ch", GetNpcWorldPos(nNpcIndex));
    SetNpcLifeTime(nNewIndex, 30 * 60);
    SetNpcScript(nNewIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanshu.lua");
    AddUnitStates(nNewIndex, 6, GetTime());--¼ÇÂ¼NPC´´½¨µÄÊ±
    SetCurrentNpcSFX(nNewIndex, 909, 2, 1, 18*30*60);

    --·ÅÑÌ»ð
    DoFireworks(801, 10);
   
    --¸øÎ×Ê¦ÐÄ
    -- goc gf_AddItemEx2({2, 1, 30746, 1}, "Tr¸i Tim B¨ng Gi¸", "Phï Thñy B¨ng Gi¸", "Phï Thñy B¨ng Gi¸", 24*3600, 1);

    --LongDaiKa: mod thªm phÇn th­ëng
    local tbAward = {
        { nExp = 5000000000 }, -- 5 tû exp
        { tbProp = { 2, 1, 31239 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph¸ch §¬n
        { tbProp = { 2, 1, 30847 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Håi Tiªn §¬n
        { tbProp = { 0, 105, 30144 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = DATETIME_SEC_ONE_MONTH }, -- TÇn ChiÕn Xa-Rùc Rì
    };
    WAward:Give(tbAward, "PhÇn th­ëng giÕt boss Th¸nh Ho¶ §µn.");
    
    --Ë¢100¸öÊ¥µ®ÀñºÐ
    local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
    for i = 1, 30 do
        local nNewNpcIndex = CreateNpc("Event gi¸ng sinh VN", "hép quµ thu ho¹ch", nMapId, nMapX + random(-10, 10), nMapY + random(-10, 10));
        SetNpcLifeTime(nNewNpcIndex, 30);
        SetNpcScript(nNewNpcIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
    end

    --´ò¿ªmission£¬Ã¿3·ÖÖÓ³öÏÖ50¸öÊ¥µ®ÀñºÐ£¬³ÖÐø30·ÖÖÓ
    SetGlbValue(1026, nNewIndex);

    OpenMission(MISSION_ID, nMapId)
end

