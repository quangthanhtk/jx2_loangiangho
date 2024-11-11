-- ³õÊ¼»¯ÅÅĞĞ°ñÊ±»Øµ÷µÄº¯Êı
-- ÈÎÎñ±äÁ¿Ê¹ÓÃËµÃ÷
-- 763 ¼ÇÂ¼ÔÚÍæ¼ÒÉíÉÏµÄË¥¼õÖÜÊı
-- 764 ¼ÇÂ¼Íæ¼Ò±¾ÖÜµÄÅÅÃû,Èç¹ûÎ´½ø100Ãû,ÔòÉèÖÃÎª999
-- 765 ¼ÇÂ¼Íæ¼Ò»ñµÃÔªË§µÄ´ÎÊı(²»·ÖËÎÁÉ,Ö»ÒªÊÇÔªË§¾ÍËã)
-- 766 ¼ÇÂ¼Íæ¼Ò»ñµÃ½«¾üµÄ´ÎÊı(²»·ÖËÎÁÉ)
-- 767 ¼ÇÂ¼Íæ¼Ò»ñµÃÏÈ·æµÄ´ÎÊı
-- 768 ¼ÇÂ¼×Ê¸ñÉóºË¾üÏÎµÄÖÜÊı


function OnBattleDataArrive(szKey, nKey1, nKey2, nCount)
	if szKey ~= "" then
		BuildNewBattleRank(szKey, nKey1, nKey2, 1)
	end
end

function OnBattleDataInit(szKey, nKey1, nKey2, nCount)
	if szKey ~= "" then
		BuildNewBattleRank(szKey, nKey1, nKey2, 0)
	end
end

-- ÉÙ¼ÓÒ»¸öÎÄ¼şÁË,Í¬ÎªÕ½³¡µÄ¾ÍÒ²·ÅÔÚÕâÀï°É

function UpdateBattleMaxRank()
	-- ¸üĞÂËÎÁÉµÄ×î¸ß¾üÏÎ
	local nCurrRank = GetTask(704)
	if nCurrRank < 0 then	-- ¸üĞÂÁÉ·½
		local nPreRank = GetTask(746)
		if nCurrRank < nPreRank then
			SetTask(746, nCurrRank)
		end
	elseif nCurrRank > 0 then	-- ¸üĞÂËÎ·½
		local nPreRank = GetTask(745)
		if nCurrRank > nPreRank then
			SetTask(745, nCurrRank)
		end
	end
end

function CalcBattleNoInRank()
	local song_or_liao = 1
	local nTaskValue = GetTask(701)
	if nTaskValue < 0 then
		nTaskValue = -nTaskValue;
		song_or_liao = -1
	end
	
	if nTaskValue >= 50000 then
		SetTask(704, 3 * song_or_liao)	-- ¶¼Í³
	elseif nTaskValue >= 15000 then
		SetTask(704, 2 * song_or_liao)	-- Ğ£Î¾
	else
		SetTask(704, 1 * song_or_liao)	-- Ê¿±ø
	end
end

function CalcBattleRank()
	local flag, GIsGlbRealm = GetRealmType();
	if GIsGlbRealm ~= 0 then --²»ÔÚÔ­·ş
		return 0
	end
	
	local nWeeks, nRank, nPoint = GetPlayerRank()
	
	if nRank == nil then	-- ÅÅÃûÎ´½ø100Ãû
		SetTask(764, 999)
	elseif nRank > 0 then
		SetTask(764, nRank)
	else
		SetTask(764, -nRank)
	end
	
	local nBodyWeeks = GetTask(763)
	if nWeeks == nBodyWeeks or				-- Èç¹ûÆÀ¹ıÁË
		nWeeks == -1 then					-- Èç¹ûÃ»ÓĞÊı¾İ¾Í±£³ÖÔ­Ñù
		return
	end
	
	if nBodyWeeks - nWeeks > 1 then			-- Èç¹û¿çÇø²¢·ş²úÉúµÄ±ä»¯
		SetTask(768, nWeeks - 1)
		SetTask(763, nWeeks)
		return
	end
	
	SetTask(763, nWeeks)	-- ±êÊ¶±¾ÖÜÒÑ¾­ÅÅ¹ıÃû´ÎÁË
	
	local t = --LongDaiKa: table gèc, kh«ng ®­îc söa ë ®©y
	{
		{2, 250000, 6, 0},	--1
		{8, 120000, 5, 0},	--8¸ö½«¾ü
		{10, 80000, 4, 0},	--10
		{1000,50000,3,0},
		{1000,15000,2,0},
		{1000,0,1,0},
	}
	local song_or_liao = 1
	
	if nRank == nil or nRank > t[1][1] + t[2][1] + t[3][1] then
		CalcBattleNoInRank()
		return
	end
	
	if nRank < 0 then
		nRank = -nRank
		song_or_liao = -1
	end
	
	local tPlayer = {}
	for i=0, nRank - 1 do
		tPlayer[i+1] = GetRankByIndex(song_or_liao, i)
	end
	
	local n = 1
	for i = 1, getn(tPlayer) do
		for j = n, getn(t) do
			if tPlayer[i] >= t[j][2] and t[j][4] < t[j][1] then
				t[j][4] = t[j][4] + 1
				n = j
				break
			end
		end
	end

	SetTask(704, t[n][3] * song_or_liao)
end
