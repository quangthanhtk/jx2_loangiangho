--�ű����ƣ��ʼ�����
--�ű����ܣ�
--���ܲ߻���
--���ܿ���������
--����ʱ�䣺2012-05-20��������������Ů���ı���գ��������Ů���������ı���գ�
--�����޸ļ�¼

Import("\\script\\lib\\define.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\itemfunctions.lua");
Include("\\script\\mail\\mail_head.lua");

--------------------------------------------------------------------------
GMC_LOG_HEADER			= "";
GMC_LOG_SERIAL			= 0;
GMC_ITEM				= {}; -- name, g, d, p, count
GMC_ITEM_NORMAL			= {}; -- name, g, d, p
--------------------------------------------------------------------------
-- ͨ�÷���
function gmc_write_log(str_log)
	WriteLog(format("[Th� ��n b�][Acc:%s][Role:%s][%d]%s", GetAccount(), GetName(), GMC_LOG_SERIAL, str_log))
end
function gmc_arg_2_str(tab_arg)
	if not tab_arg then return "nil" end

	local arg_count		= getn(tab_arg);
	if 0 >= arg_count then return "empty" end

	local arg_format	= strrep("%s,", arg_count);
	local arg_string	= format(arg_format, gf_UnPack(tab_arg));

	return strsub(arg_string, 1, strlen(arg_string) - 1);
end
function gmc_check_room_weight()
	local item_info		= GetItemTemplateInfo(GMC_ITEM[2], GMC_ITEM[3], GMC_ITEM[4]);
	if not item_info then return end

	local need_count	= 0;
	if 0 == GMC_ITEM[2] then
		need_count		= GMC_ITEM[5];
	else
		need_count		= ceil(GMC_ITEM[5] / max(item_info.StackCount, 1));
	end

	if GetFreeItemRoom() < need_count then
		ShowMailMessage(format("T�i kh�ng �� %d", need_count));
		return
	end

	local need_weight	= GMC_ITEM[5] * item_info.Weight;
	if GetMaxItemWeight()-GetCurItemWeight() < need_weight then
		ShowMailMessage(format("S�c n�ng t�i kh�ng �� %d", need_weight));
		return
	end

	return 1;
end
--------------------------------------------------------------------------
function gmc_check_script_nothing()
	return 1;
end
--------------------------------------------------------------------------
-- ��ͨ��Ʒ����ģ��
-- Prame_0 ����������Ĭ��Ϊ1��
-- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
function gmc_check_script_normal_item(tab_arg)
	local item_count	= tonumber(tab_arg[1] or 1);
	GMC_ITEM			= GMC_ITEM_NORMAL;
	GMC_ITEM[5]			= item_count;
	return gmc_check_room_weight();
end
function gmc_process_script_normal_item(tab_arg)
	local item_count	= tonumber(tab_arg[1] or 1);
	if 0 >= item_count then return end
	local is_bingding	= tonumber(tab_arg[2] or 1);
	local item_status	= (1 == is_bingding and 4) or 1;

	local ret_code		= AddItem(GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status);
	gmc_write_log(format("[%s][GDP:%d,%d,%d][Count:%d][Status:%d][RetCode:%d]", GMC_LOG_HEADER, GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, ret_code));
	Msg2Player(format("B�n �� nh�n ���c [%s]*%d", GMC_ITEM_NORMAL[1], item_count));
end


--------------------------------------------------------------------------
-- �����������ģ��
-- Prame_0 taskid
-- Prame_1 value
function gmc_process_script_taskid(nTaskid, nValue)
	local old_point = GetTask(nTaskid);
	local new_point = nValue
	SetTask(nTaskid, nValue)
	gmc_write_log(format("[%s][TaskID:%d][OldPoint:%d][NewPoint:%d]", GMC_LOG_HEADER, nTaskid, old_point, new_point));
end

