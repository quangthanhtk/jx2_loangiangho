--headÎÄ¼þ
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\online_activites\\task_values.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\online\\olympic\\oly_award_table.lua")
Import("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Import("\\script\\lib\\sdb.lua")

Import("\\script\\ksgvn\\lib.lua")

--»Øµ÷º¯ÊýÂ·¾¶
Oly_CallBack_Script = "\\script\\online\\olympic\\oly_head.lua";

--»î¶¯¿ªÊ¼Ê±¼ä(¸ù¾Ý¸ñÊ½µ÷Õû)!!!!!!!!!
--activity start time
ACTIVITY_START_DATE = {2023,4,24} --{year£¬mouth£¬day}
OLY_ACTIVITY_TAG = 6 --please +1 when reopen 
OLY_ACTIVITY_DURATION = 3600 * 24 * 37 --3600 * 24 * 15»î¶¯Ê±³¤

N_FIRE_SINGLE_EXP 	= 300000000
N_FIRE_FIVE_EXP 	= 300000000
T_FIRE_SINGLE_POP 	= {"Danh väng ChiÕt Xung X·", 6, 10}

--ÊÇ·ñÖØ¿ª»î¶¯ÐèÒªÖØÖÃ±äÁ¿
function oly_CheckAndResetTask()
	if gf_GetTaskByte(VET_OLY_TASK4, 2) ~= OLY_ACTIVITY_TAG then
		SetTask(VET_OLY_TASK, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK1, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK2, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK3, 0, TASK_ACCESS_CODE_OLYMPIC)
		SetTask(VET_OLY_TASK4, 0, TASK_ACCESS_CODE_OLYMPIC)
		gf_SetTaskByte(VET_OLY_TASK4, 2, OLY_ACTIVITY_TAG, TASK_ACCESS_CODE_OLYMPIC)
		for i=30894,30899 do--É¾³ý¾ÉµÄ»î¶¯µÀ¾ß£¨¸÷ÖÖ»ðÖÖ£©
			local n = BigGetItemCount(2,1,i)
			if n > 0 then
				BigDelItem(2,1,i,n)
			end
		end
	end
end

--»î¶¯¿ªÆôÊ±¼äÅÐ¶Ï
function oly_IsActivityOpen()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nEndTime = nStartTime + OLY_ACTIVITY_DURATION;
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		oly_CheckAndResetTask();
		return 1;
	else
		return 0;
	end
end

--Ã¿ÈÕÇåÀí
function oly_DailyReset()
	if oly_IsActivityOpen() == 1 then
		--µ±Ììµã»ð´ÎÊý
		gf_SetTaskByte(VET_OLY_TASK,1,0,TASK_ACCESS_CODE_OLYMPIC);
		--²ÂÊý×ÖÁì½±´ÎÊý
		gf_SetTaskByte(VET_OLY_TASK1,1,0,TASK_ACCESS_CODE_OLYMPIC);
		--ÐÒÔËÊý×Ö
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,0,TASK_ACCESS_CODE_OLYMPIC);
		--²ÂÊý×ÖÁì½±´ÎÊý
		gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
		--µã»ð±ê¼ÇÖÃ0
		SetTask(VET_OLY_TASK3,0,TASK_ACCESS_CODE_OLYMPIC);
		--Ú¤»ð¹íÁé´¥·¢´ÎÊý
		gf_SetTaskByte(VET_OLY_TASK4,1,0,TASK_ACCESS_CODE_OLYMPIC);
	end
end

--¼ÆËã»î¶¯ÒÑ¿ªÆôÌìÊý
function oly_GetActivityOpenDays()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nSpaceTimeSceconds = nCurrTime - nStartTime;
	return floor(nSpaceTimeSceconds / (3600 * 24)) + 1;
end

