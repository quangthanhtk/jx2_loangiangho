--�Ƕᾭ��

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>�o�n Khinh H�u<color>: ","G�n ��y Th�n V��ng say m� ph�t h�c nh�ng s�ch trong t�ng kinh c�c �� b� m�t h�t, ��i hi�p h�y ��n ch� hai th� l�c kh�c �� m��n.","L�m phi�n ��i hi�p �� thay b�n v��ng ��n <color=yellow>Qu�nh K�t<color> �o�t v� 3 quy�n Kim Cang Kinh.","��i hi�p �� ��n <color=yellow>Qu�nh K�t<color> �o�t v� 3 quy�n Kim Cang Kinh ch�a?","L�m phi�n ��i hi�p �� thay b�n v��ng ��n <color=yellow>H�ng Kh�nh<color> �o�t v� 3 quy�n Kim Cang Kinh.","��i hi�p �� ��n <color=yellow>H�ng Kh�nh<color> �o�t v� 3 quy�n Kim Cang Kinh ch�a?"},
	{"<color=green>��t T�y �ng T�c<color>: ","�i, ba quy�n kinh th� quan tr�ng trong T�ng Kinh C�c c�a b�n t� �� kh�ng c�nh m� bay, theo nh� �� t� c�a Thanh M�c Nhai th� r�t c� th� �� b� c�c th� l�c kh�c l�y �i, ��i hi�p c� th� gi�p �� b�n t� vi�c n�y kh�ng?","L�m phi�n ��i hi�p thay b�n t�ng ��n <color=yellow>Thi�n Long T�<color> �o�t v� 3 quy�n Kim Cang Kinh.","��i hi�p �� ��n <color=yellow>Thi�n Long T�<color> �o�t v� 3 quy�n Kim Cang Kinh ch�a?","L�m phi�n ��i hi�p thay b�n t�ng ��n <color=yellow>H�ng Kh�nh<color> �o�t v� 3 quy�n Kim Cang Kinh.","��i hi�p �� ��n <color=yellow>H�ng Kh�nh<color> �o�t v� 3 quy�n Kim Cang Kinh ch�a?"},	
	{"<color=green>L� ��c Kh�nh<color>: ","G�n ��y L� t��ng qu�n m��n v�i quy�n kinh th� xem, kh�ng ng� b� ng��i kh�c l�m h� h�i. Ha Ha, ��i hi�p c� th� gi�p ta ��n ch� hai th� l�c c�n l�i �� tr�m kh�ng? T�i h� v� c�ng c�m k�ch!","L�m phi�n ��i hi�p thay ta ��n <color=yellow>Thi�n Long T�<color> �o�t v� 3 quy�n Kim Cang Kinh.","��i hi�p �� ��n <color=yellow>Thi�n Long T�<color> �o�t v� 3 quy�n Kim Cang Kinh ch�a?","L�m phi�n ��i hi�p thay ta ��n <color=yellow>Qu�nh K�t<color> �o�t v� 3 quy�n Kim Cang Kinh.","��i hi�p �� ��n <color=yellow>Qu�nh K�t<color> �o�t v� 3 quy�n Kim Cang Kinh ch�a?"},
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
		"Tr� �o�t kinh th� (Ti�u hao 5 �i�m tinh l�c)/#dqh_talk_1("..nType..")",
		"Gi�i thi�u chi ti�t/#dqh_talk_2("..nType..")",
		"Kh�ng c� vi�c g�!/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dqh_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = GetTask(TASK_FIELD_PVP_STEAL_BOOK);
	local tMapType = {
		[1] = {6100,6200},
		[2] = {6000,6200},
		[3] = {6000,6100},
	};
	if nState ~= 0 then
		if gf_Judge_Room_Weight(3,30,"") ~= 1 then
			return 0;
		end
		local nCount = BigGetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
		if nCount >= 3 then		
			if BigDelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],nCount) == 1 then
				yp_aw_giveAward_6();
				SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
				SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
				SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
				SetTask(TASK_FIELD_PVP_STEALED,0);
				Talk(1,"",g_NpcName.."�a t� ��i hi�p! ��y l� qu� t�ng, h�y nh�n l�y!");
			end
		else
			local nGoMap = GetTask(TASK_FIELD_PVP_STEAL_MAP);
			local nRandType = 0;
			if nGoMap == 0 then 
				nRandType = random(1,2);
				SetTask(TASK_FIELD_PVP_STEAL_MAP,tMapType[nType][nRandType]);			
			else
				for i = 1,getn(tMapType[nType]) do
					if tMapType[nType][i] == nGoMap then
						nRandType = i;
						break;
					end
				end
			end
			Say(g_NpcName..tNpcName[nType][(nRandType-1)*2+4],
				3,
				"\nHo�n th�nh nhi�m v� [Tr� �o�t kinh th�]/#dqh_talk_1_2("..nType..")",
				"\nH�y b� nhi�m v� [Tr� �o�t kinh th�]/#dqh_talk_1_1("..nType..")",
				"\nK�t th�c ��i tho�i/nothing");
		end
	else
		Say(g_NpcName.."��i hi�p mu�n nh�n nhi�m v� [Tr� �o�t kinh th�] kh�ng?",
				3,
				"\nNh�n nhi�m v� [Tr� �o�t kinh th�]/#dqh_talk_1_4("..nType..")",
				"\n*B� qua nhi�m v� [Tr� �o�t kinh th�]/#dqh_talk_1_3("..nType..")",
				"\nK�t th�c ��i tho�i/nothing");
	end