--------------------------------------------------------------------------
-- ��ҵ���鲹��ģ��
-- Prame_0 value
function gmc_process_script_mp(nPoint)
	MP_MasterAddPoint(nPoint)
	gmc_write_log(format("[%s][EXP th� nghi�p: %d]", GMC_LOG_HEADER, nPoint));
	Msg2Player("B�n �� nh�n ���c %d EXP th� nghi�p.", nPoint);
end

--------------------------------------------------------------------------
-- ���鲹��ģ��
-- Prame_0 value
function gmc_process_script_exp(nPoint)
	ModifyExp(nPoint)
	gmc_write_log(format("[%s][EXP: %d]", GMC_LOG_HEADER, nPoint));
	Msg2Player("B�n nh�n ���c %d EXP.", nPoint);
end
--------------------------------------------------------------------------
---- �������������ӣ�
---- Prame_0 ����ֵ��Ĭ��Ϊ0��
--function gmc_process_script_1(tab_arg)
--	local add_point = tonumber(tab_arg[1] or 0);
--	local old_point = GetTask(TASKID_BATTLE_RANKPOINT);
--	if 0 <= old_point then
--		SetTask(TASKID_BATTLE_RANKPOINT, old_point + add_point);
--	else
--		SetTask(TASKID_BATTLE_RANKPOINT, old_point - add_point);
--	end
--	local new_point = GetTask(TASKID_BATTLE_RANKPOINT);
--
--	gmc_write_log(format("[�������������ӣ�][OldPoint:%d][NewPoint:%d]", old_point, new_point));
--	Msg2Player("��ľ���ֵ�Ѹ���");
--end
----------------------------------------------------------------------------
---- �������������ã�
---- Prame_0 ����ֵ��Ĭ��Ϊ0��
--function gmc_process_script_2(tab_arg)
--	local set_point = tonumber(tab_arg[1] or 0);
--	local old_point = GetTask(TASKID_BATTLE_RANKPOINT);
--	SetTask(TASKID_BATTLE_RANKPOINT, set_point);
--	local new_point = GetTask(TASKID_BATTLE_RANKPOINT);
--
--	gmc_write_log(format("[�������������ã�][OldPoint:%d][NewPoint:%d]", old_point, new_point));
--	Msg2Player("��ľ���ֵ�Ѹ���");
--end
----------------------------------------------------------------------------
---- ��Ǯ����
---- Prame_0 ��Ǯ������Ĭ��Ϊ1��
--function gmc_process_script_3(tab_arg)
--	local add_cash = tonumber(tab_arg[1] or 1);
--	local old_cash = GetCash();
--	Earn(add_cash * 10000);
--	local new_cash = GetCash();
--
--	gmc_write_log(format("[��Ǯ����][OldCash:%d][NewCash:%d]", old_cash, new_cash));
--end
----------------------------------------------------------------------------
---- ������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
--GMC_ITEM_4 = {"�����", 2, 95, 204};
--function gmc_check_script_4(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_4;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_4(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_4;
--	GMC_LOG_HEADER		= "������";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ͨ�����Ʋ���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
--GMC_ITEM_5 = {"ͨ������", 2, 95, 621};
--function gmc_check_script_5(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_5;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_5(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_5;
--	GMC_LOG_HEADER		= "ͨ�����Ʋ���";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
--GMC_ITEM_6 = {"������", 2, 95, 208};
--function gmc_check_script_6(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_6;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_6(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_6;
--	GMC_LOG_HEADER		= "�������";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ���������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
--GMC_ITEM_7 = {"��������", 2, 95, 674};
--function gmc_check_script_7(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_7;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_7(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_7;
--	GMC_LOG_HEADER		= "���������";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �׾��貹��
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_8 = {
--	{"�׾���"   , 2, 1, 270 },
--	{"��׾���" , 2, 1, 1007},
--	{"�׾��ɵ�" , 2, 1, 1008},
--};
--function gmc_check_script_8(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_8[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_8(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_8[item_type];
--	GMC_LOG_HEADER		= "�׾��貹��";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �����²���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_9 = {
--	{"������"     , 2, 1, 9999},
--	{"�������"   , 2, 1, 9998},
--	{"�Ի;�����" , 2, 1, 9977},
--};
--function gmc_check_script_9(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_9[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_9(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_9[item_type];
--	GMC_LOG_HEADER		= "�����²���";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �����²���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_10 = {
--	{"С�˲ι�"   , 2, 0, 552},
--	{"���˲ι�"   , 2, 0, 553},
--	{"ǧ���˲ι�" , 2, 0, 796},
--};
--function gmc_check_script_10(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_10[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_10(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_10[item_type];
--	GMC_LOG_HEADER		= "�˲ι�����";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ǧ��ȯ����
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_11 = {
--	{"ǧ������ȯ" , 2, 95, 246},
--	{"ǧ������ȯ" , 2, 95, 247},
--	{"ǧ������ȯ" , 2, 95, 573},
--};
--function gmc_check_script_11(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_11[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_11(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_11[item_type];
--	GMC_LOG_HEADER		= "ǧ��ȯ����";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ������Ըɰ����
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
--GMC_ITEM_12 = {"������Ըɰ", 2, 95, 231};
--function gmc_check_script_12(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_12;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_12(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_12;
--	GMC_LOG_HEADER		= "������Ըɰ����";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �۹�������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
--GMC_ITEM_13 = {"�۹���", 2, 0, 888};
--function gmc_check_script_13(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_13;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_13(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_13;
--	GMC_LOG_HEADER		= "�۹�������";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �����������
---- Param_0 ǿ���ȡ�Ĭ��Ϊ0��
---- Param_1 ǿ��������Ĭ��Ϊ0��
---- Param_2 ָ�����ɡ�Ĭ��Ϊ����������ɡ�
--function gmc_check_script_14(tab_arg)
--	if 1 ~= gf_JudgeRoomWeight(1, 0, "") then
--		ShowMailMessage(format("�����ռ䲻��%d��", 1));
--		return
--	end
--	local player_route	= tonumber(tab_arg[5] or GetPlayerRoute());
--	if 1 ~= gf_CheckPlayerRoute(player_route) then
--		ShowMailMessage("���ȼ�������");
--		return
--	end
--	return 1;
--end
--function gmc_process_script_14(tab_arg)
--	local item_enhance1	= tonumber(tab_arg[1] or 0);
--	local item_enhance2	= tonumber(tab_arg[2] or 0);
--	local player_route	= tonumber(tab_arg[3] or GetPlayerRoute());
--	local player_body	= GetBody();
--
--	local ret_code, item_index = ef_AddShineSunEquip(player_route, player_body, 1, 4, item_enhance1);
--	if 1 == ret_code then
--		SetItemEnhanceFailedNum(item_index, item_enhance2);
--	end
--	gmc_write_log(format("[�����������][Body:%d][Route:%d][Enhance:%d,%d][RetCode:%d]", player_body, player_route, item_enhance1, item_enhance2, ret_code));
--	return 1;
--end
----------------------------------------------------------------------------
---- �������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
----GMC_ITEM_15 = {"������", 2, 95, 1511};
--function gmc_check_script_15(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_15;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_15(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_15;
--	GMC_LOG_HEADER		= "�������";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ����赲���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
----GMC_ITEM_16 = {"�����", 2, 1, 1001};
--function gmc_check_script_16(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_16;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_16(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_16;
----	GMC_LOG_HEADER		= "����赲���";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- YY���в���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
----GMC_ITEM_17 = {"YY����", 2, 95, 1972};
--function gmc_check_script_17(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_17;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_17(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_17;
----	GMC_LOG_HEADER		= "YY����";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ��̳���в���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
----GMC_ITEM_18 = {"��̳����", 2, 95, 1973};
--function gmc_check_script_18(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_18;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_18(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_18;
----	GMC_LOG_HEADER		= "��̳����";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �콾���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
--GMC_ITEM_19 = {"�콾��", 2, 97, 236};
--function gmc_check_script_19(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_19;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_19(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_19;
--	GMC_LOG_HEADER		= "�콾���";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �������������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_20 = {
----	{"������С���" , 2, 95, 2215},
----	{"�����������" , 2, 95, 2216},
----	{"�����˴����" , 2, 95, 2217},
--};
--function gmc_check_script_20(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_20[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_20(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_20[item_type];
--	GMC_LOG_HEADER		= "�������������";
--	return gmc_process_script_normal_item(tab_arg);
--end
--
---- �����ɾ��쳣���޷���������ɾ�
---- Param ��
--TASKID_ACH_TIANGANG = 3709
--function gmc_process_script_21(tab_arg)
----	GMC_LOG_HEADER = "�����ɾ��쳣����"
----	gmc_process_script_taskid(TASKID_ACH_TIANGANG, 3)
----	OnAchEvent(2,TASKID_ACH_TIANGANG)
----	Msg2Player(format("�㼤���������ɾ͡�"));
--end
--
---- �������ʸ�ֲ��������ӣ�
---- Param_0 ��ֵ��Ĭ��Ϊ0��
--TASKID_BIWUDAHUI_ZIGE = 662
--function gmc_process_script_22(tab_arg)
----	GMC_LOG_HEADER = "�������ʸ�ֲ��������ӣ�"
----	local add_point = tonumber(tab_arg[1] or 0);
----	local new_point = GetTask(TASKID_BIWUDAHUI_ZIGE) + add_point;
----	gmc_process_script_taskid(TASKID_BIWUDAHUI_ZIGE, new_point)
----	Msg2Player("��ı������ʸ���Ѹ���");
--end
--
---- ��������ֲ��������ã�
---- Param_0 ��ֵ��Ĭ��Ϊԭ����ֵ��
--TASKID_BIWUDAHUI_POINT = 666
--function gmc_process_script_23(tab_arg)
----	GMC_LOG_HEADER = "�������ʸ�ֲ��������ã�"
----	local set_point = tonumber(tab_arg[1] or GetTask(TASKID_BIWUDAHUI_POINT));
----	gmc_process_script_taskid(TASKID_BIWUDAHUI_POINT, set_point)
----	Msg2Player("��ı���������Ѹ���");
--end
--
---- �������������쳣
---- Param ��
--GMC_ITEM_24 = {"�±�����������" , 2, 95, 820}
--function gmc_check_script_24(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_24;
--	local tArg		= {}
--	tArg[1]			= 20
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_24(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_24;
--	GMC_LOG_HEADER		= "�������������쳣����";
--	gmc_process_script_exp(25000000)
--	local tArg		= {}
--	tArg[1]			= 20
--	tArg[2]			= 4
--	return gmc_process_script_normal_item(tArg);
--end
--
---- ���������쳣����
---- Param ��
--TASKID_XINSHOU_TASK = 1
--function gmc_process_script_25(tab_arg)
--	GMC_LOG_HEADER		= "���������쳣����";
--	gmc_process_script_taskid(TASKID_XINSHOU_TASK, 100)
--	Msg2Player("���Ѿ������������");
--end
--
---- �ƽ������쳣
---- Param ��
--GMC_ITEM_26 = {"����ƽ𻢣��ƣ�" , 0, 105, 10116}
--TASKID_HUANGJINHU_TASK = 1035
--function gmc_check_script_26(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_26;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_26(tab_arg)
--	GMC_LOG_HEADER	= "�ƽ������쳣����";
--	local new_point = 0
--	gmc_process_script_taskid(TASKID_HUANGJINHU_TASK, new_point)
--	
--	GMC_ITEM_NORMAL	= GMC_ITEM_26;
--	local item_count  = 1
--	local item_status = 4
--	nRetCode = AddItem(GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, -1,-1,-1,-1,-1,-1)
--	gmc_write_log(format("[%s][GDP:%d,%d,%d][Count:%d][RetCode:%d]", GMC_LOG_HEADER, GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, ret_code));
--	Msg2Player(format("������[%s]��%d", GMC_ITEM_NORMAL[1], item_count));
--end
--
---- ������������Ʒ��ʧ
---- Param ��
--GMC_ITEM_27 = {"����" , 2, 111, 48};
--TASKID_HUININGHU_TASK = 4211
--function gmc_check_script_27(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_27;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_27(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_27;
--	GMC_LOG_HEADER		= "������������Ʒ��ʧ����";
--	local new_point = 0
--	gmc_process_script_taskid(TASKID_HUININGHU_TASK, 0)
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_process_script_normal_item(tArg);
--end
--
---- ��ʦ�쳣
---- Pram_0 ��ҵ������Ĭ��0��
--function gmc_process_script_28(tab_arg)
--	GMC_LOG_HEADER		= "��ʦ�쳣����";
--	local nPoint 		= tonumber(tab_arg[1] or 0);
--	gmc_process_script_mp(nPoint)
--end
--
---- ���������쳣
---- Param ��
--function gmc_process_script_29(tab_arg)
--	GMC_LOG_HEADER		= "���������쳣����";
--	UnLockAllItem()
--	gmc_write_log(format("[%s][���װ������]", GMC_LOG_HEADER));
--	Msg2Player(format("�Ѿ����װ�����ꡣ"));
--end
--
---- ���Ӷ�Ӧ���þ��δ���
---- Param_0 : 1:����Ԫ˧, 2:���ý���, 3:�����ȷ�
---- Param_1 : ���Ӷ�Ӧ���þ��δ���
--GMC_TASK_30 = {
----	{"����Ԫ˧" , 765},
----	{"���ý���" , 766},
----	{"�����ȷ�" , 767},
--};
--function gmc_process_script_30(tab_arg)
--	GMC_LOG_HEADER		= "���þ������Ӵ���";
--	local nType 		= tonumber(tab_arg[1] or 0);
--	local nPoint 		= tonumber(tab_arg[2] or 0);
--	GMC_TASK = GMC_TASK_30[nType]
--	if not GMC_TASK then return end
--	gmc_process_script_taskid(GMC_TASK[2], GetTask(GMC_TASK[2]) + nPoint)
--end
--
---- ��������������޷�����
---- Param_0 : ��������ǿ���� 1:�ͼ�, 2:�м�, 3:�߼�, 4:�ؼ�
--GMC_ITEM_31 = {
----	{"�ͼ����о���" , 2, 97, 205},
----	{"�м����о���" , 2, 97, 206},
----	{"�߼����о���" , 2, 97, 207},
----	{"�ؼ����о���" , 2, 97, 208},
--};
--function gmc_check_script_31(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_31;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_31(tab_arg)
--	GMC_LOG_HEADER		= "��������������޷�����";
--	local nType 		= tonumber(tab_arg[1] or 0);
--	GMC_ITEM_NORMAL 	= GMC_ITEM_31[nType]
--	if not GMC_ITEM_NORMAL then return end
--	local tArg		= {}
--	tArg[1]			= 1
--	tArg[2]			= 4
--	return gmc_process_script_normal_item(tArg);
--end
--
----------------------------------------------------------------------------
---- ����Ҫ������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_32 = {
--	{"����Ҫ��" , 2, 0, 554},
--	{"������Ҫ��" , 2, 95, 585},
--};
--function gmc_check_script_32(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_32[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_32(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_32[item_type];
--	GMC_LOG_HEADER		= "����Ҫ������";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 2014��ȳƺŲ���
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_33 = {
----	{"��ƽ���" , 2, 95, 3382},
----	{"����Զ��" , 2, 95, 3381},
----	{"������" , 2, 95, 3380},
----	{"��������" , 2, 95, 3379},
--};
--function gmc_check_script_33(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_33[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_33(tab_arg)
----	local item_type		= tonumber(tab_arg[3] or 1);
----	GMC_ITEM_NORMAL		= GMC_ITEM_33[item_type];
----	GMC_LOG_HEADER		= "2014��ȳƺŲ���";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- �����
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_34 = {
----	{"������ʿ����(��)" , 2, 1, 10000},
----	{"���󶽻�����(��)" , 2, 1, 10001},
----	{"������������(��)" , 2, 1, 10002},
----	{"�����������(��)" , 2, 1, 10003},
----	{"��˫�ɽ�����(��)" , 2, 1, 10004},
----	{"��²Ԫ˧����(��)" , 2, 1, 10005},
--};
--function gmc_check_script_34(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_34[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_34(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_34[item_type];
--	GMC_LOG_HEADER		= "�����";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ����ܲ���
---- Prame_0 (0:�ɼ�  1:����) * 100 + 1~6 ���ܸ���
---- Param_1 �ȼ� 1~4
--function gmc_check_script_35(tab_arg)
--	local skillType		= tab_arg[1];
--	local skillID		= mod(skillType, 100);
--	skillType			= floor(skillType / 100);
--	local level			= tab_arg[2];
--	if GetLifeSkillMaxLevel(skillType, skillID) > level then return end
--	if level >= 4 then return end
--	return 1;
--end
--function gmc_process_script_35(tab_arg)
--	local skillType		= tab_arg[1];
--	local skillID		= mod(skillType, 100);
--	skillType			= floor(skillType / 100);
--	local maxlevel		= tab_arg[2];
--	local curLevel		= GetLifeSkillLevel(skillType, skillID);
--	--LearnLifeSkill(skillType, skillID, curLevel, maxlevel, 0);
--	SetLifeSkillMaxLevel(skillType, skillID, maxlevel);
--	SendScript2VM("\\script\\lifeskill\\lifeskillpoint.lua", format("g_LifeSkillPoint:UpdateMaxPoint(%d, %d)", skillType, curLevel));
--	return 1;
--end
----------------------------------------------------------------------------
---- �������ǵ���
---- Prame_0 ����
--function gmc_check_script_36(tab_arg)
--	local nCount		= tab_arg[1];
--	if nCount <= 0 then return end
--	return 1;
--end
--function gmc_process_script_36(tab_arg)
--	local nCount		= tab_arg[1];
--	gf_Modify("DPDS", nCount);
--	return 1;
--end
--
---- ����ı������
---- Prame_0 ����id
--function gmc_check_script_37(tab_arg)
--	local nTaskId		= tab_arg[1];
--	if nTaskId <= 0 then return end
--	return 1;
--end
--function gmc_process_script_37(tab_arg)
--	local nTaskId		= tab_arg[1];
--	
--	SendScript2VM("\\script\\task\\global_task\\gtask_npc.lua", format("tGtTask:set_task(3,%d)", nTaskId));
--	return 1;
--end
--
----------------------------------------------------------------------------
---- vip������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
---- Param_2 ��Ʒ���͡�Ĭ��Ϊ1��
--GMC_ITEM_38 = {
----	{"������ƿ���δ���" , 2, 95, 3451},
----	{"�����ƿ���δ���" , 2, 95, 3453},
--};
--function gmc_check_script_38(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_38[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_38(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_38[item_type];
--	GMC_LOG_HEADER		= "vip������";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ������������
---- Prame_0 ����������Ĭ��Ϊ1��
---- Prame_1 �Ƿ�󶨣�1Ϊ�󶨣�0Ϊ���󶨣���Ĭ��Ϊ1��
----GMC_ITEM_39 = {"��������", 2, 114, 171};
--function gmc_check_script_39(tab_arg)
--	--GMC_ITEM_NORMAL		= GMC_ITEM_39;
--	--return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_39(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_39;
--	GMC_LOG_HEADER		= "������������";
--	return gmc_process_script_normal_item(tab_arg);
--end
--------------------------------------------------------------------------
function gmc_check_script(script_id, ...)
	local script	= SCRIPT_CFG[script_id];
	if not script or 'function' ~= type(script[1]) then return end

	return script[1](arg);
end
function gmc_process_script(script_id, ...)
	GMC_LOG_SERIAL	= random(1000);
	gmc_write_log(format("[Script:%d][Param:%s]", script_id, gmc_arg_2_str(arg)));

	local script	= SCRIPT_CFG[script_id];
	if not script or 'function' ~= type(script[2]) then return end

	return script[2](arg);
end
--------------------------------------------------------------------------
SCRIPT_CFG = {
--	[1 ] = {gmc_check_script_nothing , gmc_process_script_1 },
--	[2 ] = {gmc_check_script_nothing , gmc_process_script_2 },
--	[3 ] = {gmc_check_script_nothing , gmc_process_script_3 },
--	[4 ] = {gmc_check_script_4       , gmc_process_script_4 },
--	[5 ] = {gmc_check_script_5       , gmc_process_script_5 },
--	[6 ] = {gmc_check_script_6       , gmc_process_script_6 },
--	[7 ] = {gmc_check_script_7       , gmc_process_script_7 },
--	[8 ] = {gmc_check_script_8       , gmc_process_script_8 },
--	[9 ] = {gmc_check_script_9       , gmc_process_script_9 },
--	[10] = {gmc_check_script_10      , gmc_process_script_10},
--	[11] = {gmc_check_script_11      , gmc_process_script_11},
--	[12] = {gmc_check_script_12      , gmc_process_script_12},
--	[13] = {gmc_check_script_13      , gmc_process_script_13},
--	[14] = {gmc_check_script_14      , gmc_process_script_14},
--	[15] = {gmc_check_script_15      , gmc_process_script_15},
--	[16] = {gmc_check_script_16      , gmc_process_script_16},
--	[17] = {gmc_check_script_17      , gmc_process_script_17},
--	[18] = {gmc_check_script_18      , gmc_process_script_18},
--	[19] = {gmc_check_script_19      , gmc_process_script_19},
--	[20] = {gmc_check_script_20      , gmc_process_script_20},
--	[21] = {gmc_check_script_nothing , gmc_process_script_21},
--	[22] = {gmc_check_script_nothing , gmc_process_script_22},
--	[23] = {gmc_check_script_nothing , gmc_process_script_23},
--	[24] = {gmc_check_script_24 	 , gmc_process_script_24},
--	[25] = {gmc_check_script_nothing , gmc_process_script_25},
--	[26] = {gmc_check_script_26 	 , gmc_process_script_26},
--	[27] = {gmc_check_script_27 	 , gmc_process_script_27},
--	[28] = {gmc_check_script_nothing , gmc_process_script_28},
--	[29] = {gmc_check_script_nothing , gmc_process_script_29},
--	[30] = {gmc_check_script_nothing , gmc_process_script_30},
--	[31] = {gmc_check_script_31 	 , gmc_process_script_31},
--	[32] = {gmc_check_script_32 	 , gmc_process_script_32},
--	[33] = {gmc_check_script_33 	 , gmc_process_script_33},
--	[34] = {gmc_check_script_34 	 , gmc_process_script_34},
--	[35] = {gmc_check_script_35 	 , gmc_process_script_35},
--	[36] = {gmc_check_script_36 	 , gmc_process_script_36},
--	[37] = {gmc_check_script_37 	 , gmc_process_script_37},
--	[38] = {gmc_check_script_38 	 , gmc_process_script_38},
--	[39] = {gmc_check_script_39 	 , gmc_process_script_39},
};

