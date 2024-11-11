Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	npc_talk_main()
end

function npc_talk_main()
	local tbSay = {}
	tinsert(tbSay, format("%s/how_to_enter", "L�m sao �� v�o V�n Linh ��i"))
	tinsert(tbSay, format("%s/#iwant_enter(0)", "V�o V�n Linh ��i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>Y�u H�<color>", "Ch�o m�ng ��n v�i V�n Linh ��i, b�n chu�n b� xong ch�a?")
	Say(szMsg,getn(tbSay),tbSay)
end

function how_to_enter()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>Y�u H�<color>", "C� th� c� nh�n ho�c t� ��i �� v�o. C� nh�n v�o:  c�n ho�n th�nh nhi�m v� s� thi v� kh� H�a Ph�ng tr��c, ti�u hao 1 Thi�n Ki�u L�nh �� v�o. T� ��i v�o:  ��i tr��ng c�n ho�n th�nh nhi�m v� s� thi v� kh� H�a Ph�ng, n�p cho b�n th�n v� t�t c� th�nh vi�n, m�i ng��i 1 Thi�n Ki�u L�nh m�i c� th� v�o.")
	Say(szMsg,getn(tbSay),tbSay)
end


function iwant_enter(bConfirm)
	if not bConfirm or bConfirm ~= 1 then
		local tbSay = {}
		tinsert(tbSay, format("%s/#iwant_enter(1)", "X�c nh�n �i v�o"))
		tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
		tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
		local szMsg = format("%s:%s", "<color=green>Y�u H�<color>", "�i v�o V�n Linh ��i ��i tr��ng ti�u hao thi�n ki�u l�nh ,s� l��ng t��ng ���ng v�i s� ng��i t� ��i, c� x�c nh�n �i v�o kh�ng?")
		Say(szMsg,getn(tbSay),tbSay)
		return
	end
	
	local nPlayerNum = GetTeamSize()
	if nPlayerNum < 1 then
		nPlayerNum = 1
	end
	if tGtTask:check_task_isfinish(270) ~= 1 then
		Talk(1,"","Ho�n th�nh chu�i nhi�m v� H�a Ph�ng m�i ���c v�o V�n Linh ��i!")
		return
	end
	if nPlayerNum > 1 then
    	if GetName() ~= GetCaptainName() then
    		Talk(1,"",g_NpcName.."Ch� c� ��i tr��ng m�i ���c thao t�c");
    		return 0;
    	end
	end
	local nOK,szMsg = consume_tianjiaoling(0, nPlayerNum)
	if  nOK ~= 1 then
		Talk(1,"",szMsg)
		return 0
	end
	nOK,szMsg = consume_tianjiaoling(1, nPlayerNum)
	if  nOK ~= 1 then
		Talk(1,"",szMsg)
		return 0
	end
	gf_TeamOperateEX(confirm_enter)
	return 1
end


function confirm_enter()
	NewWorld(8011, 1554, 3222)
	SetFightState(1)
end

T_NEED_ITEM = {
	{"Thi�n Ki�u L�nh",2,97,236,1},
}
function consume_tianjiaoling(bDelete, nPlayerNum)
	local szMsg = nil
	for i = 1, getn(T_NEED_ITEM) do
    	local ti = T_NEED_ITEM[i]
    	local nNeed = ti[5] * nPlayerNum
    	if ti[2] ~= -1 then
        	if GetItemCount(ti[2], ti[3], ti[4]) < nNeed then
        		szMsg = format("%sx%d kh�ng ��", ti[1], nNeed)
        		return 0,szMsg
        	end
    	else
    		if GetCash() < nNeed*10000 then
    			szMsg = format("Kh�ng c� %d%s", ti[1], nNeed)
        		return 0,szMsg
    		end
    	end
	end
	
	if 1 == bDelete then --���ж����ͨ���ˣ�ִ��ɾ��
		for i = 1, getn(T_NEED_ITEM) do
            local ti = T_NEED_ITEM[i]
            local nNeed = ti[5] * nPlayerNum
        	if ti[2] ~= -1 then
        		local nDelResult = DelItem(ti[2], ti[3], ti[4], nNeed)
        		if not nDelResult or nDelResult ~= 1  then
        			return 0,szMsg
        		end
        	else
        		if 1 ~= Pay(nNeed*10000) then
        			return 0,szMsg
        		end
        	end
    	end
	end
	return 1,szMsg
end
