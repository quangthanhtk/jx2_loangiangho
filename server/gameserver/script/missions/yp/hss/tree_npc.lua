--̫�����

Include("\\script\\missions\\yp\\hss\\head.lua")
Include("\\script\\missions\\yp\\award.lua")
Import("\\script\\tmp_task_id_def.lua")

g_strFile = "\\script\\missions\\yp\\hss\\tree_npc.lua";

--���ֻ����
--�ṹ�������������Ŀ�������������֣����ӵ����������ӵ�������������֣�Ʒ�ʣ��ڼ��׶Σ���ֲʱ�䣬�����������ɵ�����t��
--���ӣ�
--tTreeSeed = {
--	[1] = {
--		PlayerName1 = {
--			[1] = {"һ���޻���",45,0,GetTime(),0;yupo = {������ id ���� Ʒ��}},
--			[2] = {},
--		},
--		PlayerName2 ...
--	},
--}
tTreeSeed = {};

tYupoRank = {};  --�������а�

g_NpcName = "<color=green>Th�i H� C� Th�<color>: "

g_nNeedTime = 15*60;  --��ˮʱ��
g_nGrownTime = 60*60; --����ʱ��
g_nFailTime = 90*60;  --����ʱ��
g_nWaterCount = 3; --��ˮ����

function main()
	local m,x,y = GetNpcWorldPos(GetTargetNpc());
	local nType = 0;
	if tPos[m].tree1[1][1] == x and tPos[m].tree1[1][2] == y then
		if tTreeSeed[1] == nil then
			tTreeSeed[1] = {};
		end
		nType = 1;
	end
	if tPos[m].tree2[1][1] == x and tPos[m].tree2[1][2] == y then
		if tTreeSeed[2] == nil then
			tTreeSeed[2] = {};
		end
		nType = 2;
	end	
	if tPos[m].tree3[1][1] == x and tPos[m].tree3[1][2] == y then
		if tTreeSeed[3] == nil then
			tTreeSeed[3] = {};
		end
		nType = 3;
	end
	
	if nType == 0 then
		print("nTypenTypenTypenType")
		return 0;
	end
	local strtab = {};
	local nMapID = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if tMainMapID[nCamp] and tMainMapID[nCamp][1] == nMapID then
		tinsert(strtab,"\nGieo h�t gi�ng/#tree_talk_1("..nType..")");
		tinsert(strtab,"\nXem t�nh tr�ng tr�ng/#tree_talk_2("..nType..")");
	elseif nCamp ~= 0 and gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1) == 1 then
		tinsert(strtab,"\nTr�m Ng�c Ph�ch/#tree_talk_3("..nType..")");
	end
	tinsert(strtab,"\nK�t th�c ��i tho�i/nothing");
	Say(g_NpcName.."ta l� m�t c�y c� th�!",
		getn(strtab),
		strtab);
end

