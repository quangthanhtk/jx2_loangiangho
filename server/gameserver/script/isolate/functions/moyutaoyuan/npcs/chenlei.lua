Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
function main()
    -- if tGtTask:check_cur_task(566) ~= 1 then
    --     Talk(1,"","<color=green>����<color>:�����������ʲô��������ȥ���������Ӳ��ó�ȥ�������һ�����������Ҳ���Ǽ��������������ɣ�")
    --     return
    -- end
    -- tGtNpcMain:npc_main(nil,"�����������ʲô��������ȥ���������Ӳ��ó�ȥ�������һ�����������Ҳ���Ǽ��������������ɣ�");
    if tGtNpcMain:npc_main(nil,"Th� gi�i b�n ngo�i tr�ng nh� th� n�o, mu�n �i xem th� qu�. C� T� kh�ng cho ra ngo�i, v�y l�nh gi�o v� c�ng b�n ngo�i xem nh� m� r�ng ki�n th�c v�y!") == 1 then
        Talk(1,"","<color=green>Tr�n L�i<color>: Th� gi�i b�n ngo�i tr�ng nh� th� n�o, mu�n �i xem th� qu�. C� T� kh�ng cho ra ngo�i, v�y l�nh gi�o v� c�ng b�n ngo�i xem nh� m� r�ng ki�n th�c v�y!")
    end
end