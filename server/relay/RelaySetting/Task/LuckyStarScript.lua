--����֮��Relay�˴����ű�

function GameSvrConnected(GameSvr)
rolename = GetStringFromSDB("LuckyStar", 0, 0);
if (rolename ~= "") then
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end;
	str = format("Server: %d li�n k�t l�i Relay, ng�i sao may m�n %s", GameSvr,rolename)
	OutputMsg(str);
end;

function TaskShedule()
	TaskName("Ng�i sao may m�n")
	TaskInterval(10)
	TaskCountLimit(0)
end

function TaskContent()
	randomseed(date("%d%H%M%S"));
	accname, rolename = RandomSelAOnlinePlayer()
	date = GetCurrentTime()
	success = SaveStringToSDBOw("LuckyStarLog", date, 0, rolename)
	success = SaveStringToSDBOw("LuckyStar", 0, 0, rolename)
	str = format("Xu�t hi�n ng�i sao may m�n m�i %s",rolename)
	OutputMsg(str);
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end

