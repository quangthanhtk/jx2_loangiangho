--一些事件处理函数
Include("\\script\\isolate\\online_activites\\christmas\\2015_12\\tasks.lua")

function handle_on_npc_talk(nIndex)
	local szTitle = format("<color=green>%s:<color> Ng祔 l� s緋 n r錳, m鋓 ngi c� th� n ch� c馻 ta  t譵 hi觰 th玭g tin ho箃 ng.", GetTargetNpcName())
	local tSay = {
		format("%s/#_npc_talk_1(%d)", "Gi秈 th輈h ho箃 ng", nIndex),
		--format("%s/#_npc_talk_2(%d)", "领取每日累积装饰奖励", nIndex),
		format("%s/#_npc_talk_3(%d)", "C鯽 H祅g Song Цn", nIndex),
		format("%s/nothing", "R阨 kh醝"),
	}
	Say(szTitle, getn(tSay), tSay)
end
function _npc_talk_1(nIndex)
	local _,nStartDate, nEndDate = isolate_get_dates()
	local szTitle = format("<color=green>%s:<color> Trong th阨 gian %s~%s, i tho筰 v韎 C﹜ Noel g莕 y  nh薾 nhi謒 v� trang tr� C﹜ Noel.", GetTargetNpcName(), isolate_get_str_date(nStartDate), isolate_get_str_date(nEndDate))
	szTitle = format("%s\n%s", szTitle, "M鏸 l莕 trang tr� C﹜ Noel u nh薾 頲 ph莕 thng EXP, khi c﹜ trng th祅h n c蕄 t鑙 產 s� nh薾 頲 ph莕 thng cu鑙 c飊g: Ngo礽 ph莕 thng EXP c遪 c� Qu� Song Цn.")
	szTitle = format("%s\n%s",szTitle, "C╪ c� theo ng c蕄 c馻 b筺 m� nh薾 頲 ph莕 thng EXP kh竎 nhau, c蕄 c祅g cao th� EXP nh薾 頲 c祅g nhi襲.")
	--szTitle = format("%s\n%s",szTitle, "每日，你还有机会成为圣诞之星，在领取最终奖励时，获得2倍的经验奖励哦。")
	local tSay = {
		format("%s/nothing", "R阨 kh醝"),
	}
	Say(szTitle, getn(tSay), tSay)
end
--function _npc_talk_2(nIndex)
--	local szTitle = format("<color=green>%s:<color>当前服务器累积完成装饰圣诞树任务已达<color=yellow>%d<color>轮。", GetTargetNpcName(), get_server_count())
--	local tSay = {}
--	for i = 1, getn(tFinalAward) do
--		local t = tFinalAward[i]
--		local szWord = format("服务器累积完成轮数达到%d次的奖励", t[1])
--		tinsert(tSay, format("%s/#get_server_award(%d)", szWord, i))
--	end
--	tinsert(tSay, format("%s/nothing", "离开"))
--	Say(szTitle, getn(tSay), tSay)
--end
function _npc_talk_3(nIndex)
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3070, "C鯽 H祅g Song Цn"))
end

function handle_on_tree1_talk(nIndex)
	_tree_talk(nIndex, 1)
end
function handle_on_tree2_talk(nIndex)
	_tree_talk(nIndex, 2)
end
function _tree_talk(nIndex, nType)
	local szTitle = format("<color=green>%s:<color> Trang tr� c﹜ c� th� gi髉 C﹜ Noel c馻 m譶h tr� n猲 xinh p h琻, ng th阨 c騨g nh薾 頲 ph莕 thng trang tr�, sau khi trang tr� c﹜ th� ph莕 thng c馻 l莕 trang tr� sau u g蕄 i, cho n khi ho祅 th祅h trang tr� c﹜.", GetTargetNpcName())
	szTitle = format("%s\n%s", szTitle, format("Чi hi謕 b﹜ gi� 產ng c� %d 甶觤 trang tr�", get_task("id_score")))
	local tSay = {
		format("%s/#_tree_talk_1(%d,%d)", "Trang tr� c﹜ th玭g", nIndex,nType),
		format("%s/#_tree_talk_2(%d,%d)", "Nh薾 qu� gi竛g sinh", nIndex,nType),
		format("%s/nothing", "R阨 kh醝"),
	}
	Say(szTitle, getn(tSay), tSay)
