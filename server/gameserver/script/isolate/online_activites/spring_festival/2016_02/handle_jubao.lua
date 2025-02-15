--
-- Author: Zheng Jinke
-- Date: 2015-12-31 9:53:00
--

-- tb_npc_jbp在isolate中保存聚宝盆NPC的信息，具体配置如下：
-- tb_npc_jbp = {   {1：NPCid,2：pos1,3：pos2,4：pos3,5：玩家姓名,6：当前可领取数 ,7：聚宝开始时间,8：聚宝结束时间},   } 

Include("\\script\\function\\ornament\\ornament.lua")

-- 每分钟检查聚宝盆状态。存在缺陷。
-- 缺陷是：由于只精确到分钟，因此存在误差。如果聚宝盆在两次检查之间结束，本该结束的聚宝盆需要在服务器下一次的分钟事件回调时才会被结束掉
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
	if npc[6]<=0 then --无人聚宝
		local Title = "<color=gold>T� B秓 B錸 tr鑞g:<color> T� B秓 B錸 n祔 hi謓 ch璦 c� ngi t� b秓, ng礽 c� th� t T� T礽 Th筩h v祇  ti課 h祅h t� b秓."
		local tbSay = {}
		tinsert(tbSay,format("%s/#do_jubao(%d)","T� b秓 ngay",idx))
		tinsert(tbSay,"T� b�/nothing")
		Say(Title,getn(tbSay),tbSay)
	elseif npc[6]>0 and curtime < npc[7] then  -- 正在聚宝
		local TalkStr = format("<color=gold>T� B秓 B錸-%s:<color> T� B秓 B錸 產ng chu萵 b� t� b秓, sau %d gi﹜ s� t� b秓 ho祅 t蕋.",npc[5],npc[7]-curtime)
		Talk(1,"",TalkStr)
	else
		local nCnt = get_task("id_get_jbp_award_cnt")
		local Title = format("<color=gold>T� B秓 B錸-%s:<color> T� B秓 B錸 產ng t� b秓. H玬 nay i hi謕  nh薾 thng t� b秓 %d/%d l莕",npc[5], nCnt, GET_JBP_LIMIT)
		local tbSay = {}
		if nCnt < GET_JBP_LIMIT then
			tinsert(tbSay,format("Nh薾 l蕐 ph莕 thng./#get_jbp_award(%d)",idx))
		end
		tinsert(tbSay,"H駓 b�/nothing")
		Say(Title,getn(tbSay),tbSay)
	end
end
function do_jubao(idx)
	local npc = tb_npc_jbp[idx];
	if npc[6]>0 then 
		Talk(1,"",format("<color=gold>T� B秓 B錸-%s:<color> T� B秓 B錸 產ng t� b秓, h穣 n T� B秓 B錸 kh竎  ti課 h祅h.",npc[5]))
		return 0;
	end
	local nMax = GetItemCount(2,1,31170)
	local rest = PUTCOIN_LIMIT-get_task("id_putcoin_cnt")
	if rest <= 0 then
		Talk(1,"",format("M鏸 ng祔 m鏸 ngi 頲 t v祇 t鑙 產 %d T� T礽 Th筩h. Ng礽  t v祇 qu� gi韎 h筺.", PUTCOIN_LIMIT)); 
		return
	end
	nMax = min( nMax,rest )
	AskClientForNumber(format("_handle_put_coin%d",idx),1,nMax,format("Mu鑞 b� v祇 bao nhi猽 ng?",nMax,rest))
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
		Talk(1,"",format("<color=gold>T� B秓 B錸-%s:<color> T� B秓 B錸 產ng t� b秓, h穣 n T� B秓 B錸 kh竎  ti課 h祅h.",npc[5])); 
		return 0;
	end
	local cNum = get_task("id_putcoin_cnt")
	if cNum + num > PUTCOIN_LIMIT then 
		--Talk(1,"",format("神奇金币每人每天最多投币%d枚，您的投币超过限额了。", PUTCOIN_LIMIT)); 
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
		Talk(1,"",format("<color=gold>%s-T� B秓 B錸:<color> Ng礽  t v祇 th祅h c玭g <color=red>%d<color> T� T礽 Th筩h, nh薾 頲 <color=red>%d<color> 甶觤 Phong Hoa. T� B秓 B錸 c馻 ng礽   t苙g thng cho <color=red>%d<color> ngi ch琲",GetName(),num,(FENGHUAPOINT_PER_COIN*num),point))
		local news = format("Ch骳 m鮪g i hi謕 [%s]  k輈h ho箃 th祅h c玭g T� B秓 B錸 � [%s], T� B秓 B錸 b総 u t� b秓! C竎 i hi謕 nhanh ch鉵g nh薾 甶觤 ch骳 ph骳 n祇!",GetName(),npc[9])
		AddGlobalNews(news, 1)
		SetCurrentNpcSFX(npc[1],909,2,1,(JUBAO_PREPARE_TIME+num*JUBAO_TIME_PRE_COIN)*18)
    	FireEvent("event_cost_item", 2,1,31170,num)
	else
		print(" Error:occur on delete item jixiangjinbi (2,1,31007)")
		WriteLog("X鉧 v藅 ph萴 th蕋 b筰")
		return 0;
	end
	return 1;
end

function get_jbp_award( idx )
	local npc = tb_npc_jbp[idx]
	if npc[6] <= 0 then 					-- 领完了
		Talk(1,"","<color=gold>T� B秓 B錸-Tr鑞g:<color> Х nh薾 thng T� B秓 B錸 ho祅 t蕋.")
		return 0;
	end
	local cnt = get_task("id_get_jbp_award_cnt")	
	if cnt >= GET_JBP_LIMIT then 			-- 次数上限
		Talk(1,"",format("<color=gold>T� B秓 B錸-%s:<color> H玬 nay  nh薾 thng T� B秓 B錸 %d l莕, ng祔 mai h穣 quay l筰.",npc[5],GET_JBP_LIMIT))
		return 0;
	end
	
	local cutTime = GetTime()
	
	if cutTime < npc[7] then return 0 end
	
	local time_lim = get_task("id_get_jbp_award_cd")	
	if time_lim > cutTime then 				-- 频率太快
		Talk(1,"",format("<color=gold>T� B秓 B錸-%s:<color> T莕 su蕋 nh薾 qu� nhanh, sau %d gi﹜ r錳 th� l筰.",npc[5],time_lim-cutTime))
		return 0;
	end

	npc[6]=npc[6]-1
	ornament_add_score(1)
	AddRuntimeStat(40, 8, 0, 1)
	set_task("id_get_jbp_award_cnt",cnt+1)
	set_task("id_get_jbp_award_cd", cutTime+GET_JBP_CD)
	--handle_on_use_jubaoex()                    -- 发放聚宝盆随机奖励
	Talk(1,"",format("<color=gold>%s-T� B秓 B錸:<color> Ch骳 m鮪g nh薾 thng T� B秓 B錸 th祅h c玭g",npc[5]))
	if tb_npc_jbp[idx][6]<=0 then 
		SetCurrentNpcSFX(npc[1],0,2,1)
	end
end

function handle_use_coin_clip(Itemidx)
	tExchg.coin_clip:npc_talk_main("M秐h уng Ti襫", 1)
end

