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

TMain.msg = "<color=green>L�c Phi�n M�n Danh V�ng S�<color>: Thi�n �m Gi�o g�n ��y th�t hi�p ng��i qu� ��ng! Ch�ng ta ph�i t� ��i danh b� �i �i�u tra t�nh h�nh c�a Thi�n �m Gi�o, k�t qu� Tuy�t T�nh v� ��a S�t ��u b� m�t t�ch! C�i g�? Ng��i b�o ng��i c�a L�c Phi�n M�n v�n l� h�nh tunh b�t ��nh? �i, lo cho h� qu�, Truy Phong �i t�m h� r�i, kh�ng bi�t t�nh h�nh th� n�o r�i!..";
TMain.sel = {
	{"Ta mu�n t�m hi�u danh v�ng L�c Phi�n M�n", Talk_1},
	{"Ra kh�i", "nothing",},
};

Talk_1.msg = "<color=green>L�c Phi�n M�n Danh V�ng S�<color>: L�c Phi�n M�n tr��c nay lu�n h�nh ��ng ��c l�p, r�t �t khi xu�t hi�n tr�n giang h�. L�n n�y v� chuy�n \"B�ch H�i Lam\" b� tr�m, �� tri�u t�p v� l�m cao th� v� ��y, nh�ng ng��i tr� gi�p ch�ng ta s� ���c h�u t�!";
Talk_1.sel = {
	{"L�m sao nh�n ���c danh v�ng L�c Phi�n M�n?", Talk_1_1},
	{"L�m sao xem danh v�ng L�c Phi�n M�n c�a ta?", Talk_1_2},
	{"L�m sao ��i th��ng danh v�ng L�c Phi�n M�n?", Talk_1_3},
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
};

Talk_1_1.msg = "<color=green>L�c Phi�n M�n Danh V�ng S�<color>: Ho�n th�nh chu�i nhi�m v� ban ��u L�c Phi�n M�n v� nhi�m v� h�ng ng�y � ch� <color=green>Nh� s� L�c T�n M�n ��p V�n<color>.";
Talk_1_1.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_2.msg = "<color=green>L�c Phi�n M�n Danh V�ng S�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n s� th�y ���c t�t c� danh v�ng hi�n t�i c�a b�n th�n.";
Talk_1_2.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_3.msg = "<color=green>L�c Phi�n M�n Danh V�ng S�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n nh�p <color=yellow>n�t Ph�n th��ng danh v�ng L�c Phi�n M�n<color>, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, nh�p chu�t ��i v�o v�t ph�m mu�n ��i l� ���c!";
Talk_1_3.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

function main()
	temp_Talk(TMain);
end
