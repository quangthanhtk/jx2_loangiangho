Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local tSay = {
		"S� d�ng 999 V� T� Kinh Th� s� nh�n ���c 01 M�t T�ch Cao C�p 15% (Ng�u nhi�n)/wzjs_exchange_1",
		"S� d�ng 999 V� T� Kinh Th�, ti�u hao 100 Xu ��o c� nh�n ���c 01 M�t T�ch Cao C�p 15% (Theo l�u ph�i c�a ng��i ch�i)/wzjs_exchange_2",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("C�ch s� d�ng:", getn(tSay), tSay);
end

function wzjs_exchange_1()
	if GetItemCount(2,1,30785) < 999 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "V� T� Kinh Th�", 999))
		return 0;
	end
	if DelItem(2,1,30785,999) ~= 1 then
		return 0;
	end
	ahf_GetGaojiZhenjuan(0, 1, 1, 2)
end

function wzjs_exchange_2()
	if GetItemCount(2,1,30785) < 999 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "V� T� Kinh Th�", 999))
		return 0;
	end
	if GetItemCount(2,1,30230) < 100 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "XU", 100))
		return 0;
	end
	if DelItem(2,1,30785,999) ~= 1 or DelItem(2,1,30230,100) ~= 1 then
		return 0;
	end
	ahf_GetGaojiZhenjuan(1, 1, 1, 2)
end