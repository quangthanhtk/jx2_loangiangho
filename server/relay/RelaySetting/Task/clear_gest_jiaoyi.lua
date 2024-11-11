
-- �������ʸ�����
g_nBWBeginTime = MkTime(2016,11,14,0,0,0); --20016��11��14�ţ���һ����ʼ������ 1260115200
g_nBWWeeks = 4;  --12��Ϊһ����
bCopy = 0;

function TaskShedule()
	-- ��������
	TaskName("X�a b� h�ng t� v�")

	-- ���ô���ʱ��
	local h = tonumber(date("%H"))
	local m = tonumber(date("%M"))

	-- 60���Ӵ���һ��
	TaskInterval(60)

	TaskTime(h, m)

--	OutputMsg("����"..h..":"..m.."���������������...")
	-- ִ��һ��
	TaskCountLimit(0)
end;

-- ��ʱִ�е�����
function TaskContent()

	local nDate = tonumber(date("%Y%m%d"));
	local nCurWeek = tonumber(date("%w"));

	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --��ǰ�����ĵڼ���
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	
	print("check clear_share_bw:",nCurSeason, nSeasonWeek, nCurWeek, tonumber(date("%H")))

	if nDate >= 20161111 and nDate < 20161114 then
		clear_share_bw();
	elseif nCurSeason > 1 and nSeasonWeek == 1 and nCurWeek == 1 then
		clear_share_bw();
	end
end

function clear_share_bw()
	local nHour = tonumber(date("%H"));
	local nRouteMax = 32;
	if nHour > 0 and nHour < 10 then
		if bCopy ~= 1 then
			print("clear_share_bw")
			OutputMsg("�ang x�a b� s� li�u h�ng t� v�...")
			for i = 0, 1 do
				for j = 0, nRouteMax do
					CopyOneShareDBRecord("GestConvention_Zige", i, j, "GestConvention_Zige_Last")
					ClearOneShareDBRecord("GestConvention_Jiaoyi", i, j)
--					ClearOneShareDBRecord("GestConvention_Jiaoyi_w", i, j)
					ClearOneShareDBRecord("GestConvention_Change", i, j)
					ClearOneShareDBRecord("GestConvention_Zige", i, j)
					bCopy = 1;
				end
			end
		end
	end
end

function GameSvrConnected(GameSvr)
end
