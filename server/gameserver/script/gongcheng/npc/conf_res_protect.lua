--�ű����ƣ���ṥ��ս_��Դ��������_��Դ���䳵�Ի�����
--�ű����ܣ��Ի���������������Դ�����⡣
--�߻��ˣ����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-04-11
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--=================================������������======================================
	--�ǽ���Ӧ�ĳ���
	Tb_map_2_city = {}
	Tb_map_2_city[105] = 100
	Tb_map_2_city[108] = 100
	Tb_map_2_city[304] = 300
	Tb_map_2_city[308] = 300
	Tb_map_2_city[218] = 350
	Tb_map_2_city[406] = 350
	--����NPC��¼λ��
	--1����¼�Ƿ�ռ��
	box_belong_ID = 2				--��ֵ��ʼ��Ϊ0
	--2��������
	box_open_week_ID = 4			--��ֵ��ʼ��Ϊ0
	--��ʼ�򿪵�ʱ��
	box_open_time_ID = 5				--��ʼ��Ϊ0
	--NPC������¼ID
	TasktempID_npc_index = 166
function main()
	local npc_index = GetTargetNpc()
	
	if check_res_protect_condition(1) ~= 1 then
		return
	end
	
	--�����ڱ����Ƿ��Ѿ�����
	if GetUnitCurStates(npc_index,box_open_week_ID) >= zgc_pub_day_turn(7) then
		Talk(1,"","<color=green>Ch� �<color>: T�i nguy�n c�a r��ng n�y �� b� c��p �o�t!")
		return
	end
	--С�ײ����Կ�����
	if GetPlayerFaction() == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Ng��i ch�a gia nh�p m�n ph�i kh�ng th� tham gia ho�t ��ng n�y")
		return
	end
	
	on_enter_res_protect_map()--����һ����Դ����״̬
	
	--����ģʽ�����Բμ�
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"","<color=green>Ch� �<color>: D�ng th�c luy�n c�ng kh�ng th� nh�n ���c T�i nguy�n n�y")
		return
	end
	--��ս��״̬�޷���
	if GetFightState() == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Tr�ng th�i phi chi�n ��u kh�ng th� tham gia ho�t ��ng n�y")
		return
	end
	--������ʿ���ÿ������������
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	if IsTongMember() ~= 0 and GetTongName() == city_belog_name then
		Talk(1,"","<color=green>Ch� �<color>: Nh�n s� c�a b�n bang kh�ng th� tham gia trang �o�t t�i nguy�n n�y")
		return
	end
	--����̫Զ�޷�����
	if Zgc_pub_npc_distance() > 10 then
		Talk(1,"","<color=green>Ch� �<color>: C� ly qu� xa, kh�ng th� m� B�o r��ng")
		return
	end
	--����ռ��״̬�ж�
	local openTime = GetNpcTempData(npc_index, 1);
	local curTime = GetTime();
	if openTime ~= 0 and curTime - openTime <= 30 then
		Talk(1,"","<color=green>Nh�c nh�<color>: �ang m� r��ng, vui l�ng ��i.")
		return 
	end
	--��־״̬Ϊ����״̬
	SetNpcTempData(npc_index, 1, curTime);
	--����NPC����
	SetTaskTemp(TasktempID_npc_index, npc_index)
	--�����������ȡ
		DoWait(7,8,10)		
end

--��Դ����ʱ��Ϊ������
task_week_seq = 3
--��Դ������ʼʱ��Ϊ20��00-21��00
task_start_sec_seq = 72000
task_end_sec_seq = 75600

function conf_res_protect_date_chk()
	--�Ƿ���������
	local week_seq_now = 0
	week_seq_now = floor((GetTime() - 57600)/86400)
	week_seq_now = num_return - (floor(num_return/7) * 7)
	if week_seq_now >= 2 then
		week_seq_now = week_seq_now - 2
	else
		week_seq_now = week_seq_now + 5
	end
	if week_seq_now ~= task_week_seq then
		return 0
	else
	--�Ƿ�����Դ����ʱ��
		local sec_seq_now = ((GetTime() - 57600) - (floor(sec_num/86400))*86400)
		if sec_seq_now >= task_start_sec_seq and sec_seq_now <= task_end_sec_seq then
			return 1
		else
			return 0
		end		
	end
end

function check_res_protect_condition(bNotify)
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	--�жϱ����Ƿ�ռ��
	if city_belog_name == "" or city_belog_name == nil then
		if bNotify == 1 then
			Talk(1,"","<color=green>Ch� �<color>: Tr�n n�y ch�a c� bang ph�i chi�m l�nh th�nh th� n�y, kh�ng th� m� nhi�m v� b�o h� T�i nguy�n tu�n n�y!")
		end
		return 0
	end
	--��ǰ�Ƿ��ǿ����ӵ�ʱ�䣿
	if Zgc_pub_week_day() ~= 3 or (Zgc_pub_week_day() == 3 and (Zgc_pub_today_sec_num_rtn() < 72000 or Zgc_pub_today_sec_num_rtn() > 75600))then
		if bNotify == 1 then
			Talk(1,"","<color=green>Ch� �<color>: Th�i gian B�o h� T�i nguy�n bang h�i chi�n: m�i t�i <color=yellow>th� T� <color> t� <color=yellow>19h<color> ��n <color=yellow>20h<color>!")
		end
		return 0
	end
	--С�ײ����Կ�����
	if GetPlayerFaction() == 0 then
		if bNotify == 1 then
			Talk(1,"","<color=green>Ch� �<color>: Ng��i ch�a gia nh�p m�n ph�i kh�ng th� tham gia ho�t ��ng n�y")
		end
		return	0
	end
	return 1
end


function on_enter_res_protect_map()
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	if check_res_protect_condition(0) == 1 then
	    	SetFightState(1)
	    	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	    	if IsTongMember() == 0  then
				local nRan = random(1,2)
				if nRan == 1 then
					SetPKFlag(1,1)
				else
					SetPKFlag(1,2)
				end
				ForbidChangePK(1)
			else
				SetPKFlag(3,2)
				if GetTongName() ~= city_belog_name then --�����سǰ�
					ForbidChangePK(1)
				else
					ForbidChangePK(0)
					ForbidChangePK(1)
	    		--SetLogoutRV(1)
			   		SetDeathPunish(1)
					--Talk(1, "", "Nh�n s� c�a b�n bang kh�ng th� tham gia trang �o�t t�i nguy�n n�y")
					return 0
				end
			end
	    	ForbidChangePK(1)
	    	--SetLogoutRV(1)
	    	SetDeathPunish(1)
	end
end

function on_leave_res_protect_map()
	--SetFightState(0)
	ForbidChangePK(0)
	SetDeathPunish(1)
	SetPKFlag(0,0)
end

function on_player_login()
	CreateTrigger(2, 3003, 3003)
	CreateTrigger(2, 3004, 3004)
	CreateTrigger(2, 3005, 3005)
	CreateTrigger(2, 3006, 3006)
end

--SendScript2VM("\\script\\gongcheng\\npc\\conf_res_protect.lua", "on_player_login()")	
