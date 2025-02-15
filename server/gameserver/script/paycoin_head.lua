--通用消耗金币机制

--记录扣金数目的任务变量（单位铜）
PC_COIN_TASK = 3134;
TASK_ACCESS_CODE_KUAFU_DRAG = 13;

--金币消耗记录
--nPay 单位铜
function pc_pay_addtask(nPay, bForceAddTask)
	if not nPay or nPay <= 0 or type(nPay) ~= "number" then return 0; end
	local nCurrentValue = GetTask(PC_COIN_TASK);
	if nCurrentValue + nPay > 2^31 - 1 then
		WriteLog(format("[Tr� ti襫 li猲 server]\t[name]\t%s\t[value]\t%s", GetName(), nPay));
		return 0;
	end
	if GetCash() < nPay then
		if bForceAddTask then
			SetTask(PC_COIN_TASK, nCurrentValue + nPay, TASK_ACCESS_CODE_KUAFU_DRAG);
		end
		Msg2Player(format("V祅g trong h祅h trang kh玭g  %s", tostring(nPay / 10000)));
		return 0;
	end
	if Pay(nPay) == 1 then
		SetTask(PC_COIN_TASK, nCurrentValue + nPay, TASK_ACCESS_CODE_KUAFU_DRAG);
		return 1;
	end
	return 0;
end