
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 酒楼老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
szNpcName = "<color=green>Ch� t鰑 l莡<color>: "

Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv58\\task_main.lua");
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")
Include("\\script\\online_activites\\201506cn\\npc\\npc_main.lua")
function main()
	if GetWorldPos() == 200 then
		if GetTaskTrans() == 2 then		
			trans_talk_04()
			return
		end
	end
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==12) then
		task_012_00();
		return
	end
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,374) < 1 then
		--跟汴京酒楼老板买鲤鱼焙面             
		buy_gift_talk(1);
		return
	end
	local sal_num = 97
	if dragon_boat_08_time_chk() ~= 1 then
		sal_num = 98
	end
	local tSel = {
	}
	if is_in_activity_date()==1 then
		tinsert(tSel, format("%s/npc_talk_shop_1506", "Ho箃 ng b竛h ch璶g th琺 ngon"))
	end
	tinsert(tSel, "Ta ch� 甶 ngang th玦/end_dialog")
	Say("<color=green>Ch� T鰑 l莡<color>: Ru v� th鴆 ╪ � ch� ta r蕋 ngon, c遪 c� nguy猲 li謚 l祄 b竛h 輙 n鱝, kh竎h quan c� mu鑞 gh� qua kh玭g?",
		getn(tSel), tSel)
end

