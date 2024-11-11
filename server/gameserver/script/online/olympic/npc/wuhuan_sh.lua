Include("\\script\\online\\olympic\\oly_head.lua")

function main()
    if oly_Is_LevelSkill() ~= 1 then
        return 0;
    end
    if oly_IsActivityOpen() ~= 1 then
        return 0;
    end
    local tbSay = {
        format("D�ng 5 lo�i %s �� th�p s�ng/free_fire", HuoZhongName),
        format("D�ng %s �� th�p s�ng/ib_fire", WuCai_ShenHuoZhong[5]),
        "Ki�m tra s� l�n th�p s�ng c�a server/oly_GetFireCount",
        --"Nh�n th��ng m�c/_w_oly_GetAccumulateAward", --LongDaiKa: mod th�m ph�n th��ng s� l�n k�ch ho�t
        --"*** Set 1999 l�n/#gf_SetMyTaskByte(VET_OLY_TASK2,1,2,1999,TASK_ACCESS_CODE_OLYMPIC)", --LongDaiKa: mod th�m ph�n th��ng s� l�n k�ch ho�t
        "\n r�t lui/do_nothing",
    }
    local nCount = gf_GetMyTaskByte(VET_OLY_TASK2, 1, 2);
    local nIndex = oly_GetCountStep(nCount);
    local sTitle = ""
    if nIndex ~= 0 then
        sTitle = format("%s: B�n �� t�ch l�y th�p l�a %d l�n, ti�p t�c th�p th�m %d l�n s� nh�n ���c ph�n th��ng %s", WuCai_ShenHuoZhong[5]
        , nCount, OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][1] - nCount, OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][4]);
    else
        sTitle = format("%s: B�n �� t�ch l�y th�p l�a %d l�n, �� nh�n ���c t�t c� ph�n th��ng", WuCai_ShenHuoZhong[5], nCount);
    end
    if nCount >= OLY_ACCUMULATE_FIRE_AWARD_TABLE[getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE)][1] then
        tremove(tbSay, 2);
    end
    Say(sTitle, getn(tbSay), tbSay);
end

function free_fire()
    if gf_GetMyTaskBit(VET_OLY_TASK3, 26, 30) >= 3 then
        Talk(1, "", format("%s c�a m�i th�nh th� ch� c� th� th�p l�a %d l�n/ng�y", HuoTanNpcName, 3));
        return 0;
    end
    if gf_Judge_Room_Weight(3, 10, "") ~= 1 then
        Talk(1, "", "Kh�ng gian h�nh trang kh�ng ��")
        return 0;
    end
    --������ȫ
    local tempTb = "Kh�ng �� v�t ph�m th�p s�ng ch�a th�nh c�ng: \n";
    local nFlag = 0;
    for i = 1, getn(Flame_Table) do
        if GetItemCount(Flame_Table[i][1], Flame_Table[i][2], Flame_Table[i][3]) < 1 then
            tempTb = tempTb .. Flame_Table[i][5] .. " ";
            nFlag = 1;
        end
    end
    if nFlag == 1 then
        Talk(1, "", tempTb);
        return 0;
    end
    --ɾ������
    nFlag = 0;
    for i = 1, getn(Flame_Table) do
        if DelItem(Flame_Table[i][1], Flame_Table[i][2], Flame_Table[i][3], 1) ~= 1 then
            nFlag = 1;
        end
    end
    if nFlag == 1 then
        return -1;
    end
    --�����1
    gf_SetMyTaskBit(VET_OLY_TASK3, 26, 30, gf_GetMyTaskBit(VET_OLY_TASK3, 26, 30) + 1, TASK_ACCESS_CODE_OLYMPIC);
    SetCurrentNpcSFX(GetTargetNpc(), 975, 2, 0, 3);
    --���յ�����
    if gf_GetTaskByte(VET_OLY_TASK, 1) < 18 then
        gf_SetTaskByte(VET_OLY_TASK, 1, gf_GetTaskByte(VET_OLY_TASK, 1) + 1, TASK_ACCESS_CODE_OLYMPIC);
    end
    --�ۼƵ�����
    --oly_Accumulate_FireNum();
    --������2
    --oly_GiveAward2();

    --LongDaiKa: mod th�m t�ch lu�
    WTask:Modify(WTASKID_THANHHOADAN_ACTIVE_FIRE_COUNT, 1);

    ModifyExp(N_FIRE_SINGLE_EXP);
    AddPop(T_FIRE_SINGLE_POP[2], T_FIRE_SINGLE_POP[3]);
    Msg2Player(format("Nh�n %d %s", T_FIRE_SINGLE_POP[2], T_FIRE_SINGLE_POP[1]));
    CustomAwardGiveGroup("Fire_Single", 0);
    --ȫ��������
    oly_AddFireCount(1);
end

function ib_fire()
    AskClientForNumber("ib_fire_Rec", 1, min(OLY_IB_FIRE_MAX_NUM, GetItemCount(WuCai_ShenHuoZhong[1], WuCai_ShenHuoZhong[2], WuCai_ShenHuoZhong[3])), "H�y  nh�p s� l�n th�p s�ng v�o :");
end

function ib_fire_Rec(nNum)
    if not nNum or nNum <= 0 then
        return
    end
    SetCurrentNpcSFX(GetTargetNpc(), 975, 2, 0, 3);
    local nCount = 0;
    for i = 1, nNum do
        if ib_fire_do() <= 0 then
            break ;
        end
        nCount = i
    end

    --LongDaiKa: mod th�m t�ch lu�
    WTask:Modify(WTASKID_THANHHOADAN_ACTIVE_FIRE_COUNT, nCount);
    
    --ȫ��������
    oly_AddFireCount(nCount * 3);
end

function ib_fire_do()
    if gf_Judge_Room_Weight(3, 10, "") ~= 1 then
        Talk(1, "", "Kh�ng gian h�nh trang kh�ng ��")
        return 0;
    end
    if GetItemCount(WuCai_ShenHuoZhong[1], WuCai_ShenHuoZhong[2], WuCai_ShenHuoZhong[3]) < 1 then
        Talk(1, "", format("Thi�u %s, kh�ng th� th�p s�ng %s.", WuCai_ShenHuoZhong[5], HuoTanNpcName));
        return 0;
    end
    if DelItem(WuCai_ShenHuoZhong[1], WuCai_ShenHuoZhong[2], WuCai_ShenHuoZhong[3], 1) ~= 1 then
        return -1;
    end
    --���յ�����
    if gf_GetTaskByte(VET_OLY_TASK, 1) < 18 then
        gf_SetTaskByte(VET_OLY_TASK, 1, gf_GetTaskByte(VET_OLY_TASK, 1) + 1, TASK_ACCESS_CODE_OLYMPIC);
    end
    --�ۼƵ�����
    oly_Accumulate_FireNum();
    --������3
    --oly_GiveAward3();
    ModifyExp(N_FIRE_FIVE_EXP)
    --gf_AddCampPop(5);
    return CustomAwardGiveGroup("Fire_Five", 0);
end
