--�����ýű�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");
Import("\\script\\lib\\define.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};
Talk_1_4 = {};
TMain.msg = "<color=green>Tr�i B�c Song �ng L�c Nhi�n Phong<color>:";
TMain.sel = {
	{"L�m sao nh�n ���c danh v�ng ��i Danh Ph�?", Talk_1_1},
	{"L�m sao xem danh v�ng ��i Danh Ph� c�a ta?", Talk_1_2},
	{"L�m sao ��i th��ng danh v�ng ��i Danh Ph�?", Talk_1_3},
	{"Ta mu�n xem s� l�n ho�n th�nh nhi�m v� danh v�ng tu�n ho�n c�a tu�n n�y",Talk_1_4},
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
};



Talk_1_1.msg = "<color=green>Tr�i B�c Song �ng L�c Nhi�n Phong<color>: Ho�n th�nh nhi�m v� ban ��u ��i Danh Ph� � ch� <color=green>C�o Th� Tri�u ��nh<color> v� nhi�m v� h�ng ng�y � ch� Tr�i B�c Song �ng Ngu M�c S�n v� nhi�m v� tu�n ho�n (Tu�n), ��u c� th� t�ng danh v�ng ��i Danh Ph�.";
Talk_1_1.sel = {
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
}

Talk_1_2.msg = "<color=green>Tr�i B�c Song �ng L�c Nhi�n Phong<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n s� th�y ���c t�t c� danh v�ng hi�n t�i c�a b�n th�n.";
Talk_1_2.sel = {
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
}

Talk_1_3.msg = "<color=green>Tr�i B�c Song �ng L�c Nhi�n Phong<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n nh�p n�t Ph�n th��ng danh v�ng li�n minh th��ng h�i, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, ch�n khung danh v�ng ��i Danh Ph�, sau �� ch�n v�t ph�m mu�n ��i, nh�p n�t ta mu�n ��i l� ���c.";
Talk_1_3.sel = {
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
}

Talk_1_4.sel = {
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
}

function main()
	Talk_1_4.msg = format("<color=green>Tr�i B�c Song �ng L�c Nhi�n Phong<color>: Nhi�m v� danh v�ng tu�n ho�n (Tu�n) �� ho�n th�nh <color=green>%d<color> l�n, tu�n n�y c�n c� th� ho�n th�nh <color=green>%d<color> l�n.",GetTask(TASKID_SW_REPEAT_TASK_1),20-GetTask(TASKID_SW_REPEAT_TASK_1));
	temp_Talk(TMain);
end
