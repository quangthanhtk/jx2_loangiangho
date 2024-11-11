--ͨ�����Ľ�һ���
Import("\\script\\task_access_code_def.lua")

--��¼�۽���Ŀ�������������λͭ��
PC_COIN_TASK = 3134;

--���Դ�����ʵ����������
function pc_back_originalserver_pay()
	local nTotalValue = GetTask(PC_COIN_TASK);
	local nTotalPay = 0
	local result = 0
	if nTotalValue > 0 then
		--�Ⱦ����۵��������н���
		local nCash = GetCash()
		local nPay = min(nCash, nTotalValue)
		result = Pay(nPay)--�ӱ�����Ǯ
		if result == 1 then 
			nTotalValue = nTotalValue - nPay
			nTotalPay = nTotalPay + nPay
		end
		
		if nTotalValue > 0 then--������������ʹ����ӿ�Ǯ
			local nSaveCash = GetSaveMoney()
			local nSavePay = min(nSaveCash, nTotalValue)
			result = PaySaveMoney(nSavePay)--�Ӵ������Ǯ
			if result == 1 then 
				nTotalValue = nTotalValue - nSavePay
				nTotalPay = nTotalPay + nSavePay
			end
		end
	elseif nTotalValue < 0 then
		--�����쳣������
		nTotalValue = 0
		result = 1
	end
	
	if nTotalPay > 0 and nTotalValue >= 0  then
		SetTask(PC_COIN_TASK, nTotalValue, TASK_ACCESS_CODE_KUAFU_DRAG);
		WriteLog(format("[pc_back_originalserver_pay]\t%s\t%s\t%d\t%d", GetAccount(), GetName(), nTotalValue, nTotalPay));
	end
end