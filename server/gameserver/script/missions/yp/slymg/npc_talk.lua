Include("\\script\\missions\\yp\\slymg\\head.lua")

function main()
	local strNpcName = GetTargetNpcName();
	local tSay = {};
	local msg = nil;
	if strNpcName == "Ng��i truy�n t�ng �m ���ng" then
		msg = "T�i s� ph� tr�ch h� tr� c�c v� v�o �m ���ng Ph�n �� Thi�n �m Gi�o!";
		tinsert(tSay, format("\n �m ���ng Ph�n �� Thi�n �m/#mg_GotoLevel2(%d)", 1));
	elseif strNpcName == "Ng��i truy�n t�ng D��ng ���ng" then
		msg = "T�i s� ph� tr�ch h� tr� c�c v� v�o D��ng ���ng Ph�n �� Thi�n �m Gi�o!";
		tinsert(tSay, format("\n D��ng ���ng Ph�n �� Thi�n �m/#mg_GotoLevel2(%d)", 2));
	elseif strNpcName == "Ng��i truy�n t�ng t�ng 3" then
		msg = "T�i s� ph� tr�ch h� t� c�c v� v�o t�ng 3 ph�n �� Thi�n �m Gi�o!";
		tinsert(tSay, "\n T�ng �� ph�n �� Thi�n �m/mg_GotoLevel3");
	elseif strNpcName == "Xa phu Thi�n �m Gi�o" then
		msg = "T�i s� ph� tr�ch h� tr� c�c v� tr� v� Th�t L�c Nhai M�t C�c!";
		tinsert(tSay, "\n Tr� v� Th�t L�c Nhai M�t C�c/mg_ReturnMg");
	end
	tinsert(tSay, "\n T�i v�n kh�ng mu�n tr� v�/nothing");
	Say(format("<color=gold>%s<color>:", strNpcName)..msg, getn(tSay), tSay);
end