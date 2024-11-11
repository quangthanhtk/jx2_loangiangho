
-- ±ÈÎä´ó»á×Ê¸ñÅÅÃû
g_nBWBeginTime = MkTime(2016,11,14,0,0,0); --20016Äê11ÔÂ14ºÅ£¨ÖÜÒ»£©¿ªÊ¼ÐÂÈü¼¾ 1260115200
g_nBWWeeks = 4;  --12ÖÜÎªÒ»Èü¼¾
bCopy = 0;

function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("Xãa bá h¹ng tû vâ")

	-- ÉèÖÃ´¥·¢Ê±¼ä
	local h = tonumber(date("%H"))
	local m = tonumber(date("%M"))

	-- 60·ÖÖÓ´¥·¢Ò»´Î
	TaskInterval(60)

	TaskTime(h, m)

--	OutputMsg("½«ÓÚ"..h..":"..m.."Çå³ý½ÏÒÕÅÅÃûÊý¾Ý...")
	-- Ö´ÐÐÒ»´Î
	TaskCountLimit(0)
end;

-- ¶¨Ê±Ö´ÐÐµÄÄÚÈÝ
function TaskContent()

	local nDate = tonumber(date("%Y%m%d"));
	local nCurWeek = tonumber(date("%w"));

	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --µÚ¼¸Èü¼¾
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --µ±Ç°Èü¼¾µÄµÚ¼¸ÖÜ
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
			OutputMsg("§ang xãa bá sè liÖu h¹ng tû vâ...")
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