function tree_clearTaskValue()
	if GetTask(TASK_FIELD_PVP_SEED_NUM) ~= 0 then
		local strName = GetName();
		for i,v in tTreeSeed do
			if v[strName] then			
				return 1;
			end
		end
		SetTask(TASK_FIELD_PVP_SEED_NUM,0);
		SetTask(TASK_FIELD_PVP_SEED_TIME,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end
	return 0;
end

--��ȡ������ id ���� Ʒ��
--����������Ʒ�� ������
function tree_getYupo(nQulity,nOp)
	local t = {};
	local nNum = ceil(random(g_nWaterCount-1, g_nWaterCount)*(nOp/g_nWaterCount)*(random(6,10)*0.1));
	if nNum <= 0 then return t; end
	local nYpQ = ceil(nQulity*(nOp/g_nWaterCount)*(random(6,10)*0.1));	
	for i = 1,getn(tYupoName) do
		if nYpQ >= tYupoName[i][3] then
			tinsert(t,tYupoName[i][1]);
			tinsert(t,tYupoName[i][2]);
			tinsert(t,nNum);
			tinsert(t,nYpQ);
			return t;
		end
	end
end

function tree_talk_1(nType)
	local nHour = tonumber(date("%H"));
	if nHour >= 20 or nHour <= 6 then 
		Talk(1,"",g_NpcName.."T� 7:00-20:00 m�i c� th� gieo h�t gi�ng!");
		return 0;
	end
	tree_clearTaskValue();
	if GetTask(TASK_FIELD_PVP_SEED_NUM) >= 2 then
		Talk(1,"",g_NpcName.."B�n �� gieo 2 h�t gi�ng r�i!");
		return 0;
	end
	local strtab = {};
	for i,v in tSeedName do
		for j=1,getn(v) do
			if GetItemCount(v[j][2][1],v[j][2][2],v[j][2][3]) >= 1 then
				tinsert(strtab,format("%s/#tree_talk_1_1(%d,%d,%d)",v[j][1],nType,i,j));
			end
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"",g_NpcName.."Tr�n ng��i c�c h� kh�ng c� h�t gi�ng!");
		return 0;
	end
	tinsert(strtab,"\nK�t th�c ��i tho�i/nothing");
	Say(g_NpcName.."Gieo h�t gi�ng n�o?",
		getn(strtab),
		strtab);
end

function tree_talk_1_1(nType,n,m)
	local tCurSeed = tSeedName[n][m];
	if DelItem(tCurSeed[2][1],tCurSeed[2][2],tCurSeed[2][3],1) == 1 then
		SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)+1);
		local nTime = tonumber(date("%H%M%S"));
		if GetTask(TASK_FIELD_PVP_SEED_NUM) == 1 then
			SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,nTime);
		else 
			SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,nTime);
		end
		local strName = GetName();
		if tTreeSeed[nType][strName] == nil then
			tTreeSeed[nType][strName] = {};
		end
		local nRand = random(tCurSeed[3][1],tCurSeed[3][2]); --Ʒ��
		local time = GetTime();
		local t = {tCurSeed[1],nRand,0,time,0,time}; --�������֣�Ʒ�ʣ��ڼ��׶Σ���ֲʱ�䣬�����������ɵ�����t
		tinsert(tTreeSeed[nType][strName],t);
		tTreeSeed[nType][strName].n = nil
		Talk(1,"",g_NpcName.."B�n ��i "..tCurSeed[1].."Gieo v�o trong Th�i H� C� Th�!");
		AddRuntimeStat(29, 6, 0, 1);
	end
end

function tree_talk_2(nType)
	local strName = GetName();
	if tTreeSeed[nType][strName] == nil or getn(tTreeSeed[nType][strName]) == 0 then
		Talk(1,"",g_NpcName.."B�n kh�ng gieo h�t gi�ng l�n c�y c� th� n�y!");
		return 0;
	end
	local strtab = {};
	for i = 1,getn(tTreeSeed[nType][strName]) do
		tinsert(strtab,format("\n%s/#tree_talk_2_1(%d,%d)",tTreeSeed[nType][strName][i][1],nType,i));
	end
	tinsert(strtab,"\nK�t th�c ��i tho�i/nothing");
	Say(g_NpcName.."Ch�n h�t gi�ng c�n thao t�c: ",
		getn(strtab),
		strtab);	
end

