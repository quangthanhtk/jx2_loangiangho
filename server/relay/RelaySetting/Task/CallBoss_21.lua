-- ����9����ֵ�BOSS��ʱ��

function TaskShedule()
	TaskName("BOSS bu�i tr�a");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(21,0);
	OutputMsg(format("BOSS xu�t hi�n v�o l�c 21:00..."));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()

    local Random1 = Random(8)
          Random2 = Random(5)
          Random3 = Random(2)
	
	  world1 = Random1+1
	  world2 = Random2+101
	  world3 = Random3+201

          msg="BOSS ��u ti�n xu�t hi�n t�i:"..world1..",   BOSS th� 2 xu�t hi�n t�i:"..world2..",   BOSS th� 3 xu�t hi�n t�i:"..world3
	  OutputMsg(format(msg));

	-- ִ���ٻ�BOSS�ű�
	GlobalExecute(format("dw createBoss(%d,%d,%d)", world1, world2, world3));
end
