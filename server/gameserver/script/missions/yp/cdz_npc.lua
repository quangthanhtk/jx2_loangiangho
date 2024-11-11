Include("\\script\\missions\\yp\\yp_head.lua")

tNpcDir = {
	{1,2,3},
	{4,5,6},
	{7,8,9}
}

tCDZList = {
  [6000] = {
	  {"��i L� Truy�n ��o 1","�� Nh�t"},
	  {"��i L� Truy�n ��o 2","�� Nh�"},
	  {"��i L� Truy�n ��o 3","�� Tam"},
	  {"��i L� Truy�n ��o 4","�� T�"},
	  {"��i L� Truy�n ��o 5","�� Ng�"},
	  {"��i L� Truy�n ��o 6","�� L�c"},
	  {"��i L� Truy�n ��o 7","�� Th�t"},
	  {"��i L� Truy�n ��o 8","�� B�t"},
	  {"��i L� Truy�n ��o 9","�� C�u"},
	},
  [6100] = {
	  {"Th� Ph�n Truy�n ��o 1","�� Nh�t"},
	  {"Th� Ph�n Truy�n ��o 2","�� Nh�"},
	  {"Th� Ph�n Truy�n ��o 3","�� Tam"},
	  {"Th� Ph�n Truy�n ��o 4","�� T�"},
	  {"Th� Ph�n Truy�n ��o 5","�� Ng�"},
	  {"Th� Ph�n Truy�n ��o 6","�� L�c"},
	  {"Th� Ph�n Truy�n ��o 7","�� Th�t"},
	  {"Th� Ph�n Truy�n ��o 8","�� B�t"},
	  {"Th� Ph�n Truy�n ��o 9","�� C�u"},
	},
  [6200] = {
	  {"T�y H� Truy�n ��o 1","�� Nh�t"},
	  {"T�y H� Truy�n ��o 2","�� Nh�"},
	  {"T�y H� Truy�n ��o 3","�� Tam"},
	  {"T�y H� Truy�n ��o 4","�� T�"},
	  {"T�y H� Truy�n ��o 5","�� Ng�"},
	  {"T�y H� Truy�n ��o 6","�� L�c"},
	  {"T�y H� Truy�n ��o 7","�� Th�t"},
	  {"T�y H� Truy�n ��o 8","�� B�t"},
	  {"T�y H� Truy�n ��o 9","�� C�u"},
	},
}

tSomeFeihua = {
	[6000] = {
		"Thi�u hi�p c� mu�n tham ng� m�t �o�n ph�t ph�p c�ng v�i ta kh�ng?",
		"H�o h�n tha m�ng, ��y l� do � tr�n ��a xu�ng, n�n ta ��a l�i, ta th�t s� kh�ng bi�t!",
	},
	[6100] = {
		"Tho�t l�c ��o ch�ng sinh, gi�i tr� s�u lo�i phi�n n�o, tu l�c ban nh��c h�nh, nh�n ���c s�u lo�i ph�t th�n, sinh ra s�u lo�i tr� tu�. Thi�u hi�p qu� l� ng��i c� tu� c�n, hay l� ch�ng ta v� trong t� n�o!",
		"Quy�n kinh th� n�y qu� th�t r�t t�t, n�n t�ng cho thi�u hi�p, khi c� th�i gian h�y ��n nh� c�a ta tr� chuy�n nh�.",
	},	
	[6200] = {
		"Thi�u hi�p c� ��ng � gia nh�p kh�ng?",
		"���c r�i, tr�n ���ng �i ta nh�t ���c quy�n kinh th� n�y, n�u c�a ng��i th� h�y c�m l�y �i.",
	},
};

tFightNpc = {
	[6000] = {"��i L� Ho�ng T�c Qu�n S�","��i L� Ho�ng T�c Qu�n S�"},
	[6100] = {"Th� Ph�n Phi�n T�ng","Th� Ph�n Phi�n T�ng"},	
	[6200] = {"T�y H� Qu�n S�","T�y H� Qu�n S�"},
}

