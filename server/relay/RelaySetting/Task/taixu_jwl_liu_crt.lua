--�ű����ƣ�̫�����񴴽����������ýű�
--�ű����ܣ���relay��ָ������ô����������Ľű�
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-03-04
--�����޸ļ�¼��
function TaskShedule()
	-- ��������
	TaskName("Th�n c�p nhi�m v� Trang s�c Th�i H�")
	-- 24��Сʱһ��
	TaskInterval(1440)
	-- ���ô���ʱ��
	local random_time_m = random(0,30)
	-- �ظ�ִ�����޴���
	TaskTime(21,random_time_m)
	TaskCountLimit(0)
	OutputMsg("Nhi�m v� t�ng c�p trang s�c Th�i H�: Th� r�n L�u ch� t�o th�nh c�ng!")
end
-- ��ʱִ�е�����
function TaskContent()
	GlobalExecute("dw taixujwl_liu_crt()")
end