--µÈ¼¶Á÷ÅÉÏÞÖÆ
function oly_Is_LevelSkill()
	local nLevel = GetLevel();
	--if nLevel < 70 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
	--	Talk(1,"","Íæ¼Ò<color=green>70<color>¼¶ÒÔÉÏ¡¢ÒÑ¼ÓÈëÁ÷ÅÉÑ§»á<color=green>1<color>Ì×<color=green>55<color>¼¶¼¼ÄÜ²Å¿ÉÒÔ²Î¼Ó»î¶¯");
	if nLevel < 59 then	-- or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("Ng­êi ch¬i cÊp <color=green>%d<color> trë lªn míi cã thÓ tham gia ho¹t ®éng.", 59));	--®· gia nhËp hÖ ph¸i häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> 
		return 0;
	end
	return 1;
end

--Âú×ãnNumÊýÁ¿µÄ»ðÖÖ
function oly_GetFlameNum(nKind,nNum)
	if GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) >= nNum then
		return 1;
	end
	return 0;
end

function oly_CreateShenghuoTan()
	if oly_IsActivityOpen() == 1 then
		local npcIndex = CreateNpc("aoyunshenghuotai",HuoTanNpcName,100,1327,3077);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\red_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai",HuoTanNpcName,400,1444,2876);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\black_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai",HuoTanNpcName,300,1833,3670);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\green_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai",HuoTanNpcName,500,1768,3136);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\yellow_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai",HuoTanNpcName,350,1431,2810);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\blue_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai",HuoTanNpcName,200,1441,2807);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\wuhuan_sh.lua");
	end	
end

--IBºÏ³É
function begin_combining_1(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"",format("%s sè l­îng kh«ng ®ñ", HuoZhongName));
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3])/Compose_ShengHuo_Num_1;
	local nNum1 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_1_callback",0,min(nNum,nNum1),"H·y nhËp sè l­îng vµo");
end

function begin_combining_1_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"",format("%s sè l­îng kh«ng ®ñ", HuoZhongName));
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_1 then
		return 0;
	end
	local nNum2 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	if nNum2 < nNum * Compose_ShenShi_Num_1 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_1) == 1 and DelItem(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3],nNum * Compose_ShenShi_Num_1) == 1 then
		gf_AddItemEx2({WuCai_ShenHuoZhong[1],WuCai_ShenHuoZhong[2],WuCai_ShenHuoZhong[3],nNum}, WuCai_ShenHuoZhong[5], szLogTitle, format("GhÐp %s", HuoZhongName), 0, 1);
	end
end

--Ãâ·ÑºÏ³É
function begin_combining_2(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"",format("%s sè l­îng kh«ng ®ñ", HuoZhongName));
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) / Compose_ShengHuo_Num_2;
	local nNum1 = floor(GetCash() / (Compose_Coin_Num_2 * 10000));
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_2_callback",0,min(nNum,nNum1),"H·y nhËp sè l­îng vµo");
end

function begin_combining_2_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"",format("%s sè l­îng kh«ng ®ñ", HuoZhongName));
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_2 then
		return 0;
	end
	local nNum2 = GetCash();
	if nNum2 < nNum * Compose_Coin_Num_2 * 10000 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_2) == 1 and Pay(Compose_Coin_Num_2 * 10000 * nNum) == 1 then
		gf_AddItemEx2({WuCai_ShenHuoZhong[1],WuCai_ShenHuoZhong[2],WuCai_ShenHuoZhong[3],nNum}, WuCai_ShenHuoZhong[5], szLogTitle, format("GhÐp %s", HuoZhongName), 0, 1);
	end
end

--²ÂÊý×ÖÓÎÏ·
function oly_begin_guess()
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	--ÓÎÏ·¿ªÊ¼£¬Éú³ÉÄ¿±êÊý
	local nTarget = random(1,OLY_MAX_RAND);
	gf_SetTaskByte(VET_OLY_TASK,2,nTarget,TASK_ACCESS_CODE_OLYMPIC); --Éú³ÉµÄÊý
	gf_SetTaskByte(VET_OLY_TASK,3,0,TASK_ACCESS_CODE_OLYMPIC); --²ÂµÄ´ÎÊý
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC); --µÝ¹é´ÎÊý
	oly_begin_guess_input();
end

function oly_begin_guess_input()
	gf_SetTaskByte(VET_OLY_TASK,4,gf_GetTaskByte(VET_OLY_TASK,4) + 1,TASK_ACCESS_CODE_OLYMPIC)
	AskClientForNumber("oly_begin_guess_Child1",1,OLY_MAX_RAND,"NhËp ch÷ sè c¸c h¹ ®o¸n tróng");