end
function _tree_talk_1(nIndex, nType,nOption)
	local nTask = get_cur_task(nType,1)
	local nStep = get_step(nType)
	if nStep >= getn(tTaskAward[nType])-1 then
		Talk(1, "", "Lt trang tr� n祔  t giai 畂筺 cao nh蕋, kh玭g th� ti誴 t鬰 trang tr�, ng祔 mai h穣 quay l筰.")
		return
	end
	if nTask == 0 then
		return
	end
	local tCfg = _get_task_cfg_(nTask)
	if tCfg then
		if not nOption then
    		local szTitle = format("<color=green>%s:<color> Ng緈 ngh輆 C﹜ Noel ph竧 hi謓 c遪 m閠 s� thi誹 s鉻, quy誸 nh d飊g <color=yellow>%d %s<color> ti課 h祅h trang tr�, nh璶g nh鱪g v藅 n祔 ch� c� <color=yellow>%s - %s<color> m韎 c�, ngi mu鑞 甶 xem th� kh玭g? Lt n祔 ngi  ho祅 th祅h %d/%d l莕 nhi謒 v� trang tr� r錳."
    			, GetTargetNpcName(), tCfg[2][4], tCfg[1], tCfg[4], tCfg[3], nStep, getn(tTaskAward[nType])-1)
        	local tSay = {
        		format("%s/#_tree_talk_1(%d,%d,1)", "уng � trang tr�", nIndex,nType),
        		format("%s/nothing", "R阨 kh醝"),
        	}
        	Say(szTitle, getn(tSay), tSay)
        	return
        elseif nOption == 1 then
        	finish_task(nType)
        end
	end
end
function _tree_talk_2(nIndex, nType, bConfirm)
	local nStep = get_step(nType)
	if nStep >= getn(tTaskAward[nType]) then
		Talk(1, "", "Х nh薾 t蕋 c� ph莕 thng c馻 lt trang tr� n祔, ng祔 mai h穣 quay l筰.")
		return
	end 
	local nCurTask = get_cur_task(nType,0)
	if nCurTask > 0 then
		Talk(1, "", "H譶h nh� ch璦 ho祅 th祅h nhi謒 v� trang tr�")
		return
	end
	
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	
	if not bConfirm then
		local szTitle = format("<color=green>%s:<color> Lt hi謓 t筰 <color=yellow>%d/%d, c莕 ch� � l� sai khi nh薾 thng s� k誸 th骳 lt hi謓 t筰, ng �?<color>"
			, GetTargetNpcName(), nStep, getn(tTaskAward[nType])-1)
    	local tSay = {
    		format("%s/#_tree_talk_2(%d,%d,1)", "Nh薾 ", nIndex,nType),
    		format("%s/nothing", "R阨 kh醝"),
    	}
    	Say(szTitle, getn(tSay), tSay)
    	return
	end
	
	local szTask = format("id_task_%d", nType)
	set_task_byte(szTask, "byte_task", TASK_STATUS_FINISH)
	get_task_award(nType, nStep+1)
	set_task_byte(szTask, "byte_step", getn(tTaskAward[nType]))
	add_server_count()
end

tItem = {
	--limit,cost,award,point
	[200130971] = {500, 0, "act_12_normal", 0},
	[200130972] = {-1, 10, "act_12_ib", 12},
}
function handle_on_use_item(nIndex,confirm)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local nId = PackItemId(g,d,p)
	local t = tItem[nId]
	if t then
		if t[1] > 0 and get_task("id_open_box1") >= t[1] then
			Talk(1,"",format("H玬 nay s� lng m� %s  t gi韎 h筺", GetItemName(nIndex)))
			return
		end
		if CustomAwardCheckCondition(t[3]) ~= 1 then
			return
		end
		if t[2] > 0 then
			if not confirm then
    			local szTitle = format("M� %s c莕 ti猽 hao %d %s, ng � kh玭g?", GetItemName(nIndex), t[2], "Xu")
    			local tSay = {
    				format("%s/#handle_on_use_item(%d,1)", "X竎 nh m�", nIndex),
    				format("%s/nothing", "T� b�"),
    			}
    			Say(szTitle, getn(tSay), tSay)
    			return
    		end
    		if DelItem(2,1,30230,t[2]) ~= 1 then
    			Talk(1,"",format("%s kh玭g  %d", "Xu", t[2]))
    			return
    		end
		end
		if DelItemByIndex(nIndex, 1) ~= 1 then
			return
		end
		if CustomAwardGiveGroup(t[3], 0) ~= 1 then
			return
		end
		if t[4] > 0 then
			add_task("id_score", t[4])
			Msg2Player(format("Nh薾 頲 %d 甶觤 trang tr�", t[4]))
		end
		if t[1] > 0 then
			add_task("id_open_box1", 1)
		end
	end
end

