function main()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local wDay = tonumber(date("%w"))
	if wDay < 1 or wDay > 5 then
		return 0;
	end
	local msg = "BOSS Di�n V� ��c S�t S� sau 5 ph�t s� xu�t hi�n � Th�t L�c Nhai, c�c v� ��i hi�p c� th� ��n tham gia th� luy�n."
	Msg2Global(msg);
	AddGlobalNews(msg, 1);
end