end

--ÁÙÊ±È«¾Ö»º´æ²ÂµÄÊý×Ö
function oly_begin_guess_Child1(nNum)
	local nTarget = gf_GetTaskByte(VET_OLY_TASK,2);
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,4);
	if nNum == nTarget then
		Talk(1,"",format("Chóc mõng c¸c h¹ ®· ®o¸n tróng råi!!!  \n Ch÷ sè may m¾n cña c¸c h¹ lµ<color=green>%d<color>, sè lÇn ®o¸n lµ<color=green>%d<color>",nTarget,nTimes));
		gf_SetTaskByte(VET_OLY_TASK,3,nTimes,TASK_ACCESS_CODE_OLYMPIC);
		gf_SetTaskByte(VET_OLY_TASK,4,Guess_Flag,TASK_ACCESS_CODE_OLYMPIC);
	else
		if nTimes >= OLY_MAX_GUESS then
			Talk(1,"",format("Sè lÇn ®o¸n qu¸<color=green>%d<color>lÇn, <color=red>®· ®o¸n sai<color>, Ch÷ sè may m¾n cña c¸c h¹ lµ<color=red>%d<color>.",OLY_MAX_GUESS,nTarget));
			return 0;
		end
		if nNum > nTarget then
			Talk(1,"oly_begin_guess_input",format("Ch÷ sè ®o¸n lÇn %d cña c¸c h¹ lµ<color=red>%d<color>, qu¸ lín råi, h·y ®o¸n sè nhá h¬n tÝ.",nTimes,nNum));
		else
			Talk(1,"oly_begin_guess_input",format("Ch÷ sè ®o¸n lÇn %d cña c¸c h¹ lµ<color=red>%d<color>, qu¸ nhá råi, h·y ®o¸n sè lín h¬n tÝ.",nTimes,nNum));
		end
	end
end

--²ÂÊý×Ö½±Àø
function oly_get_last_guess_award()
	if gf_GetTaskByte(VET_OLY_TASK,4) == 0 then
		Talk(1,"","HiÖn t¹i c¸c h¹ kh«ng cßn phÇn th­ëng ®Ó nhËn n÷a råi!")
		return 0;
	end
	if gf_GetTaskByte(VET_OLY_TASK,4) ~= Guess_Flag then
		Talk(1,"","LÇn tr­íc c¸c h¹ ®· ®o¸n sai, kh«ng thÓ nhËn phÇn th­ëng!")
		return 0;
	end
	local nNum = gf_GetTaskByte(VET_OLY_TASK1,1);
	if nNum >= OLY_MAX_AWARD_NUM then
		Talk(1,"","Sè lÇn nhËn phÇn th­ëng ®· qu¸ 3 lÇn, kh«ng thÓ nhËn thªm ®­îc n÷a.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
  	return 0
	end
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,3);--¾º²Â´ÎÊý
	if nTimes < 1 or nTimes > 5 then return 0; end
	--Áì½±
	gf_SetTaskByte(VET_OLY_TASK1,1,nNum + 1,TASK_ACCESS_CODE_OLYMPIC);
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC);
	gf_Modify("Exp",OLY_GUESS_AWARD_TABLE[nTimes][1]);
	gf_AddItemEx2(OLY_GUESS_AWARD_TABLE[nTimes][2], Flame_Table[4][5], szLogTitle, "PhÇn th­ëng ®o¸n sè", 0, 1);
end

--·µ»Øµ±Ç°Ê±¼äs
function oly_GetDayCurrTime()
	local nHour = tonumber(date("%H"));
	local nMinute = tonumber(date("%M"));
	local nSecond = tonumber(date("%S"));
	return nHour * 3600 + nMinute * 60 + nSecond;
end

