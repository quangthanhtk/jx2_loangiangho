--��ʱִ�еĽű�
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
			local nNpcIdx = CreateNpc("Phanh M�nh Tam Lang Th�ch T�", "Thi�n �m T�n S�", tPos[1], tPos[2], tPos[3])
			SetNpcLifeTime(nNpcIdx, 60*60);--����1Сʱ
			SetNpcScript(nNpcIdx, "\\script\\online_activites\\201506cn\\boss_death.lua")
			AddGlobalNews(format("Thi�n �m T�n S� xu�t hi�n � <color=yellow>%s<color>, c�c v� ��i hi�p h�y nhanh ch�ng �i ti�u di�t tr��c khi ch�ng mang theo m�t th� tr�n tho�t!",szMapName), 1)
		end
	end
end