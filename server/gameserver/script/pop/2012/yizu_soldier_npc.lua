Import("\\script\\lib\\define.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

--�ɹ���������
function OnDeath(nNpcIdx)
	if tGtTask:check_cur_task(921) == 1 then
		Talk(1,"","S� Quan Li�u Qu�c: ��i hi�p ��ng ��nh n�a! Qu� th�t ta kh�ng bi�t t�nh h�nh c� th�, ch� nghe n�i r�ng c�ng ph�m �ang ���c �� nh�t cao th� c�a Li�u Qu�c tr�ng coi! Xin ��i hi�p tha m�ng!");
		SetTask(TASKID_SW_USE_ANTIDOTE,1);
	end
	RemoveNpc(nNpcIdx);
end
