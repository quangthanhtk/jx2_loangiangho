Import("\\script\\task\\global_task\\gtask_data.lua")

npc_Cnt = 0;

function NpcDeath()
    npc_Cnt  = npc_Cnt - 1;
end

function main()
    if tGtTask:check_cur_task(534) == 1 then
         if FinishGTask(534) ~= 1 then
            local szTitle = "Tr�n Ph�p C� Quan ch� c� 1 n�t:";
            local tSay = {}
            tinsert(tSay,"1. K�ch ho�t n�t/npc_PushButton")
            tinsert(tSay,"2. Ta mu�n b� qua nhi�m v�/npc_WantJump")
            tinsert(tSay,"3. R�i kh�i/nothing")
            Say(szTitle,getn(tSay),tSay);
         else
            Msg2Player("Ho�n th�nh nhi�m v�")
         end
         return
	end
    tGtNpcMain:npc_main();
end

function npc_PushButton()
    if npc_Cnt <= 0 then
        Talk(1,"","Tr�n Ph�p C� Quan chuy�n ��ng, 1 ��c Nh�n xu�t hi�n")
        local nNpcIdx = CreateNpc("sz_dr","��c Nh�n",GetWorldPos());
        SetNpcDeathScript(nNpcIdx,"\\script\\isolate\\functions\\translife10\\ondeath\\dr_ondeath.lua")
        npc_Cnt = npc_Cnt + 1;
    else
        Talk(1,"","��c Nh�n �� xu�t hi�n, kh�ng th� tri�u h�i n�a.")
        return
    end
end

function npc_WantJump()
    tGtNpcMain:npc_main();
end