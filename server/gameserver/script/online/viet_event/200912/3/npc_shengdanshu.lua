--=============================================
--create by baiyun 2009.11.13
--describe:Խ�ϰ�12�·ݻ������ʦʥ�����ű�
--============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function main()
    local nNpcIndex = GetTargetNpc();
    local szName = GetNpcName(nNpcIndex);
    local szBoxName = "h�p qu� thu ho�ch";
    if GetTrigger(2509) ~= 0 then
        Talk(1, "", format("Tr��c ��y ng��i �� k�ch ho�t %s, xin nh�p %s nh�n th��ng.", szName, szBoxName));
        return 0;
    end
    if GetLevel() < 20 or GetPlayerRoute() == 0 then
        Talk(1, "", "C�p 20 tr� l�n v� �� tham gia v�o m�n ph�i m�i c� th� k�ch ho�t ��i tho�i v�i c�y");
        return 0;
    end
    --local nLeftTime = 30 * 60  - (GetTime() - GetUnitCurStates(nNpcIndex, 6));--NPC����ʣ�����
    --local nLeftMinute = floor(nLeftTime / 60);--ʣ����ٷ���
    --SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, nLeftMinute);
    SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, GetUnitCurStates(nNpcIndex, 6) + 30 * 60);
    CreateTrigger(1, 1501, 2509);
    ContinueTimer(GetTrigger(2509));
    Talk(1, "", format("Ng��i �� k�ch ho�t %s, xin �i nh�p %s nh�n th��ng.", szName, szBoxName));
end