--»ñµÃÒÑ·¢³öÊýÁ¿
function oly_CallBack_GetTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- Ã»ÓÐ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_TGL_NUM,nFlag);
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--ÒÑ·¢³öÊýÁ¿+
function oly_CallBack_ModifyTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_ModifyTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nTglNum = gf_GetMyTaskByte(VET_OLY_TASK2,3,4);
	if nCount == 0 then
		-- Ã»ÓÐ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nTglNum);
		--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nFlag + nTglNum);
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--»ñÈ¡ÀÛ¼ÆÊýÄ¿
function oly_GetAccumulatedTglNum()
	--Îª0È¥¹²ÏíÊý¾Ý¿âÈ¡
	ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_GetTGNum");
	local nDaysNum = oly_GetActivityOpenDays() * 50; --Ò»Ìì·¢50¸ö
	nTgl = GetGlbValue(Glb_Oly_TGL_NUM) or 0; --ÒÑ·¢³öÊýÁ¿
	local nTglNum = nDaysNum - nTgl; --ÀÛ¼ÆÊýÄ¿
	if nTglNum < 0 or nTglNum > (OLY_ACTIVITY_DURATION/(3600 * 24))*50  then
		print("ERROE:oly_GetAccumulatedTglNum() TGL")
		return -1;
	end
	return nTglNum;
end

function oly_CreateDlgTable()
	local tbSay = {};
	local nDayTime = oly_GetDayCurrTime(); --µ±ÌìÊ±¼ä
	--	print("nDayTime",nDayTime);
	--¿ÉÒÔ²ÂÐÒÔËÊý×Ö£¬ÏÔÊ¾ÐÒÔËÊý×Ö
	--0-21
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
			tinsert(tbSay,"Ch­a hoµn thµnh th¾p s¸ng 6 lÇn /do_nothing");
		else
			if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
				tinsert(tbSay,"NhËp ch÷ sè may m¾n vµo /input_luck_num_201207");
			else
				tinsert(tbSay,format("Ch÷ sè may m¾n h«m nay cña c¸c h¹ lµ%d/do_nothing",gf_GetMyTaskByte(VET_OLY_TASK1,2,3)));
			end
		end
	end
	--²»¿ÉÒÔ²ÂÊý×ÖÁË£¬ÏÔÊ¾ÖÐÃ»ÖÐ£¬ÖÐÁËÏÔÊ¾µÇ¼Ç
	--21:00-21:30
	if nDayTime >= OLY_TIME_START and nDayTime < OLY_TIME_MID then
		--È«¾ÖÁ¿Îª0£¬È¥¹²ÏíÊý¾Ý¿âÈ¡
		--if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
		ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		--end
		
		if gf_GetTaskByte(VET_OLY_TASK1,4) == 1 then
			tinsert(tbSay,"Tróng th­ëng råi, ®· ®­îc ®¨ng ký/do_nothing");
		else
			local nRelayLuckNum = GetGlbValue(Glb_Oly_Luck_NUM) or 0;
    		local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3) or 0;
    		if nRelayLuckNum == nMyluckNum and nRelayLuckNum ~= 0 then
    			tinsert(tbSay,"Tróng th­ëng råi, t¹i h¹ muèn ®¨ng ký/register_mylucknum_201207");
    		else
    			tinsert(tbSay,"C¸c h¹ ®· kh«ng tróng th­ëng, h·y may m¾n lÇn sau/do_nothing");
    		end
		end
	end
	--²»¿ÉÒÔ²ÂÊý×ÖÁË£¬ÏÔÊ¾ÖÐÃ»ÖÐ£¬µÇ¼ÇÁËÏÔÊ¾Áì½±
	--21:30-22:00
	if nDayTime >= OLY_TIME_MID and nDayTime < OLY_TIME_END then
		--È«¾ÖÁ¿Îª0£¬È¥¹²ÏíÊý¾Ý¿âÈ¡
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		if gf_GetTaskByte(VET_OLY_TASK1,4) == 1 then
			tinsert(tbSay,"Tróng th­ëng råi, t¹i h¹ muèn nhËn phÇn th­ëng/get_lucknum_award_201207");
		else
			tinsert(tbSay,format("%s/do_nothing", "Kh«ng tróng th­ëng"));
		end
	end
	--22:00-24:00
	if nDayTime >= OLY_TIME_END then
		tinsert(tbSay,"Ngµy mai h·y ®Õn/do_nothing");
	end

	return tbSay;
end

