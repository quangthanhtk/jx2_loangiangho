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
    if tdoneMs[1] == 1 and tdoneMs[2] == 1 and tdoneMs[3] == 1 and tdoneMs[4] == 1 and tdoneMs[5] == 1 then -- 本周所有任务都完成了
        Talk(1,"",format("<color=green>%s<color>: Tng T莕 ph秐 lo筺  b� x� l� g莕 xong, c遪 l筰 c� giao cho ta.  t�.",GetTargetNpcName()))
        return
    end
    for i = 1, getn(tTaskId) do
        if tGtTask:check_cur_task(tTaskId[i]) ~= 1 and tdoneMs[i] ~= 1 then
            ClearGTask(tTaskId[i])
        end
    end
    tGtNpcMain:npc_main(nil,"G莕 y, nh鱪g Tng Ngi b秓 v� th玭 l祅g b� ph竧 甶猲, kh玭g bi誸 t譶h tr筺g ngo礽 th玭 nh� th� n祇 r錳.");
end