end

function dqh_talk_1_4(nType)
	local g_NpcName = tNpcName[nType][1];
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
		return 0;
	end
	yp_setValue(3,-5);
	local tNum = floyd_rm4n(9,3); --9ѡ3
	local nRand = 0;
	local strNum = "";
	for i = 1,3 do
		gf_SetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,tNum[i],1);
	end
	local tMapType = {
		[1] = {6100,6200},
		[2] = {6000,6200},
		[3] = {6000,6100},
	};
	local nRandType = random(1,2);
	SetTask(TASK_FIELD_PVP_STEAL_MAP,tMapType[nType][nRandType]);
	Talk(1,"",g_NpcName..tNpcName[nType][(nRandType-1)*2+3]);
end

function dqh_talk_1_3(nType)
	local g_NpcName = tNpcName[nType][1];
	local tSay = {
		format("\nX�c nh�n/#dqh_talk_1_3_1(%d)", nType),
		"�� ta suy ngh�/nothing",
	}
	local szCardName = "Th� th�ng ho�c Th� ho�t ��ng"
	if IsActivatedVipCard() ~= 0 then
		szCardName = GetVipCardName(GetVipCardIndex());
	end
	Say(g_NpcName..format("%s sau khi k�ch ho�t <color=green>%s<color> d�ng <color=green>%s*%d<color> c� th� tr�c ti�p ho�n th�nh nhi�m v� v� nh�n th��ng!", 
		gf_GetPlayerSexName(), szCardName, "Thi�n Ki�u L�nh", 3), getn(tSay), tSay);
end

function dqh_talk_1_3_1(nType)
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	if IsActivatedVipCard() ~= 1 then
		Talk(1, "", g_NpcName.."Ng��i ch�a k�ch ho�t th� th�ng ho�c th� ho�t ��ng!");
		return 0;
	end
	if GetItemCount(2, 97, 236) < 3 then
		Talk(1,"",g_NpcName..format("S� l��ng <color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", "Thi�n Ki�u L�nh", 3));
		return 0;
	end
	local nJlz = yp_getValue(3);
	if nJlz < 5 then
		Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
		return 0;
	end
	if DelItem(2, 97, 236, 3) ~= 1 then return 0; end
	yp_setValue(3,-5);
	local nStep = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1);
	gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1,2);
	yp_aw_giveAward_6();
	gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1,nStep);
	Talk(1,"",g_NpcName.."�a t� ��i hi�p! ��y l� qu� t�ng, h�y nh�n l�y!");
	AddRuntimeStat(30, 1, 0, 1);
end

function dqh_talk_1_2(nType)
	local g_NpcName = tNpcName[nType][1];
	local nCount = GetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
	if nCount >= 3 then
		dqh_talk_1(nType);
	else
		Talk(1,"",g_NpcName.."��i Hi�p ch�a ho�n th�nh nhi�m!");
	end
end

function dqh_talk_1_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
	SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
	SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
	SetTask(TASK_FIELD_PVP_STEALED,0);
	local nCount = BigGetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
	if nCount ~= 0 then
		BigDelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],nCount);
	end
	Talk(1,"",g_NpcName.."�� h�y b� nhi�m v�!");	
end

function dqh_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."��i hi�p c� th� ��n ph�m vi c�a th� l�c kh�c t�m 9 <color=yellow>Ng��i Truy�n ��o<color> v�o, 9 <color=yellow>Ng��i Truy�n ��o<color> n�y c�t gi� <color=yellow>3<color> Kim Cang Kinh. Ch�c ��i hi�p nhanh ch�ng l�y v�.")
end