----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: G�i boss T�i Nguy�n Chi�n
----------------------------------------------------------------------------------------------------

function TaskShedule()
	TaskName("T�o m�i BOSS T�i Nguy�n Chi�n");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	--TaskTime(23, 00);
	TaskTime(22, 05);
	OutputMsg(format("BOSS ��ng Ph��ng Gi�o Ch�  s� xu�t hi�n � %s...", "22:05"));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_r2s_CreateBossTnc()");
end
