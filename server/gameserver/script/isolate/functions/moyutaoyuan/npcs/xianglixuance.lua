Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
function main()
    -- Talk(1,"","<color=green>��������<color>:�����Ҷ���Υ��������������")
    
    -- if tGtTask:check_cur_task(565) ~= 1 and tGtTask:check_cur_task(567) ~= 1 then
    --     Talk(1,"","<color=green>��������<color>:�����Ҷ���Υ��������������")
    --     return
    -- end
    if tGtNpcMain:npc_main(nil,"Th� s� ng��c v�i � ta, ta c�n c� th� l�m g�...") == 1 then
        Talk(1,"","<color=green>T��ng L� Huy�n S�ch<color>: Th� gi�i ngo�i t�i kh�ng th�ch ��u, t�i ch� mu�n s�ng nh�n nh� � ��y th�i.")
    end
end