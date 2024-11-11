Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\lib\\globalfunctions.lua")
function main()
    local szNpcName = GetTargetNpcName()
    if BigGetItemCount(2,1,31242) > 0 then
        local szTalk = format("<color=green>%s<color>: ��ng ��nh ta! Ta kh�ng c�n g� n�a ��u!",szNpcName)
		Talk(1,"",szTalk)
		return
	end
    if tGtTask:check_cur_task(563) == 1 then
        local szTalk = format("<color=green>%s<color>: ��ng ��nh ta! Ch� c�n ng��i ��a ta ra kh�i ��y, Ma V�c B� L�c n�y ta t�ng ng��i!",szNpcName)
        if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
            return 
        end
        Talk(1,"",szTalk)
        AddItem(2,1,31242,1);
        return
    end
    Talk(1,"",format("<color=green>%s<color>: ��y l� ��u, �i su�t 3 ng�y 3 ��m v�n ch�a ra kh�i. Ta m�t qu�.",szNpcName));
end