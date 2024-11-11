--������

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>�o�n Khinh Nh�n<color>: ","D��i ch�n n�i c�a b�n t� c� 3 c�y Th�i H�, t��ng truy�n n�m x�a do Th�i H� Ch�n Nh�n v�n du ��n ��y m� tr�ng. Nhi�u n�m nay lu�n c�nh l� um t�m. C�y c� th� n�y th�n k� � ch�, mang h�t gi�ng Th�i H� ��t v�o trong s� c� th� h�p th� linh kh� ��t tr�i. s� nh�n ���c Ng�c Ph�ch �� t�ng c�ng l�c.","Ta cho ng��i hai h�t gi�ng, hy v�ng ng��i h�y mang ��n ch� Th�i H� C� Th� �� tr�ng, ��ng th�i th�nh c�ng thu ho�ch 2 l�n.","T��ng truy�n, T�y H� v� Th� Ph�n c�ng c� c� th�. Nh�ng b�n v� l� � hai n��c �� c� gan d�m v�o n��c ta h�i tr�m Ng�c Ph�ch. Hy v�ng ng��i h�y ��n ch� <color=yellow>Qu�nh K�t ho�c H�ng Kh�nh<color> �� tr�m Ng�c Ph�ch 1 l�n, xem nh� l� g�y �ng ��p l�ng �ng!"},
	{"<color=green>C�c B�n C�c Qu�<color>: ","D��i ch�n n�i c�a b�n t� c� 3 c�y Th�i H�, t��ng truy�n n�m x�a do Th�i H� Ch�n Nh�n v�n du ��n ��y m� tr�ng. Nhi�u n�m nay lu�n c�nh l� um t�m. C�y c� th� n�y th�n k� � ch�, mang h�t gi�ng Th�i H� ��t v�o trong s� c� th� h�p th� linh kh� ��t tr�i. s� nh�n ���c Ng�c Ph�ch �� t�ng c�ng l�c.","C�c B�n C�c Qu�: Ta cho ng��i hai h�t gi�ng, hy v�ng ng��i h�y mang ��n ch� Th�i H� C� Th� �� tr�ng, ��ng th�i th�nh c�ng thu ho�ch 2 l�n.","T��ng truy�n, T�y H� v� ��i L� c�ng c� c� th�. Nh�ng b�n v� l� � hai n��c �� c� gan d�m v�o n��c ta h�i tr�m Ng�c Ph�ch. Hy v�ng ng��i h�y ��n ch� <color=yellow>H�ng Kh�nh ho�c Thi�n Long T�<color> �� tr�m Ng�c Ph�ch 1 l�n, xem nh� l� g�y �ng ��p l�ng �ng!"},	
	{"<color=green>L� ��c D�c<color>: ","D��i ch�n n�i c�a b�n m�n c� 3 c�y Th�i H�, t��ng truy�n n�m x�a do Th�i H� Ch�n Nh�n v�n du ��n ��y m� tr�ng. Nhi�u n�m nay lu�n c�nh l� um t�m. C�y c� th� n�y th�n k� � ch�, mang h�t gi�ng Th�i H� ��t v�o trong s� c� th� h�p th� linh kh� ��t tr�i. s� nh�n ���c Ng�c Ph�ch �� t�ng c�ng l�c.","Ta cho ng��i hai h�t gi�ng, hy v�ng ng��i h�y mang ��n ch� Th�i H� C� Th� �� tr�ng, ��ng th�i th�nh c�ng thu ho�ch 2 l�n.","T��ng truy�n, Th� Ph�n v� ��i L� c�ng c� c� th�. Nh�ng b�n v� l� � hai n��c �� c� gan d�m v�o n��c ta h�i tr�m Ng�c Ph�ch. Hy v�ng ng��i h�y ��n ch� <color=yellow>Qu�nh K�t ho�c Thi�n Long T�<color> �� tr�m Ng�c Ph�ch 1 l�n, xem nh� l� g�y �ng ��p l�ng �ng!"},
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
		Talk(1,"",g_NpcName.."Ta gi�p ���c g� cho ��i hi�p?");
		return 0;
	end
	local strtab = {
		"Ng�c Ph�ch Chi Tinh (Ti�u hao 5 �i�m tinh l�c)/#ldx_talk_1("..nType..")",
		"B�t T�nh Chi Tinh (Ti�u hao 5 �i�m tinh l�c)/#ldx_talk_2("..nType..")",
		"Cung ph�ng th�m/#ldx_talk_3("..nType..")",
		"Gi�i thi�u chi ti�t/#ldx_talk_4("..nType..")",
		format("Mua Ng�ng Tinh L� (%d v�ng/c�i)/ldx_talk_5", 5),
		"Kh�ng c� vi�c g�!/nothing",
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
			--������
			yp_aw_giveAward_9();
			--------------------------
			Talk(1,"",g_NpcName.."�a t� ��i hi�p! ��y l� qu� t�ng, h�y nh�n l�y!");
		else
			Say(g_NpcName.."G�p kh� kh�n �? Ng��i c� th� h�y b� nhi�m v� n�y.",
				3,
				"\nHo�n th�nh nhi�m v� [Ng�c Ph�ch Chi Tinh]/#ldx_talk_1_2("..nType..")",
				"\nH�y b� nhi�m v� [Ng�c Ph�ch Chi Tinh]/#ldx_talk_1_1("..nType..")",
				"\nK�t th�c ��i tho�i/nothing");
		end
	else
		Say(g_NpcName.."G�p kh� kh�n �? Ng��i c� th� h�y b� nhi�m v� n�y.",
				3,
				"\nNh�n nhi�m v� [Ng�c Ph�ch Chi Tinh]/#ldx_talk_1_4("..nType..")",
				"\n*B� qua nhi�m v� [Ng�c Ph�ch Chi Tinh]/#ldx_talk_1_3("..nType..")",
				"\nK�t th�c ��i tho�i/nothing");
	end
end

function ldx_talk_1_4(nType)
	local g_NpcName = tNpcName[nType][1];
	local nTimes = GetTask(TASK_FIELD_PVP_TAIXU);
	if nTimes >= 3 then
		Talk(1,"",format("H�m nay �� ho�n th�nh %d l�n, ng�y mai h�y quay l�i!", 3));
		return 0;
	end
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
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
		format("\nX�c nh�n/#ldx_talk_1_3_1(%d)", nType),
		"�� ta suy ngh�/nothing",
	}
	local szCardName = "Th� th�ng ho�c Th� ho�t ��ng"
	if IsActivatedVipCard() ~= 0 then
		szCardName = GetVipCardName(GetVipCardIndex());
	end
	Say(g_NpcName..format("%s sau khi k�ch ho�t <color=green>%s<color> d�ng <color=green>%s*%d<color> c� th� tr�c ti�p ho�n th�nh nhi�m v� v� nh�n th��ng!", 
		gf_GetPlayerSexName(), szCardName, "Thi�n Ki�u L�nh", 6), getn(tSay), tSay);
