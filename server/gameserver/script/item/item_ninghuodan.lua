--����	1	0	30008
--ŭ��ֵ����

_,AT_GGS = GetRealmType();
if 1==AT_GGS then
	Include("\\script\\paycoin_head.lua")
end

function OnUse(nItemIndex)
	if GetPlayerRoute() ~= 25 then
		Talk(1, "", "Ch� khi gia nh�p ph�i <color=yellow>Minh Gi�o Th�nh Chi�n<color> th� m�i ���c s� d�ng Ng�ng H�a ��n")
		return
	end
	local nCostGold = 0
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then --�ڿ����ʹ�� ��3����
		nCostGold = 3
	end
	
	if nCostGold > 0 and GetCash() < nCostGold then
		Msg2Player(format("��i hi�p kh�ng c� �� %d V�ng tr�n ng��i, kh�ng th� s� d�ng Ng�ng H�a ��n", nCostGold))
		return
	end
	
	if RestoreGas() == 1 then
		if nCostGold > 0 then
			pc_pay_addtask(nCostGold * 10000)
		end
		--DelItemByIndex(nItemIndex, 1)
		return 1
	else
		Msg2Player("Hi�n �i�m N� kh� �� ��y, kh�ng th� s� d�ng Ng�ng H�a ��n")
	end
end