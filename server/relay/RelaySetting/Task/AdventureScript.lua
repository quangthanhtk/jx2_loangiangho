function TaskShedule()
	TaskName("T�m kho b�u")
	TaskInterval(1)
	TaskCountLimit(0)
	randomseed(date("%d%H%M%S"));
end

function TaskContent()
	Aid = Random(320);
	Date = GetCurrentTime()

	success = SaveCustomDataToSDBOw("Adventure",Date, 0, "iis", Aid, 353,  "\\script\\item\\shanhesheji.lua");
	NotifySDBRecordChanged("Adventure", Date ,0 ,1);
	GlobalExecute("dw AddLocalNews([[Khu v�c n�o �� xu�t hi�n m�nh S�n H� X� T�c, m�i ng��i mau ��n t�m th�, th�i gian l� 30 ph�t!]])");
	OutputMsg("T�i"..Aid.."�i�m, sinh ra 1 b�o v�t!");

end

