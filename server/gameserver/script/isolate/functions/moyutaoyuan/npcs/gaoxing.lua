Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")


function main()
    local tTaskId = {
        571,572,573,574,575,
    }
    local tdoneMs = {
        0, 0, 0, 0, 0
    }
    for i = 1,getn(tdoneMs) do
        tdoneMs[i] = GetTask(TaoYuan_TskMission[2 + i])
    end
    if tdoneMs[1] == 1 and tdoneMs[2] == 1 and tdoneMs[3] == 1 and tdoneMs[4] == 1 and tdoneMs[5] == 1 then -- �����������������
        Talk(1,"",format("<color=green>%s<color>: T��ng T�n ph�n lo�n �� b� x� l� g�n xong, c�n l�i c� giao cho ta. �a t�.",GetTargetNpcName()))
        return
    end
    for i = 1, getn(tTaskId) do
        if tGtTask:check_cur_task(tTaskId[i]) ~= 1 and tdoneMs[i] ~= 1 then
            ClearGTask(tTaskId[i])
        end
    end
    tGtNpcMain:npc_main(nil,"G�n ��y, nh�ng T��ng Ng��i b�o v� th�n l�ng b� ph�t �i�n, kh�ng bi�t t�nh tr�ng ngo�i th�n nh� th� n�o r�i.");
end