function tree_talk_2_1(nType,n)
--	gf_PrintTable(tTreeSeed)
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	local nCurTime = GetTime();
	local nGetTime = nCurTime - tCurSeed[6];
	local strtab = {};
	local strMsg = "";
	if nGetTime >= g_nFailTime then --������
		strMsg = "Ng�c Ph�ch c�a ng��i do kh�ng d�ng trong th�i gian d�i n�n �� m�c n�t.";
		tinsert(strtab,format("\nLo�i b� t�p ch�t/#tree_talk_2_4(%d,%d)",nType,n))
	elseif nGetTime >= g_nGrownTime then --�ﵽ�ջ�ʱ��
		if tCurSeed[3] < g_nWaterCount then
			tinsert(strtab,format("\nB� v�o Ng�ng Tinh L�/#tree_talk_2_2_item(%d, %d, %d)", nType, n, g_nWaterCount-tCurSeed[3]))
		end
		tCurSeed.yupo = tree_getYupo(tCurSeed[2],tCurSeed[5]); --�ϳ�����
		strMsg = format("%s,�� ch�n %d l�n.", tCurSeed[1], tCurSeed[3]);
		if getn(tCurSeed.yupo) > 0 then
			tinsert(strtab,format("\nThu ho�ch/#tree_talk_2_3(%d,%d)",nType,n));
		else
			tinsert(strtab,format("\nLo�i b� t�p ch�t/#tree_talk_2_4(%d,%d)",nType,n))
		end
	else
		local nDisTime = nCurTime - tCurSeed[4];
		if nDisTime >= g_nNeedTime and tCurSeed[3] < g_nWaterCount then --������ˮʱ��
			strMsg = format("%s, s� l�n �� ch�n: <color=yellow>%d<color>.",tCurSeed[1],tCurSeed[3]);
			tinsert(strtab,format("\nT��i n��c/#tree_talk_2_2_plant(%d,%d)",nType,n))
		elseif tCurSeed[3] < g_nWaterCount then --��ˮʱ��δ����δ�������
			strMsg = format("%s, s� l�n �� ch�n: <color=yellow>%d<color>, kho�ng c�ch l�n ch�n ti�p theo <color=yellow>%s<color>.",tCurSeed[1],tCurSeed[3],Get_Time_String(g_nNeedTime-(GetTime()-tCurSeed[4]),"hms"));
			tinsert(strtab,format("\nB� v�o Ng�ng Tinh L�/#tree_talk_2_2_item(%d, %d, 1)", nType, n))
		else
			strMsg = format("%s,�� ch�n.sau<color=yellow>%s<color>c� th� thu t�p",tCurSeed[1], Get_Time_String(g_nGrownTime - nGetTime,"hms"));
		end
	end	
	
	tinsert(strtab,"\nK�t th�c ��i tho�i/nothing");
	Say(g_NpcName..strMsg,
		getn(strtab),
		strtab)
end

function tree_talk_2_2_plant(nType, n)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	local nDisTime = GetTime() - tCurSeed[4];
	if nDisTime >= g_nNeedTime and tCurSeed[3] < g_nWaterCount then
		tree_talk_Watering(nType, n, 1);
	end
end

function tree_talk_2_2_item(nType, n, nNum)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	if GetItemCount(2, 1, 30804) < nNum then
		Talk(1,"",format("trong t�i %s s� l��ng kh�ng �� %d", "Ng�ng Tinh L�", nNum));
		return 0;
	end
	if DelItem(2, 1, 30804, nNum) == 1 then
		tree_talk_Watering(nType, n, nNum);
	end
end

function tree_talk_Watering(nType,n,nNum)
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	local strSeedName = tCurSeed[1];
	local nAwardType = 0;
	local nAwardTypeD = 0;
	local strMsg = "";
	if tCurSeed[3] < g_nWaterCount then
		tCurSeed[3] = tCurSeed[3]+nNum;
		tCurSeed[4] = GetTime();
		tCurSeed[5] = tCurSeed[5]+nNum;
		for i = 1,getn(tSeedName) do
			for j = 1,getn(tSeedName[i]) do
				if tSeedName[i][j][1] == strSeedName then
					nAwardType = i;
					nAwardTypeD = j
					break;
				end
			end
		end
		if nAwardType ~= 0 then
			for i = 1, nNum do
				yp_aw_giveAward_7(nAwardType, nAwardTypeD, tCurSeed[3]);
			end
		end
	end
end

