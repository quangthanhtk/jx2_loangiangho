Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
function main()
    -- if tGtTask:check_cur_task(566) ~= 1 then
    --     Talk(1,"","<color=green>陈磊<color>:外面的世界是什么样，真想去看看。钜子不让出去，那领教一下外面的武艺也算是见到了外面的世界吧！")
    --     return
    -- end
    -- tGtNpcMain:npc_main(nil,"外面的世界是什么样，真想去看看。钜子不让出去，那领教一下外面的武艺也算是见到了外面的世界吧！");
    if tGtNpcMain:npc_main(nil,"Th� gi韎 b猲 ngo礽 tr玭g nh� th� n祇, mu鑞 甶 xem th� qu�. C� T� kh玭g cho ra ngo礽, v藋 l穘h gi竜 v� c玭g b猲 ngo礽 xem nh� m� r閚g ki課 th鴆 v藋!") == 1 then
        Talk(1,"","<color=green>Tr莕 L鏸<color>: Th� gi韎 b猲 ngo礽 tr玭g nh� th� n祇, mu鑞 甶 xem th� qu�. C� T� kh玭g cho ra ngo礽, v藋 l穘h gi竜 v� c玭g b猲 ngo礽 xem nh� m� r閚g ki課 th鴆 v藋!")
    end
end