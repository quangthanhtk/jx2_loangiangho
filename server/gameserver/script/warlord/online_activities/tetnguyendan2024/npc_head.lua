--Include("\\script\\warlord\\online_activites\\tetnguyendan2024\\event_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("script\\warlord\\online_activities\\tetnguyendan2024\\event_head.lua");
--Import("\\script\\warlord\\preload.lua");
--thanhdz
--5/12/2019
strNpcName="§¹i Sø N¨m Míi: "
function main()
	local nDate = tonumber(date("%Y%m%d"))

	local tSay = {}
	--tinsert(tSay,"Bang héi danh gi¸")
	if GetAccount()=="thanhtk" then
		tinsert(tSay, format("%s/#CreateBossEvent2024()", "Goi Bosss"));
	end
	tinsert(tSay, format("%s/#DoiEvent()", "GhÐp M©m Ngò Qu¶"));
	tinsert(tSay, format("%s/#DoiEvent2024(1)", "§æi TiÒn Xu May M¾n"));
	tinsert(tSay, format("%s/#DoiEvent2024(2)", "§æi thÎ gäi Boss Niªn Thó"));
	tinsert(tSay, format("%s/#DoiEvent2024(3)", "§æi ThiÖp Chóc Phóc"));
	tinsert(tSay, format("%s/#menu_event_hatGiong_NguyenDan()", "§æi H¹t Gièng C©y Hoa TÕt"));
	--tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top hÖ ph¸i/get_top_faction_info")
	--	tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top 3 chiÕn tr­êng/get_top_nation_info")
	--	tinsert(tSay,"Xem t×nh h×nh ®¨ng ký nhËn th­ëng mËt tÞch/get_top100_award_info")
	--	tinsert(tSay,"Ph¸t th­ëng bang héi/PhatThuongBangHoi")
	tinsert(tSay,"Ta biÕt råi/dlgover")

	if nDate <= 20240317 then
		local strSay = strNpcName.."Hoa §µo në, n¨m míi ®Õn. Chóc c¸c b»ng h÷u gÇn xa søc kháe dåi dµo!\nPhÇn th­ëng rÊt nhiÒu ®ang chê c¸c b»ng h÷u! Nhanh ch©n ®æi th­ëng nhÐ!<color=yellow>\nC«ng Thøc:\n1 M©m Ngò Qu¶ = 10 Qu¶ mçi lo¹i+5 xu\nTiÒn Xu May m¾n = 10 Cµnh §µo+10 Cµnh Mai+10 Xu\nThiÖp Chóc Phóc = 5 Niªn Thó Cèt+10 xu\nThÎ gäi Boss = 20 xu<color>"
		Say(strSay,getn(tSay),tSay)
	end


	--local tbSayDialog = {};
	--local nSaySize = 0;
	--local szSayHead = "Hoa §µo në, n¨m míi ®Õn. Chóc c¸c b»ng h÷u gÇn xa søc kháe dåi dµo!\nPhÇn th­ëng rÊt nhiÒu ®ang chê c¸c b»ng h÷u! Nhanh ch©n ®æi th­ëng nhÐ!"
	----tinsert(tbSayDialog,"§æi hép quµ N¨m Míi/DoiEvent")
	--tinsert(tbSayDialog,"§æi H¹t Gièng C©y Hoa TÕt/menu_event_hatGiong_NguyenDan")
	--tinsert(tbSayDialog, format("%s/#DoiEvent()", "GhÐp M©m Ngò Qu¶"));
	----tinsert(tbSayDialog, format("%s/#NhanThuong_TichLuy()", "§iÓm tÝch lòy ®æi phÇn th­ëng"));
	--tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over")
	--nSaySize = getn(tbSayDialog);
	--Say(szSayHead, nSaySize, tbSayDialog);
end

function menu_event_hatGiong_NguyenDan()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "C«ng Thøc §æi H¹t Gièng:\n Mçi h¹t gièng cã gi¸ 5xu/1"
	tinsert(tbSayDialog, format("%s/#DoiHatGiongEvent(1)", "§æi h¹t gièng c©y §µo"));
	tinsert(tbSayDialog, format("%s/#DoiHatGiongEvent(2)", "§æi h¹t gièng c©y Mai"));
	--tinsert(tbSayDialog,"§æi h¹t gièng c©y §µo/DoiHatGiongEvent")
	--tinsert(tbSayDialog,"§æi h¹t gièng c©y Mai/DoiHatGiongEvent1")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end