end

function ldx_talk_1_3_1(nType)
	local nTimes = GetTask(TASK_FIELD_PVP_TAIXU);
	if nTimes >= 3 then
		Talk(1,"",format("H�m nay �� ho�n th�nh %d l�n, ng�y mai h�y quay l�i!", 3));
		return 0;
	end
	if gf_Judge_Room_Weight(10,300,"") ~= 1 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	if IsActivatedVipCard() ~= 1 then
		Talk(1, "", g_NpcName.."Ng��i ch�a k�ch ho�t th� th�ng ho�c th� ho�t ��ng!");
		return 0;
	end
	if GetItemCount(2, 97, 236) < 6 then
		Talk(1,"",g_NpcName..format("S� l��ng <color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", "Thi�n Ki�u L�nh", 6));
		return 0;
	end
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
		return 0;
	end
	if DelItem(2, 97, 236, 6) ~= 1 then return 0; end
	SetTask(TASK_FIELD_PVP_TAIXU, nTimes + 1)
	yp_setValue(3,-5);
	for i = 1, 3 do yp_aw_giveAward_7(2, 4); end
	yp_aw_giveAward_8(2);
	yp_aw_giveAward_9();
	Talk(1,"",g_NpcName.."�a t� ��i hi�p! ��y l� qu� t�ng, h�y nh�n l�y!");
	AddRuntimeStat(30, 3, 0, 1);
	--����ռ�����
	gf_TeamOperateEX(function () 
  	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1103)");	
  end);
