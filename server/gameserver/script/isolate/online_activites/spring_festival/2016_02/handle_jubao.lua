--
-- Author: Zheng Jinke
-- Date: 2015-12-31 9:53:00
--

-- tb_npc_jbp��isolate�б���۱���NPC����Ϣ�������������£�
-- tb_npc_jbp = {   {1��NPCid,2��pos1,3��pos2,4��pos3,5���������,6����ǰ����ȡ�� ,7���۱���ʼʱ��,8���۱�����ʱ��},   } 

Include("\\script\\function\\ornament\\ornament.lua")

-- ÿ���Ӽ��۱���״̬������ȱ�ݡ�
-- ȱ���ǣ�����ֻ��ȷ�����ӣ���˴���������۱��������μ��֮����������ý����ľ۱�����Ҫ�ڷ�������һ�εķ����¼��ص�ʱ�Żᱻ������
function check_jbp_state(  )  
	local curtime = GetTime();
	for i=1,getn(tb_npc_jbp)do
		if tb_npc_jbp[i][6] > 0 then 
			if curtime > tb_npc_jbp[i][8] then
				tb_npc_jbp[i][5]="";
				tb_npc_jbp[i][6]=0;
				tb_npc_jbp[i][7]=0;
				SetCurrentNpcSFX(tb_npc_jbp[i][1],0,2,1)
			end
		end
	end
end

function handle_on_npc_talk_jbp( nidx )
	local idx = nil--GetNpcTempData(nidx,1)
	for i=1,getn(tb_npc_jbp) do
		if tb_npc_jbp[i][1]==nidx then
			idx=i
			break
		end
	end
	if idx == nil then 
		print(format("JuBao NPC %d not in list", nidx))
		return 0 
	end
	local npc = tb_npc_jbp[idx];
	local curtime = GetTime();
	if npc[6]<=0 then --���˾۱�
		local Title = "<color=gold>T� B�o B�n tr�ng:<color> T� B�o B�n n�y hi�n ch�a c� ng��i t� b�o, ng�i c� th� ��t T� T�i Th�ch v�o �� ti�n h�nh t� b�o."
		local tbSay = {}
		tinsert(tbSay,format("%s/#do_jubao(%d)","T� b�o ngay",idx))
		tinsert(tbSay,"T� b�/nothing")
		Say(Title,getn(tbSay),tbSay)
	elseif npc[6]>0 and curtime < npc[7] then  -- ���ھ۱�
		local TalkStr = format("<color=gold>T� B�o B�n-%s:<color> T� B�o B�n �ang chu�n b� t� b�o, sau %d gi�y s� t� b�o ho�n t�t.",npc[5],npc[7]-curtime)
		Talk(1,"",TalkStr)
	else
		local nCnt = get_task("id_get_jbp_award_cnt")
		local Title = format("<color=gold>T� B�o B�n-%s:<color> T� B�o B�n �ang t� b�o. H�m nay ��i hi�p �� nh�n th��ng t� b�o %d/%d l�n",npc[5], nCnt, GET_JBP_LIMIT)
		local tbSay = {}
		if nCnt < GET_JBP_LIMIT then
			tinsert(tbSay,format("Nh�n l�y ph�n th��ng./#get_jbp_award(%d)",idx))
		end
		tinsert(tbSay,"H�y b�/nothing")
		Say(Title,getn(tbSay),tbSay)
	end
end
function do_jubao(idx)
	local npc = tb_npc_jbp[idx];
	if npc[6]>0 then 
		Talk(1,"",format("<color=gold>T� B�o B�n-%s:<color> T� B�o B�n �ang t� b�o, h�y ��n T� B�o B�n kh�c �� ti�n h�nh.",npc[5]))
		return 0;
	end
	local nMax = GetItemCount(2,1,31170)
	local rest = PUTCOIN_LIMIT-get_task("id_putcoin_cnt")
	if rest <= 0 then
		Talk(1,"",format("M�i ng�y m�i ng��i ���c ��t v�o t�i �a %d T� T�i Th�ch. Ng�i �� ��t v�o qu� gi�i h�n.", PUTCOIN_LIMIT)); 
		return
	end
	nMax = min( nMax,rest )
	AskClientForNumber(format("_handle_put_coin%d",idx),1,nMax,format("Mu�n b� v�o bao nhi�u ��ng?",nMax,rest))
end

function _handle_put_coin1(num)handle_put_coin( num ,1 ) end
function _handle_put_coin2(num)handle_put_coin( num ,2 ) end
function _handle_put_coin3(num)handle_put_coin( num ,3 ) end
function _handle_put_coin4(num)handle_put_coin( num ,4 ) end
function _handle_put_coin5(num)handle_put_coin( num ,5 ) end
function _handle_put_coin6(num)handle_put_coin( num ,6 ) end
function _handle_put_coin7(num)handle_put_coin( num ,7 ) end
function _handle_put_coin8(num)handle_put_coin( num ,8 ) end
function _handle_put_coin9(num)handle_put_coin( num ,9 ) end
function _handle_put_coin10(num)handle_put_coin( num ,10 ) end
function _handle_put_coin11(num)handle_put_coin( num ,11 ) end
function _handle_put_coin12(num)handle_put_coin( num ,12 ) end
function _handle_put_coin13(num)handle_put_coin( num ,13 ) end
function _handle_put_coin14(num)handle_put_coin( num ,14 ) end
function _handle_put_coin15(num)handle_put_coin( num ,15 ) end
function _handle_put_coin16(num)handle_put_coin( num ,16 ) end
function _handle_put_coin17(num)handle_put_coin( num ,17 ) end
function _handle_put_coin18(num)handle_put_coin( num ,18 ) end
function _handle_put_coin19(num)handle_put_coin( num ,19 ) end
function _handle_put_coin20(num)handle_put_coin( num ,20 ) end

