--�ű����ƣ�����
--�ű����ܣ�
--���ܲ߻���
--���ܿ���������
--����ʱ�䣺2010-12-16
--�����޸ļ�¼

tMsg = {
	"<color=green>H��ng d�n s� d�ng h�p th�:<color>\n"..
	"    <color=yellow>��i th��ng g�i th�<color>: H�o h�u, th�nh vi�n bang h�i, c�u nh�n, ng��i ch�i b�t k� trong danh s�ch �en.\n"..
	"    <color=yellow>�i�u ki�n g�i th�<color>: Ng��i ch�i c�p 10 tr� l�n m�i ���c g�i th�. M�i ng�y ���c g�i t�i �a 3 th�.",
	"    <color=yellow>�i�u ki�n v�t ph�m ��nh k�m qua th�<color>: <color=red> B�y gi� t�m kh�ng th� g�i v�t ph�m v� ti�m v�ng cho ng��i ch�i kh�c.\n"..
	"    <color=yellow>Quy t�c l�u th�<color>: ��i v�i th� ch�a ��c, h� th�ng s� l�u l�i trong 30 ng�y, sau �� s� t� ��ng x�a. ��i v�i th� �� ��c v� c� ��nh k�m ch�a nh�n, h� th�ng s� l�u l�i trong 30 ng�y, sau �� t� ��ng x�a. ��i v�i th� �� ��c v� kh�ng c� ��nh k�m, h� th�ng s� l�u l�i 3 ng�y, sau �� t� ��ng x�a. Th� c� ��nh k�m s� ���c ��nh d�u [!] �� nh�c nh�.\n\n",
	"    <color=red>Nh�c nh� 1<color>: K� hi�u th� c�a th� h� th�ng l� logo game, k� hi�u th� c�a ng��i ch�i l� th� th��ng. Vui l�ng kh�ng tin v�o b�t k� th� c�a ng��i ch�i n�o t� nh�n l� ng��i c�a B�H, <color=red>h�n n�a B�H c�ng kh�ng bao gi� y�u c�u ng��i ch�i cung c�p th�ng tin t�i kho�n v� m�t kh�u. H�y c�n th�n �� ph�ng!<color>\n",
	"    <color=red>Nh�c nh� 2<color>: Khi b�n c�n th� ch�a ��c, k� hi�u nh�c nh� th� s� l�e s�ng, k� hi�u nh�c nh� th� n�m � b�n tr�i b�n �� nh� trong giao di�n ch�nh. H�y ch� � ��c th� k�p th�i, tr�nh qu� h�n s� b� h� th�ng x�a!\n",
	"    <color=red>Nh�c nh� 3<color>: N�u v� l� do c� nh�n m� kh�ng th� ��c th� k�p l�c, d�n ��n v�t ph�m ��nh k�m trong th� qu� h�n v� b� x�a, t�t c� s� kh�ng ���c x� l�!",
}


function OnUse()
	Talk(getn(tMsg), "", unpack(tMsg));
end