--Relay¹²ÏíÊý¾Ý¿â»Øµ÷º¯Êý
--Ã¿Ìì21µãµ÷ÓÃÒ»´Î
--Ã¿Ì¨gs¶¼Ö´ÐÐÒ»´ÎÒÔ×îºóËæ»úÊýÎª×¼
function oly_CallBack_Relay_Random(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_Callback_Relay_Random")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nRandom = random(1,OLY_MAX_LUCK_NUM);
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",nRandom);
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--»ñÈ¡ÐÒÔËÊý×Ö
--Glb_Oly_Luck_NUM
function oly_CallBack_GetLuckNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	--0µ½21µãÖ®¼ä
	local nDayTime = oly_GetDayCurrTime(); --µ±ÌìÊ±¼ä
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		SetGlbValue(Glb_Oly_Luck_NUM,0);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record2.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_Luck_NUM,nFlag);
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function do_nothing()
	--do nothing
end

--ÀÛ¼ÆÊýÄ¿£¬ÐÒÔËÊý×Ö£¬Íæ¼ÒÐÒÔËÊý×Ö
function oly_GetBaseInfo()
	--ÊýÄ¿
	local nTglNum = oly_GetAccumulatedTglNum();
	if nTglNum < 0 then
		print("ERROR:TGL Num is error");
		return 0,"",0;
	end
	--½ñÌìµÄÐÒÔËÊý×Ö
	local strNum = "";
	if oly_GetDayCurrTime() < OLY_TIME_START then
		strNum = "21:00 tèi nay më th­ëng, tr­íc 21:30 ®¨ng ký tróng th­ëng, tr­íc 22:00 nhËn th­ëng";
	else
		--ÐÒÔËÊý¾ÝÎª0£¬È¥¹²ÏíÊý¾Ý¿âÈ¡
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		local nNumTemp = GetGlbValue(Glb_Oly_Luck_NUM);
		if nNumTemp ~= 0 then
			strNum = tostring(nNumTemp);
		else
			strNum = "21:00 tèi nay më th­ëng, tr­íc 21:30 ®¨ng ký tróng th­ëng, tr­íc 22:00 nhËn th­ëng";
		end
	end
	--ÎÒµÄÐÒÔËÊý×Ö
	local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3);
	return nTglNum,strNum,nMyluckNum;
end

--µÇ¼ÇÖÐ½±ÈËÊý+1
function oly_CallBack_Rigister(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Rigister")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- Ã»ÓÐ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0;
	--µÇ¼ÇÊýÁ¿²»³¬¹ý10
	if nFlag < MAX_WIN_NUM then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag + 1);
		--µÇ¼ÇÃû×Ö
		gf_SetTaskByte(VET_OLY_TASK1,4,1,TASK_ACCESS_CODE_OLYMPIC);
		Talk(1,"",format("C¸c h¹ ®· ®¨ng ký råi, tõ %d:%d ®Õn %d:%d giê h·y ®Õn nhËn phÇn th­ëng",floor(OLY_TIME_MID/3600),floor(mod(OLY_TIME_MID,3600)/60),floor(OLY_TIME_END/3600),floor(mod(OLY_TIME_END,3600)/60)));
	else
		Talk(1,"",format("Sè lÇn ®¨ng ký ®· v­ît qua %d lÇn, kh«ng thÓ ®¨ng ký n÷a",MAX_WIN_NUM));
	end
	
	gf_SetMyTaskByte(VET_OLY_TASK1,2,3,0,TASK_ACCESS_CODE_OLYMPIC)--ÇåµôÉíÉÏµÄÊý×Ö ·ÀÖ¹ÖØ¸´Áì½±
	AddItem(2,201,13,3,4)--¸ø3¸ö°ó¶¨µÄÌìÎÆÊ¯
	
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--µÇ¼ÇÖÐ½±ÈËÊý-1
function oly_CallBack_Rigister_Dec(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- Ã»ÓÐ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
		--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	--µÇ¼ÇÊýÁ¿²»Ð¡ÓÚ0
	if nFlag > 0 then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag - 1);
	end
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--È¡ÐÒÔËÊý×ÖÁì½±
function oly_CallBack_GetLuckPersonNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckPersonNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0; --ÈËÊý
	--Áì½±¿©
	oly_GetLuckNumAward(nFlag);
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function oly_GetLuckNumAward(nFlag)
	if nFlag <= 0 or nFlag == nil then return 0; end
	local nTgl = oly_GetAccumulatedTglNum();
	if nTgl <= 0 then return 0; end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0;
	end
	--=======·¢½±
	gf_AddItemEx2({2,97,236,floor(nTgl/nFlag)}, "Thiªn Kiªu LÖnh", szLogTitle, "NhËn th­ëng ch÷ sè may m¾n", 0, 1);
	Msg2Global(format("Chóc mõng %s trong Rót Th¨m May M¾n nhËn ®­îc %s*%d",GetName(), "Thiªn Kiªu LÖnh", floor(nTgl/nFlag)));
	--Áì½±±ê¼Ç
	gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
	--ÉèÖÃÁìÈ¡ÊýÁ¿
	gf_SetMyTaskByte(VET_OLY_TASK2,3,4,floor(nTgl/nFlag),TASK_ACCESS_CODE_OLYMPIC);
	--ÀÛ¼ÆÊýÁ¿+
	ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_ModifyTGNum");
	--µÇ¼ÇÈËÊý¼õ1
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister_Dec");
end