function handle_put_coin( num ,idx )
	if 0 == num then return	end
	
	local npc=tb_npc_jbp[idx];
	if npc[6]>0 then 
		Talk(1,"",format("<color=gold>T� B�o B�n-%s:<color> T� B�o B�n �ang t� b�o, h�y ��n T� B�o B�n kh�c �� ti�n h�nh.",npc[5])); 
		return 0;
	end
	local cNum = get_task("id_putcoin_cnt")
	if cNum + num > PUTCOIN_LIMIT then 
		--Talk(1,"",format("������ÿ��ÿ�����Ͷ��%dö������Ͷ�ҳ����޶��ˡ�", PUTCOIN_LIMIT)); 
		return 0;
	end
	local npc = tb_npc_jbp[idx]
	local curtime = GetTime();
	if DelItem(2,1,31170,num) == 1 then
		local point = num * JUBAO_POINT_4_FREE;
		tb_npc_jbp[idx][5]=GetName();
		tb_npc_jbp[idx][6]=point;
		tb_npc_jbp[idx][7]=curtime+JUBAO_PREPARE_TIME;
		tb_npc_jbp[idx][8]=curtime+num*JUBAO_TIME_PRE_COIN+JUBAO_PREPARE_TIME;
		add_task("id_putcoin_cnt", num)
		ornament_add_score(FENGHUAPOINT_PER_COIN*num)
		AddRuntimeStat(40, 7, 0, num)
		AddRuntimeStat(40, 8, 0, num*FENGHUAPOINT_PER_COIN)
		Talk(1,"",format("<color=gold>%s-T� B�o B�n:<color> Ng�i �� ��t v�o th�nh c�ng <color=red>%d<color> T� T�i Th�ch, nh�n ���c <color=red>%d<color> �i�m Phong Hoa. T� B�o B�n c�a ng�i �� �� t�ng th��ng cho <color=red>%d<color> ng��i ch�i",GetName(),num,(FENGHUAPOINT_PER_COIN*num),point))
		local news = format("Ch�c m�ng ��i hi�p [%s] �� k�ch ho�t th�nh c�ng T� B�o B�n � [%s], T� B�o B�n b�t ��u t� b�o! C�c ��i hi�p nhanh ch�ng nh�n �i�m ch�c ph�c n�o!",GetName(),npc[9])
		AddGlobalNews(news, 1)
		SetCurrentNpcSFX(npc[1],909,2,1,(JUBAO_PREPARE_TIME+num*JUBAO_TIME_PRE_COIN)*18)
    	FireEvent("event_cost_item", 2,1,31170,num)
	else
		print(" Error:occur on delete item jixiangjinbi (2,1,31007)")
		WriteLog("X�a v�t ph�m th�t b�i")
		return 0;
	end
	return 1;
end

function get_jbp_award( idx )
	local npc = tb_npc_jbp[idx]
	if npc[6] <= 0 then 					-- ������
		Talk(1,"","<color=gold>T� B�o B�n-Tr�ng:<color> �� nh�n th��ng T� B�o B�n ho�n t�t.")
		return 0;
	end
	local cnt = get_task("id_get_jbp_award_cnt")	
	if cnt >= GET_JBP_LIMIT then 			-- ��������
		Talk(1,"",format("<color=gold>T� B�o B�n-%s:<color> H�m nay �� nh�n th��ng T� B�o B�n %d l�n, ng�y mai h�y quay l�i.",npc[5],GET_JBP_LIMIT))
		return 0;
	end
	
	local cutTime = GetTime()
	
	if cutTime < npc[7] then return 0 end
	
	local time_lim = get_task("id_get_jbp_award_cd")	
	if time_lim > cutTime then 				-- Ƶ��̫��
		Talk(1,"",format("<color=gold>T� B�o B�n-%s:<color> T�n su�t nh�n qu� nhanh, sau %d gi�y r�i th� l�i.",npc[5],time_lim-cutTime))
		return 0;
	end

	npc[6]=npc[6]-1
	ornament_add_score(1)
	AddRuntimeStat(40, 8, 0, 1)
	set_task("id_get_jbp_award_cnt",cnt+1)
	set_task("id_get_jbp_award_cd", cutTime+GET_JBP_CD)
	--handle_on_use_jubaoex()                    -- ���ž۱����������
	Talk(1,"",format("<color=gold>%s-T� B�o B�n:<color> Ch�c m�ng nh�n th��ng T� B�o B�n th�nh c�ng",npc[5]))
	if tb_npc_jbp[idx][6]<=0 then 
		SetCurrentNpcSFX(npc[1],0,2,1)
	end
end

function handle_use_coin_clip(Itemidx)
	tExchg.coin_clip:npc_talk_main("M�nh ��ng Ti�n", 1)
end

