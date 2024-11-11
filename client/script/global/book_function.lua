
--Code by Zhuli

g_tRSG = {
	[1] = {
		szTitle = "Ti”u Nh©n s©m qu∂",
		nTaskID = 2506,
		},
	[2] = {
		szTitle = "ßπi Nh©n s©m",
		nTaskID = 2505,
		},
	[3] = {
		szTitle = "Nh©n S©m vπn n®m",
		nTaskID = 2693,
		},
};

g_bGreatBook = 0;
g_nRsgType   = 0;

function ReadNormalBook()
	local szTitle = "H∑y ch‰n Qu∂ Nh©n S©m c«n dÔng";
	local tMenu = {
		"Ta kh´ng dÔng Qu∂ Nh©n S©m /#Confirm(0)",
		"\n Ph∂n hÂi /noting",
	};
	local nRSG = 0;

	for nIdx = 1, getn(g_tRSG) do
		tRsg = g_tRSG[nIdx];
		local tRsg = g_tRSG[nIdx];
		local nTime = GetTask(tRsg.nTaskID) / 18 / 60;
		if 0 < nTime then
			nRSG = nRSG + 1;
			tinsert(tMenu, 1, format("Ta muËn dÔng %s [Cﬂn %d giÍ %d phÛt] /#Confirm(%d)", tRsg.szTitle, nTime / 60, mod(nTime, 60), nIdx));
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
	AskClientForNumber("AddPoint", 1, nPopur, "MuËn nhÀp vµo bao nhi™u tu vi?");
end

function AddPoint(nPopur)
	if nPopur <= 0 then
		return 0;
	end

	ReadBook(nPopur, g_bGreatBook, g_nRsgType);
	NotifyScript(1000, g_nRsgType); --LongDaiKa: mod luy÷n mÀt tﬁch nhanh, c„ vŒ nh≠ 2022 kh´ng c„ t∏c dÙng
end

function nothing()
end

function OnReadBookApp(nType)
	if not nType then
		local szTitle = "H∑y ch‰n Qu∂ Nh©n S©m c«n dÔng";
		local tMenu = {
			"Ta kh´ng dÔng Qu∂ Nh©n S©m /#OnReadBookApp(0)",
			"\n Ph∂n hÂi /noting",
		};
		local nRSG = 0;
	
		for nIdx = 1, getn(g_tRSG) do
			tRsg = g_tRSG[nIdx];
			local tRsg = g_tRSG[nIdx];
			local nTime = GetTask(tRsg.nTaskID) / 18 / 60;
			if 0 < nTime then
				nRSG = nRSG + 1;
				tinsert(tMenu, 1, format("Ta muËn dÔng %s [Cﬂn %d giÍ %d phÛt] /#OnReadBookApp(%d)", tRsg.szTitle, nTime / 60, mod(nTime, 60), nIdx));
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
		return Talk(1, "", "Lﬁch luy÷n cÒa bπn Æ∑ Æπt tËi Æa!");
	end
	local nMax = min(1000,floor(nPopur / POPUR2POPUR2));
	local nMax = min(nMax, nMaxPopur2);
	if nMax < 1 then
		return Talk(1, "", "Tu vi kh´ng ÆÒ, kh´ng th” chuy”n h„a lﬁch luy÷n");
	end
	AskClientForNumber("ExchangePoint", 1, nMax, "MuËn chuy”n h„a bao nhi™u lﬁch luy÷n?");
end
function ExchangePoint(nCount)
	local nPopur = GetPopur();
	if nCount * POPUR2POPUR2 > nPopur then
		return Talk(1, "", format("Tu vi kh´ng ÆÒ %d, kh´ng th” chuy”n h„a lﬁch luy÷n", nCount * POPUR2POPUR2));
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
	[2] = "B› k›p Æang trang bﬁ ch≠a Æ«y c p!",
	[3] = "B› k›p Æang trang bﬁ ch≠a th®ng hoa thµnh Ch©n V‚ MÀt Tﬁch, tr≠Ìc ti™n dÔng [Qu∏n Th´ng Quy”n] Æ” th®ng hoa",
	[4] = "ßi”m lﬁch luy÷n kh´ng ÆÒ, h∑y chuy”n h„a tu vi thµnh Æi”m lﬁch luy÷n tr≠Ìc",
	[5] = "C p tu luy÷n Æ∑ ch‰n bﬁ lÁi",
	[6] = "C p tu luy÷n Æ∑ ch‰n bﬁ lÁi, h∑y ch‰n lπi",
	[7] = "Bπn c«n tu luy÷n c p tr≠Ìc Æ„, h∑y ch‰n lπi",
	[8] = "C p tu luy÷n Æ∑ ch‰n Æ∑ Æ»y c p",
}

