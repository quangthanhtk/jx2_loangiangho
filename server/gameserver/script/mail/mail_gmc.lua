--½Å±¾Ãû³Æ£ºÓÊ¼þ²âÊÔ
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£º
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2012-05-20£¨½ñÌìÊÇÄÐÉúÏòÅ®ÉúµÄ±í°×ÈÕ£¬Ã÷Ìì²ÅÊÇÅ®ÉúÏòÄÐÉúµÄ±í°×ÈÕ£©
--´úÂëÐÞ¸Ä¼ÇÂ¼

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
-- Í¨ÓÃ·½·¨
function gmc_write_log(str_log)
	WriteLog(format("[Th­ ®Òn bï][Acc:%s][Role:%s][%d]%s", GetAccount(), GetName(), GMC_LOG_SERIAL, str_log))
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
		ShowMailMessage(format("Tói kh«ng ®ñ %d", need_count));
		return
	end

	local need_weight	= GMC_ITEM[5] * item_info.Weight;
	if GetMaxItemWeight()-GetCurItemWeight() < need_weight then
		ShowMailMessage(format("Søc nÆng tói kh«ng ®ñ %d", need_weight));
		return
	end

	return 1;
end
--------------------------------------------------------------------------
function gmc_check_script_nothing()
	return 1;
end
--------------------------------------------------------------------------
-- ÆÕÍ¨ÎïÆ·²¹³¥Ä£°å
-- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
-- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
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
	Msg2Player(format("B¹n ®· nhËn ®­îc [%s]*%d", GMC_ITEM_NORMAL[1], item_count));
end


--------------------------------------------------------------------------
-- ÈÎÎñ±äÁ¿²¹³¥Ä£°å
-- Prame_0 taskid
-- Prame_1 value
function gmc_process_script_taskid(nTaskid, nValue)
	local old_point = GetTask(nTaskid);
	local new_point = nValue
	SetTask(nTaskid, nValue)
	gmc_write_log(format("[%s][TaskID:%d][OldPoint:%d][NewPoint:%d]", GMC_LOG_HEADER, nTaskid, old_point, new_point));
end

--------------------------------------------------------------------------
-- ÊÚÒµ¾­Ñé²¹³¥Ä£°å
-- Prame_0 value
function gmc_process_script_mp(nPoint)
	MP_MasterAddPoint(nPoint)
	gmc_write_log(format("[%s][EXP thô nghiÖp: %d]", GMC_LOG_HEADER, nPoint));
	Msg2Player("B¹n ®· nhËn ®­îc %d EXP thô nghiÖp.", nPoint);
end

--------------------------------------------------------------------------
-- ¾­Ñé²¹³¥Ä£°å
-- Prame_0 value
function gmc_process_script_exp(nPoint)
	ModifyExp(nPoint)
	gmc_write_log(format("[%s][EXP: %d]", GMC_LOG_HEADER, nPoint));
	Msg2Player("B¹n nhËn ®­îc %d EXP.", nPoint);
