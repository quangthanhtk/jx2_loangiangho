
function _mis_str_split(src, seq)
	src = src or "";
	seq = seq or "";
	local fields = {};
	local op = function (c)
		%fields[getn(%fields) + 1] = gsub(c, "^%s*(.-)%s*$", "%1");
	end
	local pattern = format("([^%s]+)", seq);
	gsub(src, pattern, op)
	--print(src)
	--gf_PrintTable(fields)
	return fields;
end

function _mis_talk_event_cb(szNpcName, szTitle, szContent)
	--print(szNpcName, szTitle, szContent)
	local tSay = _mis_str_split(szContent, "|");
	tSay[getn(tSay)] = format(tSay[getn(tSay)], "Ta cÇn xö lı nh÷ng viÖc kh¸c");
	--gf_PrintTable(tSay)
	Say(format("<color=gold>%s<color>:%s", szNpcName, szTitle), getn(tSay), tSay);
end

--½Å±¾´¥·¢µÄÊÂ¼ş¶¼±¸×¢ÔÚÕâÀï
--NPCËÀÍö
--EventType:event_kill_npc
--EventName:npcÃû³Æ
--CallBack Param: npc Index

--NPC¶Ô»°
--EventType:event_talk_npc
--EventName:npcÃû³Æ
--CallBack Param: npc Index

--Item¶Ô»°
--EventType:event_use_item
--EventName:format("%d%d%d", g, d, p)
--CallBack Param: item Index

--Ã¿ÈÕÇåÀí
--EventType:event_daily_clean
--EventName:ÈÎÒâ
--CallBack Param: ÎŞ

--Ã¿ÖÜÇåÀí
--EventType:event_weekly_clean
--EventName:ÈÎÒâ
--CallBack Param: ÎŞ

--·şÎñÆ÷Æô¶¯
--EventType:event_server_start
--EventName:ÈÎÒâ
--CallBack Param: ÎŞ

--¸±±¾¹ı¹Ø
--EventType:event_mission_passstage
--EventName:Íò½£Ú££¬µØĞş¹¬£¬ÁºÉ½£¬Ì«Ò»Ëş£¬Ó¢ĞÛÌ«Ò»Ëş£¬²Ø½£É½×¯£¬Ì«Ğé»Ã¾³
--CallBack Param:EventType, EventName, nStage

--²Î¼ÓÒ»´ÎÕ½³¡
--EventType: event_mission_joinonce
--EventName:ÌìÃÅÕó£¬´åÂäÕù¶áÕ½£¬²İ¹ÈÕù¶áÕ½£¬ÅÚÌ¨Õù¶áÕ½£¬ÑãÃÅ¹ØÖ÷Õ½³¡£¬¶÷Ô¹Ì¨
--CallBack Param:EventType, EventName

--Èı·½ÊÆÁ¦ÈÎÎñ
--EventType:event_yp_taskfinish
--EventName:ÍÚ±¦£¬Íµ¾­Êé£¬ÔËïÚ£¬½ÙïÚ£¬ÍµÓñÆÇ£¬
--CallBack Param:EventType, EventName

--ÑİÎäÕ½Ïà¹Ø
--EventType:event_ywz_taskfinish
--EventName:ÖÜ³£ÈÎÎñ,¸öÈË½¨Éè»ı·Ö´ï300
--CallBack Param:EventType, EventName

--Ê§ÂäÑÂÖ®Õ½
--EventType:event_slyb_award
--EventName:Ê§ÂäÑÂÖ®Õ½ÊÆÁ¦½±Àø
--CallBack Param:EventType, EventName, nRank