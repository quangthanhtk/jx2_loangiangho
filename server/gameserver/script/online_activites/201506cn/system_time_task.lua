--定时执行的脚本
Include("\\script\\online_activites\\201506cn\\head.lua")

function main()
	if is_in_activity_date()~=1 then
		return
	end
	local t = g_t201506cn.tBossPos
	for i,v in t do
		if SubWorldID2Idx(i) > 0 then
			local nRand = random(2, getn(v))
			local tPos = v[nRand]
			local szMapName = v[1]
			local nNpcIdx = CreateNpc("Phanh M謓h Tam Lang Th筩h T�", "Thi猲  T輓 S�", tPos[1], tPos[2], tPos[3])
			SetNpcLifeTime(nNpcIdx, 60*60);--存在1小时
			SetNpcScript(nNpcIdx, "\\script\\online_activites\\201506cn\\boss_death.lua")
			AddGlobalNews(format("Thi猲  T輓 S� xu蕋 hi謓 � <color=yellow>%s<color>, c竎 v� i hi謕 h穣 nhanh ch鉵g 甶 ti猽 di謙 trc khi ch髇g mang theo m藅 th� tr鑞 tho竧!",szMapName), 1)
		end
	end
end