--ÐÒÔËÊý×ÖÖµ0
function oly_CallBack_LuckNum_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_LuckNum_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",0);
	SetGlbValue(Glb_Oly_TGL_NUM,0);
	SetGlbValue(Glb_Oly_Luck_NUM,0);
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--µÇ¼ÇÊýÁ¿ÖÃ0
function oly_CallBack_Register_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Register_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
end

--»î¶¯½áÊøÇå³ýÊýÄ¿
function oly_CallBack_TGL_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
end

--µã»ð´ÎÊýÀÛ¼Æ½±Àø
function oly_Accumulate_FireNum()
	local nNum = gf_GetMyTaskByte(VET_OLY_TASK2,1,2);
	if nNum >= OLY_ACCUMULATE_FIRE_AWARD_TABLE[getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE)][1] then
		return 0;
	end
	--´ÎÊý+1
	gf_SetMyTaskByte(VET_OLY_TASK2,1,2,nNum+1,TASK_ACCESS_CODE_OLYMPIC);
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] == nNum+1  then
			
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 1 then
				gf_AddItemEx2(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3], OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4], szLogTitle, "PhÇn th­ëng th¾p s¸ng céng dån ", OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][6], 1);
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 2 then
				gf_EventGiveCustomAward(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][1],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][2],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][3],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][4],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][5])
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 3 then
				if type(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]) == "string" then
					dostring(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]);
				end
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 4 then
				CustomAwardGiveGroup(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3], 0)
			end
			local szMsg = format("Chóc mõng ®¹i hiÖp ®· nhËn ®­îc phÇn th­ëng tÝch lòy th¾p löa %d lÇn: %s", nNum+1, OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4])
			Msg2Player(szMsg)
			--×ÔÐÐÀ©Õ¹
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4] == "Thiªn Cang LÖnh" then
				--gf_SetMyTaskByte(VET_OLY_TASK2,1,2,0,TASK_ACCESS_CODE_OLYMPIC);
				Msg2Global(format("Chóc mõng %s tÝch lòy th¾p löa %s ®¹t sè lÇn nhÊt ®Þnh nhËn ®­îc Thiªn Cang LÖnh *1", HuoTanNpcName, GetName()));
			end
			break
		end
	end
end

--Ëæ»úÐÇ¿Ì
function oly_XingKe_Award()
	gf_EventGiveRandAward(OLY_XINGKE_AWARD_TB, gf_SumRandBase(OLY_XINGKE_AWARD_TB), 1);
end

--Ëæ»úÌìÒÇ
function oly_TianYi_Award()
	gf_EventGiveRandAward(OLY_TIANYI_AWARD_TB, gf_SumRandBase(OLY_TIANYI_AWARD_TB), 1);
end

--Ê¦ÃÅ4Ì×
function oly_ShiMeng4_Award()
	MA_GiveFactionEquip4({1, nil, nil, 0}, szLogTitle);
