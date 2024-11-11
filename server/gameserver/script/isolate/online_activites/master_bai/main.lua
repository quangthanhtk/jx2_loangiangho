--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\globalfunctions.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "master_bai",
    szViewName 			= "N�m M�i B�i S�",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20151225,
    nEndDate 			= 20160105,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 23,
}

--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
    {id={"id_bai_time_today", 6,}, clear="daily", }, --ÿ�հ�ʦ����
}

function on_add_watches()
	isolate_watch_event("event_player_interactive", "handle_on_bai", "gentle")
	isolate_watch_npc_talk("Uy Nh� T�n", 100, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi�o s�", 200, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi�o s�", 300, "handle_on_npc_talk")
	--isolate_watch_npc_talk("��ɯ", 100, "handle_on_npc_talk")
end


tCfg = {
	max_bai_oneday = 1,--ÿ�հ�ʦ������
	no_check_lv = 801,--8ת��Ҳ����ʵ�ʵȼ�
}

tOpenDate = {
	[20151225] = 1,
	[20160101] = 1,
	[20160102] = 1,
	[20160103] = 1,
}

function on_event_player_login(nExchangeComing)
	Msg2Player("N�m m�i 2016 s�p ��n r�i, c�c b�n �� h�c ���c nh�ng g� ch�a, c� c�u n�i l� ba ng��i c�ng �i ch�c c� ng��i ��ng m�nh h�c theo, ho�t ��ng N�m M�i B�i S� b�t ��u r�i! Chi ti�t m�i c�c b�n �i Bi�n Kinh, Th�nh ��, Tuy�n Ch�u t�m Gi�o s� �� t�m hi�u th�m")
end


function check_open_date()
	local today = tonumber(date("%Y%m%d"))
	return tOpenDate[today] or 0
end

function handle_on_bai()
	if check_open_date() ~= 1 then
		return 0;
	end
	if get_task("id_bai_time_today") >= tCfg.max_bai_oneday then
 		Talk(1,"",format("<color=green>%s<color>: M�i ng��i ch� ���c nh�n th��ng %d l�n/ng�y.", isolate_view_name(), tCfg.max_bai_oneday));
 		return
 	end
 	local nTeamNum = GetTeamSize();
 	if nTeamNum ~= 2 then
		Talk(1,"",format("<color=green>%s<color>: Ph�i hai ng��i t� ��i m�i ���c nh�n th��ng.", isolate_view_name()));
		return
	end
	
	local nLv = gf_GetTransLevel();
 	local nTeamNum = GetTeamSize();
 	local nMapId,nPosX,nPosY = GetWorldPos();
 	
	local nOldIdx = PlayerIndex;
	local nMasterIdx = 0
	if GetTeamMember(1) == PlayerIndex then
		nMasterIdx = GetTeamMember(2);
	elseif GetTeamMember(2) == PlayerIndex then 
		nMasterIdx = GetTeamMember(1);
	else
		WriteLog("activity master bai:team error");
		return
	end
	PlayerIndex = nMasterIdx
	local nMapId2,nPosX2,nPosY2 = GetWorldPos();
	local nLv2 = gf_GetTransLevel();
	local sName2 = GetName();
	PlayerIndex = nOldIdx;
	
	if nMapId ~= nMapId2 or abs((nPosX-nPosX2)+(nPosY-nPosY2)) > 20 then --�����ж�
		Talk(1,"",format("<color=green>%s<color>: B�n v� ��i t��ng c�n b�i c�ch qu� xa, h�y ��n g�n h�n n�a!", isolate_view_name()));
		return
	end
	
	if nLv >= nLv2 and nLv2 < tCfg.no_check_lv then 
		Talk(1,"",format("<color=green>%s<color>: Ng��i ch�i c�p th�p l�m ��ng t�c L� ph�p v�i ng��i ch�i c�p cao trong ��i m�i ���c th��ng.", isolate_view_name()))
		return
	end
	
	return _give_award(nLv, nLv2, sName2, nMasterIdx)
end

function _give_award(nLvLow, nLvHigh,szHighName,nMasterIdx)
	local szName = GetName()
	local nMul = 1
	local nRandom = random(1,100);
	if nRandom <= 2 then    --2%���ʷ���
		nMul = 2
	end
	if nLvLow < tCfg.no_check_lv then
		local nLv = mod(nLvLow, 100)
		local nExp = floor(((nLv^4)/(80^4))*3000000);
		local nExpFinal = nExp*nMul
		ModifyExp(nExpFinal)
		Msg2Player(format("Sau khi h�nh l� b�i s� v�i %s, c�ng nhau giao l�u giang h� t�m ��c, v� th� n�n EXP giang h� t�ng l�n %d �i�m.",szHighName, nExpFinal));
		if nMul > 1 then
			local szMsg = format("%s th�nh t�m th�nh gi�o v� h�c v�i %s, sau khi ���c ch� �i�m th� v� c�ng ti�n b�, nh�n ���c ph�n th��ng g�p %d l�n, ���c %d �i�m EXP.", 
				szName, szHighName, nMul, nExpFinal)
			Msg2Global(szMsg)
		end
	else
		if gf_Judge_Room_Weight(1, 100, "") ~= 1 then
			return 0
		end
		local nNum = 1*nMul
		AddItem(2,1,30913,nNum)
		Msg2Player(format("Sau khi h�nh l� b�o s� v�i %s, c�ng nhau giao l�u giang h� t�m ��c, nh�n ���c ph�n th��ng %s.",szHighName, "��ng T� Chi Nguy�n"))
		if nMul > 1 then
			local szMsg = format("%s th�nh t�m th�nh gi�o v� h�c v�i %s, sau khi ���c ch� �i�m th� v� c�ng ti�n b�, nh�n ���c ph�n th��ng g�p %d l�n, ���c %d %s", 
				szName, szHighName, nMul, nNum, "��ng T� Chi Nguy�n")
			Msg2Global(szMsg)
		end
	end
	add_task("id_bai_time_today", 1)
	local nOldIdx = PlayerIndex
	PlayerIndex = nMasterIdx
	Msg2Player(format("%s h�nh l� b�i s� v�i b�n, c�ng l�c t�ng l�n ��ng k�",szName))
	PlayerIndex = nOldIdx
	return 1
end

function handle_on_npc_talk(nIndex)
	local szDate = format("%s, %s~%s", isolate_get_str_date(20151225), isolate_get_str_date(20160101), isolate_get_str_date(20160103))
	local szTitle = format('<color=green>%s:<color> Trong th�i gian %s, t�m m�t v� b�ng h�u giang h� v� t� ��i, th�nh vi�n c�p th�p l�m ��ng t�c h�nh "L� ph�p" v�i ng��i ch�i c�p cao �� b�y t� th�nh �, s� c� c� h�i nh�n ���c ph�n th��ng EXP phong ph�! N�u may m�n th� c�n c� th� ���c ph�n th��ng g�p ��i. ��i v�i cao th� giang h� �� ��t chuy�n sinh 8, n�u c�ng giao l�u giang h� t�m ��c, s� ���c ph�n th��ng <color=yellow>%s<color>! Ch� �: M�i ng��i ch� ���c h�c EXP giang h� %d l�n/ng�y!'
		, GetTargetNpcName(), szDate , "��ng T� Chi Nguy�n", tCfg.max_bai_oneday)
    local tbSay = {
    	format("%s/nothing", "Bi�t r�i!"),
    	}
    Say(szTitle, getn(tbSay), tbSay)
end
