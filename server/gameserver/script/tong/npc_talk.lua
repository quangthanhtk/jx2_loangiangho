--some npc

tTongNpcTalk = {
	{"Tr��ng l�o B�ch Hi�u Sinh","V� L�m Minh l� li�n minh t� ph�t c�a v� l�m nh�n s� trung nguy�n �� ch�ng l�i Thi�n �m Gi�o."},
	{"�ch B�o Trai - Gia C�t K�","�ch B�o Trai l� kho c�a bang ph�i, bang ph�i c� th� d� tr� bao nhi�u ti�n qu� th� ph�i ph� thu�c v�o c�p c�a �ch B�o Trai."},
	{"Thi�u ch� T�ng Ki�m Di�p T� Kh�u","Thi�t Di�n huynh �� ��ng lo, ta �� b�o H�o Nh�t Doanh d�n theo ng��i �i vi�n tr� ��a S�t v� Tuy�t T�nh."},
	{"Th��ng thi�n ph�t �c s� - H�n �an T�m","Th��ng thi�n ph�t �c ���ng, g�p thi�n s� th��ng, g�p �c s� ph�t."},
	{"B�o Ch�u Kim Cang c�a Thi�u L�m","Ta kh�ng v�o ��a ng�c th� ai v�o ��a ng�c."},
	{"Tr�n Tr�c H�o-Ng�c di�n th� sinh c�a V� �ang","V� ngh� c�a D��ng t��ng qu�n qu� nhi�n cao c��ng, ch�ng ta l�m l�i n�o."},
	{"D��ng gia gi�o ��u D��ng Tam B�o","Tr�n huynh �� l� ng��i h�o ph�ng, t� v� v�i huynh �y th�t l� vui."},
	{"Tr�ng Khai Vinh-Tr��ng l�o h�nh ���ng c�a C�i Bang","Huynh �� C�i Bang � kh�p thi�n h�, h�nh ��ng c�a Thi�n �m Gi�o th� l�m sao qua ���c m�t c�a ta."},
	{"���ng M�ng L�m-Ng�c di�n tri th� c�a ���ng M�n","L�m sao �� h�a gi�i th�t tr�ng th�t hoa ��c c�a Thi�n �m Gi�o?"},
	{"T�n V� M�nh-T� h� ph�p c�a Ng� ��c","Ph�i c�n th�n ng��i c�a Thi�n �m m��n x�c ho�n h�n, s�p x�p gian t�."},
	{"Th�y Y�n l�c y ti�n t� Ti�u S� S�","Phi Y�n t� t�, ta nh�t ��nh s� c�u t� ra."},
	--{"���̽�ëʨ���ܰ���","�⡶���������ǡ�д�����ǵ����س���������ǧ���������ղ��ܡ�"},
	{"Ng� B�t Duy-T� h� thi�n s� c�a C�n L�n","B�ng T�m c� n��ng, kh�ng c�n lo l�ng. ��a S�t v� Tuy�t T�nh c� v� c�ng cao c��ng, b�n ti�u t�c c�a Thi�n �m kh�ng l�m g� ���c ��u."},
	{"T� ��i danh b� - Thi�t Di�n","Kh�ng ng� tr�n ���ng �i l�i b� b�n Thi�n �m Gi�o ch�n ���ng."},
	{"T� ��i Danh B�-Tuy�t T�nh","Thi�n �m ti�u t�c, ta v� ng��i quy�t ��u ��n c�ng."},
	{"T� ��i danh b� - B�ng T�m","��a S�t v� Tuy�t T�nh l� v� b�o v� ch�ng t�i m� ch� ��ng ch�n h�u, ��ng n�n x�y ra chuy�n nh�!"},
	{"T� ��i Danh B�-��a S�t","B�n th� �� Thi�n �m Gi�o, h�y ��n ��i chi�n 300 hi�p v�i gia gia n�o."},
	{"V� L�m Minh H� V�","N�i d�ng qu�n c�a V� L�m Minh, kh�ng ph�n s� mi�n v�o!"},
};

function main()
	local nNpcName = GetTargetNpcName();
	for i = 1,getn(tTongNpcTalk) do
		if nNpcName == tTongNpcTalk[i][1] then
			Talk(1,"","<color=green>"..nNpcName.."<color>: "..tTongNpcTalk[i][2]);
			return 0;
		end	
	end
	if nNpcName == "Th� Kh�" then
		OpenBox()
		EnableBoxLock(1)
	elseif nNpcName == "Ti�m T�p H�a" then
		Sale(35)
	elseif nNpcName == "Ch� D��c �i�m" then
		Sale(30)
	end
end
