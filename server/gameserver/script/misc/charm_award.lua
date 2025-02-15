Import("\\script\\lib\\sdb.lua");
Import("\\script\\lib\\globalfunctions.lua");

THIS_FILE = "\\script\\misc\\charm_award.lua";

CHARM_AWARD_DAY = 20;
CHARM_AWARD_HOUR = 20;
CHARM_AWARD = {
	{
		[1] = {
			{{0, 108, 937, 1}, 30},
			{{0, 109, 937, 1}, 30},
			{{0, 110, 937, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 21, 1}, 30},
			{{0, 120, 21, 1}, 30},
			{{0, 121, 21, 1}, 30},
		},
		[2] = {
			{{0, 108, 938, 1}, 30},
			{{0, 109, 938, 1}, 30},
			{{0, 110, 938, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 22, 1}, 30},
			{{0, 120, 22, 1}, 30},
			{{0, 121, 22, 1}, 30},
		},
		[3] = {
			{{0, 108, 939, 1}, 30},
			{{0, 109, 939, 1}, 30},
			{{0, 110, 939, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 23, 1}, 30},
			{{0, 120, 23, 1}, 30},
			{{0, 121, 23, 1}, 30},
		},
		[4] = {
			{{0, 108, 940, 1}, 30},
			{{0, 109, 940, 1}, 30},
			{{0, 110, 940, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 24, 1}, 30},
			{{0, 120, 24, 1}, 30},
			{{0, 121, 24, 1}, 30},
		},
	},
	{
		[1] = {
			{{0, 108, 937, 1}, 30},
			{{0, 109, 937, 1}, 30},
			{{0, 110, 937, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
		[2] = {
			{{0, 108, 938, 1}, 30},
			{{0, 109, 938, 1}, 30},
			{{0, 110, 938, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
		[3] = {
			{{0, 108, 939, 1}, 30},
			{{0, 109, 939, 1}, 30},
			{{0, 110, 939, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
		[4] = {
			{{0, 108, 940, 1}, 30},
			{{0, 109, 940, 1}, 30},
			{{0, 110, 940, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
	},
	{
		[1] = {
			{{0, 108, 937, 1}, 30},
			{{0, 109, 937, 1}, 30},
			{{0, 110, 937, 1}, 30},
		},
		[2] = {
			{{0, 108, 938, 1}, 30},
			{{0, 109, 938, 1}, 30},
			{{0, 110, 938, 1}, 30},
		},
		[3] = {
			{{0, 108, 939, 1}, 30},
			{{0, 109, 939, 1}, 30},
			{{0, 110, 939, 1}, 30},
		},
		[4] = {
			{{0, 108, 940, 1}, 30},
			{{0, 109, 940, 1}, 30},
			{{0, 110, 940, 1}, 30},
		},
	},
}

function main()
	local nDay = tonumber(date("%d"));
	if nDay ~= CHARM_AWARD_DAY then
		return
	end
	--删除以前的备份排名
	local sdbRankCopy = SDB("CHARM_RANK_DATA_COPY", 0, 0);
	sdbRankCopy:delete();
	--当前数据库拷贝
	local sdbRank = SDB("CHARM_RANK_DATA", 0, 0);
	sdbRank:reflash()
	sdbRank:apply2(callout(_CopyDatabaseCB, "CHARM_RANK_DATA", "CHARM_RANK_DATA_COPY"));
end

function _CopyDatabaseCB(szKey, szKeyCopy, nCount, sdb)
	if nCount <= 0 then
		return 0;
	end
	local sdbCopy = SDB(szKeyCopy, 0, 0);
	sdbCopy.sortType = 2;
	local msg = ""
	for i = 0, min(nCount - 1, 3) do
		local tData = sdb[i];
		if tData and tData[1] then
			msg = msg..format("[%s]", tData[1]);
			sdbCopy[tData[1]] = {"ddd", tonumber(tData[2]), tonumber(tData[3]), 0};
		end
	end
	Msg2Global(format("Ch骳 m鮪g %s nh薾 頲 ph莕 thng x誴 h筺g s鴆 quy課 r�.", msg))
end

function OnHour()
	local nVersion,bGlbRealm = GetRealmType();
	if bGlbRealm == 1 then
		return 
	end
	
	local nHour = tonumber(date("%H"));
	if nHour ~= CHARM_AWARD_HOUR then
		Talk(1,"","B﹜ gi� kh玭g ph秈 l� 20h, kh玭g th� nh薾 thng.")
		return
	end
	
	local nDay = tonumber(date("%d"));
	if nDay ~= CHARM_AWARD_DAY then
		Talk(1,"","H玬 nay kh玭g ph秈 l� ng祔 20, kh玭g th� nh薾 thng.")
		return
	end
	
	if SubWorldID2Idx(200) == -1 then
		Talk(1,"","H穣 n ch� Th祅h Ch� Bi謓 Kinh  nh薾 thng.")
		return 
	end
	
	local sdbRank = SDB("CHARM_RANK_DATA_COPY", 0, 0);
	sdbRank:reflash()
	sdbRank:apply2(get_charm_award);
end

function get_charm_award(nCount, sdb)
	local nVersion,bGlbRealm = GetRealmType();
	if bGlbRealm == 1 then
		return 
	end	
	if SubWorldID2Idx(200) == -1 then
		Talk(1,"","H穣 n ch� Th祅h Ch� Bi謓 Kinh  nh薾 thng.")
		return 
	end
	if nCount < 0 then
		Talk(1,"","Kh玭g c� d� li謚 x誴 h筺g.");
		return
	end
	for i = 1, min(nCount, 3) do
		local tData = sdb[i-1];
		if tData and tData[1] and tData[1] == GetName() and tonumber(tData[2]) > 0 then
			if tonumber(tData[4]) ~= 0 then
				Talk(1,"","Ngi  nh薾 thng r錳")
				return
			end
			local nBody = GetBody()
			local tAward = CHARM_AWARD[i][nBody]
			if GetFreeItemRoom() < getn(tAward) then
				Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
				return 0;
			end
			local sdbCopy = SDB("CHARM_RANK_DATA_COPY", 0, 0);
			sdbCopy.sortType = 2;
			sdbCopy[tData[1]] = {"ddd", tonumber(tData[2]), tonumber(tData[3]), 1};			
			for _, v in tAward do
				gf_AddItemEx2(v[1], GetItemName(v[1][1], v[1][2], v[1][3]), "H� th鑞g S鴆 quy課 r�", "Ph莕 thng x誴 h筺g 甶觤 quy課 r�", v[2]*24*3600, 1);
			end
			Msg2Global(format("Thi猲 H� Phong L璾, t﹏ � y. Do Giang H� nh蕋 tr� c玭g nh薾, th竛g n祔 hi謕 s�  %s 甶觤 quy課 r� x誴 h筺g %d, s� nh薾 頲 ph莕 thng tuy謙 p duy nh蕋.",	tData[1], i));
			return
		end
	end
	Talk(1,"","Kh玭g c� t� c竎h nh薾 thng.")
end
