Import("\\script\\online_activites\\task_values.lua")
Import("\\script\\lib\\define.lua")
--Import("\\script\\lib\\globalfunctions.lua")
--��Ҫ���⴦���ÿ���������������
--�ڲ������Ѿ�ʵ������Ҫ��ʱ���Զ���������ű�
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\script\\function\\honor_tong\\ht_head.lua")

Include("\\script\\ksgvn\\autoexec\\schedule_task.lua")

function OnWeeklyDoSpecial()
	--ͨ�����ڣ(������������0)
	if tGtTask:check_cur_task(84) == 0 then
		SetTask(VET_TDD_WEEK_TASK_CROSS,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,2,0,4);
	end	
	if tGtTask:check_cur_task(86) == 0 then
		SetTask(VET_WJZ_WEEK_TASK_CROSS,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,4,0,4);
	end	
	if tGtTask:check_cur_task(88) == 0 then
		SetTask(VET_WEEK_TASK_FANPAI,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,6,0,4);
	end
	
	--3v3ÿ��Ҫ�ɵ���
	SetTask(TASKID_3V3_LASTWEEK_FIGHT_TIMES, GetTask(TASKID_3V3_WEEK_FIGHT_TIMES)); --����ս���������
	SetTask(TASKID_3V3_WEEK_FIGHT_TIMES, 0); --����ս������
	if GetTask(TASKID_3V3_LASTWEEK_FIGHT_TIMES) ~= 0 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 1, 1); --���ܽ�������ȡ
	end
	
	SetTask(3198,0)--equip shop weekly limit
	SetTask(3199,0)--equip shop weekly limit
	
	--���ɿ���
	tf_ResetTask_Weekly();
	
	--���ɴ��Ҷ���ս���콱�������
	tm_WeeklyClear();
	
	--���ֹ�ѫÿ��˥��
	merit_WeeklyDecay();
	
	--��������
	ht_WeeklyReset();
	
	_ksgOnWeeklyClear()
	
	--��������yp
	SetPlayerScript("\\script\\missions\\yp\\yp_head.lua")
	SendScript2VM("\\script\\missions\\yp\\yp_head.lua", "yp_weeklyClean()");
	
	SetPlayerScript("\\script\\function\\vip_card\\vc_head.lua");
	SendScript2VM("\\script\\function\\vip_card\\vc_head.lua", "vc_WeeklyTaskReset()");
	
	SetPlayerScript("\\script\\missions\\yp\\ywz\\head.lua");
	SendScript2VM("\\script\\missions\\yp\\ywz\\head.lua", "ywz_WeeklyReset()");
end
