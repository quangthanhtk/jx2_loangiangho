function main()
	local szNpcName = GetNpcName(GetTargetNpc());
	local tMsg = {
		["T�n Ph� Kham B� Qu�c V��ng"] = "Ta th��ng hay �i d�o m�t m�nh, suy ngh� l�m sao �� ph�t tri�n qu�c gia trong t��ng lai!",
		["L� ��c D�c Qu�c V��ng"] = "� trong th�nh th�t l� bu�n ch�n, kh�ng kh� b�n ngo�i v�n t�t h�n!",
		["L� Nguy�n Tr�n C�ng Ch�a"] = "Ta mu�n � c�ng v�i ng��i y�u m�i kh�ng xa r�i!",
		["�o�n Khinh H�u Qu�c V��ng"] = "Hy v�ng ng��i d�n c�a ta lu�n s�ng trong h�nh ph�c!",
		["�o�n Ng�c Nhi C�ng Ch�a"] = "N��c ch�y v� t�nh, ng��i ta y�u l�i kh�ng y�u ta.",
		["Sa Ca Ninh B� V��ng T�"] = "Ta mu�n b�o v� ng��i y�u c�a ta!",
	}
	Say(format("<color=green>%s<color>:%s", szNpcName, tMsg[szNpcName]), 0);
end