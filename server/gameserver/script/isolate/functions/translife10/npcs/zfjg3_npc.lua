Import("\\script\\task\\global_task\\gtask_data.lua")
npc_Cnt = 0;

function NpcDeath()
    npc_Cnt  = npc_Cnt - 1;
end


function main()
    local task_id = 540
    -- local task_info = GetInfo(task_id, 4)                   -- 4表示查询任务信息中的 任务NPC模板ID
    if tGtTask:check_cur_task(540) == 1 then
         local t = FinishGTask(540);
         if t ~= 1 then
            local szTitle = "Tr薾 Ph竝 C� Quan ch� c� 1 n髏:";
            local tSay = {}
            tinsert(tSay,"1. K輈h ho箃 n髏/npc_PushButton")
            tinsert(tSay,"2. Ta mu鑞 b� qua nhi謒 v�/npc_WantJump")
            tinsert(tSay,"3. R阨 kh醝/nothing")
            Say(szTitle,getn(tSay),tSay);
         else
            Msg2Player("Ho祅 th祅h nhi謒 v�")
         end
         return
	end
    tGtNpcMain:npc_main();
end

function npc_PushButton()
    if npc_Cnt <= 0 then
        Talk(1,"","Tr薾 Ph竝 C� Quan chuy觧 ng, 1 Con R鑙 Th� Tr薾 xu蕋 hi謓")
        local nNpcIdx = CreateNpc("sz_szkl","Con R鑙 Th� Tr薾",GetWorldPos());
        SetNpcDeathScript(nNpcIdx,"\\script\\isolate\\functions\\translife10\\ondeath\\szkl_ondeath.lua")
        npc_Cnt = npc_Cnt + 1;
    else
        Talk(1,"","Con R鑙 Th� Tr薾  xu蕋 hi謓, kh玭g th� tri謚 h錳 n鱝.")
        return
    end
end


function npc_WantJump()
    tGtNpcMain:npc_main();
end