end

function ldx_talk_1_2(nType)
	local g_NpcName = tNpcName[nType][1];
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2) ~= 2 then
		Talk(1,"",g_NpcName.."��i Hi�p ch�a ho�n th�nh nhi�m!");
	else
		ldx_talk_1(nType);
	end	
end

function ldx_talk_1_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	Talk(1,"",g_NpcName.."�� h�y b� nhi�m v�!");
end

function ldx_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1);
	if nState == 1 then
		if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) == 1 then
			--------------------------
			--������
			yp_aw_giveAward_10();
			--------------------------
			Talk(1,"",g_NpcName.."�a t� ��i hi�p! ��y l� qu� t�ng, h�y nh�n l�y!");
		else
			Say(g_NpcName.."G�p kh� kh�n �? Ng��i c� th� h�y b� nhi�m v� n�y.",
				3,
				"\nHo�n th�nh nhi�m v� [B�t T�nh Chi Tinh]/#ldx_talk_2_2("..nType..")",
				"\nH�y b� nhi�m v� [B�t T�nh Chi Tinh]/#ldx_talk_2_1("..nType..")",
				"\nK�t th�c ��i tho�i/nothing");
		end
	else
		Say(g_NpcName.."G�p kh� kh�n �? Ng��i c� th� h�y b� nhi�m v� n�y.",
				3,
				"\nNh�n nhi�m v� [B�t T�nh Chi Tinh]/#ldx_talk_2_4("..nType..")",
				"\n*B� qua nhi�m v� [B�t T�nh Chi Tinh]/#ldx_talk_2_3("..nType..")",
				"\nK�t th�c ��i tho�i/nothing");
	end	
end

function ldx_talk_2_4(nType)
	local g_NpcName = tNpcName[nType][1];
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
		return 0;
	end
	yp_setValue(3,-5);
	gf_SetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1,1);
	Talk(1,"",g_NpcName..tNpcName[nType][4]);
end

function ldx_talk_2_3(nType)
	local g_NpcName = tNpcName[nType][1];
	local tSay = {
		format("\nX�c nh�n/#ldx_talk_2_3_1(%d)", nType),
		"�� ta suy ngh�/nothing",
	}
	local szCardName = "Th� th�ng ho�c Th� ho�t ��ng"
	if IsActivatedVipCard() ~= 0 then
		szCardName = GetVipCardName(GetVipCardIndex());
	end
	Say(g_NpcName..format("%s sau khi k�ch ho�t <color=green>%s<color> d�ng <color=green>%s*%d<color> c� th� tr�c ti�p ho�n th�nh nhi�m v� v� nh�n th��ng!", 
		gf_GetPlayerSexName(), szCardName, "Thi�n Ki�u L�nh", 2), getn(tSay), tSay);
end

function ldx_talk_2_3_1(nType)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	if IsActivatedVipCard() ~= 1 then
		Talk(1, "", g_NpcName.."Ng��i ch�a k�ch ho�t th� th�ng ho�c th� ho�t ��ng!");
		return 0;
	end
	if GetItemCount(2, 97, 236) < 2 then
		Talk(1,"",g_NpcName..format("S� l��ng <color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", "Thi�n Ki�u L�nh", 2));
		return 0;
	end
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
		return 0;
	end
	if DelItem(2, 97, 236, 2) ~= 1 then return 0; end
	yp_setValue(3,-5);
	yp_aw_giveAward_10()
	Talk(1,"",g_NpcName.."�a t� ��i hi�p! ��y l� qu� t�ng, h�y nh�n l�y!");
	AddRuntimeStat(30, 4, 0, 1);
