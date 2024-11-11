Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")


function main()
    local nTaskId1 = 569
    local nTaskId2 = 570
    local doneMs1 = GetTask(TaoYuan_TskMission[1]);
    local doneMs2 = GetTask(TaoYuan_TskMission[2]);
    if doneMs1 == 1 and doneMs2 == 1 then -- �����������������
        Talk(1,"",format("<color=green>%s<color>: B�n ng��i Thi�n �m Gi�o �� b� gi�o hu�n, trong th�i gian ng�n s� kh�ng d�m sinh s� n�a. �a t�.",GetTargetNpcName()))
        return
    end
    if tGtTask:check_cur_task(nTaskId1) ~= 1 and doneMs1 ~= 1 then -- ����û��������Щ���񣬰����ܵļ�¼���
        ClearGTask(nTaskId1)
    end
    if tGtTask:check_cur_task(nTaskId2) ~= 1 and doneMs2 ~= 1  then
        ClearGTask(nTaskId2)
    end
    tGtNpcMain:npc_main(nil,"Thi�n �m Gi�o d�m l�m h� C� T� L�nh, n�u � S�ch ��o B� Hoang, M� �� S�n C�c, Th� Ngo�i ��o Vi�n ph�t hi�n ng��i c�a Thi�n �m Gi�o h�y di�t cho ta.");

end