------------------------------------------------------------
-- ´ò°üµÄxxxÊµÏÖ,ÓÒ»÷Ê¹ÓÃ»ñµÃx¸öxxx
------------------------------------------------------------

tPackItems = {
	[200130822] = {"Nh©n S©m D­ìng Vinh Hoµn",1,0,30005,100},--Ò»ÏäÈË²ÎÑøÈÙÍè
	[200130823] = {"§iÒn ThÊt Sa §¶m Hoµn",1,0,30006,100},--Ò»ÏäÌïÆßöèµ¨Íè
	[200130824] = {"Cöu Hoa Ngäc Lé Hoµn",1,0,30007,100},--Ò»Ïä¾Å»¨ÓñÂ¶Íè
}

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function on_use_real(nItemIndex)
	local name = GetItemName(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nKey = p + d*100000+g*1000*100000
	local t = tPackItems[nKey]
	if not t then
		return
	end
	local szMsg = format("Më %s sÏ nhËn ®­îc %d c¸i <color=yellow>%s<color>. §ång ý më kh«ng?", name, t[5], t[1])
	Say(szMsg,
		2,
		format("%s/#sure_open(%d)","Më", nItemIndex),
		format("%s/nothing","Ra khái"))
end;


-- ´ò¿ª°ü¹ü
function sure_open(nItemIndex)
	--local name = GetItemName(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nKey = p + d*100000+g*1000*100000
	local t = tPackItems[nKey]
	if not t then
		return
	end
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) or GetFreeItemRoom() < 1 then
		Say("Kho¶ng trèng trong tói hµnh trang kh«ng ®ñ", 0)
		return
	end

	if (DelItem(g,d,p, 1) == 1) then
		if (AddItem(t[2],t[3],t[4],t[5]) == 0) then	
			AddItem(g,d,p, 1)
		else
			local szMsg = format("B¹n ®· nhËn ®­îc %d c¸i %s", t[5], t[1])
			Say(szMsg, 0)
			Msg2Player(szMsg)
		end
	end
end;

