Include("\\script\\task\\global_task\\task_id.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\isolate\\functions\\longmenhotel\\main.lua")
function main()
--		if tGtTask:check_cur_task(13) == 1 and GetTask(Task_id_004) == 1 then
--			--if DelItem(2,0,30010,1) == 1 and DelItem(2,0,30028,1) == 1 then
--			--	Talk(2,"","<color=green>李老：<color>多谢"..tSex.."销魂引魂铃，请把散化消灵散交给我吧！我去拯救百姓！","<color=green>"..GetName()..":<color>好!");
--			--	SetTask(Task_id_004,GetTask(Task_id_004)+1);
--			--end
--		else
	if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
		Talk(1,"",format("<color=green>%s<color>:".."Ch祇 m鮪g n nh� ta ch琲!", GetTargetNpcName()));
	else
		local szTitle = format("<color=green>%s<color>: Х l� c飊g h閕 c飊g thuy襫, ch� ta c� v礽 th� c� th� gi髉 頲 ngi!", GetTargetNpcName())
		local tbSay = {}
		tinsert(tbSay, "Mua 1 B竛h c Ch�: ti猽 hao 500 v祅g/buy_banhdacche")
		tinsert(tbSay, "C鯽 H祅g U萵 Linh 8/open_shop")
		tinsert(tbSay, "H駓 b�/nothing")
		Say(szTitle, getn(tbSay), tbSay)
		
	end
		--end
end

function open_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3115, "Ti謒 Qu竛 Tr� Long M玭"));
end

function buy_banhdacche()
	local szNpcName = "<color=green>L� L穙: <color>"
	local nCount = VNG_GetTaskPos(TSK_BUY_BANHDACCHE, 2, 1)
	if nCount >= 30 then
		Talk(1,"",szNpcName.."H玬 nay i hi謕  mua  30 l莕 r錳, ng祔 mai h穣 quay l筰 !")
		return
	end
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."H祅h trang c馻 c竎 h� kh玭g  � tr鑞g ho芻  n苙g!")
		return
	end
	if GetCash() < 500*10000 then
		Talk(1, "", szNpcName.."Чi hi謕 kh玭g mang theo  500 V祅g.")
		return 0
	end
	if Pay(500*10000) == 1 then
		VNG_SetTaskPos(TSK_BUY_BANHDACCHE, nCount + 1, 2, 1)
		gf_AddItemEx2({2,1,31319,1}, "b竛h c ch�", "MUA BANH DAC CHE", "Mua b竛h c ch�")
	end
end