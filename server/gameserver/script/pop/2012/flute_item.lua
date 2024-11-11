--����
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua")

nItemID1 = 2;
nItemID2 = 96;

function OnUse(nItemIdx)
	local nMapId,nMapX,nMapY = GetWorldPos();
tNpcInfo = {
	[117] = {{1663,1},920,2,TASKID_SW_ITEM_FLUTE_CD,nil, --���� {skillId,skillLevel},����ID��npcTypeNumber,itemUseCD
		{4,{"Li�u Qu�c Th�ch Kh�ch","Li�u Qu�c Th�ch Kh�ch",nMapId,nMapX,nMapY,-1,1,1,10},"\\script\\pop\\2012\\liaoguo_cike_npc.lua","\\script\\pop\\2012\\liaoguo_cike_npc.lua"},--{npcNum,{npcInfo(createNpc���� ����)},npcScript,}
		{1,{"Li�u Qu�c Th�ch Kh�ch Tinh Anh","Li�u Qu�c Th�ch Kh�ch Tinh Anh",nMapId,nMapX,nMapY,-1,1},"\\script\\pop\\2012\\liaoguo_cike_npc.lua","\\script\\pop\\2012\\liaoguo_cike_npc.lua"},
		},
	[132] = {nil,0,1,TASKID_SW_ITEM_ZLSSW_CD,5077,--����ɽʥ��
		{1,{"Linh T� T�","Linh T� T�",nMapId,nMapX,nMapY,},"\\script\\pop\\2012\\flute_item.lua","\\script\\pop\\2012\\flute_item.lua",},
		},
	}	
	
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= nItemID1 or d ~= nItemID2 or not tNpcInfo[p] then
		return 0;
	end  
	local tNpc 		=  tNpcInfo[p];
	local nNumIdx = 3;
	local nNpcTabStartIdx = 6; 
	local nNpcIdx = 0;
	local nCDTime	= 120;
	local nDis = 100;
	if not tNpc[nNumIdx] or tNpc[nNumIdx] < 1 then
		return 0;
	end 
	
	if tNpc[2] and tNpc[2] > 0 then
		if tGtTask:check_cur_task(tNpc[2]) ~= 1 then
			return 0;
		end
	end
	if type(tNpc[4]) == "number" and GetTime() - GetTask(tNpc[4]) < nCDTime then
		Talk(1,"","��o c� n�y m�i 2 ph�t m�i ���c d�ng 1 l�n!");
		return 0;
	end
	if tNpc[5] and tNpc[5] ~= nMapId then 
		Talk(1,"","H�y v�o V�n Trung �� s� d�ng v�t ph�m n�y.");
		return 0;
	end
--- �������⴦��
	if p == 117 and  nMapId ~= 600 and nMapId ~= 601 and nMapId ~= 602 then     
		Talk(1,"","H�y ��n B� l�c V��ng K�, ��i Th�o Nguy�n 1, ��i Th�o Nguy�n 2 s� d�ng v�t ph�m n�y!");
		return 0;
	end

	if p == 132 and abs(nMapX - 1587) < nDis and abs(nMapY - 3391) < nDis then
		Talk(1,"","H�y � ngo�i th�nh s� d�ng v�t ph�m n�y!");
		return 0;
	end
--
	for i = nNpcTabStartIdx,getn(tNpc) do
		local nIdx = i ;
		if tNpc[nIdx] and tNpc[nIdx][1] and tNpc[nIdx][2] and tNpc[nIdx][3] then
			for ii = 1,tNpc[nIdx][1] do
				tNpc[nIdx][3] = tNpc[nIdx][3] or "";
				nNpcIdx = CreateNpc(gf_UnPack(tNpc[nIdx][2]));
				SetNpcScript(nNpcIdx,tNpc[nIdx][3]);
				if tNpc[nIdx][4] and tNpc[nIdx][4] ~= ""then
					SetNpcDeathScript(nNpcIdx,tNpc[nIdx][4]);
				end
			end
		end
	end
	
	SetTask(tNpc[4],GetTime());
	if nNpcIdx ~= 0 and type(tNpc[1]) == "table" then
		DoSkill2Target(nNpcIdx,tNpc[1][1],tNpc[1][2],PIdx2NpcIdx(PlayerIndex));
	end
end

function OnDeath(nNpcIdx)
	if GetNpcName(nNpcIdx) == "Linh T� T�" then
		gf_AddItemEx({2,96,133,1,4},"M�nh ��o ��c Kinh");
		RemoveNpc(nNpcIdx);
	end
end