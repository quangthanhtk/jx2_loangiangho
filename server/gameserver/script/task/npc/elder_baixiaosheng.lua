Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	local tSay = {
		"T�i h� ch� xem qua th�i/nothing",	
	}
	Say("<color=green>Tr��ng L�o B�ch Hi�u Sinh<color>:c� �n o�n s� c� giang h�, c� ng��i s� c� �n o�n,con ng��i ch�nh l� giang h�, ng��i lam sao r�i kh�i?", getn(tSay), tSay);
end