end
--------------------------------------------------------------------------
---- ¾ü¹¦²¹³¥£¨Ôö¼Ó£©
---- Prame_0 ¾ü¹¦Öµ¡¾Ä¬ÈÏÎª0¡¿
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
--	gmc_write_log(format("[¾ü¹¦²¹³¥£¨Ôö¼Ó£©][OldPoint:%d][NewPoint:%d]", old_point, new_point));
--	Msg2Player("ÄãµÄ¾ü¹¦ÖµÒÑ¸üÐÂ");
--end
----------------------------------------------------------------------------
---- ¾ü¹¦²¹³¥£¨ÉèÖÃ£©
---- Prame_0 ¾ü¹¦Öµ¡¾Ä¬ÈÏÎª0¡¿
--function gmc_process_script_2(tab_arg)
--	local set_point = tonumber(tab_arg[1] or 0);
--	local old_point = GetTask(TASKID_BATTLE_RANKPOINT);
--	SetTask(TASKID_BATTLE_RANKPOINT, set_point);
--	local new_point = GetTask(TASKID_BATTLE_RANKPOINT);
--
--	gmc_write_log(format("[¾ü¹¦²¹³¥£¨ÉèÖÃ£©][OldPoint:%d][NewPoint:%d]", old_point, new_point));
--	Msg2Player("ÄãµÄ¾ü¹¦ÖµÒÑ¸üÐÂ");
--end
----------------------------------------------------------------------------
---- ½ðÇ®²¹³¥
---- Prame_0 ½ðÇ®ÊýÁ¿¡¾Ä¬ÈÏÎª1½ð¡¿
--function gmc_process_script_3(tab_arg)
--	local add_cash = tonumber(tab_arg[1] or 1);
--	local old_cash = GetCash();
--	Earn(add_cash * 10000);
--	local new_cash = GetCash();
--
--	gmc_write_log(format("[½ðÇ®²¹³¥][OldCash:%d][NewCash:%d]", old_cash, new_cash));
--end
----------------------------------------------------------------------------
---- Ììî¸Áî²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_4 = {"Ììî¸Áî", 2, 95, 204};
--function gmc_check_script_4(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_4;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_4(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_4;
--	GMC_LOG_HEADER		= "Ììî¸Áî²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- Í¨ÌìÁîÅÆ²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_5 = {"Í¨ÌìÁîÅÆ", 2, 95, 621};
--function gmc_check_script_5(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_5;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_5(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_5;
--	GMC_LOG_HEADER		= "Í¨ÌìÁîÅÆ²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ¾ÛÒåÁî²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_6 = {"¾ÛÒåÁî", 2, 95, 208};
--function gmc_check_script_6(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_6;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_6(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_6;
--	GMC_LOG_HEADER		= "¾ÛÒåÁî²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- µØÐþ½ðÁî²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_7 = {"µØÐþ½ðÁî", 2, 95, 674};
--function gmc_check_script_7(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_7;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_7(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_7;
--	GMC_LOG_HEADER		= "µØÐþ½ðÁî²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- °×¾ÔÍè²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_8 = {
--	{"°×¾ÔÍè"   , 2, 1, 270 },
--	{"´ó°×¾ÔÍè" , 2, 1, 1007},
--	{"°×¾ÔÏÉµ¤" , 2, 1, 1008},
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
--	GMC_LOG_HEADER		= "°×¾ÔÍè²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ¾ü¹¦ÕÂ²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_9 = {
--	{"¾ü¹¦ÕÂ"     , 2, 1, 9999},
--	{"´ó¾ü¹¦ÕÂ"   , 2, 1, 9998},
--	{"»Ô»Í¾ü¹¦ÕÂ" , 2, 1, 9977},
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
--	GMC_LOG_HEADER		= "¾ü¹¦ÕÂ²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ¾ü¹¦ÕÂ²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_10 = {
--	{"Ð¡ÈË²Î¹û"   , 2, 0, 552},
--	{"´óÈË²Î¹û"   , 2, 0, 553},
--	{"Ç§ÄêÈË²Î¹û" , 2, 0, 796},
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
--	GMC_LOG_HEADER		= "ÈË²Î¹û²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- Ç§±äÈ¯²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_11 = {
--	{"Ç§±äèóÐÇÈ¯" , 2, 95, 246},
--	{"Ç§±äèóÌìÈ¯" , 2, 95, 247},
--	{"Ç§±äèóÓîÈ¯" , 2, 95, 573},
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
--	GMC_LOG_HEADER		= "Ç§±äÈ¯²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ÐÂÄêÐíÔ¸É°²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_12 = {"ÐÂÄêÐíÔ¸É°", 2, 95, 231};
--function gmc_check_script_12(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_12;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_12(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_12;
--	GMC_LOG_HEADER		= "ÐÂÄêÐíÔ¸É°²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ¾Û¹¦µ¤²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_13 = {"¾Û¹¦µ¤", 2, 0, 888};
--function gmc_check_script_13(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_13;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_13(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_13;
--	GMC_LOG_HEADER		= "¾Û¹¦µ¤²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ð©ÔÂÎäÆ÷²¹³¥
---- Param_0 Ç¿»¯¶È¡¾Ä¬ÈÏÎª0¡¿
---- Param_1 Ç¿»¯µãÊý¡¾Ä¬ÈÏÎª0¡¿
---- Param_2 Ö¸¶¨Á÷ÅÉ¡¾Ä¬ÈÏÎªÍæ¼Ò×ÔÉíÁ÷ÅÉ¡¿
--function gmc_check_script_14(tab_arg)
--	if 1 ~= gf_JudgeRoomWeight(1, 0, "") then
--		ShowMailMessage(format("±³°ü¿Õ¼ä²»×ã%d¸ö", 1));
--		return
--	end
--	local player_route	= tonumber(tab_arg[5] or GetPlayerRoute());
--	if 1 ~= gf_CheckPlayerRoute(player_route) then
--		ShowMailMessage("ÇëÏÈ¼ÓÈëÁ÷ÅÉ");
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
--	gmc_write_log(format("[ð©ÔÂÎäÆ÷²¹³¥][Body:%d][Route:%d][Enhance:%d,%d][RetCode:%d]", player_body, player_route, item_enhance1, item_enhance2, ret_code));
--	return 1;
--end
----------------------------------------------------------------------------
---- ¶·ÆÇÁî²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
----GMC_ITEM_15 = {"¶·ÆÇÁî", 2, 95, 1511};
--function gmc_check_script_15(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_15;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_15(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_15;
--	GMC_LOG_HEADER		= "¶·ÆÇÁî²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ºÍÊÏèµ²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
----GMC_ITEM_16 = {"ºÍÊÏèµ", 2, 1, 1001};
--function gmc_check_script_16(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_16;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_16(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_16;
----	GMC_LOG_HEADER		= "ºÍÊÏèµ²¹³¥";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- YY»î¶¯ÀñºÐ²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
----GMC_ITEM_17 = {"YY»î¶¯ÀñºÐ", 2, 95, 1972};
--function gmc_check_script_17(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_17;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_17(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_17;
----	GMC_LOG_HEADER		= "YY»î¶¯ÀñºÐ";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ÂÛÌ³»î¶¯ÀñºÐ²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
----GMC_ITEM_18 = {"ÂÛÌ³»î¶¯ÀñºÐ", 2, 95, 1973};
--function gmc_check_script_18(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_18;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_18(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_18;
----	GMC_LOG_HEADER		= "ÂÛÌ³»î¶¯ÀñºÐ";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- Ìì½¾Áî²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_19 = {"Ìì½¾Áî", 2, 97, 236};
--function gmc_check_script_19(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_19;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_19(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_19;
--	GMC_LOG_HEADER		= "Ìì½¾Áî²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ÎäÁÖÃËÀñ°ü²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_20 = {
----	{"ÎäÁÖÃËÐ¡Àñ°ü" , 2, 95, 2215},
----	{"ÎäÁÖÃËÖÐÀñ°ü" , 2, 95, 2216},
----	{"ÎäÁÖÃË´óÀñ°ü" , 2, 95, 2217},
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
--	GMC_LOG_HEADER		= "ÎäÁÖÃËÀñ°ü²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
--
---- Ììî¸Áî³É¾ÍÒì³££¬ÎÞ·¨Õý³£¼¤»î³É¾Í
---- Param ÎÞ
--TASKID_ACH_TIANGANG = 3709
--function gmc_process_script_21(tab_arg)
----	GMC_LOG_HEADER = "Ììî¸Áî³É¾ÍÒì³£²¹³¥"
----	gmc_process_script_taskid(TASKID_ACH_TIANGANG, 3)
----	OnAchEvent(2,TASKID_ACH_TIANGANG)
----	Msg2Player(format("Äã¼¤»îÁËÌìî¸Áî³É¾Í¡£"));
--end
--
---- ±ÈÎä´ó»á×Ê¸ñ·Ö²¹³¥£¨Ôö¼Ó£©
---- Param_0 ·ÖÖµ¡¾Ä¬ÈÏÎª0¡¿
--TASKID_BIWUDAHUI_ZIGE = 662
--function gmc_process_script_22(tab_arg)
----	GMC_LOG_HEADER = "±ÈÎä´ó»á×Ê¸ñ·Ö²¹³¥£¨Ôö¼Ó£©"
----	local add_point = tonumber(tab_arg[1] or 0);
----	local new_point = GetTask(TASKID_BIWUDAHUI_ZIGE) + add_point;
----	gmc_process_script_taskid(TASKID_BIWUDAHUI_ZIGE, new_point)
----	Msg2Player("ÄãµÄ±ÈÎä´ó»á×Ê¸ñ·ÖÒÑ¸üÐÂ");
--end
--
---- ±ÈÎä´ó»á»ý·Ö²¹³¥£¨ÉèÖÃ£©
---- Param_0 ·ÖÖµ¡¾Ä¬ÈÏÎªÔ­À´µÄÖµ¡¿
--TASKID_BIWUDAHUI_POINT = 666
--function gmc_process_script_23(tab_arg)
----	GMC_LOG_HEADER = "±ÈÎä´ó»á×Ê¸ñ·Ö²¹³¥£¨ÉèÖÃ£©"
----	local set_point = tonumber(tab_arg[1] or GetTask(TASKID_BIWUDAHUI_POINT));
----	gmc_process_script_taskid(TASKID_BIWUDAHUI_POINT, set_point)
----	Msg2Player("ÄãµÄ±ÈÎä´ó»á»ý·ÖÒÑ¸üÐÂ");
--end
--
---- ±ÈÎä´ó»áÈü¼¾½±Òì³£
---- Param ÎÞ
--GMC_ITEM_24 = {"ÐÂ±ÈÎä´ó»áÈü¼¾°ü" , 2, 95, 820}
--function gmc_check_script_24(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_24;
--	local tArg		= {}
--	tArg[1]			= 20
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_24(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_24;
--	GMC_LOG_HEADER		= "±ÈÎä´ó»áÈü¼¾½±Òì³£²¹³¥";
--	gmc_process_script_exp(25000000)
--	local tArg		= {}
--	tArg[1]			= 20
--	tArg[2]			= 4
--	return gmc_process_script_normal_item(tArg);
--end
--
---- ÐÂÊÖÈÎÎñÒì³£²¹³¥
---- Param ÎÞ
--TASKID_XINSHOU_TASK = 1
--function gmc_process_script_25(tab_arg)
--	GMC_LOG_HEADER		= "ÐÂÊÖÈÎÎñÒì³£²¹³¥";
--	gmc_process_script_taskid(TASKID_XINSHOU_TASK, 100)
--	Msg2Player("ÄãÒÑ¾­Íê³ÉÐÂÊÖÈÎÎñ¡£");
--end
--
---- »Æ½ð»¢ÈÎÎñÒì³£
---- Param ÎÞ
--GMC_ITEM_26 = {"¼ªÏé»Æ½ð»¢£¨»Æ£©" , 0, 105, 10116}
--TASKID_HUANGJINHU_TASK = 1035
--function gmc_check_script_26(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_26;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_26(tab_arg)
--	GMC_LOG_HEADER	= "»Æ½ð»¢ÈÎÎñÒì³£²¹³¥";
--	local new_point = 0
--	gmc_process_script_taskid(TASKID_HUANGJINHU_TASK, new_point)
--	
--	GMC_ITEM_NORMAL	= GMC_ITEM_26;
--	local item_count  = 1
--	local item_status = 4
--	nRetCode = AddItem(GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, -1,-1,-1,-1,-1,-1)
--	gmc_write_log(format("[%s][GDP:%d,%d,%d][Count:%d][RetCode:%d]", GMC_LOG_HEADER, GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, ret_code));
--	Msg2Player(format("Äã»ñµÃÁË[%s]¡Á%d", GMC_ITEM_NORMAL[1], item_count));
--end
--
---- »áÄþ¸®ÈÎÎñÎïÆ·¶ªÊ§
---- Param ÎÞ
--GMC_ITEM_27 = {"ÏãÄÒ" , 2, 111, 48};
--TASKID_HUININGHU_TASK = 4211
--function gmc_check_script_27(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_27;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_27(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_27;
--	GMC_LOG_HEADER		= "»áÄþ¸®ÈÎÎñÎïÆ·¶ªÊ§²¹³¥";
--	local new_point = 0
--	gmc_process_script_taskid(TASKID_HUININGHU_TASK, 0)
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_process_script_normal_item(tArg);
--end
--
---- ³öÊ¦Òì³£
---- Pram_0 ÊÚÒµµãÊý¡¾Ä¬ÈÏ0¡¿
--function gmc_process_script_28(tab_arg)
--	GMC_LOG_HEADER		= "³öÊ¦Òì³£²¹³¥";
--	local nPoint 		= tonumber(tab_arg[1] or 0);
--	gmc_process_script_mp(nPoint)
--end
--
---- Ëø»êËø¶¨Òì³£
---- Param ÎÞ
--function gmc_process_script_29(tab_arg)
--	GMC_LOG_HEADER		= "Ëø»êËø¶¨Òì³£²¹³¥";
--	UnLockAllItem()
--	gmc_write_log(format("[%s][Çå³ý×°±¸Ëø»ê]", GMC_LOG_HEADER));
--	Msg2Player(format("ÒÑ¾­Çå³ý×°±¸Ëø»ê¡£"));
--end
--
---- Ôö¼Ó¶ÔÓ¦ÓÀ¾Ã¾üÏÎ´ÎÊý
---- Param_0 : 1:ÓÀ¾ÃÔªË§, 2:ÓÀ¾Ã½«¾ü, 3:ÓÀ¾ÃÏÈ·æ
---- Param_1 : Ôö¼Ó¶ÔÓ¦ÓÀ¾Ã¾üÏÎ´ÎÊý
--GMC_TASK_30 = {
----	{"ÓÀ¾ÃÔªË§" , 765},
----	{"ÓÀ¾Ã½«¾ü" , 766},
----	{"ÓÀ¾ÃÏÈ·æ" , 767},
--};
--function gmc_process_script_30(tab_arg)
--	GMC_LOG_HEADER		= "ÓÀ¾Ã¾üÏÎÔö¼Ó´ÎÊý";
--	local nType 		= tonumber(tab_arg[1] or 0);
--	local nPoint 		= tonumber(tab_arg[2] or 0);
--	GMC_TASK = GMC_TASK_30[nType]
--	if not GMC_TASK then return end
--	gmc_process_script_taskid(GMC_TASK[2], GetTask(GMC_TASK[2]) + nPoint)
--end
--
---- ÎåÐÐÌìÒÇÂôµêºóÎÞ·¨²¹³¥
---- Param_0 : ÎåÐÐÌìÒÇÇ¿»¯¶È 1:µÍ¼¶, 2:ÖÐ¼¶, 3:¸ß¼¶, 4:ÌØ¼¶
--GMC_ITEM_31 = {
----	{"µÍ¼¶ÎåÐÐ¾«»ê" , 2, 97, 205},
----	{"ÖÐ¼¶ÎåÐÐ¾«»ê" , 2, 97, 206},
----	{"¸ß¼¶ÎåÐÐ¾«»ê" , 2, 97, 207},
----	{"ÌØ¼¶ÎåÐÐ¾«»ê" , 2, 97, 208},
--};
--function gmc_check_script_31(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_31;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_31(tab_arg)
--	GMC_LOG_HEADER		= "ÎåÐÐÌìÒÇÂôµêºóÎÞ·¨²¹³¥";
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
---- ÐÞÕæÒª¾÷²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_32 = {
--	{"ÐÞÕæÒª¾÷" , 2, 0, 554},
--	{"´óÐÞÕæÒª¾÷" , 2, 95, 585},
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
--	GMC_LOG_HEADER		= "ÐÞÕæÒª¾÷²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 2014Äê¶È³ÆºÅ²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_33 = {
----	{"Öó¾Æ½­ºþ" , 2, 95, 3382},
----	{"ÉùÃûÔ¶Ñï" , 2, 95, 3381},
----	{"ÃûÕðº£ÄÚ" , 2, 95, 3380},
----	{"¶À²½ÌìÏÂ" , 2, 95, 3379},
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
----	GMC_LOG_HEADER		= "2014Äê¶È³ÆºÅ²¹³¥";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ÃÜÁî²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_34 = {
----	{"ÓùµÐÃÍÊ¿ÃÜÁî(ÐÂ)" , 2, 1, 10000},
----	{"ÆÆÕó¶½»¤ÃÜÁî(ÐÂ)" , 2, 1, 10001},
----	{"Ìú¹ÇÁúÎÀÃÜÁî(ÐÂ)" , 2, 1, 10002},
----	{"Õò¾ü»¢ÆïÃÜÁî(ÐÂ)" , 2, 1, 10003},
----	{"ÎÞË«·É½«ÃÜÁî(ÐÂ)" , 2, 1, 10004},
----	{"ÆÆÂ²ÔªË§ÃÜÁî(ÐÂ)" , 2, 1, 10005},
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
--	GMC_LOG_HEADER		= "ÃÜÁî²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- Éú»î¼¼ÄÜ²¹³¥
---- Prame_0 (0:²É¼¯  1:ÖÆÔì) * 100 + 1~6 ¼¼ÄÜ¸±Àà
---- Param_1 µÈ¼¶ 1~4
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
---- ²¹³¥¶·ÆÇµãÊý
---- Prame_0 ÊýÁ¿
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
---- ÈÎÎñµÄ±äÁ¿Çå¿Õ
---- Prame_0 ÈÎÎñid
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
---- vip¿¨²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
---- Param_2 ÎïÆ·ÀàÐÍ¡¾Ä¬ÈÏÎª1¡¿
--GMC_ITEM_38 = {
----	{"¹ó±ö»¢ÎÆ¿¨£¨Î´¼¤»î£©" , 2, 95, 3451},
----	{"ÖÁ×ð»¢ÎÆ¿¨£¨Î´¼¤»î£©" , 2, 95, 3453},
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
--	GMC_LOG_HEADER		= "vip¿¨²¹³¥";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- ¶«»ÊÐþÌú²¹³¥
---- Prame_0 ²¹³¥ÊýÁ¿¡¾Ä¬ÈÏÎª1¡¿
---- Prame_1 ÊÇ·ñ°ó¶¨£¨1Îª°ó¶¨£¬0Îª²»°ó¶¨£©¡¾Ä¬ÈÏÎª1¡¿
----GMC_ITEM_39 = {"¶«»ÊÐþÌú", 2, 114, 171};
--function gmc_check_script_39(tab_arg)
--	--GMC_ITEM_NORMAL		= GMC_ITEM_39;
--	--return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_39(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_39;
--	GMC_LOG_HEADER		= "¶«»ÊÐþÌú²¹³¥";
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

