Include("\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")
Include("\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua")
Include("\\script\\missions\\eyt_battle\\join_npc.lua")
Include("\\settings\\static_script\\kf_newbattles\\sign_up_npc_kf.lua")
Include("\\script\\missions\\one_road_battle\\orb_functions.lua")
Include("\\script\\system_switch_config.lua")

function main()
	local tbSay = {}
	local szTitle = "Cã thÓ nhËn th­ëng liªn server ë ®©y, ng­¬i muèn nhËn phÇn th­ëng g×?"
	tinsert(tbSay, format("%s/#get_award(1)", "Thiªn M«n TrËn Liªn Server"))
	if IsKfNewBattleOpen() ~= 0 then tinsert(tbSay, format("%s/#get_award(6)", "Ph¸o §µi ChiÕn Liªn Server")) end
	if IsKfNewBattleOpen() ~= 0 then tinsert(tbSay, format("%s/#get_award(7)", "Nh¹n M«n Quan Liªn Server")) end
	tinsert(tbSay, format("%s/#get_award(2)", "Lo¹n chiÕn bang héi"))
	--tinsert(tbSay, format("%s/#get_award(3)", "±ÈÎä´ó»áÁªÈü"))
	--tinsert(tbSay, format("%s/#get_award(4)", "±ÈÎä´ó»áµ¥ÈËÈü"))
	tinsert(tbSay, format("%s/#get_award(5)", "ChiÕn Tr­êng ¢n O¸n §µi"))
	tinsert(tbSay, format("%s/orb_award_talk", "ChiÕn tr­êng HiÖp Lé T­¬ng Phïng"))
	
	tinsert(tbSay, format("\n%s/nothing", "Ra khái"))
	Say(szTitle, getn(tbSay), tbSay)
end

function get_award(nType)
	if 1 == nType then
		jyr_main_lingjiang()
	elseif 2 == nType then
		tm_award_tong_melee()
	elseif 3 == nType then
		SendScript2Client("Open([[XvxRank]])");
	elseif 4 == nType then
		main_bwdh_award()
	elseif 5 == nType then
		main_eyt_award()
	elseif 6 == nType then
		SendScript2VM("\\settings\\static_script\\kf_newbattles\\sign_up_npc_kf.lua", format("get_kf_battle_award(%d)", EMPLACEMENT_ID) )
	elseif 7 == nType then
		SendScript2VM("\\settings\\static_script\\kf_newbattles\\sign_up_npc_kf.lua", format("get_kf_battle_award(%d)", MAINBATTLE_ID) )
	end
end
