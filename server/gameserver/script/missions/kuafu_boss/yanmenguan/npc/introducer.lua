Include("\\script\\lib\\talktmp.lua")

Import("\\script\\missions\\kuafu_boss\\yanmenguan\\mission_head.lua")

g_InfoHeader = "<color=green>".."Gi�i thi�u ho�t ��ng".."<color>: ";

T={}
T1={}
T2={}
T3={}

T.msg = g_InfoHeader
T.sel = {
	{"H�nh n�n h� th�ng", T1},
	{"Gi�i thi�u c�ch ch�i", T2},
	{"R�i kh�i ��y", T3},
	{"K�t th�c ��i tho�i", "nothing", }, 
}

T1.msg = g_InfoHeader.."Li�u Qu�c v� Thi�n �m Gi�o l�i �m m�u x�m ph�m Trung Nguy�n. T� H� Ph�p Thi�n �m Gi�o Ti�u Nhi�m Nguy�t �ang t�p h�p c�c b� l�c du m�c ��n B� L�c V��ng K�, chu�n b� xua qu�n ti�n c�ng! V� L�m Minh nh�n ���c tin b�o, l�p t�c k�u g�i cao th� c�c bang h�i Trung Nguy�n c�ng ��n ��i Th�o Nguy�n, ng�n ch�n Xe Ng�a T�p K�t, ti�u di�t T� H� Ph�p Thi�n �m Gi�o Ti�u Nhi�m Nguy�t. ��i qu�n Li�u Qu�c s�p ��n n�i, th�i gian c� h�n, mong c�c hi�p s� mau ch�ng ��n gi�p, ��i th�ng quay v�!"
T1.sel = {
	{"tr� l�i", T, }, 
	{"Ta bi�t r�i", "nothing", }, 
}

T2.msg = g_InfoHeader..format("\n    %d gi� t�i m�i T7 s� m� BOSS Li�n Server, duy tr� %d ph�t. Ng��i ch�i �� v�o bang, ��t c�p Chuy�n Sinh %d Lv%d tr� l�n ���c tham d�\n    �� ��m b�o ho�t ��ng di�n ra hi�u qu�, m�i khu v�c ��u gi�i h�n s� ng��i, khi ��t t�i �a s� kh�ng th� v�o n�a\n   T� H� Ph�p Thi�n �m Gi�o Ti�u Nhi�m Nguy�t s� ��ng th�i xu�t hi�n t�i ��i Th�o Nguy�n 2, ��i Th�o Nguy�n 1, B� L�c V��ng ��nh, nh�ng ch� 1 ch� l� BOSS th�t. Ng��i ch�i k�t li�u BOSS th�t v� bang c�a ng��i �� s� ���c nh�n th��ng th�m\n    T�n c�ng Xe Ng�a T�p K�t v� BOSS s� nh�n ���c �i�m theo t� l� nh�t ��nh. T�t c� th�nh vi�n bang tham chi�n v� bang h�i ��t Top %d t�ng �i�m s� ���c nh�n th��ng h�ng\n    Bang h�i ch�a l�t v�o BXH, nh�ng t�ng s�t th��ng ��t %d c�ng ���c nh�n th��ng n�ng ��ng\n    T�t c� ph�n th��ng ��u ���c nh�n t�i Qu�n Gia Bang H�i c�a server m�nh\n    �i�m T�ch C�c C� Nh�n ��t %d m�i ���c nh�n th��ng c� nh�n\n    Ph�i nh�n th��ng tr��c %d gi� ng�y di�n ra ho�t ��ng, qu� h�n xem nh� b� th��ng;",
	21,60,9,90,15,1000,20,24)

T2.sel = {
	{"tr� l�i", T, }, 
	{"K�t th�c ��i tho�i", "nothing", }, 
}

T3.msg = g_InfoHeader
T3.sel = {
	{"R�i kh�i chi�n tr��ng", "leave_battle", }, 
	{"Ta s� kh�ng l�m ��o binh!", "nothing", }, 
}

-- \nÿ��������%d�㿪�ſ��BOSS�淨�������%d���ӣ���Ҫ�����Ტ�ҵȼ�����%dת%d������Ҳſ��Բ���;
-- \nΪ��֤�Ч����ÿ�ŵ�ͼ���������ޣ����ﵽ�������޺��������;
-- \n�������󻤷���Ƚ�»�ͬʱ�����ڴ��ԭ�������ԭһ������ͥ���䣬��������ֻ��һ������ģ��������Ǽٵģ�������BOSS���һ������Һ����������ö��⽱��; 
-- \nͨ��������������BOSS���ᰴ������ò�ͬ�Ļ���֡����������ҵĻ�����������ǰ%d�İ������������;
-- \nδ�ϰ�İ�ᣬ�˺����ִﵽ%dҲ�ܻ�û�Ծ����;
-- \n���н�����Ҫ�ص�ԭ����ȥ���ܼҴ���ȡ;
-- \n���˽�����Ҫ���˻�Ծ�ȴﵽ%d�ֲſ�����ȡ;
-- \n������Ҫ�ڻ���յ�%d��֮ǰ��ȡ��������Ϊ����;

function main()
	temp_Talk(T);
end

function leave_battle()
	local nCamp = KFB_COMMON_PLAYER_CAMP;
	DelMSPlayer(Mission_Kfb.missionID, nCamp);
	Msg2MSAll(Mission_Kfb.missionID, GetName().."R�i kh�i chi�n tr��ng.");
end