end

--ÔÌÁé2
function oly_YunLing2_Award()
	MA_GiveLevel2WenShi({1, nil, 30, 0}, szLogTitle);
end

--¸ø½±Àø1
function oly_GiveAward1()
	gf_Modify("Exp",180000);
	gf_EventGiveRandAward(OLY_AWARD_1_TABLE,gf_SumRandBase(OLY_AWARD_1_TABLE),1,szLogTitle,"PhÇn th­ëng 1");
end

--¸ø½±Àø2
function oly_GiveAward2()
	gf_Modify("Exp",OLY_EXP_2);
	gf_EventGiveRandAward(OLY_AWARD_2_TABLE,gf_SumRandBase(OLY_AWARD_2_TABLE),1,szLogTitle,"PhÇn th­ëng 2");
end

--¸ø½±Àø3
function oly_GiveAward3()
	gf_Modify("Exp",OLY_EXP_3);
	gf_EventGiveRandAward(OLY_AWARD_3_TABLE,gf_SumRandBase(OLY_AWARD_3_TABLE),1,szLogTitle,szLogTitle);
end

--¸ø»ðÖÖ
function oly_AddShengHuo(nNum,nIndex)
	if oly_IsActivityOpen() == 1 then
		AddItem(Flame_Table[nIndex][1],Flame_Table[nIndex][2],Flame_Table[nIndex][3],nNum);
		Msg2Player(format("C¸c h¹ nhËn ®­îc %s x %d",Flame_Table[nIndex][5],nNum));
	end
end

function oly_GetCountStep(nNum)
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if nNum < OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] then
			return i;
		end
	end
	return 0;
end

function oly_StarEquip_Award()
	gf_EventGiveRandAward(OLY_STAREQUIP_AWARD_TB, gf_SumRandBase(OLY_STAREQUIP_AWARD_TB), 1, szLogTitle, szLogTitle);
end

