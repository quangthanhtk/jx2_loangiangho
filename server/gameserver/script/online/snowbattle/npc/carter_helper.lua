function main()
	local tSay = {
		"Tuy�n Ch�u/#ch_goto_city(1)",
		"Bi�n Kinh/#ch_goto_city(2)",
		"Th�nh ��/#ch_goto_city(3)",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("Ch� c� Th�nh ��, Bi�n Kinh v� Tuy�n Ch�u m�i c� khu n�m tuy�t. Ta c� th� truy�n t�ng ��i hi�p ��n ch� Xa Phu_N�m tuy�t c�a Th�nh ��, Bi�n Kinh, Tuy�n Ch�u, ��i hi�p mu�n �i ��u?", getn(tSay), tSay);
end

function ch_goto_city(nCity)
	local tCity = {
		{100, 1414, 3007},
		{200, 1372, 2897},
		{300, 1752, 3560},
	}
	NewWorld(tCity[nCity][1], tCity[nCity][2], tCity[nCity][3]); 
end