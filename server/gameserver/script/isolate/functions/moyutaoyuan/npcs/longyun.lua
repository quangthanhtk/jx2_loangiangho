Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")


function main()
    local nTaskId1 = 569
    local nTaskId2 = 570
    local doneMs1 = GetTask(TaoYuan_TskMission[1]);
    local doneMs2 = GetTask(TaoYuan_TskMission[2]);
    if doneMs1 == 1 and doneMs2 == 1 then -- 本周所有任务都完成了
        Talk(1,"",format("<color=green>%s<color>: B鋘 ngi Thi猲  Gi竜  b� gi竜 hu蕁, trong th阨 gian ng緉 s� kh玭g d竚 sinh s� n鱝.  t�.",GetTargetNpcName()))
        return
    end
    if tGtTask:check_cur_task(nTaskId1) ~= 1 and doneMs1 ~= 1 then -- 本周没有做过这些任务，把上周的记录清掉
        ClearGTask(nTaskId1)
    end
    if tGtTask:check_cur_task(nTaskId2) ~= 1 and doneMs2 ~= 1  then
        ClearGTask(nTaskId2)
    end
    tGtNpcMain:npc_main(nil,"Thi猲  Gi竜 d竚 l祄 h� C� T� L謓h, n誹 � S竎h Чo B� Hoang, M� у S琻 C鑓, Th� Ngo筰 Уo Vi猲 ph竧 hi謓 ngi c馻 Thi猲  Gi竜 h穣 di謙 cho ta.");

end