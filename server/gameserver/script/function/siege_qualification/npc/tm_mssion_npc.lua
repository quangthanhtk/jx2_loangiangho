--mission�ڰ���ʹnpc
--��������
--�˳�mission
Include("\\script\\function\\siege_qualification\\tm_head.lua")

function main()
	local tSay = {
		"\n ph�n ph�i Th�n Th�/tm_assign_beast",
		"\n r�t kh�i chi�n tr��ng/tm_leave_battle",
		"\nT�i ch� xem xem th�i/nothing",
	}
	Say(TM_TONG_AD_NPC.."Th�i gian c� h�n, ��i tr��ng nhanh nhanh ph�n ph�i th�n th�, cu�c chi�n s�p ���c b�t ��u!", getn(tSay), tSay);
end