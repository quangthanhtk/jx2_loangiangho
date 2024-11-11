--通用消耗金币机制
Import("\\script\\task_access_code_def.lua")

--记录扣金数目的任务变量（单位铜）
PC_COIN_TASK = 3134;

--跨回源服金币实现真正消耗
function pc_back_originalserver_pay()
	local nTotalValue = GetTask(PC_COIN_TASK);
	local nTotalPay = 0
	local result = 0
	if nTotalValue > 0 then
		--先尽量扣掉背包所有金子
		local nCash = GetCash()
		local nPay = min(nCash, nTotalValue)
		result = Pay(nPay)--从背包扣钱
		if result == 1 then 
			nTotalValue = nTotalValue - nPay
			nTotalPay = nTotalPay + nPay
		end
		
		if nTotalValue > 0 then--如果背包不够就从箱子扣钱
			local nSaveCash = GetSaveMoney()
			local nSavePay = min(nSaveCash, nTotalValue)
			result = PaySaveMoney(nSavePay)--从储物箱扣钱
			if result == 1 then 
				nTotalValue = nTotalValue - nSavePay
				nTotalPay = nTotalPay + nSavePay
			end
		end
	elseif nTotalValue < 0 then
		--数据异常，清理
		nTotalValue = 0
		result = 1
	end
	
	if nTotalPay > 0 and nTotalValue >= 0  then
		SetTask(PC_COIN_TASK, nTotalValue, TASK_ACCESS_CODE_KUAFU_DRAG);
		WriteLog(format("[pc_back_originalserver_pay]\t%s\t%s\t%d\t%d", GetAccount(), GetName(), nTotalValue, nTotalPay));
	end
end