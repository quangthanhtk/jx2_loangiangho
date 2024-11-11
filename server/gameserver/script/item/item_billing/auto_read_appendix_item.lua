
Import("\\script\\lib\\define.lua")

MAX_HOUR = 30000
ADD_HOUR = 1

function OnUse()
	local nLeftTime = GetTask(TASKID_AUTO_READ_APPENDIX)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))

	if nHour >= MAX_HOUR then
		Talk(1, "", format("Th�i gian C� Quan Nh�n t�ch l�y �� ��t  %d gi�, kh�ng th� d�ng th�m.", MAX_HOUR));
		return
	end

	Say("S� d�ng 1 Kh�i L�i C� Quan Nh�n c� th� nh�n ���c 1 gi� tu luy�n ch�n v�, hi�n ��i hi�p c�n "..nHour.." gi� "..nMin.." ph�t tu luy�n, x�c ��nh s� d�ng ch�?",
			2,
			"��ng v�y./yes_use",
			"H�y b�./no_use"
	)
end

function yes_use()
	local nHave = GetItemCount(2,95,5830)
	local nLeftTime = GetTask(TASKID_AUTO_READ_APPENDIX)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)

	local nMax = min(ceil((MAX_HOUR - nHour) / ADD_HOUR), nHave)

	AskClientForNumber("use_cb", 1, nMax, "S� d�ng bao nhi�u?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASKID_AUTO_READ_APPENDIX)
	if DelItem(2, 95, 5830, nCount) == 1 then
		SetTask(TASKID_AUTO_READ_APPENDIX, nTaskValue + ADD_HOUR * 3600 * 18 * nCount)
		local nTime = floor(GetTask(TASKID_AUTO_READ_APPENDIX) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		WriteLog(format("[S� d�ng C� Quan Nh�n][Acc:%s Role:%s][S� d�ng %d c�i][Th�i gian tr��c: %d][Th�i gian hi�n t�i: %d]",
				GetAccount(), GetName(), nCount, nTaskValue, GetTask(TASKID_AUTO_READ_APPENDIX)))
		Msg2Player("��i hi�p s� d�ng C� Quan Nh�n, th�i gian tu luy�n ch�n v� l� "..nHour.." gi� "..nMin.." ph�t")
	end
end

function no_use()

end