-- 跨服区药品消耗脚本
Include("\\script\\paycoin_head.lua")

tItems = {
	--{道具，GDP，金子，生效}
	{"Ti猽 Dao B筩h V﹏ T竛", {1, 0, 125}, 2500,1},
	{"Ti猽 Dao V﹏ C萴 T鬰", {1, 0, 126}, 5000,1},
	{"Ti猽 Dao 筺 T鬰 Cao", {1, 0, 127}, 10000,1},
	{"Ti猽 Dao Чi Ho祅 Кn", {1, 0, 128}, 2500,1},
	{"Ti猽 Dao Ph鬰 Th駓 Кn", {1, 0, 129}, 5000,1},
	{"Ti猽 Dao Quy Nguy猲 Кn", {1, 0, 130}, 10000,1},
	{"Ti猽 Dao Ng鋍 Linh T竛", {1, 0, 131}, 2500,1},
	{"Ti猽 Dao Ng鋍 L� Ho祅", {1, 0, 132}, 5000,1},
	{"Ti猽 Dao T筼 H鉧 T竛", {1, 0, 133}, 10000,1},
	{"Ti猽 Dao C鰑 Chuy觧 Кn", {1, 0, 134}, 100000,1},
	{"Linh Chi T鬰 M謓h Ho祅", {1, 0, 30012}, 50000,2}, --LongDaiKa: t総 thu ti襫 s� d鬾g m竨, m芻 nh 50000
	{"Dao Tr� Чi Ho祅 Кn", {1, 0, 30013}, 50000,2}, --LongDaiKa: t総 thu ti襫 s� d鬾g m竨, m芻 nh 50000
	{"Tuy誸 S﹎ Ph秐 Kh� Ho祅", {1, 0, 30014}, 50000,2}, --LongDaiKa: t総 thu ti襫 s� d鬾g m竨, m芻 nh 50000
	{"B竛h B閠 v祅g", 			{1, 1, 30015}, 50000,1},
	{"Minh Nguy謙 D�", 	 {1, 1, 30016}, 50000,1},
	{"T﹜ B綾 V鋘g", 			{1, 1, 30017}, 50000,1},
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
