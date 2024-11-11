-- �����ҩƷ���Ľű�
Include("\\script\\paycoin_head.lua")

tItems = {
	--{���ߣ�GDP�����ӣ���Ч}
	{"Ti�u Dao B�ch V�n T�n", {1, 0, 125}, 2500,1},
	{"Ti�u Dao V�n C�m T�c", {1, 0, 126}, 5000,1},
	{"Ti�u Dao �o�n T�c Cao", {1, 0, 127}, 10000,1},
	{"Ti�u Dao ��i Ho�n ��n", {1, 0, 128}, 2500,1},
	{"Ti�u Dao Ph�c Th�y ��n", {1, 0, 129}, 5000,1},
	{"Ti�u Dao Quy Nguy�n ��n", {1, 0, 130}, 10000,1},
	{"Ti�u Dao Ng�c Linh T�n", {1, 0, 131}, 2500,1},
	{"Ti�u Dao Ng�c L� Ho�n", {1, 0, 132}, 5000,1},
	{"Ti�u Dao T�o H�a T�n", {1, 0, 133}, 10000,1},
	{"Ti�u Dao C�u Chuy�n ��n", {1, 0, 134}, 100000,1},
	{"Linh Chi T�c M�nh Ho�n", {1, 0, 30012}, 50000,2}, --LongDaiKa: t�t thu ti�n s� d�ng m�u, m�c ��nh 50000
	{"Dao Tr� ��i Ho�n ��n", {1, 0, 30013}, 50000,2}, --LongDaiKa: t�t thu ti�n s� d�ng m�u, m�c ��nh 50000
	{"Tuy�t S�m Ph�n Kh� Ho�n", {1, 0, 30014}, 50000,2}, --LongDaiKa: t�t thu ti�n s� d�ng m�u, m�c ��nh 50000
	{"B�nh B�t v�ng", 			{1, 1, 30015}, 50000,1},
	{"Minh Nguy�t D�", 	 {1, 1, 30016}, 50000,1},
	{"T�y B�c V�ng", 			{1, 1, 30017}, 50000,1},
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
