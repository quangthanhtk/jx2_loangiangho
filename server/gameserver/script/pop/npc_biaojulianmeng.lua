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

TMain.msg = "<color=green>Li�n Minh Ti�u C�c S�<color>: Thi�n �m Gi�o lu�n ��i ��u v�i ch�ng ta, e r�ng l� �ang t�m S�n H� X� T�c ��. Xem ra kh�ng nh�ng ti�u c�c c�a ch�ng ta g�p n�n, c� giang h� c�ng �ang l�m nguy!";
TMain.sel = {
	{"Ta mu�n t�m hi�u danh v�ng Li�n Minh Ti�u C�c", Talk_1},
	{"Ra kh�i", "nothing",},
};

Talk_1.msg = "<color=green>Li�n Minh Ti�u C�c S�<color>: Li�n minh ti�u c�c c�a ch�ng ta lu�n mu�n d� h�a vi qu�. V�i th�ng nay Thi�n �m Gi�o �i kh�p n�i ��i ��u v�i ch�ng ta, r�t nhi�u huynh �� �� b� h� ��c th�. M�t ti�u l� chuy�n nh�, danh d� c�a ti�u c�c m�i l� chuy�n l�n, t�t c� ti�u c�c h�y h�p th�nh li�n minh ti�u c�c, chi�u m� h�o ki�t gi�p �� ch�ng ta m�t tay, s� c� qu� t�ng cho ng��i ho�n th�nh!";
Talk_1.sel = {
	{"L�m sao nh�n ���c danh v�ng Li�n Minh Ti�u C�c?", Talk_1_1},
	{"L�m sao xem danh v�ng Li�n Minh Ti�u C�c c�a ta?", Talk_1_2},
	{"L�m sao ��i th��ng danh v�ng Li�n Minh Ti�u C�c?", Talk_1_3},
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
};

Talk_1_1.msg = "<color=green>Li�n Minh Ti�u C�c S�<color>: Ho�n th�nh chu�i nhi�m v� li�n minh ti�u c�c ban ��u v� nhi�m v� h�ng ng�y � ch� <color=green>T�ng Ti�u ��u Thi�n H�nh Ti�u C�c-Thi�n Kh�i<color>, ��u c� th� t�ng danh v�ng Li�n Minh Ti�u C�c.";
Talk_1_1.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_2.msg = "<color=green>Li�n Minh Ti�u C�c S�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n s� th�y ���c t�t c� danh v�ng hi�n t�i c�a b�n th�n.";
Talk_1_2.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_3.msg = "<color=green>Li�n Minh Ti�u C�c S�<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n nh�p <color=yellow>n�t Ph�n th��ng danh v�ng Li�n Minh Ti�u C�c<color>, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, nh�p chu�t ��i v�o v�t ph�m mu�n ��i l� ���c!";
Talk_1_3.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

function main()
	temp_Talk(TMain);
end