function main()
	local nNpcIdx = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIdx);
	local g_NpcName = "<color=green>"..strNpcName.."<color>: ";
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID = GetWorldPos();
	
	if nCamp == 0 or tMainMapID[nCamp] == nil then
		Talk(1,"",g_NpcName..tSomeFeihua[nMapID][1]);
		return 0;
	end
	if tMainMapID[nCamp][1] == nil or tMainMapID[nCamp][1] == nMapID then
		Talk(1,"",g_NpcName.."��i hi�p h�y ��n doanh tr�i phe ��ch �� �o�t kinh th�!");
		return 0;
	end
		
	if GetTask(TASK_FIELD_PVP_STEAL_BOOK) == 0 or GetTask(TASK_FIELD_PVP_STEAL_MAP) ~= nMapID then
		Talk(1,"",g_NpcName..tSomeFeihua[nMapID][1]);
		return 0;
	end

	if BigGetItemCount(2,95,825) >= 3 then
		Talk(1,"",g_NpcName.."Ng��i �� tr�m 3 Kim Cang Kinh r�i.");
		return 0;
	end

	local nNpcNum = 0;
	for i = 1,getn(tCDZList[nMapID]) do
		if tCDZList[nMapID][i][1] == strNpcName then
			nNpcNum = i;
			break;
		end
	end

	if nNpcNum ~= 0 then
		if gf_GetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum) == 1 then
			Talk(1,"",g_NpcName.."Ch� c�a ta �� h�t kinh th� �� ng��i tr�m r�i!");
			return 0;
		end
	
		local nDirX,nDirY = 0,0; --��λ
		for i=1,getn(tNpcDir) do
			for j = 1,getn(tNpcDir[i]) do
				if nNpcNum == tNpcDir[i][j] then
					nDirX = i;
					nDirY = j;
					break;
				end
			end
		end
		if nDirX == 0 or nDirY == 0 then
			return 0;
		end
		local a,b,c,d = find_neighbor(nDirX,nDirY,tNpcDir);
		local t = {a,b,c,d}
		local strMsg = "";
		local nNum = 0;
		for i = 1,getn(t) do
			if t[i] ~= 0 then
				if gf_GetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,t[i]) == 1 then
					nNum = nNum + 1;
				end
				if i > 1 then
					strMsg = strMsg..",";
				end
				strMsg = strMsg..tCDZList[nMapID][t[i]][2];
			end
		end
		if gf_GetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,nNpcNum) ~= 1 then --ľ�о���
			if gf_GetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum) ~= 1 then
				local tNpcCamp = {
					[6000] = 1,
					[6100] = 2,
					[6200] = 3
				};
				ModifyLife(GetLife()/2);
				local nIdx = CreateNpc(tFightNpc[nMapID][1],tFightNpc[nMapID][2],GetWorldPos());
				SetNpcLifeTime(nIdx,5*60);
				local nNpcCamp = tNpcCamp[nMapID];
				if tAllCamp[nNpcCamp] then
					SetCampToNpc(nIdx,tAllCamp[nNpcCamp]);
				end
				SetNpcScript(nIdx,"\\script\\missions\\yp\\monster_npc.lua");
				nIdx = CreateNpc(tFightNpc[nMapID][1],tFightNpc[nMapID][2],GetWorldPos());
				SetNpcLifeTime(nIdx,5*60);
				if tAllCamp[nNpcCamp] then
					SetCampToNpc(nIdx,tAllCamp[nNpcCamp]);
				end
				SetNpcScript(nIdx,"\\script\\missions\\yp\\monster_npc.lua");
				gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1,gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1)+1);
				gf_SetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum,1);
				Talk(1,"",g_NpcName.."Tr�n ng��i ta kh�ng c� Kim Cang Kinh, nh�ng ta th�y ���c "..strMsg.." trong s� ng��i truy�n ��o, c� ng��i mang theo "..nNum.." quy�n.");
			else
				Talk(1,"",g_NpcName.."Tr�n ng��i ta kh�ng c� Kim Cang Kinh, nh�ng ta th�y ���c "..strMsg.." trong s� ng��i truy�n ��o, c� ng��i mang theo "..nNum.." quy�n.");
			end
		else
			if gf_Judge_Room_Weight(2,10,"") ~= 1 then
				return 0;
			end
			gf_SetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum,1);
			gf_AddItemEx({2,95,825,1},"Kim Cang Kinh");
			if random(1,100) <= 1 then
				gf_AddItemEx({2,95,822,1},"Kim L�ng T�u");
			end
			Talk(1,"",g_NpcName..tSomeFeihua[nMapID][2]);
		end
	end
end

function find_neighbor(nDirX,nDirY,tb)
	local a,b,c,d = 0,0,0,0;
	local nLenth = getn(tb[nDirX]);
	local nHight = getn(tb);
	if nDirX > 1 and nDirX < nHight then
		a = tb[nDirX+1][nDirY];
		b = tb[nDirX-1][nDirY];
	elseif nDirX == 1 then
		a = tb[nDirX+1][nDirY];
	elseif nDirX == nHight then
		a = tb[nDirX-1][nDirY];
	end
	if nDirY > 1 and nDirY < nLenth then
		c = tb[nDirX][nDirY+1];
		d = tb[nDirX][nDirY-1];
	elseif nDirY == 1 then
		c = tb[nDirX][nDirY+1];
	elseif nDirY == nLenth then
		d = tb[nDirX][nDirY-1];
	end
	return a,b,c,d;
end
