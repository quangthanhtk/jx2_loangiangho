Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
function main()
    -- Talk(1,"","<color=green>相里玄策<color>:世与我而相违，复驾言兮焉求。")
    
    -- if tGtTask:check_cur_task(565) ~= 1 and tGtTask:check_cur_task(567) ~= 1 then
    --     Talk(1,"","<color=green>相里玄策<color>:世与我而相违，复驾言兮焉求。")
    --     return
    -- end
    if tGtNpcMain:npc_main(nil,"Th� s� ngc v韎 � ta, ta c遪 c� th� l祄 g�...") == 1 then
        Talk(1,"","<color=green>Tng L� Huy襫 S竎h<color>: Th� gi韎 ngo礽 t玦 kh玭g th輈h u, t玦 ch� mu鑞 s鑞g nh祅 nh� � y th玦.")
    end
end