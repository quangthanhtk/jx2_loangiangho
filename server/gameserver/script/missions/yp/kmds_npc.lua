--��ľ��ʦ

Include("\\script\\missions\\yp\\award.lua");

g_NpcName = "<color=green>V� L�m Minh-Kh� M�c ��i S�<color>: ";
g_MaxRewardCount = 3;

function main()
	local strtab = {
		"Nh�n l�y ph�n th��ng./kmds_talk_2",
		"Gi�i thi�u Thi�n �m Th�m B�/kmds_talk_3",
		"K�t th�c ��i tho�i/nothing",
		};
	local nCurState = yp_checkRewardTime();
	if nCurState ~= 0 then
		local nCount = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState);
		tinsert(strtab,1,format("�� t� nh�n l�nh (%d/%d)/#kmds_talk_1(%d)",nCount,g_MaxRewardCount,nCurState));
	end
	Say(g_NpcName.."Nh�n v� b� ngo�i c�a Thi�n �m Th�nh ��a r�t y�n t�nh nh�ng th�t ra l� nguy hi�m kh�p n�i. T��ng truy�n g�n ��y t�p trung r�t nhi�u nh�n s� giang h�, nh�ng h�nh ��ng c�a h� r�t k� qu�c, d��ng nh� l� m�t h�t l� tr�. Tr��ng l�o B�ch Hi�u Sinh nh� ta �i �i�u tra t�nh h�nh, nh�ng Thi�n Ba D��ng Ph� c� chuy�n n�n c�n ta ��n �� g�p. Thi�u hi�p c� th� gi�p ta �i xem th� kh�ng? Nh� mang theo Huy Hi�u V� L�m Minh �� tr�nh b� ng��i c�a m�nh ng� th��ng.",
		getn(strtab),
		strtab);
end

function kmds_talk_1(nCurState)
	local nLastState = nCurState - 1;
	if nLastState == 0 then
		nLastState = 2;
	end
	local nLastAward = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nLastState);
	if nLastAward ~= 0 then
		Talk(1,"",g_NpcName.."L�o phu r�t h�i l�ng v� bi�u hi�n l�n tr��c c�a ��i hi�p, h�y nh�n l�y qu� t� l� c�a l�o phu r�i nh�n l�nh sau (C�n ph�i nh�n th��ng c�a tr�n tr��c).");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nNum = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
	if nNum >= 8 then
		gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
		SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
		return 0;
	end
	local nCurCount = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState);
	if nCurCount >= g_MaxRewardCount and nNum >= 1 then
		gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
		SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
		return 0;
	elseif nCurCount >= g_MaxRewardCount and nNum < 1 then
		Talk(1,"",g_NpcName.."Bi�u hi�n c�a thi�u hi�p khi�n l�o phu kh� l�ng ch�p nh�n, h�y ti�p t�c r�n luy�n r�i quay l�i sau.");
		return 0;
	end	
	gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
	gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState,nCurCount+1);
	gf_AddItemEx({tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],8-nNum},tPVPItemInfo[15][1]);
	Talk(1,"",g_NpcName.."���c, thi�u hi�p h�y c�m l�y huy hi�u n�y, ch�c th�nh c�ng nh�!");
	SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
end

function kmds_talk_2()
	local nState = 0;
	local nCurTime = yp_checkRewardTime();
	for i = 1,4 do
		nState = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,i);
		if nState ~= 0 then		
			break;
		end
	end
	if nState == 0 then
		Talk(1,"",g_NpcName.."��i hi�p kh�ng c� tham gia h�nh ��ng Thi�n �m Th�m B� l�n tr��c!");
		return 0;
	end
	if nState ~= nCurTime then --��һ������
		if gf_Judge_Room_Weight(4,20,"") ~= 1 then
			return 0;
		end		
		local nNum1 = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
		local nNum2 = GetTask(TASK_FIELD_PVP_REWARD_HANDED);
		if nNum1 ~= 0 or nNum2 ~= 0 then
			if nNum1 ~= 0 then
				if BigDelItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nNum1) ~= 1 then
					return 0;
				end
			end
			kmds_clearTaskID();
			yp_aw_giveAward_17(nNum1+nNum2);
		elseif GetTask(TASK_FIELD_PVP_REWARD_DEADNUM) >= 8 then
			kmds_clearTaskID();
			yp_aw_giveAward_17(0);
		else
			kmds_clearTaskID();
			Talk(1,"",g_NpcName.."Bi�u hi�n c�a thi�u hi�p khi�n l�o phu kh� l�ng ch�p nh�n, h�y ti�p t�c r�n luy�n r�i quay l�i sau.");
		end
	else --��ǰ����
		Talk(1,"",g_NpcName.."��i hi�p h�y b�nh t�nh, ��i h�nh ��ng Thi�n �m Th�m B� l�n n�y k�t th�c r�i h�y ��n nh�n th��ng!");
	end
end

function kmds_clearTaskID()
	SetTask(TASK_FIELD_PVP_REWARD_HANDED,0);
	SetTask(TASK_FIELD_PVP_REWARD_TIME1,0);
	SetTask(TASK_FIELD_PVP_REWARD_TIME2,0);
	SetTask(TASK_FIELD_PVP_REWARD_DEADNUM,0);	
end

function kmds_talk_3()
	local strtab = {
		"B�i c�nh/#kmds_talk_3_1(1)",
		"Ch� �/#kmds_talk_3_1(2)",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing",
	};
	Say(g_NpcName.."��i hi�p mu�n t�m hi�u v� vi�c g�?",
		getn(strtab),
		strtab)
end

function kmds_talk_3_1(nType)
	local strMsg = {
		"R�t nhi�u nh�n s� giang h� b� m�t l� tr� t�p trung t�i Thi�n �m Th�nh ��a, vi�c k� l� n�y �� g�y s� ch� � cho V� L�m Minh Ch�. M�t ng��i t� x�ng l� L�o Gi� c�a Kh� M�c ��i S� V� L�m Minh hy v�ng c�c h� c� th� t�m hi�u gi�p nguy�n nh�n.",
		format("%s\n%s\n%s",
			"H�ng ng�y Thi�n �m Th�nh ��a b� bo ph� b�i s��ng ��c, ch� t� 16:00-16:30 ho�c 22:00-22:30 th� s��ng ��c m�i ti�u tan v� c� th� v�o.",
			"    Khi v�o Thi�n �m Th�nh ��a c�n mang theo Huy Hi�u V� L�m Minh �� ch�ng t� th�n ph�n, khi b� k� ��ch ��nh tr�ng th��ng s� r�i ra m�t n�a huy ch��ng. M�i 10 ph�t th� �� t� c�a Kh� M�c ��i S� s� ��n ng��i � n�i ch� ��nh, ng��i ch� c�n giao n�p huy ch��ng l� ���c.",
			"    C�n c� theo s� l��ng huy ch��ng giao n�p th� Kh� M�c ��i S� s� b�y t� l�ng bi�t �n."
			)
		,
		}
	Talk(1,"kmds_talk_3",g_NpcName..strMsg[nType])
end