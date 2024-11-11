--Ï´ÕæÆøµ¤Ò©ÎïÆ·½Å±¾

Import("\\script\\system_switch_config.lua")

t_name = {"NhËm M¹ch", "§èc M¹ch", "§íi M¹ch", "Xung M¹ch",}
t_type_task = {2947, 2948, 2949, 2950,}

function OnUse_Real(id)
	local tbSay = {}
	local szTitle = ""
	if 1 == IsMeridianSystemOpen() and MeridianGetLevel() >= 1 then
		szTitle = format("DŞch C©n §an: ta cã thÓ gióp ng­¬i tÈy tñy dŞch c©n, xin h·y chän kinh m¹ch cÇn tÈy.")
		for i=1,4 do
			local nCurTypeZhenQi = GetTask(t_type_task[i])
			if nCurTypeZhenQi > 0 then
				tinsert(tbSay, format("%s%s/#_do_restore(%d)", "Ta muèn tÈy tñy", t_name[i], i))
			end
		end
--		tinsert(tbSay, format("%s%s/#_do_restore(1)","ÎÒÒªÏ´Ëè", t_name[1]))
--		tinsert(tbSay, format("%s%s/#_do_restore(2)","ÎÒÒªÏ´Ëè", t_name[2]))
--		tinsert(tbSay, format("%s%s/#_do_restore(3)","ÎÒÒªÏ´Ëè", t_name[3]))
--		tinsert(tbSay, format("%s%s/#_do_restore(4)","ÎÒÒªÏ´Ëè", t_name[4]))
		tinsert(tbSay, "Ta chØ ghĞ ch¬i/no")
	else
		szTitle = format("HiÖn t¹i c¸c h¹ vÉn ch­a kİch ho¹t c¶nh giíi, rÊt tiÕc ta kh«ng thÓ gióp ng­¬i dŞch c©n tÈy tñy.")
		tinsert(tbSay, "Ra khái/no")
	end
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_restore(nType)
	if nType >= 1 and nType <= 4 then
		local nCurTypeZhenQi = GetTask(t_type_task[nType])
		if nCurTypeZhenQi > 0 then
			local g,d, p = 2,1,30549
			local nCount = GetItemCount(g,d, p)
    		if nCount >= 1 then
    			local nResult = MeridianRestore(nType)
            	if nResult > 0 then
            		local nDelResult = DelItem(g,d, p,1)
            		if nDelResult == 1 then
            			Talk(1,"",format("[%s]%s", t_name[nType], "TÈy tñy thµnh c«ng!"))
            		else
            			--Ê§°ÜÁË ²»ÖªµÀ¸ÃÔõÃ´´¦Àí...
            		end
            	else
            		--Talk(1,"",format("[%s]%s", t_name[nType], "²»ĞèÒªÏ´Ëè£¡"))
            	end
    		end
		else
			Talk(1,"",format("[%s]%s", t_name[nType], "Kh«ng cÇn tÈy tñy!"))
		end
	end
end


function no()
end

