--=============================================
--create by baiyun 2009.11.13
--describe:Խ�ϰ�12�·ݻ������ʦ�����ű�
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function OnDeath(nNpcIndex)
		SetNpcLifeTime(nNpcIndex, 0);
    --ˢʥ����
    local nNewIndex = CreateNpc("aoyunshenghuotai", "H�a ��n thu ho�ch", GetNpcWorldPos(nNpcIndex));
    SetNpcLifeTime(nNewIndex, 30 * 60);
    SetNpcScript(nNewIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanshu.lua");
    AddUnitStates(nNewIndex, 6, GetTime());--��¼NPC������ʱ
    SetCurrentNpcSFX(nNewIndex, 909, 2, 1, 18*30*60);

    --���̻�
    DoFireworks(801, 10);
   
    --����ʦ��
    -- goc gf_AddItemEx2({2, 1, 30746, 1}, "Tr�i Tim B�ng Gi�", "Ph� Th�y B�ng Gi�", "Ph� Th�y B�ng Gi�", 24*3600, 1);

    --LongDaiKa: mod th�m ph�n th��ng
    local tbAward = {
        { nExp = 5000000000 }, -- 5 t� exp
        { tbProp = { 2, 1, 31239 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph�ch ��n
        { tbProp = { 2, 1, 30847 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- H�i Ti�n ��n
        { tbProp = { 0, 105, 30144 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = DATETIME_SEC_ONE_MONTH }, -- T�n Chi�n Xa-R�c R�
    };
    WAward:Give(tbAward, "Ph�n th��ng gi�t boss Th�nh Ho� ��n.");
    
    --ˢ100��ʥ�����
    local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
    for i = 1, 30 do
        local nNewNpcIndex = CreateNpc("Event gi�ng sinh VN", "h�p qu� thu ho�ch", nMapId, nMapX + random(-10, 10), nMapY + random(-10, 10));
        SetNpcLifeTime(nNewNpcIndex, 30);
        SetNpcScript(nNewNpcIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
    end

    --��mission��ÿ3���ӳ���50��ʥ����У�����30����
    SetGlbValue(1026, nNewIndex);

    OpenMission(MISSION_ID, nMapId)
end

