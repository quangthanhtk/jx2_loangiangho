-- �󷨻���1
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\lib\\globalfunctions.lua");
function main()
    if tGtTask:check_cur_task(536) == 1 then
         local t = FinishGTask(536);
         if t ~= 1 then
            local szTitle = "Tr�n Ph�p C� Quan c� 2 n�t:";
            local tSay = {}
            tinsert(tSay,"1. �n n�t b�n tr�i/#npc_PushButton(1)")
            tinsert(tSay,"2. �n n�t b�n ph�i/#npc_PushButton(0)")
            tinsert(tSay,"3. R�i kh�i/nothing")
            Say(szTitle,getn(tSay),tSay);
         end
         return
	end
    tGtNpcMain:npc_main();
end

function npc_PushButton( nPara )
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng d�");
        return
	end
    if nPara == 1 then
        Talk(1,"","�� m� ���c Tr�n Ph�p C� Quan, 1 Tr�n Ph� r�i ra.")
        AddItem(2,0,31003,1);
    else
        Talk(1,"","K�ch ho�t sai Tr�n Ph�p C� Quan, h�y th� ph� gi�i l�i.")
        return
    end
end