----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: G�i boss T�i Nguy�n Chi�n
----------------------------------------------------------------------------------------------------

function TaskShedule()
	TaskName("T�o m�i BOSS Event 2024");

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	--TaskTime(23, 00);
	TaskTime(11, 01);
	OutputMsg(format("BOSS  s� xu�t hi�n � %s...", "11:01"));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_event2024_CreateBossEvent2024()");
end
