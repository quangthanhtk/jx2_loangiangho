--=============================================
--create by baiyun 2009.11.13
--describe:越南版12月份活动冰冷巫师死亡脚本
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function OnDeath(nNpcIndex)
		SetNpcLifeTime(nNpcIndex, 0);
    --刷圣诞树
    local nNewIndex = CreateNpc("aoyunshenghuotai", "H醓 n thu ho筩h", GetNpcWorldPos(nNpcIndex));
    SetNpcLifeTime(nNewIndex, 30 * 60);
    SetNpcScript(nNewIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanshu.lua");
    AddUnitStates(nNewIndex, 6, GetTime());--记录NPC创建的时
    SetCurrentNpcSFX(nNewIndex, 909, 2, 1, 18*30*60);

    --放烟火
    DoFireworks(801, 10);
   
    --给巫师心
    -- goc gf_AddItemEx2({2, 1, 30746, 1}, "Tr竔 Tim B╪g Gi�", "Ph� Th駓 B╪g Gi�", "Ph� Th駓 B╪g Gi�", 24*3600, 1);

    --LongDaiKa: mod th猰 ph莕 thng
    local tbAward = {
        { nExp = 5000000000 }, -- 5 t� exp
        { tbProp = { 2, 1, 31239 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph竎h Кn
        { tbProp = { 2, 1, 30847 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- H錳 Ti猲 Кn
        { tbProp = { 0, 105, 30144 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = DATETIME_SEC_ONE_MONTH }, -- T莕 Chi課 Xa-R鵦 R�
    };
    WAward:Give(tbAward, "Ph莕 thng gi誸 boss Th竛h Ho� Уn.");
    
    --刷100个圣诞礼盒
    local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
    for i = 1, 30 do
        local nNewNpcIndex = CreateNpc("Event gi竛g sinh VN", "h閜 qu� thu ho筩h", nMapId, nMapX + random(-10, 10), nMapY + random(-10, 10));
        SetNpcLifeTime(nNewNpcIndex, 30);
        SetNpcScript(nNewNpcIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
    end

    --打开mission，每3分钟出现50个圣诞礼盒，持续30分钟
    SetGlbValue(1026, nNewIndex);

    OpenMission(MISSION_ID, nMapId)
end

