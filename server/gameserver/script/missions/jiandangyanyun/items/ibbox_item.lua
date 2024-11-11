Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")


function handle_on_use()

		local szAward = "JD_IB1"
		if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
			return 0
		end
		if DelItem(2,1,31124, 1) == 1 then
    		if CustomAwardGiveGroup(szAward, 0) > 0 then     --¶þºÅ²ÎÊýÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø,Èç¹ûÊÇÔò1
    			AddRuntimeStat(44,14,0,1)
        		return 1
        	else
        		AddItem(2,1,31124, 1)
        	end
    	end
end
function OnUse(  )
	-- body
	handle_on_use()
end