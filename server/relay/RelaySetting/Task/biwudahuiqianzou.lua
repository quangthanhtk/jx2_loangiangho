-- =====================================================
-- ÿ��Сʱ����һ�εı�����ǰ���������
-- =====================================================
g_nInterValTime = 1;	--�����ļ��ʱ��
-- ��ʱ�趨
function TaskShedule()
	-- ��������
	TaskName("Gh�p ��i tr��c ��i h�i t� v�")

	-- 15���Ӵ���һ��
	TaskInterval(g_nInterValTime)

	-- ���ô���ʱ��
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	nMin = mod((floor(nMin/g_nInterValTime)+1)*g_nInterValTime,60)
	if nMin == 0 then
		nHour = nHour + 1; --�����x��48�������Ļ�����ô����x+1��0�ִ���NPC
	end;
	--Relay��������һ��quarterִ��
	TaskTime(nHour, nMin)

	-- �ظ�ִ�����޴���
	TaskCountLimit(0)

	local msg = "Gh�p ��i l�i th�nh c�ng, th�i gian gh�p ��i l�n ��u l� "..nHour.." �i�m"..nMin.." Ph�t "
	OutputMsg(format(msg))
end;

-- ��ʱִ�е�����
function TaskContent()
	GlobalExecute("dw biwudahuiqianzou_init()")
end;

function GameSvrConnected(GameSvr)
end
