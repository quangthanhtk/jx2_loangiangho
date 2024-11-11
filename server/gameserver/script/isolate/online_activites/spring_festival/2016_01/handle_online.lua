--
-- Author: Zheng Jinke
-- Date: 2015-12-22 15:51:29
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

---------------------------����ʱ��---------------------------


function do_online_time_activity()
	local titleSay = ""--format("<color=gold>һƷ����<color>:���ÿ����������������������ۻ����߼�ʱ��������ۻ����ߴﵽһ��ʱ��ʱ����ҿ��������ң���ȡ������������һ���ۻ����߼�ʱ��")
	local tbSay = {}
	local round = get_task("id_online_time_round")+1
	local t = tb_online_task[round]
	local tAward = tb_online_award[round]
	if not t then
		Talk(1,"","�� ho�n th�nh nhi�m v� t�ch l�y online c�a h�m nay, ng�y mai h�y quay l�i.")
		return 0;
	end
	
	local curtime = get_task("id_online_time_count")
	local goal = t[1]
	local need = goal - curtime
	titleSay = format("L��t nhi�m v� hi�n t�i: %d/%d, ph�n th��ng: %d %s, t�ch l�y online %s", round, getn(tb_online_task), tAward[5], tAward[1]
		, _get_time_str(curtime))
	if need > 0 then
		local resStr = format("B�n c�n t�ch l�y online th�m %s m�i ���c nh�n th��ng",_get_time_str(need))
		titleSay = format("%s,%s", titleSay, resStr)
	else
		tinsert(tbSay,format("%s/#online_award(%d)","X�c nh�n nh�n th��ng", round))
	end
		
	tinsert(tbSay,format("%s/nothing", "Ra kh�i"))
	Say(titleSay,getn(tbSay),tbSay)
end

function _get_time_str(nMin)
	local resStr = ""
	local hour = floor(nMin / 60)
	local minu = floor(mod(nMin,60))
	local resStr = format("%d gi� %d ph�t",hour,minu)
	return resStr
end

function active_online(  )  --��������ʱ�䣬������id����Ϊ1
	set_task("id_online_time_round",1)
end

function online_award( round )
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then return end
	local tb_award = tb_online_award[round]
	AddItem(tb_award[2],tb_award[3],tb_award[4],tb_award[5],tb_award[6])
	set_task("id_online_time_round",round)
	local Str = format("Nh�n th��ng online l��t th� %d/%d th�nh c�ng", round, getn(tb_online_task))
	Msg2Player(1,"",Str)
end
---------------------------����ʱ��---------------------------