function tree_talk_2_3(nType,n)
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)-1);
	if n == 1 then
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
	else 
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end	
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,1) == 1 then
		local nSur = gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2);
		gf_SetTaskByte(TASK_FIELD_PVP_SEED_SUR,2,nSur+1);
	end	
	if tCurSeed.yupo then
		--����
		tremove(tTreeSeed[nType][strName],n);
		tTreeSeed[nType][strName].n = nil;
		
		gf_AddItemEx(tCurSeed.yupo[2],tCurSeed.yupo[1],tCurSeed.yupo[3]);
		
		--���񴥷�
		--Include("\\script\\global\\events.lua")
		local tType = {
			["H� Kh�ng Ng�c Ph�ch_��c bi�t"] = 4,
			["M�c T� Ng�c Ph�ch_Nh�t ph�m"] = 3,
			["T� Tr�ch Ng�c Ph�ch_Nh� ph�m"] = 2,
			["B�ng T�m Ng�c Ph�ch_Tam ph�m"] = 1,
		}
		--EventOnTrigger(7, {name="�ռ���������", category=tType[tCurSeed.yupo[1]]});
		FireEvent("event_mission_task_award", "pvp", "yupo", tType[tCurSeed.yupo[1]])
		
		--cdkey�
  	gf_TeamOperateEX(function () 
  		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1103)");	
  	end);
	end
end

function tree_talk_2_4(nType,n)
	local strName = GetName();
	SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)-1);
	if n == 1 and GetTask(TASK_FIELD_PVP_SEED_NUM) ~= 0 then
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
	else 
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end
	tremove(tTreeSeed[nType][strName],n);
	tTreeSeed[nType][strName].n = nil;
	Talk(1,"",g_NpcName.."T�p ch�t �� ���c lo�i b�, ng��i c� th� ti�p t�c gieo h�t gi�ng r�i.");	
end

function tree_talk_3(nType)
--	gf_PrintTable(tTreeSeed)
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) == 1 then
		Talk(1,"",g_NpcName.."Ng��i �� tr�m Ng�c Ph�ch r�i, h�y mau �i giao tr� nhi�m v�.");
		return 0;
	end
	if gf_Judge_Room_Weight(4,10,g_NpcName) ~= 1 then
		return 0;
	end	
	if not tTreeSeed or type(tTreeSeed) ~= "table" then
		Talk(1,"",g_NpcName.."C�y n�y kh�ng c� Ng�c Ph�ch �� tr�m!");
		return 0;
	end
	local tCurSeed = tTreeSeed[nType];
	if not tCurSeed or type(tCurSeed) ~= "table" then
		Talk(1,"",g_NpcName.."C�y n�y kh�ng c� Ng�c Ph�ch �� tr�m!");
		return 0;
	end
	SetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE, 0);
	for i,v in tCurSeed do
		for j,k in v do
			if k.yupo == nil then
				if k[3] == g_nWaterCount then
					local t = tree_getYupo(k[2],k[5]);
					if t and t[3] and t[3] > 0 then
						local nNum = random(t[3]) - 1;
						if nNum > GetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE) then
							SetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE, nNum);
						end
						k.yupo = {t[1], t[2], t[3] - nNum, t[4]};
					end
				end
			end		
		end
	end
	DoWait(121,122,5);
end

function tree_talk_3_1()
	local nNum = GetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE);	
	if nNum <= 0 then
		Talk(1,"",g_NpcName.."C�y n�y kh�ng c� Ng�c Ph�ch �� tr�m!");
		return 0;
	end
	local tYupo = {
		{1, 40, "B�ng T�m Ng�c Ph�ch_Tam ph�m", {2,95,910}},
		{1, 40, "T� Tr�ch Ng�c Ph�ch_Nh� ph�m", {2,95,911}},
		{1, 19, "M�c T� Ng�c Ph�ch_Nh�t ph�m", {2,95,912}},
		{1, 1, "H� Kh�ng Ng�c Ph�ch_��c bi�t", {2,95,913}},
	}
	local nIndex = gf_GetRandItemByTable(tYupo, 100, 1)
	gf_AddItemEx(tYupo[nIndex][4], tYupo[nIndex][3], nNum);
	gf_SetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2,1);
end
