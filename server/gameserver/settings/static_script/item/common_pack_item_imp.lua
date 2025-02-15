------------------------------------------------------------
-- 打包的xxx实现,右击使用获得x个xxx
------------------------------------------------------------

tPackItems = {
	[200130822] = {"Nh﹏ S﹎ Dng Vinh Ho祅",1,0,30005,100},--一箱人参养荣丸
	[200130823] = {"襫 Th蕋 Sa Фm Ho祅",1,0,30006,100},--一箱田七鲨胆丸
	[200130824] = {"C鰑 Hoa Ng鋍 L� Ho祅",1,0,30007,100},--一箱九花玉露丸
}

-- 脚本被程序默认调用的入口函数
function on_use_real(nItemIndex)
	local name = GetItemName(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nKey = p + d*100000+g*1000*100000
	local t = tPackItems[nKey]
	if not t then
		return
	end
	local szMsg = format("M� %s s� nh薾 頲 %d c竔 <color=yellow>%s<color>. уng � m� kh玭g?", name, t[5], t[1])
	Say(szMsg,
		2,
		format("%s/#sure_open(%d)","M�", nItemIndex),
		format("%s/nothing","Ra kh醝"))
end;


-- 打开包裹
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
		Say("Kho秐g tr鑞g trong t骾 h祅h trang kh玭g ", 0)
		return
	end

	if (DelItem(g,d,p, 1) == 1) then
		if (AddItem(t[2],t[3],t[4],t[5]) == 0) then	
			AddItem(g,d,p, 1)
		else
			local szMsg = format("B筺  nh薾 頲 %d c竔 %s", t[5], t[1])
			Say(szMsg, 0)
			Msg2Player(szMsg)
		end
	end
end;

