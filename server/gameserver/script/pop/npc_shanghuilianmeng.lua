--�����ýű�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};

TMain.msg = "<color=green>Li�n Minh Th��ng H�i S�<color>: Ng��i trong th��ng h�i ch�ng t�i l�u nay r�t th�ch k� tr�n d� b�o, l�n n�y li�n minh th��ng h�i k�t giao giang h� h�o ki�t, mong c�c v� c� th� gi�p ch�ng t�i thu th�p th�m nhi�u b�o b�i, ch�ng t�i s� h�u ta sau!";
TMain.sel = {
	{"Ta mu�n t�m hi�u danh v�ng Li�n Minh Th��ng H�i", Talk_1},
	{"Ra kh�i", "nothing",},
};

Talk_1.msg = "<color=green>Li�n Minh Th��ng H�i S�<color>: Ng��i trong th��ng h�i ch�ng t�i l�u nay r�t th�ch k� tr�n d� b�o, l�n n�y li�n minh th��ng h�i k�t giao giang h� h�o ki�t, mong c�c v� c� th� gi�p ch�ng t�i thu th�p th�m nhi�u b�o b�i, ch�ng t�i s� h�u ta sau!";
Talk_1.sel = {
	{"L�m sao nh�n ���c danh v�ng Li�n Minh Th��ng H�i?", Talk_1_1},
	{"L�m sao xem danh v�ng Li�n Minh Th��ng H�i?", Talk_1_2},
	{"L�m sao ��i th��ng danh v�ng Li�n Minh Th��ng H�i?", Talk_1_3},
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
};

Talk_1_1.msg = "<color=green>Li�n Minh Th��ng H�i S�<color>: Ho�n th�nh chu�i nhi�m v� li�n minh th��ng h�i ban ��u � ch� <color=green>Ch� ti�n trang V�n gia Ti�n Phu Nh�n<color> v� nhi�m v� li�n minh th��ng h�i h�ng ng�y, ��u c� th� t�ng danh v�ng Li�n Minh Th��ng H�i.";
Talk_1_1.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_2.msg = "<color=green>Li�n Minh Th��ng H�i S�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n s� th�y ���c t�t c� danh v�ng hi�n t�i c�a b�n th�n.";
Talk_1_2.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_3.msg = "<color=green>Li�n Minh Th��ng H�i S�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n nh�p n�t Ph�n th��ng danh v�ng li�n minh th��ng h�i, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, nh�p chu�t ��i v�o v�t ph�m mu�n ��i l� ���c!";
Talk_1_3.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

function main()
	temp_Talk(TMain);
end