end

function ldx_talk_2_2(nType)
	local g_NpcName = tNpcName[nType][1];
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) ~= 1 then
		Talk(1,"",g_NpcName.."��i Hi�p ch�a ho�n th�nh nhi�m!");
	else
		ldx_talk_2(nType);
	end
end

function ldx_talk_2_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
	Talk(1,"",g_NpcName.."�� h�y b� nhi�m v�!");	
end

function ldx_talk_3(nType)
	local g_NpcName = tNpcName[nType][1];
	local strtab = {};
	for i = 1,getn(tYupoName) do
		local nCount = GetItemCount(tYupoName[i][2][1],tYupoName[i][2][2],tYupoName[i][2][3]);
		if nCount ~= 0 then
			tinsert(strtab,format("N�p [%s]/#ldx_talk_3_1(%d)",tYupoName[i][1],i));
		end
	end
	tinsert(strtab,"tr� l�i/main");
	tinsert(strtab,"K�t th�c ��i tho�i/nothing");
	Say(g_NpcName.."��i hi�p � Th�i H� C� Th� thu ho�ch ���c �Ng�c Ph�ch� c� th� ��n t�m ta �� ��i th��ng.",
	getn(strtab),
	strtab)	
end

function ldx_talk_3_1(nType)
	local nCount = GetItemCount(tYupoName[nType][2][1],tYupoName[nType][2][2],tYupoName[nType][2][3]);
	if nCount <= 0 then
		Talk(1,"","Tr�n ng��i ��i hi�p kh�ng c� �Ng�c Ph�ch�!");
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
	Talk(2,"main",g_NpcName.."Ng�c Ph�ch Chi Tinh: ��i hi�p n�u mu�n nh�n nhi�m v� n�y, s� nh�n ���c <color=yellow>2<color> h�t gi�ng.\n��i hi�p c� th� mang ��n <color=yellow>Th�i H� C� Th�<color> thu�c th� l�c c�a m�nh �� tr�ng, h�t gi�ng <color=yellow>m�i 2 gi�<color> s� ch�n 1 l�n. Khi h�t gi�ng ch�n, ��i hi�p c� th� ch�n ch�m s�c ho�c kh�ng.\nSau khi h�t gi�ng ch�n 4 l�n, ��i hi�p s� nh�n ���c <color=yellow>Ng�c Ph�ch<color> c�a c� 2 c�y tr�ng, s� c� th� ho�n th�nhNhi�m v�.\n��i hi�p c� th� ��n ch� c�a ta �� giao n�p Ng�c Ph�ch, ta s� c�n c� theo ph�m ch�t c�a Ng�c Ph�ch �� ph�t th��ng.","B�t T�nh Chi Tinh: ��i hi�p c� th� ��n ph�m vi th� l�c ��i ��ch �� t�m <color=yellow>Th�i H� C� Th�<color>, �� l�y <color=yellow>Ng�c Ph�ch<color> xem nh� tr� ��a. Sau khi ��i hi�p <color=yellow>th�nh c�ng tr�m ���c<color> Ng�c Ph�ch, xem nh� ho�n th�nh nhi�m v�.")
end

function ldx_talk_5()
	local num = floor(GetCash() / 50000)
	AskClientForNumber("ldx_talk_5_cb", 0, num,"H�y nh�p s� l��ng c�n mua","")
end

function ldx_talk_5_cb(num)
	if num <= 0 then return end
	if gf_Judge_Room_Weight(ceil(num / 999), 1, " ") ~= 1 then
		return 0;
	end
	if Pay(50000 * num) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30804, num}, "Ng�ng Tinh L�", "Th�i H� C� Th�", "Mua Ng�ng Tinh L�", 0, 1);
end