--�����ýű�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};
Talk_2 = {};
TMain.msg = "<color=green>Danh v�ng Chi�t Xung X�<color>:  ";
TMain.sel = {
	{"Ta mu�n n�p t�nh b�o n��c ��ch",Talk_2},
	{"Ta mu�n t�m hi�u danh v�ng Chi�t Xung X�", Talk_1},
	{"Ra kh�i", "nothing",},
};

Talk_1.msg = "<color=green>Danh v�ng Chi�t Xung X�<color>:  ";
Talk_1.sel = {
	{"L�m sao nh�n ���c danh v�ng Chi�t Xung X�?", Talk_1_1},
	{"L�m sao xem danh v�ng Chi�t Xung X� c�a ta?", Talk_1_2},
	{"L�m sao ��i th��ng danh v�ng Chi�t Xung X�?", Talk_1_3},
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
};

Talk_1_1.msg = "<color=green>danh v�ng Chi�t Xung X�<color>: B�n c� 3 c�ch �� nh�n ���c danh v�ng Chi�t Xung X�, ho�n th�nh nhi�m v� ch�nh c�a phe; ho�n th�nh nhi�m v� h�ng ng�y c�a phe; ho�n th�nh nhi�m v� danh v�ng ng�u nhi�n � ch� <color=green>Danh V�ng Th��ng Nh�n<color>.";
Talk_1_1.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_2.msg = "<color=green>Danh v�ng Chi�t Xung X�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n s� th�y ���c t�t c� danh v�ng hi�n t�i c�a b�n th�n.";
Talk_1_2.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_3.msg = "<color=green>Danh v�ng Chi�t Xung X�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n nh�p n�t Ph�n th��ng danh v�ng Chi�t Xung X�, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, nh�p chu�t ��i v�o v�t ph�m mu�n ��i l� ���c!";
Talk_1_3.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

function main()
	temp_Talk(TMain);
end
