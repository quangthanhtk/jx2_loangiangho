
--Code by Zhuli

g_tRSG = {
	[1] = {
		szTitle = "Ti�u Nh�n s�m qu�",
		nTaskID = 2506,
		},
	[2] = {
		szTitle = "��i Nh�n s�m",
		nTaskID = 2505,
		},
	[3] = {
		szTitle = "Nh�n S�m v�n n�m",
		nTaskID = 2693,
		},
};

g_bGreatBook = 0;
g_nRsgType   = 0;

function ReadNormalBook()
	local szTitle = "H�y ch�n Qu� Nh�n S�m c�n d�ng";
	local tMenu = {
		"Ta kh�ng d�ng Qu� Nh�n S�m /#Confirm(0)",
		"\n Ph�n h�i /noting",
	};
	local nRSG = 0;

	for nIdx = 1, getn(g_tRSG) do
		tRsg = g_tRSG[nIdx];
		local tRsg = g_tRSG[nIdx];
		local nTime = GetTask(tRsg.nTaskID) / 18 / 60;
		if 0 < nTime then
			nRSG = nRSG + 1;
			tinsert(tMenu, 1, format("Ta mu�n d�ng %s [C�n %d gi� %d ph�t] /#Confirm(%d)", tRsg.szTitle, nTime / 60, mod(nTime, 60), nIdx));
		end
	end

	g_bGreatBook = 0;

	if 0 == nRSG then
		Confirm(0);
	else
		Say(szTitle, getn(tMenu), tMenu);
	end
end

function ReadGreatBook()
	ReadNormalBook();
	g_bGreatBook = 1;
end

function Confirm(nSel)
	if 0 ~= nSel and not g_tRSG[nSel] then
		return 0;
	end

	g_nRsgType = nSel;

	local nPopur = GetPopur();
	AskClientForNumber("AddPoint", 1, nPopur, "Mu�n nh�p v�o bao nhi�u tu vi?");
end

function AddPoint(nPopur)
	if nPopur <= 0 then
		return 0;
	end

	ReadBook(nPopur, g_bGreatBook, g_nRsgType);
	NotifyScript(1000, g_nRsgType); --LongDaiKa: mod luy�n m�t t�ch nhanh, c� v� nh� 2022 kh�ng c� t�c d�ng
end

function nothing()
end

function OnReadBookApp(nType)
	if not nType then
		local szTitle = "H�y ch�n Qu� Nh�n S�m c�n d�ng";
		local tMenu = {
			"Ta kh�ng d�ng Qu� Nh�n S�m /#OnReadBookApp(0)",
			"\n Ph�n h�i /noting",
		};
		local nRSG = 0;
	
		for nIdx = 1, getn(g_tRSG) do
			tRsg = g_tRSG[nIdx];
			local tRsg = g_tRSG[nIdx];
			local nTime = GetTask(tRsg.nTaskID) / 18 / 60;
			if 0 < nTime then
				nRSG = nRSG + 1;
				tinsert(tMenu, 1, format("Ta mu�n d�ng %s [C�n %d gi� %d ph�t] /#OnReadBookApp(%d)", tRsg.szTitle, nTime / 60, mod(nTime, 60), nIdx));
			end
		end
	
		g_bGreatBook = 0;
	
		if 0 == nRSG then
			OnReadBookApp(0);
		else
			Say(szTitle, getn(tMenu), tMenu);
		end
		return
	end
	if 0 ~= nType and not g_tRSG[nType] then
		return 0;
	end

	g_nRsgType = nType;

	ReadBookApp(g_AppIdx, g_nRsgType);
	g_AppIdx = 0;
end
POPUR2POPUR2	= 300
function OnExchangePoint()
	local nPopur = GetPopur();
	local nMaxPopur2 = 5000 - GetTask(4249);
	if nMaxPopur2 <= 0 then
		return Talk(1, "", "L�ch luy�n c�a b�n �� ��t t�i �a!");
	end
	local nMax = min(1000,floor(nPopur / POPUR2POPUR2));
	local nMax = min(nMax, nMaxPopur2);
	if nMax < 1 then
		return Talk(1, "", "Tu vi kh�ng ��, kh�ng th� chuy�n h�a l�ch luy�n");
	end
	AskClientForNumber("ExchangePoint", 1, nMax, "Mu�n chuy�n h�a bao nhi�u l�ch luy�n?");
end
function ExchangePoint(nCount)
	local nPopur = GetPopur();
	if nCount * POPUR2POPUR2 > nPopur then
		return Talk(1, "", format("Tu vi kh�ng �� %d, kh�ng th� chuy�n h�a l�ch luy�n", nCount * POPUR2POPUR2));
	end
	ExchangePopurPoint(nCount);
end

function OnReadBookApp_0 () g_AppIdx=0 ; OnReadBookApp(); end
function OnReadBookApp_1 () g_AppIdx=1 ; OnReadBookApp(); end
function OnReadBookApp_2 () g_AppIdx=2 ; OnReadBookApp(); end
function OnReadBookApp_3 () g_AppIdx=3 ; OnReadBookApp(); end
function OnReadBookApp_4 () g_AppIdx=4 ; OnReadBookApp(); end
function OnReadBookApp_5 () g_AppIdx=5 ; OnReadBookApp(); end
function OnReadBookApp_6 () g_AppIdx=6 ; OnReadBookApp(); end
function OnReadBookApp_7 () g_AppIdx=7 ; OnReadBookApp(); end
function OnReadBookApp_8 () g_AppIdx=8 ; OnReadBookApp(); end
function OnReadBookApp_9 () g_AppIdx=9 ; OnReadBookApp(); end
function OnReadBookApp_10() g_AppIdx=10; OnReadBookApp(); end

ErrorMsg = {
	[1] = "??",
	[2] = "B� k�p �ang trang b� ch�a ��y c�p!",
	[3] = "B� k�p �ang trang b� ch�a th�ng hoa th�nh Ch�n V� M�t T�ch, tr��c ti�n d�ng [Qu�n Th�ng Quy�n] �� th�ng hoa",
	[4] = "�i�m l�ch luy�n kh�ng ��, h�y chuy�n h�a tu vi th�nh �i�m l�ch luy�n tr��c",
	[5] = "C�p tu luy�n �� ch�n b� l�i",
	[6] = "C�p tu luy�n �� ch�n b� l�i, h�y ch�n l�i",
	[7] = "B�n c�n tu luy�n c�p tr��c ��, h�y ch�n l�i",
	[8] = "C�p tu luy�n �� ch�n �� ��y c�p",
}

