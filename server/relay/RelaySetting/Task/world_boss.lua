--ÿ��14:30׼ʱˢ��

function TaskShedule()
	TaskName("T�o m�i BOSS T�i Nguy�n Chi�n");

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	--TaskTime(23, 00);
	TaskTime(14, 10);
	OutputMsg(format("BOSS ��ng Ph��ng Gi�o Ch�  s� xu�t hi�n � %s...", "14:10"));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_r2s_CreateBossTnc()");
end