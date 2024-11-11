-- ¿ç·þÇøÒ©Æ·ÏûºÄ½Å±¾
Include("\\script\\paycoin_head.lua")

tItems = {
	--{µÀ¾ß£¬GDP£¬½ð×Ó£¬ÉúÐ§}
	{"Tiªu Dao B¹ch V©n T¸n", {1, 0, 125}, 2500,1},
	{"Tiªu Dao V©n CÈm Tôc", {1, 0, 126}, 5000,1},
	{"Tiªu Dao §o¹n Tôc Cao", {1, 0, 127}, 10000,1},
	{"Tiªu Dao §¹i Hoµn §¬n", {1, 0, 128}, 2500,1},
	{"Tiªu Dao Phôc Thñy §¬n", {1, 0, 129}, 5000,1},
	{"Tiªu Dao Quy Nguyªn §¬n", {1, 0, 130}, 10000,1},
	{"Tiªu Dao Ngäc Linh T¸n", {1, 0, 131}, 2500,1},
	{"Tiªu Dao Ngäc Lé Hoµn", {1, 0, 132}, 5000,1},
	{"Tiªu Dao T¹o Hãa T¸n", {1, 0, 133}, 10000,1},
	{"Tiªu Dao Cöu ChuyÓn §¬n", {1, 0, 134}, 100000,1},
	{"Linh Chi Tôc MÖnh Hoµn", {1, 0, 30012}, 50000,2}, --LongDaiKa: t¾t thu tiÒn sö dông m¸u, mÆc ®Þnh 50000
	{"Dao Tr× §¹i Hoµn §¬n", {1, 0, 30013}, 50000,2}, --LongDaiKa: t¾t thu tiÒn sö dông m¸u, mÆc ®Þnh 50000
	{"TuyÕt S©m Ph¶n KhÝ Hoµn", {1, 0, 30014}, 50000,2}, --LongDaiKa: t¾t thu tiÒn sö dông m¸u, mÆc ®Þnh 50000
	{"B¸nh Bét vµng", 			{1, 1, 30015}, 50000,1},
	{"Minh NguyÖt D¹", 	 {1, 1, 30016}, 50000,1},
	{"T©y B¾c Väng", 			{1, 1, 30017}, 50000,1},
}

function OnUse(nItemIdx)
	local tItem = getItem(tItems, nItemIdx);
	if not tItem then return 0 end
	if tItem[4] == 1 then
		local nRet = pc_pay_addtask(tItem[3]);
		local nIndex, nMapId = SubWorldIdx2ID(SubWorld);
		if nRet == 1 and nMapId == 6068 then
			AddRuntimeStat(8, 4, GetPlayerRoute(), 1);
		end
		return nRet;
	elseif tItem[4] == 2 then
		return 1;
	end
	return 0;
end

function getItem(t, i)
	local g, d, p = GetItemInfoByIndex(i)
	for i = 1, getn(t) do
		local gdp = t[i][2];
		if g == gdp[1] and d == gdp[2] and p == gdp[3] then
			return t[i]
		end
	end
end
