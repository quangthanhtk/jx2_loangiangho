--¶ÎÇáÈË

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>§o¹n Khinh Nh©n<color>: ","D­íi ch©n nói cña bæn tù cã 3 c©y Th¸i H­, t­¬ng truyÒn n¨m x­a do Th¸i H­ Ch©n Nh©n v©n du ®Õn ®©y mµ trång. NhiÒu n¨m nay lu«n cµnh l¸ um tïm. C©y cæ thô nµy thÇn kú ë chç, mang h¹t gièng Th¸i H­ ®Æt vµo trong sÏ cã thÓ hÊp thô linh khÝ ®Êt trêi. sÏ nhËn ®­îc Ngäc Ph¸ch ®Ó t¨ng c«ng lùc.","Ta cho ng­¬i hai h¹t gièng, hy väng ng­¬i h·y mang ®Õn chç Th¸i H­ Cæ Thô ®Ó trång, ®ång thêi thµnh c«ng thu ho¹ch 2 lÇn.","T­¬ng truyÒn, T©y H¹ vµ Thæ Phån còng cã cæ thô. Nh­ng bän v« lÔ ë hai n­íc ®ã c¶ gan d¸m vµo n­íc ta h¸i trém Ngäc Ph¸ch. Hy väng ng­¬i h·y ®Õn chç <color=yellow>Quúnh KÕt hoÆc H­ng Kh¸nh<color> ®Ó trém Ngäc Ph¸ch 1 lÇn, xem nh­ lµ gËy «ng ®Ëp l­ng «ng!"},
	{"<color=green>Côc Bæn C¸c Quý<color>: ","D­íi ch©n nói cña bæn tù cã 3 c©y Th¸i H­, t­¬ng truyÒn n¨m x­a do Th¸i H­ Ch©n Nh©n v©n du ®Õn ®©y mµ trång. NhiÒu n¨m nay lu«n cµnh l¸ um tïm. C©y cæ thô nµy thÇn kú ë chç, mang h¹t gièng Th¸i H­ ®Æt vµo trong sÏ cã thÓ hÊp thô linh khÝ ®Êt trêi. sÏ nhËn ®­îc Ngäc Ph¸ch ®Ó t¨ng c«ng lùc.","Côc Bæn C¸c Quý: Ta cho ng­¬i hai h¹t gièng, hy väng ng­¬i h·y mang ®Õn chç Th¸i H­ Cæ Thô ®Ó trång, ®ång thêi thµnh c«ng thu ho¹ch 2 lÇn.","T­¬ng truyÒn, T©y H¹ vµ §¹i Lý còng cã cæ thô. Nh­ng bän v« lÔ ë hai n­íc ®ã c¶ gan d¸m vµo n­íc ta h¸i trém Ngäc Ph¸ch. Hy väng ng­¬i h·y ®Õn chç <color=yellow>H­ng Kh¸nh hoÆc Thiªn Long Tù<color> ®Ó trém Ngäc Ph¸ch 1 lÇn, xem nh­ lµ gËy «ng ®Ëp l­ng «ng!"},	
	{"<color=green>Lý §øc Dôc<color>: ","D­íi ch©n nói cña bæn m«n cã 3 c©y Th¸i H­, t­¬ng truyÒn n¨m x­a do Th¸i H­ Ch©n Nh©n v©n du ®Õn ®©y mµ trång. NhiÒu n¨m nay lu«n cµnh l¸ um tïm. C©y cæ thô nµy thÇn kú ë chç, mang h¹t gièng Th¸i H­ ®Æt vµo trong sÏ cã thÓ hÊp thô linh khÝ ®Êt trêi. sÏ nhËn ®­îc Ngäc Ph¸ch ®Ó t¨ng c«ng lùc.","Ta cho ng­¬i hai h¹t gièng, hy väng ng­¬i h·y mang ®Õn chç Th¸i H­ Cæ Thô ®Ó trång, ®ång thêi thµnh c«ng thu ho¹ch 2 lÇn.","T­¬ng truyÒn, Thæ Phån vµ §¹i Lý còng cã cæ thô. Nh­ng bän v« lÔ ë hai n­íc ®ã c¶ gan d¸m vµo n­íc ta h¸i trém Ngäc Ph¸ch. Hy väng ng­¬i h·y ®Õn chç <color=yellow>Quúnh KÕt hoÆc Thiªn Long Tù<color> ®Ó trém Ngäc Ph¸ch 1 lÇn, xem nh­ lµ gËy «ng ®Ëp l­ng «ng!"},
};

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
	for i = 1, getn(tMainMapID) do
		if tMainMapID[i][1] == nMapID then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 or tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"",g_NpcName.."Ta gióp ®­îc g× cho ®¹i hiÖp?");
		return 0;
	end
	local strtab = {
		"Ngäc Ph¸ch Chi Tinh (Tiªu hao 5 ®iÓm tinh lùc)/#ldx_talk_1("..nType..")",
		"BÊt T×nh Chi Tinh (Tiªu hao 5 ®iÓm tinh lùc)/#ldx_talk_2("..nType..")",
		"Cung phông thªm/#ldx_talk_3("..nType..")",
		"Giíi thiÖu chi tiÕt/#ldx_talk_4("..nType..")",
		format("Mua Ng­ng Tinh Lé (%d vµng/c¸i)/ldx_talk_5", 5),
		"Kh«ng cã viÖc g×!/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function ldx_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,1);
	if nState == 1 then
		if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2) == 2 then
			--------------------------
			--¸ø½±Àø
			yp_aw_giveAward_9();
			--------------------------
			Talk(1,"",g_NpcName.."§a t¹ ®¹i hiÖp! §©y lµ quµ tÆng, h·y nhËn lÊy!");
		else
			Say(g_NpcName.."GÆp khã kh¨n µ? Ng­¬i cã thÓ hñy bá nhiÖm vô nµy.",
				3,
				"\nHoµn thµnh nhiÖm vô [Ngäc Ph¸ch Chi Tinh]/#ldx_talk_1_2("..nType..")",
				"\nHñy bá nhiÖm vô [Ngäc Ph¸ch Chi Tinh]/#ldx_talk_1_1("..nType..")",
				"\nKÕt thóc ®èi tho¹i/nothing");
		end
	else
		Say(g_NpcName.."GÆp khã kh¨n µ? Ng­¬i cã thÓ hñy bá nhiÖm vô nµy.",
				3,
				"\nNhËn nhiÖm vô [Ngäc Ph¸ch Chi Tinh]/#ldx_talk_1_4("..nType..")",
				"\n*Bá qua nhiÖm vô [Ngäc Ph¸ch Chi Tinh]/#ldx_talk_1_3("..nType..")",
				"\nKÕt thóc ®èi tho¹i/nothing");
	end
