--�����ýű�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};

TMain.msg = "<color=green>L� Ng�o Thi�n<color>: <color=green>N��c T�y H�<color> c�a ch�ng ta l�u nay kh�ng th�ch k�t th� v�i ng��i kh�c, ch� tr�ch b�n <color=green>��i L�<color> v� <color=green>Th� Ph�n<color> hi�p ng��i qu� ��ng! Xem ra ��i hi�p l� ng��i hi�u l� l�, h�y gi�p <color=green>T�y H�<color> m�t tay, <color=green>T�y H� Minh M�n<color> s� tr�ng th��ng cho V� L�m Minh!";
TMain.sel = {
	{"Ta mu�n t�m hi�u danh v�ng V� L�m Minh", Talk_1},
	{"Ra kh�i", "nothing",},
};

Talk_1.msg = "<color=green>L� Ng�o Thi�n<color>: <color=green>T�y H� Minh M�n<color> ch� tr� giang h� T�y H� �� nhi�u n�m, l�n n�y n��c T�y H� ph�i ch�u nh�c, ch�ng t�i sao c� th� th� �? Ch� c�n thi�u hi�p ch�u gi�p ch�ng ta m�t tay, <color=green>T�y H� Minh M�n<color> s� h�u t� s� tr� gi�p c�a V� L�m Minh!";
Talk_1.sel = {
	{"L�m sao nh�n ���c danh v�ng V� L�m Minh?", Talk_1_1},
	{"L�m sao xem danh v�ng V� L�m Minh?", Talk_1_2},
	{"L�m sao ��i th��ng danh v�ng V� L�m Minh?", Talk_1_3},
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
};

Talk_1_1.msg = "<color=green>L� Ng�o Thi�n<color>: C� 3 c�ch �� nh�n ���c danh v�ng V� L�m Minh: Ho�n th�nh nhi�m v� ch�nh c�a phe; ho�n th�nh nhi�m v� h�ng ng�y c�a phe; ho�n th�nh nhi�m v� danh v�ng ng�u nhi�n � ch� <color=green>Danh V�ng V� L�m Minh S�<color>";
Talk_1_1.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_2.msg = "<color=green>L� Ng�o Thi�n<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n s� th�y ���c t�t c� danh v�ng hi�n t�i c�a b�n th�n.";
Talk_1_2.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_3.msg = "<color=green>L� Ng�o Thi�n<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n nh�p n�t Ph�n th��ng danh v�ng V� L�m Minh, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, nh�p chu�t ��i v�o v�t ph�m mu�n ��i l� ���c!";
Talk_1_3.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

function main()
	--�ж�δ��������
	if GetTask(3301) ~= 0 then
		temp_Talk(TMain);
	else
		Talk(1, "", "<color=green>L� Ng�o Thi�n<color>: ��i hi�p kh�ng mu�n gi�p �� <color=green>��i L�<color> c�a ta, ta v� ng��i kh�ng c�n g� �� n�i n�a!");
	end
end
