--missionÄÚ°ï»á´óÊ¹npc
--·ÖÅäÉñÊŞ
--ÍË³ömission
Include("\\script\\function\\siege_qualification\\tm_head.lua")

function main()
	local tSay = {
		"\n ph©n phèi ThÇn Thó/tm_assign_beast",
		"\n rót khái chiÕn tr­êng/tm_leave_battle",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(TM_TONG_AD_NPC.."Thêi gian cã h¹n, ®éi tr­ëng nhanh nhanh ph©n phèi thÇn thó, cuéc chiÕn s¾p ®­îc b¾t ®Çu!", getn(tSay), tSay);
end