end

function ldx_talk_1_4(nType)
	local g_NpcName = tNpcName[nType][1];
	local nTimes = GetTask(TASK_FIELD_PVP_TAIXU);
	if nTimes >= 3 then
		Talk(1,"",format("H«m nay ®· hoµn thµnh %d lÇn, ngµy mai h·y quay l¹i!", 3));
		return 0;
	end
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."§iÓm tinh lùc cña ®¹i hiÖp kh«ng ®ñ!");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end	
	yp_setValue(3,-5);
	gf_SetTaskByte(TASK_FIELD_PVP_SEED_SUR,1,1);
	local nSeedType = 0;
	local nRand = random(1,10000);
	if nRand <= 9000 then
		nSeedType = 3;
	elseif nRand <= 9995 then
		nSeedType = 2;
	else
		nSeedType = 1;
	end
	local nTbidx = random(1,getn(tSeedName[nSeedType]));
	SetTask(TASK_FIELD_PVP_TAIXU, nTimes + 1)
	gf_AddItemEx(tSeedName[nSeedType][nTbidx][2],tSeedName[nSeedType][nTbidx][1],2);
	Talk(1,"",g_NpcName..tNpcName[nType][3]);
end

function ldx_talk_1_3(nType)
	local g_NpcName = tNpcName[nType][1];
	local tSay = {
		format("\nX¸c nhËn/#ldx_talk_1_3_1(%d)", nType),
		"§Ó ta suy nghÜ/nothing",
	}
	local szCardName = "ThÎ th¸ng hoÆc ThÎ ho¹t ®éng"
	if IsActivatedVipCard() ~= 0 then
		szCardName = GetVipCardName(GetVipCardIndex());
	end
	Say(g_NpcName..format("%s sau khi kÝch ho¹t <color=green>%s<color> dïng <color=green>%s*%d<color> cã thÓ trùc tiÕp hoµn thµnh nhiÖm vô vµ nhËn th­ëng!", 
		gf_GetPlayerSexName(), szCardName, "Thiªn Kiªu LÖnh", 6), getn(tSay), tSay);
end

