Include("\\script\\isolate\\online_activites\\liyu_challenge\\main.lua")

---------------------------------------�������-------------------------------------------
liyu_npc_cnt = 0;

liyu_monster_npc = {
    template = "9y_szbqdyg",
    name = "Qu�i C� Ch�p H� ��",
    pos = {
        {106,1379,2918},{106,1387,2912},{106,1401,2901},{106,1411,2906},{106,1403,2917},
        {106,1402,2933},{106,1413,2923},{106,1424,2914},{106,1400,2940},{106,1412,2932},
    },
}

function liyu_handle_talk2liyuguai()
    local nCurNpcIndex = GetTargetNpc()
    if liyu_check_ms_date() ~= 1 then 
        Talk(1,"","Ho�t ��ng �� k�t th�c") 
        SetNpcLifeTime(nCurNpcIndex,0)
        return 
    end
    local npcidx = GetTargetNpc()
    local szTitle = "Qu�i C� Ch�p H� �� l�c n�o c�ng c� th� x�ng v�o l�ng t�n c�ng th�n d�n"
    local tSay = {}
    if liyu_condition_check(1) ~= 1 then
        tinsert(tSay,"R�i kh�i/nothing")
        Say(szTitle,getn(tSay),tSay)
        return
    end
    tinsert(tSay,format("D�ng 1 Thu�c Gi�i-Th�p/#liyu_use_med(1,%d)",npcidx))
    tinsert(tSay,format("D�ng Thu�c Gi�i-Trung/#liyu_use_med(2,%d)",npcidx))
    tinsert(tSay,format("D�ng Thu�c Gi�i-Cao (H�m nay c�n ���c n�p %d l�n)/#liyu_use_med(3,%d)",LIYU_HIGH_MED_LIMIT-get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.high_med),npcidx))
    tinsert(tSay,format("D�ng Thu�c Gi�i ��c Bi�t (H�m nay c�n ���c n�p %d l�n)/#liyu_use_med(4,%d)",LIYU_TOP_MED_LIMIT-get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.top_med),npcidx))
    tinsert(tSay,"R�i kh�i/nothing")
    Say(szTitle,getn(tSay),tSay)
end


