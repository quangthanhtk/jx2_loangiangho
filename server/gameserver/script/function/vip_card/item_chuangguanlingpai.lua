Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function OnUse(nItemIdx)
	get_mission_task(nItemIdx)
end


function get_mission_task(nItemIdx, bConfirm)
	local nTaskId = 487
	local nNeedGold = 100
	local nNeedItem = 1
	local szTaskName = "Nhi�m v� v��t �i"
	
	if tGtTask:check_cur_task(nTaskId)==1 then--�Ѿ�������
		--if tGtTask:IsTaskCanOver(nTaskId) == 1 then
			if not bConfirm then
    			local szTitle = format("C� ph�i ��i hi�p �� ho�n th�nh %s, mu�n nh�n th��ng?", szTaskName)
            	local tbSay = {}
            	tinsert(tbSay, format("%s/#get_mission_task(%d,1)", "Nh�n l�y ph�n th��ng.",nItemIdx))
            	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
            	Say(szTitle, getn(tbSay), tbSay)
    		else
    			if FinishGTask(nTaskId) == 1 then
    				Talk(1, "", format("B�n �� nh�n ph�n th��ng th�nh c�ng.", szTaskName))
    			else
    				Talk(1, "", format("B�n ch�a ho�n th�nh %s", szTaskName))
    			end
    		end
--    	else
--    		Talk(1, "", format("��ʿ������δ��ɵ�%s����������������", szTaskName))
--		end
		return
	end
	
	------��û������
	
	if not bConfirm then
		local szTitle = format("Ti�u hao %d %s �� nh�n %s, ho�n th�nh %s s� nh�n ���c nhi�u kinh nghi�m, x�c ��nh d�ng?", nNeedGold, " Kim ", szTaskName, szTaskName)
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#get_mission_task(%d,1)", "Nh�n ",nItemIdx))
    	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    	Say(szTitle, getn(tbSay), tbSay)
		return
	end
	
	if GetCash() < nNeedGold * 10000 then
		Talk(1,"",format("Kh�ng �� ti�n"))
		return
	end
	
	if Pay(nNeedGold * 10000) == 1 then
		if OpenGTask(nTaskId) == 1 then
			Talk(1, "", format("B�n �� nh�n ���c nhi�m v� %s", szTaskName))
		else
			Talk(1, "", format("B�n nh�n nhi�m v� %s th�t b�i", szTaskName))
		end
		return 1
	end
end