function ldx_talk_1_3_1(nType)
	local nTimes = GetTask(TASK_FIELD_PVP_TAIXU);
	if nTimes >= 3 then
		Talk(1,"",format("H«m nay ®· hoµn thµnh %d lÇn, ngµy mai h·y quay l¹i!", 3));
		return 0;
	end
	if gf_Judge_Room_Weight(10,300,"") ~= 1 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	if IsActivatedVipCard() ~= 1 then
		Talk(1, "", g_NpcName.."Ng­¬i ch­a kÝch ho¹t thÎ th¸ng hoÆc thÎ ho¹t ®éng!");
		return 0;
	end
	if GetItemCount(2, 97, 236) < 6 then
		Talk(1,"",g_NpcName..format("Sè l­îng <color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", "Thiªn Kiªu LÖnh", 6));
		return 0;
	end
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."§iÓm tinh lùc cña ®¹i hiÖp kh«ng ®ñ!");
		return 0;
	end
	if DelItem(2, 97, 236, 6) ~= 1 then return 0; end
	SetTask(TASK_FIELD_PVP_TAIXU, nTimes + 1)
	yp_setValue(3,-5);
	for i = 1, 3 do yp_aw_giveAward_7(2, 4); end
	yp_aw_giveAward_8(2);
	yp_aw_giveAward_9();
	Talk(1,"",g_NpcName.."§a t¹ ®¹i hiÖp! §©y lµ quµ tÆng, h·y nhËn lÊy!");
	AddRuntimeStat(30, 3, 0, 1);
	--Íê³ÉÊÕ¼¯ÓñÆÇ
	gf_TeamOperateEX(function () 
  	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1103)");	
  end);
end

function ldx_talk_1_2(nType)
	local g_NpcName = tNpcName[nType][1];
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2) ~= 2 then
		Talk(1,"",g_NpcName.."§¹i HiÖp ch­a hoµn thµnh nhiÖm!");
	else
		ldx_talk_1(nType);
	end	
end

function ldx_talk_1_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	Talk(1,"",g_NpcName.."§· hñy bá nhiÖm vô!");
end

function ldx_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1);
	if nState == 1 then
		if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) == 1 then
			--------------------------
			--¸ø½±Àø
			yp_aw_giveAward_10();
			--------------------------
			Talk(1,"",g_NpcName.."§a t¹ ®¹i hiÖp! §©y lµ quµ tÆng, h·y nhËn lÊy!");
		else
			Say(g_NpcName.."GÆp khã kh¨n µ? Ng­¬i cã thÓ hñy bá nhiÖm vô nµy.",
				3,
				"\nHoµn thµnh nhiÖm vô [BÊt T×nh Chi Tinh]/#ldx_talk_2_2("..nType..")",
				"\nHñy bá nhiÖm vô [BÊt T×nh Chi Tinh]/#ldx_talk_2_1("..nType..")",
				"\nKÕt thóc ®èi tho¹i/nothing");
		end
	else
		Say(g_NpcName.."GÆp khã kh¨n µ? Ng­¬i cã thÓ hñy bá nhiÖm vô nµy.",
				3,
				"\nNhËn nhiÖm vô [BÊt T×nh Chi Tinh]/#ldx_talk_2_4("..nType..")",
				"\n*Bá qua nhiÖm vô [BÊt T×nh Chi Tinh]/#ldx_talk_2_3("..nType..")",
				"\nKÕt thóc ®èi tho¹i/nothing");
	end	
end

function ldx_talk_2_4(nType)
	local g_NpcName = tNpcName[nType][1];
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."§iÓm tinh lùc cña ®¹i hiÖp kh«ng ®ñ!");
		return 0;
	end
	yp_setValue(3,-5);
	gf_SetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1,1);
	Talk(1,"",g_NpcName..tNpcName[nType][4]);
end

function ldx_talk_2_3(nType)
	local g_NpcName = tNpcName[nType][1];
	local tSay = {
		format("\nX¸c nhËn/#ldx_talk_2_3_1(%d)", nType),
		"§Ó ta suy nghÜ/nothing",
	}
	local szCardName = "ThÎ th¸ng hoÆc ThÎ ho¹t ®éng"
	if IsActivatedVipCard() ~= 0 then
		szCardName = GetVipCardName(GetVipCardIndex());
	end
	Say(g_NpcName..format("%s sau khi kÝch ho¹t <color=green>%s<color> dïng <color=green>%s*%d<color> cã thÓ trùc tiÕp hoµn thµnh nhiÖm vô vµ nhËn th­ëng!", 
		gf_GetPlayerSexName(), szCardName, "Thiªn Kiªu LÖnh", 2), getn(tSay), tSay);
end

function ldx_talk_2_3_1(nType)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	if IsActivatedVipCard() ~= 1 then
		Talk(1, "", g_NpcName.."Ng­¬i ch­a kÝch ho¹t thÎ th¸ng hoÆc thÎ ho¹t ®éng!");
		return 0;
	end
	if GetItemCount(2, 97, 236) < 2 then
		Talk(1,"",g_NpcName..format("Sè l­îng <color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", "Thiªn Kiªu LÖnh", 2));
		return 0;
	end
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."§iÓm tinh lùc cña ®¹i hiÖp kh«ng ®ñ!");
		return 0;
	end
	if DelItem(2, 97, 236, 2) ~= 1 then return 0; end
	yp_setValue(3,-5);
	yp_aw_giveAward_10()
	Talk(1,"",g_NpcName.."§a t¹ ®¹i hiÖp! §©y lµ quµ tÆng, h·y nhËn lÊy!");
	AddRuntimeStat(30, 4, 0, 1);