function liyu_get_med_award(nType,nIndex,nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    local nRand = random(1,100)
    if gf_Judge_Room_Weight(1, 0) == 1 then    
        if nType == 1 then
            if nRand <= 40 then
                Talk(1,"","Sau khi u�ng thu�c gi�i, Qu�i C� Ch�p H� �� d�n bi�n th�nh m�t c� ch�p b�nh th��ng, nh�y m�a vui v� tr�n m�t ��t.")
                SetCurrentNpcSFX(nIndex,901,1,0)
                gf_AddItemEx({2,1,31147,1}, "R��ng L� H�i-Th��ng")
                -- AddRuntimeStat(46,2,1,1)
                
            else
                Talk(1,"","Sau khi u�ng thu�c gi�i, Qu�i C� Ch�p H� �� b� ch�y m�t, h�nh nh� thu�c gi�i kh�ng c� t�c d�ng.")
            end
            gf_Modify("Exp", LIYU_GIVE_MED_EXP1);
        elseif nType == 2 then
            SetCurrentNpcSFX(nIndex,901,1,0)
            Talk(1,"","Sau khi u�ng thu�c gi�i, Qu�i C� Ch�p H� �� d�n bi�n th�nh m�t c� ch�p b�nh th��ng, nh�y m�a vui v� tr�n m�t ��t.")
            gf_AddItemEx({2,1,31147,nNum}, "R��ng L� H�i-Th��ng")
            -- AddRuntimeStat(46,2,1,nNum)
            gf_Modify("Exp", LIYU_GIVE_MED_EXP2*nNum);
        elseif nType == 3 then
            SetCurrentNpcSFX(nIndex,901,1,0)
            Talk(1,"","Sau khi u�ng thu�c gi�i, Qu�i C� Ch�p H� �� d�n bi�n th�nh m�t c� ch�p b�nh th��ng, nh�y m�a vui v� tr�n m�t ��t.")
            gf_AddItemEx({2,1,31148,nNum}, "R��ng L� H�i-Cao")
            -- AddRuntimeStat(46,2,2,nNum)
            gf_Modify("Exp", LIYU_GIVE_MED_EXP3*nNum);
        else
            SetCurrentNpcSFX(nIndex,901,1,0)
            Talk(1,"","Sau khi u�ng thu�c gi�i, Qu�i C� Ch�p H� �� d�n bi�n th�nh m�t c� ch�p b�nh th��ng, nh�y m�a vui v� tr�n m�t ��t.")
            gf_AddItemEx({2,1,31149,nNum}, "R��ng L� H�i-H�o Hoa")
            -- AddRuntimeStat(46,2,3,nNum)
            gf_Modify("Exp", LIYU_GIVE_MED_EXP4*nNum);
        end
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return 0;
    end
    return 1;
end

function liyu_use_med2_CB(nNum) liyu_handle_use_med(2,nNum) end
function liyu_use_med3_CB(nNum) liyu_handle_use_med(3,nNum) end
function liyu_use_med4_CB(nNum) liyu_handle_use_med(4,nNum) end

function liyu_handle_use_med(nType,nNum)
    if liyu_check_ms_date() ~= 1 then 
        Talk(1,"","Ho�t ��ng �� k�t th�c") 
        return 
    end
    if nNum == 0 then return end
    if nType == 2 then
        if DelItem(2,1,31153,nNum) == 1 then
            if liyu_get_med_award(2,nIndex,nNum) ~= 1 then
                AddItem(2,1,31153,nNum) 
            end
        else
            Talk(1,"","Thu�c Gi�i-Trung tr�n ng��i kh�ng ��.")
        end
    elseif nType == 3 then
        local nCnt = get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.high_med)
        if nCnt + nNum > LIYU_HIGH_MED_LIMIT then
            Talk(1,"","N�p qu� nhi�u thu�c gi�i.")
            return
        end
        if DelItem(2,1,31154,nNum) == 1 then
            if liyu_get_med_award(3,nIndex,nNum) == 1 then
                set_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.high_med,nCnt+nNum)
            else
                AddItem(2,1,31154,nNum) 
            end
        else
            Talk(1,"","Tr�n ng��i kh�ng c� �� Thu�c Gi�i-Cao.")
        end
    else 
        local nCnt = get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.top_med)
        if nCnt + nNum > LIYU_TOP_MED_LIMIT then
            Talk(1,"","N�p qu� nhi�u thu�c gi�i.")
            return
        end
        if DelItem(2,1,31155,nNum) == 1 then
            if liyu_get_med_award(4,nIndex,nNum) == 1 then
                set_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.top_med,nCnt+nNum)
            else
                AddItem(2,1,31155,nNum) 
            end
        else
            Talk(1,"","Tr�n ng��i kh�ng c� �� Thu�c Gi�i ��c Bi�t.")
        end
    end
end

function liyu_use_med(nType,nIndex)
    if liyu_check_ms_date() ~= 1 then 
        Talk(1,"","Ho�t ��ng �� k�t th�c") 
        return 
    end
    if nType == 1 then
        if DelItem(2,1,31152,1) == 1 then
            if liyu_get_med_award(1,nIndex) ~= 1 then
                AddItem(2,1,31152,1) 
            end
        else
            Talk(1,"","Tr�n ng��i kh�ng c� Thu�c Gi�i-Th�p")
        end
    elseif nType == 2 then 
        AskClientForNumber("liyu_use_med2_CB", 0, GetItemCount(2,1,31153), "C�n d�ng bao nhi�u?");
    elseif nType == 3 then 
        local nMax = GetItemCount(2,1,31154)
        if nMax > LIYU_HIGH_MED_LIMIT - get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.high_med) then
            nMax = LIYU_HIGH_MED_LIMIT - get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.high_med) 
        end
        AskClientForNumber("liyu_use_med3_CB", 0, nMax, "C�n d�ng bao nhi�u?");
    elseif nType == 4 then 
        local nMax = GetItemCount(2,1,31155)
        if nMax > LIYU_TOP_MED_LIMIT - get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.top_med) then
            nMax = LIYU_TOP_MED_LIMIT - get_task_byte("tskid_byte",LIYU_DC_TSK_BYTE.top_med) 
        end
        AskClientForNumber("liyu_use_med4_CB", 0, nMax, "C�n d�ng bao nhi�u?");
    end
end
---------------------------------------�������------------------------------------------