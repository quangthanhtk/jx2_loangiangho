
-- �������ʸ�����

function TaskShedule()
	-- ��������
	TaskName("X�p h�ng t� c�ch ��i h�i t� v�")

	local h = tonumber(date("%H"))
	local m = tonumber(date("%M"))

	-- 60���Ӵ���һ��
	TaskInterval(60)
	TaskTime(23, 30)
	-- ִ�����޴�
	TaskCountLimit(0)
end;

-- ��ʱִ�е�����
function TaskContent()
	local w = tonumber(date("%w"))
	local h = tonumber(date("%H"))

	-- ������23��
	if w == 0 and h == 23 then
		OutputMsg("�ang x�p h�ng t� c�ch ��i h�i t� v�...")
		CalcGestConvetionRankJf("calc_point")
	end
end

tPoint = {100, 90, 85, 80, 75, 70, 65, 60, 55, 50}

function calc_point(nLevel, nRank)
	local nRetPoint = 0
	if tPoint[nRank] ~= nil then
		nRetPoint = tPoint[nRank]
	end
	return nRetPoint
end

function GameSvrConnected(GameSvr)
end
