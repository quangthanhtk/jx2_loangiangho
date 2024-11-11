--��ڣ����ͳ��

Include("\\settings\\static_script\\missions\\base\\runtime_data_stat.lua")

MAIN_ID = 4
--����ʱ����ҵ�ͳ��
function __stat_on_player_when_open_misson(nOpenType)
	if nOpenType == tbJZMY.open_type_hard then
		AddRuntimeStat(34, 2, GetPlayerRoute(), 1) --��������
		AddRuntimeStat(34, 3, 0, 1) --��������
	else
    	AddRuntimeStat(MAIN_ID, 3, 0, 1) --��������
    	AddRuntimeStat(MAIN_ID, 13, GetPlayerRoute(), 1) --��������
    	_stat_trans_player_count(MAIN_ID, 7, 1, 100)
    	_stat_level_player_count(MAIN_ID, 5, 80, 89)
    	_stat_level_player_count(MAIN_ID, 6, 90, 99)
	end
end

--����ʱ��ͳ��
function _stat_when_open_mission(nOpenType)
	if nOpenType == tbJZMY.open_type_hard then
		AddRuntimeStat(34, 1, 0, 1)
	else
		AddRuntimeStat(MAIN_ID, 1, 0, 1)
	end
	_op_on_team(__stat_on_player_when_open_misson, nOpenType)
end

--ȫͨʱ����ҵ�ͳ��
function __stat_on_player_when_all_pass()
	AddRuntimeStat(MAIN_ID, 4, 0, 1) --����
	AddRuntimeStat(MAIN_ID, 14, GetPlayerRoute(), 1) --����
end
--ȫͨʱ��ͳ��
function _stat_when_all_pass()
	AddRuntimeStat(MAIN_ID, 2, 0, 1)
	_op_on_team(__stat_on_player_when_all_pass)
end

function __stat_on_player_when_pass_stage(nStage)
	AddRuntimeStat(34, 5+nStage-1, GetPlayerRoute(), 1)
end
function _stat_when_pass_stage(nStage)
	local nOpenType = GetMissionV(tbJZMY.mv_open_type)
	if nOpenType == tbJZMY.open_type_hard and nStage >= 1 and nStage <= 4 then
		_op_on_team(__stat_on_player_when_pass_stage, nStage)
	else
		if nStage == 4 then
			_stat_when_all_pass()
		end
	end
end

function _stat_when_player_death(nStage)
	local nOpenType = GetMissionV(tbJZMY.mv_open_type)
	if nOpenType == tbJZMY.open_type_hard and nStage >= 1 and nStage <= 4 then
		AddRuntimeStat(34, 9+nStage-1, GetPlayerRoute(), 1)
	end
end

--��ѷ���ͳ��
function _stat_when_open_free_card()
	AddRuntimeStat(MAIN_ID, 8, 0, 1)
end

--�շѷ���ͳ��
function _stat_when_open_ib_card()
	AddRuntimeStat(MAIN_ID, 9, 0, 1)
end

--ib���ļ���
function _stat_when_ib_consume(nConsume)
	AddRuntimeStat(MAIN_ID, 10, 0, nConsume)
end


--ib����1����
function _stat_when_ib_produce_gulingyu(nProduce)
	AddRuntimeStat(MAIN_ID, 11, 0, nProduce)
end

--ib����2����
function _stat_when_ib_produce_super_book(nProduce)
	AddRuntimeStat(MAIN_ID, 12, 0, nProduce)
end

