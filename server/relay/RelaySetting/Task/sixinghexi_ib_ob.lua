-- =====================================================
-- ��ʱ����λ����npc�ŵ����λ�õĽű�
-- =====================================================
g_nTotalNpcCount = 4;	--NPC����
g_nTotalCityCount = 13;	--��������
g_nLastNpcIdx = 0;		--�ϴ�ˢ��NPC�ı�ţ���ʼֵ��0
g_nLastCityIdx = 1;		--�ϴ�ˢNPC�ĳ��еı�ţ���ʼֵ��1
g_nInterValTime = 15;	--�����ļ��ʱ��
-- ��ʱ�趨
function TaskShedule()
	-- ��������
	TaskName("Open IB: T� Tinh Gia H�")
	
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
	
	local msg = "Open IB: Ho�t ��ng T� Tinh Gia H�, Th�i gian t�o NPC l�n 1 l�"..nHour.." gi� "..nMin.." Ph�t "
	OutputMsg(format(msg))
end;

-- ��ʱִ�е�����
function TaskContent()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070415 and nDate < 070601 then
		local nNpcIdx,nCityIdx = get_next_npc_city(g_nLastNpcIdx,g_nLastCityIdx)
		local msg=nNpcIdx.."Th�n ti�n xu�t hi�n t�i"..nCityIdx.."B�n �� s�"
		OutputMsg(format(msg))
		g_nLastNpcIdx = nNpcIdx;
		g_nLastCityIdx = nCityIdx;
		GlobalExecute(format("dw Create_SiXing_IB_OB(%d,%d)", nNpcIdx,nCityIdx))
	end
end;

function get_next_npc_city(nCurNpcIdx,nCurCityIdx)
	local nNextNpcIdx,nNextCityIdx = 0,0;
	nNextNpcIdx = mod(nCurNpcIdx,g_nTotalNpcCount)+1;
	local nRand = random(2,g_nTotalCityCount);
	nNextCityIdx = mod(nCurCityIdx+nRand-2,g_nTotalCityCount)+1;
	return nNextNpcIdx,nNextCityIdx;
end;


