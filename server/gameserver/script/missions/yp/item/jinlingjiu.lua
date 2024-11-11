--½ğÁê¾Æ
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	if DelItem(2,95,822,1) == 1 then		
		SetTask(TASK_FIELD_PVP_DRINK,GetTime());
		CastState("state_life_max_percent_add", 0, 20*60*18, 1, 9915,0);
		SyncCustomState(1, 9915, 3,"Kim L¨ng Töu");
		Msg2Player("B¹n nhËn ®­îc tr¹ng th¸i Kim L¨ng Töu, duy tr× 20 phót!");
		
		--cdkey»î¶¯ ÏÖÔÚÃ»ÓĞÁË£¬É¾µô°É
  	-- gf_TeamOperateEX(function () 
  	-- 	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2208)");	
  	-- end);
	end
end