end

function ldx_talk_2_2(nType)
	local g_NpcName = tNpcName[nType][1];
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) ~= 1 then
		Talk(1,"",g_NpcName.."§¹i HiÖp ch­a hoµn thµnh nhiÖm!");
	else
		ldx_talk_2(nType);
	end
end

function ldx_talk_2_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
	Talk(1,"",g_NpcName.."§· hñy bá nhiÖm vô!");	
end

function ldx_talk_3(nType)
	local g_NpcName = tNpcName[nType][1];
	local strtab = {};
	for i = 1,getn(tYupoName) do
		local nCount = GetItemCount(tYupoName[i][2][1],tYupoName[i][2][2],tYupoName[i][2][3]);
		if nCount ~= 0 then
			tinsert(strtab,format("Nép [%s]/#ldx_talk_3_1(%d)",tYupoName[i][1],i));
		end
	end
	tinsert(strtab,"trë l¹i/main");
	tinsert(strtab,"KÕt thóc ®èi tho¹i/nothing");
	Say(g_NpcName.."§¹i hiÖp ë Th¸i H­ Cæ Thô thu ho¹ch ®­îc “Ngäc Ph¸ch” cã thÓ ®Õn t×m ta ®Ó ®æi th­ëng.",
	getn(strtab),
	strtab)	
end

function ldx_talk_3_1(nType)
	local nCount = GetItemCount(tYupoName[nType][2][1],tYupoName[nType][2][2],tYupoName[nType][2][3]);
	if nCount <= 0 then
		Talk(1,"","Trªn ng­êi ®¹i hiÖp kh«ng cã “Ngäc Ph¸ch”!");
		return 0;
	end
	local nRoom = nCount*3
	if gf_Judge_Room_Weight(nRoom,200,"") ~= 1 then
		return 0;
	end
	if DelItem(tYupoName[nType][2][1],tYupoName[nType][2][2],tYupoName[nType][2][3],nCount) == 1 then
		for i = 1,nCount do
			yp_aw_giveAward_8(nType);
		end
	end
end

function ldx_talk_4(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(2,"main",g_NpcName.."Ngäc Ph¸ch Chi Tinh: §¹i hiÖp nÕu muèn nhËn nhiÖm vô nµy, sÏ nhËn ®­îc <color=yellow>2<color> h¹t gièng.\n§¹i hiÖp cã thÓ mang ®Õn <color=yellow>Th¸i H­ Cæ Thô<color> thuéc thÕ lùc cña m×nh ®Ó trång, h¹t gièng <color=yellow>mçi 2 giê<color> sÏ chÝn 1 lÇn. Khi h¹t gièng chÝn, ®¹i hiÖp cã thÓ chän ch¨m sãc hoÆc kh«ng.\nSau khi h¹t gièng chÝn 4 lÇn, ®¹i hiÖp sÏ nhËn ®­îc <color=yellow>Ngäc Ph¸ch<color> cña c¶ 2 c©y trång, sÏ cã thÓ hoµn thµnhNhiÖm vô.\n§¹i hiÖp cã thÓ ®Õn chç cña ta ®Ó giao nép Ngäc Ph¸ch, ta sÏ c¨n cø theo phÈm chÊt cña Ngäc Ph¸ch ®Ó ph¸t th­ëng.","BÊt T×nh Chi Tinh: §¹i hiÖp cã thÓ ®Õn ph¹m vi thÕ lùc ®èi ®Þch ®Ó t×m <color=yellow>Th¸i H­ Cæ Thô<color>, ®Ó lÊy <color=yellow>Ngäc Ph¸ch<color> xem nh­ tr¶ ®òa. Sau khi ®¹i hiÖp <color=yellow>thµnh c«ng trém ®­îc<color> Ngäc Ph¸ch, xem nh­ hoµn thµnh nhiÖm vô.")
end

function ldx_talk_5()
	local num = floor(GetCash() / 50000)
	AskClientForNumber("ldx_talk_5_cb", 0, num,"H·y nhËp sè l­îng cÇn mua","")
end

function ldx_talk_5_cb(num)
	if num <= 0 then return end
	if gf_Judge_Room_Weight(ceil(num / 999), 1, " ") ~= 1 then
		return 0;
	end
	if Pay(50000 * num) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30804, num}, "Ng­ng Tinh Lé", "Th¸i H­ Cæ Thô", "Mua Ng­ng Tinh Lé", 0, 1);
end