---Mod thªm phÇn th­ëng tÝch luü sè lÇn kÝch ho¹t
---@param nSelectIdx number
function _w_oly_GetAccumulateAward(nSelectIdx)
	local tbAccumulateAwardDef = {
		{
			nActiveFireReq = 50,
			tbAward = {
				{ nExp = 5000000000 }, -- 5 tû exp
			}
		},
		{
			nActiveFireReq = 100,
			tbAward = {
				{ tbProp = { 2, 1, 31595 }, nStack = 1 }, -- Tói Ngo¹i Trang Quúnh QuÕ
			}
		},
		{
			nActiveFireReq = 200,
			tbAward = {
				{ tbProp = { 2, 1, 40049 }, nStack = 200 }, -- M¶nh BÝ §iÓn 30
			}
		},
		{
			nActiveFireReq = 500,
			tbAward = {
				{ tbProp = { 2, 102, 225 }, nStack = 5 }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
			}
		},
		{
			nActiveFireReq = 1000,
			tbAward = {
				{ tbProp = { 2, 1, 31553 }, nStack = 1 }, -- S­¬ng Thiªn HiÓu Gi¸c
			}
		},
		{
			nActiveFireReq = 1500,
			tbAward = {
				{ tbProp = { 2, 1, 40050 }, nStack = 300 }, -- M¶nh BÝ §iÓn 32
			}
		},
		{
			nActiveFireReq = 2000,
			tbAward = {
				{ nRate = 50, tbProp = { 2, 105, 30217 }, nStack = 1, nExpiredTime = DATETIME_SEC_ONE_MONTH }, -- HuyÒn L©n (§Ñp)
				{ nRate = 50, tbProp = { 2, 105, 30186 }, nStack = 1, nExpiredTime = DATETIME_SEC_ONE_MONTH }, -- B¹ch Lang-§Ñp
			}
		},
		{
			nActiveFireReq = 2500,
			tbAward = {
				{ tbProp = { 2, 95, 204 }, nStack = 5 }, -- Thiªn Cang LÖnh
				{ tbProp = { 2, 1, 30370 }, nStack = 5 }, -- Thiªn M«n Kim LÖnh
			}
		},
		{
			nActiveFireReq = 3000,
			tbAward = {
				{ tbProp = { 2, 1, 31239 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph¸ch §¬n
				{ tbProp = { 2, 1, 30847 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Håi Tiªn §¬n
			}
		},
		{
			nActiveFireReq = 5000,
			tbAward = {
				{ nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d)", 15, 4) },
			}
		},
	};

	local nActiveCount = WTask:Get(WTASKID_THANHHOADAN_ACTIVE_FIRE_COUNT);

	if not nSelectIdx then
		local tbSay = { format("<sex> hiÖn ®· th¾p s¸ng Th¸nh Ho¶ §µn ®­îc %d lÇn, cã thÓ nhËn th­ëng tÝch luü mèc t­¬ng øng d­íi ®©y!", nActiveCount) };

		for i = 1, getn(tbAccumulateAwardDef) do
			if WTask:GetBit(WTASKID_THANHHOADAN_ACCUMULATE_BIT_GIVE, i) == 0 then
				tinsert(tbSay, format("Mèc th­ëng kÝch ho¹t %d lÇn./#_w_oly_GetAccumulateAward(%d)", tbAccumulateAwardDef[i].nActiveFireReq, i));
			else
				tinsert(tbSay, format("[®· nhËn] Mèc th­ëng kÝch ho¹t %d lÇn./nothing", tbAccumulateAwardDef[i].nActiveFireReq));
			end
		end

		tinsert(tbSay, format("T¹m thêi ch­a cÇn ®Õn./nothing", i));
		WNpc:SayDialog(tbSay);
	end

	if not tbAccumulateAwardDef[nSelectIdx] then
		return WEnv.RETCODE_UNDEFINE;
	end

	if nActiveCount < tbAccumulateAwardDef[nSelectIdx].nActiveFireReq then
		WNpc:Talk(format("<sex> ch­a kÝch ho¹t ®ñ %d/%d lÇn kh«ng thÓ nhËn th­ëng!", nActiveCount, tbAccumulateAwardDef[nSelectIdx].nActiveFireReq));
		return WEnv.RETCODE_DENY;
	end

	if WTask:GetBit(WTASKID_THANHHOADAN_ACCUMULATE_BIT_GIVE, nSelectIdx) ~= 0 then
		WNpc:Talk("<sex> ®· nhËn mèc th­ëng nµy råi!");
		return WEnv.RETCODE_DENY;
	end

	if WLib:CheckInv(10, 100) ~= WEnv.TRUE then
		return WEnv.RETCODE_NEEDROOM;
	end

	WTask:SetBit(WTASKID_THANHHOADAN_ACCUMULATE_BIT_GIVE, nSelectIdx, 1);

	local tbAward = tbAccumulateAwardDef[nSelectIdx].tbAward;
	WAward:Give(tbAward, format("Th¸nh Ho¶ §µn - th­ëng mèc %d", nSelectIdx));
end

--È«·þµã»ð´ÎÊý-----------------------------
function oly_AddFireCount(nNum)
	if not nNum or nNum <= 0 then
		return 0;
	end
	local s = SDB("olympic_addfire", 0, 0);
	s:apply2(callout(oly_AddFireCount_CB, tonumber(nNum)));
end

function oly_AddFireCount_CB(nNum, nCount, sdb)
	local sData = sdb["data"];
	if not sData[1] or nCount <= 0 then
		sData = {0}; --Ã»ÓÐÈÎºÎ¼ÇÂ¼£¬ÖÃÁã
	end
	local s = SDB("olympic_addfire", 0, 0);
	sData[1] = sData[1] + nNum;
	s["data"] = {"d", sData[1]}; 
	Msg2Player(format("Server %s ®· th¾p s¸ng %d lÇn", HuoTanNpcName, sData[1]))
end

function oly_GetFireCount()
	local s = SDB("olympic_addfire", 0, 0);
	s:apply2(oly_GetFireCount_CB);
end

function oly_GetFireCount_CB(nCount, sdb)
	local sData = sdb["data"];
	Talk(1,"",format("Server %s ®· th¾p s¸ng %d lÇn", HuoTanNpcName, sData[1] or 0))
end
---------------------------------------------
