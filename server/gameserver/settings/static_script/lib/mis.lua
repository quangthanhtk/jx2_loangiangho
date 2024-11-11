
function _mis_str_split(src, seq)
	src = src or "";
	seq = seq or "";
	local fields = {};
	local op = function (c)
		%fields[getn(%fields) + 1] = gsub(c, "^%s*(.-)%s*$", "%1");
	end
	local pattern = format("([^%s]+)", seq);
	gsub(src, pattern, op)
	--print(src)
	--gf_PrintTable(fields)
	return fields;
end

function _mis_talk_event_cb(szNpcName, szTitle, szContent)
	--print(szNpcName, szTitle, szContent)
	local tSay = _mis_str_split(szContent, "|");
	tSay[getn(tSay)] = format(tSay[getn(tSay)], "Ta c�n x� l� nh�ng vi�c kh�c");
	--gf_PrintTable(tSay)
	Say(format("<color=gold>%s<color>:%s", szNpcName, szTitle), getn(tSay), tSay);
end

--�ű��������¼�����ע������
--NPC����
--EventType:event_kill_npc
--EventName:npc����
--CallBack Param: npc Index

--NPC�Ի�
--EventType:event_talk_npc
--EventName:npc����
--CallBack Param: npc Index

--Item�Ի�
--EventType:event_use_item
--EventName:format("%d%d%d", g, d, p)
--CallBack Param: item Index

--ÿ������
--EventType:event_daily_clean
--EventName:����
--CallBack Param: ��

--ÿ������
--EventType:event_weekly_clean
--EventName:����
--CallBack Param: ��

--����������
--EventType:event_server_start
--EventName:����
--CallBack Param: ��

--��������
--EventType:event_mission_passstage
--EventName:��ڣ������������ɽ��̫һ����Ӣ��̫һ�����ؽ�ɽׯ��̫��þ�
--CallBack Param:EventType, EventName, nStage

--�μ�һ��ս��
--EventType: event_mission_joinonce
--EventName:�����󣬴�������ս���ݹ�����ս����̨����ս�����Ź���ս������Թ̨
--CallBack Param:EventType, EventName

--������������
--EventType:event_yp_taskfinish
--EventName:�ڱ���͵���飬���ڣ����ڣ�͵���ǣ�
--CallBack Param:EventType, EventName

--����ս���
--EventType:event_ywz_taskfinish
--EventName:�ܳ�����,���˽�����ִ�300
--CallBack Param:EventType, EventName

--ʧ����֮ս
--EventType:event_slyb_award
--EventName:ʧ����֮ս��������
--CallBack Param:EventType, EventName, nRank