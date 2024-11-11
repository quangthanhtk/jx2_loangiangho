--��һ���б��е�������Ʒ�����
--��ṹ = {
--      {����=1(��Ʒ), ����, {id1,id2,id3,count}, ����ʱ��(��������0), �Ƿ�Msg2Player},
--      {����=2(����), ����, 1=ҪMsg2Player��0�����ʾ����},
--}
--{����=3(��Ǯ), ����������ͭ��}
--{����=4(����), ����, 1=ҪMsg2Player��0����Ҫ}
--{����=5(ʦ�Ź��׶�), ����, 1=ҪMsg2Player��0�����ʾ����Ҫ}
--...�μ�gf_EventGiveCustomAward�е�����ֵ���˴�������������ֵ��1
--{����=31(�Զ�������), "�Զ��������Ҫdostring�Ĵ��룩", "�Զ����Msg2Player����������ʾ����Ҫ"}
--������szLogTitle ��־��¼����
--������szLogAction �ռ��м�¼����Ϊ
function gf_EventGiveAllAward(AllAwardList, szLogTitle, szLogAction,tAddRate)
    for i = 1, getn(AllAwardList) do
        local tbSubAward = AllAwardList[i];
        local nType = tbSubAward[1];
        if nType == 1 then--��Ʒ
            gf_AddItemEx2(tbSubAward[3], tbSubAward[2], szLogTitle, szLogAction, tbSubAward[4], tbSubAward[5]);
        else
            gf_EventGiveCustomAward(nType - 1, tbSubAward[2], tbSubAward[3], szLogTitle, szLogAction, 0, tAddRate);
        end
    end
end


--�����Ӹ��������,���ô˺���ǰ�����жϱ����͸���
--������RandAwardList =
--{����=1(��Ʒ), ����, ����, {id1,id2,id3,count}, ����ʱ��(��������0), �����⴦��0Ϊ�����⴦��1Ϊ�����͸�2Ϊ�����ɸ���}
--��������������1ʱ���ǰ����͸������Բ���4���Ǹ�table����������
--                                                     {
--                                                      {"��Ʒ����", {id1,id2,id3,count}}, --����1
--                                                      {"��Ʒ����", {id1,id2,id3,count}}, --����2
--                                                      {"��Ʒ����", {id1,id2,id3,count}}, --����3
--                                                      {"��Ʒ����", {id1,id2,id3,count}}, --����4
--                                                     }
--��������������2ʱ���ǰ����ɸ������Բ���4Ҳ�Ǹ�table�����Ǵ�ʱҪ��һ�µ�7��������������ʾ������û�������ɸ�һ�������Ʒ����������������
--                                                     {
--                                                      --���ɶ�Ӧ��Ʒ���б�
--                                                        [1] = {
--                                                        {"����"�� ����, {id1,id2,id3,����...}},--����ĳЩ�����ж��ֶ������������ﻹ��Ҫ���һ��
--                                                        {"����"�� ����, {id1,id2,id3,����...}},
--                                                        {"����"�� ����, {id1,id2,id3,����...}},
--                                                      },
--                                                      {--���ֻ��һ����Ʒ�����ʾ���100
--                                                        [2] = {"����", 100����, {id1,id2,id3,����...}},
--                                                      },
--                                                     }
-- �������͵���Ʒ�����б�
--{����=2(����), ����, ����, 1=ҪMsg2Player��0�����ʾ����}
--{����=3(��Ǯ), ����, ����������ͭ��}
--{����=4(����), ����, ����, 1=ҪMsg2Player��0����Ҫ}
--{����=5(ʦ�Ź��׶�), ����, ����, ������û������ѡ����������, 1=ҪMsg2Player��0�����ʾ����Ҫ}
--...�μ�gf_EventGiveCustomAward�е�����ֵ���˴�������������ֵ��1
--{����=31(�Զ�������), ����, "�Զ��������Ҫdostring�Ĵ��룩", "�Զ����Msg2Player����������ʾ����Ҫ"}
--������nMaxPE �Ǹ��ʵ����ֵ
--������nDefault ���û�����������ʹ�ô�Ĭ��ֵ
--������szLogTitle ��־��¼����
--������szLogAction �ռ��м�¼����Ϊ
function gf_EventGiveRandAward(RandAwardList, nMaxPE, nDefault, szLogTitle, szLogAction, nRand, bZhenQiTag)
	if RandAwardList == nil or getn(RandAwardList) == 0 or nMaxPE ==0 or nMaxPE == nil then
		return 0;
	end
	if nRand == nil or nRand < 1 then
  	nRand = gf_GetRandItemByTable(RandAwardList, nMaxPE, nDefault);
  end
  local nPlayerRoute = GetPlayerRoute();
  local tbSelected = RandAwardList[nRand];
  if tbSelected[1] == 5 and nPlayerRoute == 0 then
    nRand = tbSelected[4];
    tbSelected = RandAwardList[nRand];--�����������Ǹ�ʦ�Ź��׶������û�����ɣ���һ��Ԥ���õ�ѡ��
  end
  if tbSelected[1] == 1 and (tbSelected[7] ~= 0 and tbSelected[7] ~= nil) then
    if gf_CheckPlayerRoute(nPlayerRoute) == 0 then--û������
      nRand = tbSelected[7];
      tbSelected = RandAwardList[nRand];--�������������ɸ������������û�����ɣ���һ��Ԥ���õ�ѡ��
    end
  end
  --ȫ���㲥
  if tbSelected[8] ~= nil and tbSelected[8] == 1 then
  	Msg2Global(format("Ch�c m�ng ng��i ch�i %s trong %s nh�n ���c %s*%d",GetName(),szLogAction,tbSelected[3],tbSelected[4][4]));
  end
  local nType = tbSelected[1];
  if nType == 1 then
   	 local nSpecial = tbSelected[6];
  	 if not nSpecial or nSpecial == 0 then --����Ʒ�������⴦��
    	 	gf_AddItemEx2(tbSelected[4], tbSelected[3], szLogTitle, szLogAction, tbSelected[5], 1);
    	 	return nRand;
 	   elseif nSpecial == 1 then --�����͸���
				local nBody = GetBody();
				local sItem = tbSelected[4]; -- ���ͼ��ϵ��б�
				local nSize = getn(sItem) or 1
				for i = 1, nSize do
					gf_AddItemEx2(sItem[i][nBody][2], sItem[i][nBody][1], szLogAction, szLogAction, tbSelected[5], 1)
				end
				return nRand;
     elseif nSpecial == 2 then --�����ɸ���
				local sItem = tbSelected[4][nPlayerRoute];
				local tbRandRouteTable = {
				      [1] = {2, 3, 4},
				      [5] = {6},
				      [7] = {8, 9},
				      [10] = {11, 12},
				      [13] = {14, 15},
				      [16] = {17, 18},
				      [19] = {20, 21},
				      [22] = {23},
				      [28] = {29, 30},
				  };
				local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 29, 30};
				--������û�����ɣ�Ҫ��һ���㷨������������ɣ������������������������ɶ�û�룬�����е����һ��
				if nPlayerRoute == 0 then
				  local nRandRoute = tbRouteTable[random(1, getn(tbRouteTable))];
				  sItem = tbSelected[4][nRandRoute];
				else
				  if tbRandRouteTable[nPlayerRoute] ~= nil then --��������û������
				      local nRandRoute = tbRandRouteTable[nPlayerRoute][random(1, getn(tbRandRouteTable[nPlayerRoute]))];
				      sItem = tbSelected[4][nRandRoute];
				  end
				end
				local nMaxRoutePE = 0;   --���ʻ���
				local nRouteDefault = 0; --Ĭ������
				for i = 1, getn(sItem) do
				  nMaxRoutePE = nMaxRoutePE + sItem[i][2];
				  if sItem[i][2] > nRouteDefault then
				      nRouteDefault = sItem[i][2];
				  end
				end
				local nRouteRand = gf_GetRandItemByTable(sItem, nMaxRoutePE, nMaxRoutePE);
				--ȫ���������ˣ����Ը�������
				gf_AddItemEx2(sItem[nRouteRand][3], sItem[nRouteRand][1], szLogAction, szLogAction, tbSelected[5], 1);
				return nRand;
      end
  else
    gf_EventGiveCustomAward(nType - 1, tbSelected[3], tbSelected[4] or 1, szLogTitle, szLogAction, bZhenQiTag);
    return nRand;
  end
end

--Խ�ϰ泣�õ�����Ӿ��顢��Ǯ��ʦ�Ź��׶ȡ������Ĳ�����װ��ע�⵱���ʦ�Ź��׶�֮ǰ�������ⲿ��֤����Ѿ�������
--���� nType = 1���顢2��Ǯ��3������4ʦ�Ź��׶ȡ�5С�׾��衢6��׾��衢7�׾��ɵ���8��ũ����9�����衢10ǿЧ�����衢11�����ɵ���12�����衢13ǿЧ�����衢14�����ɵ���15������ˮ��16������¶��17�����ɵ���18����¶ˮ��19-25 1����ʯ��7����ʯ
--30�Զ�������, nValue��Ҫִ��������ַ�����nMsg2Player��Ҫ��ʾ����ҵ��ַ��������Ϊ�գ�����ʾ
--���� nValue ��ӵ�ֵ����Ǯ��λ��ͭ���׾��裬��ũ���������裬ʱ���Ƿ��ӣ�
--���� nMsgPlayer ���ʦ�Ź��׶Ⱥ������Ƿ���Ҫͨ�����
--����szLogTitle ��¼log�ı���
--����szLogAction ��¼log�е�action����������������nil�����ú����ж��õ����滻
--tAddRate = {nExpAddRate=1.5, nJunGongAddRate = 1.2,}
function gf_EventGiveCustomAward(nType, nValue, nMsg2Player, szLogTitle, szLogAction, bZhenQiTag,tAddRate)
    nMsg2Player = nMsg2Player or 0;
    --szLogAction = szLogAction or "";
    local szMsg2Player = "";
    local szItemName = "";
    local szLogDefAction = "";
    if nType == 1 then
    	local nExp = nValue
    	if tAddRate and tAddRate.nExpAddRate and type(tAddRate.nExpAddRate) == "number" then
    		nExp = nExp * tAddRate.nExpAddRate
    	end
        ModifyExp(nExp);
        szMsg2Player = format("Thu ���c %d �i�m kinh nghi�m", nExp);
        szItemName = "Kinh nghi�m";
        szLogDefAction = "Nh�n �i�m";
    elseif nType == 2 then
        Earn(nValue);
        --szMsg2Player = format("������%d��ͭǮ", nValue);
        szMsg2Player = "";
        szItemName = " Kim ";
        szLogDefAction = "Nh�n ���c ti�n";
    elseif nType == 3 then
        ModifyReputation(nValue, 1);
        szMsg2Player = format("Thu ���c %d �i�m danh v�ng", nValue);
        szItemName = "Danh v�ng";
        szLogDefAction = "Thu ���c danh v�ng";
        nMsg2Player = 0;--����������ָ������ʾ��Ϣ���������ﲻ��ʾ
    elseif nType == 4 then
        SetTask(336, GetTask(336) + nValue);
        szMsg2Player = format("Thu ���c %d �i�m c�ng hi�n s� m�n", nValue);
        szItemName = "�i�m s� m�n";
        szLogDefAction = "Thu ���c �i�m c�ng hi�n s� m�n";
    elseif nType == 5 then
        SetTask(GLB_TASK_BAIJUWAN_SMALL, GetTask(GLB_TASK_BAIJUWAN_SMALL) + nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t b�ch c�u ho�n", nValue);
        szItemName = "Th�i gian �y th�c b�ch c�u ho�n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c b�ch c�u ho�n";
    elseif nType == 6 then
        SetTask(GLB_TASK_BAIJUWAN_LARGE, GetTask(GLB_TASK_BAIJUWAN_LARGE) + nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t ��i b�ch c�u ho�n", nValue);
        szItemName = "Th�i gian �y th�c ��i b�ch c�u ho�n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c ��i b�ch c�u ho�n";
    elseif nType == 7 then
        SetTask(GLB_TASK_BAIJUXIANDAN, GetTask(GLB_TASK_BAIJUXIANDAN) + nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t b�ch c�u ti�n ��n", nValue);
        szItemName = "Th�i gian �y th�c b�ch c�u ti�n ��n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c b�ch c�u ti�n ��n";
    elseif nType == 8 then
        SetTask(GLB_TASK_SHENGNONGDAN, GetTask(GLB_TASK_SHENGNONGDAN) + nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t th�n n�ng ��n", nValue);
        szItemName = "Th�i gian �y th�c th�n n�ng ��n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c th�n n�ng ��n";
    elseif nType == 9 then
        EatLiushen(1, nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t l�c th�n ho�n", nValue);
        szItemName = "Th�i gian �y th�c l�c th�n ho�n";
        szLogDefAction = "Nh�n ���c th�i gian l�c th�n ho�n";
    elseif nType == 10 then
        EatLiushen(2, nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t c��ng l�c th�n ho�n", nValue);
        szItemName = "Th�i gian �y th�c c��ng l�c th�n ho�n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c c��ng l�c th�n ho�n";
    elseif nType == 11 then
        EatLiushen(3, nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t l�c th�n ti�n ��n", nValue);
        szItemName = "Th�i gian �y th�c l�c th�n ti�n ��n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c l�c th�n ti�n ��n";
    elseif nType == 12 then
        EatSanqin(1, nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t tam thanh ho�n", nValue);
        szItemName = "Th�i gian �y th�c tam thanh ho�n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c tam thanh ho�n";
    elseif nType == 13 then
        EatSanqin(2, nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t c��ng tam thanh ho�n", nValue);
        szItemName = "Th�i gian c��ng tam thanh ho�n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c c��ng tam thanh ho�n";
    elseif nType == 14 then
        EatSanqin(3, nValue);
        szMsg2Player = format("Nh�n ���c %d ph�t tam thanh ti�n ��n", nValue);
        szItemName = "Th�i gian �y th�c tam thanh ti�n ��n";
        szLogDefAction = "Nh�n ���c th�i gian �y th�c tam thanh ti�n ��n";
    elseif nType == 15 then
        EatXcl(1, nValue);
        szMsg2Player = format("��i hi�p �� nh�n ���c %d ph�t B�ng Lai Ti�n Th�y", nValue/60);
        szItemName = "Th�i gian B�ng Lai Ti�n Th�y";
        szLogDefAction = "Nh�n ���c th�i gian B�ng Lai Ti�n Th�y";
    elseif nType == 16 then
        EatXcl(2, nValue);
        szMsg2Player = format("��i hi�p �� nh�n ���c %d ph�t B�ng Lai Ti�n L�", nValue/60);
        szItemName = "Th�i gian B�ng Lai Ti�n L�";
        szLogDefAction = "Nh�n ���c th�i gian B�ng Lai Ti�n L�";
    elseif nType == 17 then
        EatXcl(3, nValue);
        szMsg2Player = format("��i hi�p �� nh�n ���c %d ph�t B�ng Lai Ti�n ��n", nValue/60);
        szItemName = "Th�i gian B�ng Lai Ti�n ��n";
        szLogDefAction = "Nh�n ���c th�i gian B�ng Lai Ti�n ��n";
    elseif nType == 18 then
        EatXcl(4, nValue);
        szMsg2Player = format("��i hi�p �� nh�n ���c %d ph�t B�ng Lai L� Th�y", nValue/60);
        szItemName = "Th�i gian B�ng Lai L� Th�y";
        szLogDefAction = "Nh�n ���c th�i gian B�ng Lai L� Th�y";
    elseif nType >= 19 and nType <= 25 then
        lspf_AddLingShiInBottle(nType-18,nValue)
        szMsg2Player = format("Ch�c m�ng b�n �� nh�n ���c %d linh th�ch c�p %d, linh th�ch n�y ���c ch�a trong t� linh ��nh", nType-18, nValue);
        szItemName = format("Linh th�ch c�p %d",nType-18);
        szLogDefAction = format("Nh�n ���c linh th�ch c�p %d",nType-18);
		elseif nType == 26 then
        ModifyPopur(nValue)
        szMsg2Player = format("C�c h� �� nh�n ���c %d �i�m tu luy�n", nValue);
        szItemName = "Luy�n";
        szLogDefAction = "Nh�n ���c tu luy�n";
    elseif nType == 27 then
    		nMsg2Player = 0;
    		if bZhenQiTag == 1 then
    			AwardGenuineQi(nValue);
    		else
	    		if ActivityAwardGenuineQiDaily(nValue) ~= 0 then
	        	szMsg2Player = format("C�c h� nh�n ���c %d �i�m ch�n kh�", nValue);
	        	szItemName = "Ch�n kh�";
	        	szLogDefAction = "Nh�n ch�n kh�";
	        	nMsg2Player = 0; 
	        end
	      end   
    elseif nType == 30 then
        dostring(nValue);
        nMsg2Player = 0;
    elseif nType == 31 then
    	    local nJunGong = nValue
    		if tAddRate and tAddRate.nJunGongAddRate and type(tAddRate.nJunGongAddRate) == "number" then
    			nJunGong = nJunGong * tAddRate.nJunGongAddRate
    		end
    	
    	  if GetTask(701) >= 0 then
    	  	SetTask(701, GetTask(701) + nJunGong)
    	  else
    	  	SetTask(701, GetTask(701) - nJunGong)
    	  end
    	  szMsg2Player = format("C�c h� nh�n ���c %d �i�m qu�n c�ng", nJunGong)
        szItemName = "C�ng tr�ng"
        szLogDefAction = "Nh�n ���c qu�n c�ng"
    elseif nType == 32 then
    	  SetTask(707, GetTask(707) + nValue)
    	  szMsg2Player = format("C�c h� nh�n ���c %d t�ch l�y chi�n tr��ng", nValue)
        szItemName = " �i�m t�ch l�y chi�n tr��ng"
        szLogDefAction = "Nh�n ���c �i�m t�ch l�y chi�n tr��ng"
    elseif nType == 33 then
    		SetTask(3105, GetTask(3105) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C�c h� �� nh�n ���c %d ph�t T� Linh Ho�n", nValue)
        szItemName = "Th�i gian T� Linh Ho�n"
        szLogDefAction = "Nh�n ���c th�i gian T� Linh Ho�n"   
    elseif nType == 34 then
    		SetTask(3106, GetTask(3106) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C�c h� nh�n ���c %d ph�t ��i T� Linh Ho�n", nValue)
        szItemName = "Th�i gian ��i T� Linh Ho�n"
        szLogDefAction = "Nh�n ���c th�i gian ��i T� Linh Ho�n"  
    elseif nType == 35 then
    		SetTask(3107, GetTask(3107) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C�c h� nh�n ���c %d ph�t T� Linh Ti�n ��n", nValue)
        szItemName = "Th�i gian T� Linh Ti�n ��n"
        szLogDefAction = "Nh�n ���c th�i gian T� Linh Ti�n ��n"   		
    elseif nType == 36 then
    		ModifyJinJuan(nValue, 1);
    		nMsg2Player = 0;
        szItemName = "Phi�u V�ng";
        szLogDefAction = "Nh�n ���c Phi�u V�ng";
    elseif nType == 37 then
    		local nCurr, nMax = ModifyEnergy(0, 1);
    		local nLast = nMax - nCurr;
    		if nLast < 0 then
    			return
    		end
    		if nValue > nLast then
    			nValue = nLast
    		end
    		ModifyEnergy(nValue, 1);
        nMsg2Player = 0;
        szItemName = "Tinh L�c";
        szLogDefAction = "Nh�n ���c Tinh l�c";    
    end

    if nMsg2Player ~= 0 then
        Msg2Player(szMsg2Player);
    end
    if szLogTitle then
        szLogAction = szLogAction or szLogDefAction;
        gf_WriteLogEx(szLogTitle, szLogAction, nValue, szItemName, nil, GetTongName())
    end
end

--���������Ʒ�·�װ���ڵ���ǰ���ж���ұ����͸���
--������tbItemIds�����Ʒ��IDtable��strName��Ʒ����,szLogTitle�ռ�ͷ,nExpireTime����ʱ��
--      szNpcName������NPC�����֣�nNoticeMsg�Ƿ���ʾ��ҿռ���ز���
--      nMsg2Player �Ƿ���ʾ����Ѿ��������Ʒ
--����ֵ��0�������,1�ɹ�,-1�ռ���ز���
function gf_AddItemEx2(tbItemIds, strName, szLogTitle, szLogAction, nExpireTime, nMsg2Player)
	nExpireTime = nExpireTime or 0;
	szLogTitle = szLogTitle or "";
	nMsg2Player = nMsg2Player or 0;
	
	if type(tbItemIds) ~= "table" or getn(tbItemIds) < 4 then
		WriteLog("["..szLogTitle.."]\tgf_AddItemEx2:\t tham s� l�i!");
		return 0;
	end
	
	local nCount = tbItemIds[4];
	if nCount == 0 then
		return
	end
	local nRet = 0;
	local nItemIdx = 0;
	local nFailedCount = 0;
	local nOkCount = 0;
	local nDropCount = 0;
	
	--Ĭ��ֵӦ��Ϊ1(�Ѽ���)
	local nStatus = tbItemIds[5] or 1
	if nStatus < 0 then
		nStatus = 99
	end
	nStatus = nExpireTime * 100 + nStatus
	
	if tbItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus,tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
	else
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus);
	end
	
	if nRet == 0 then
		nFailedCount = nFailedCount + nCount;
	elseif nRet == 2 then
		nDropCount = nDropCount + nCount;
	else
		nOkCount = nOkCount + nCount;
	end
	
--	if tbItemIds[5] ~= nil then
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],1,tbItemIds[5],tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--					SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	else
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3], 1);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--				SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	end
	
	local szMsg1 = format("Th�m th�nh c�ng %d c�i, th�m th�t b�i %d c�i, r�i ��t %d c�i", nOkCount, nFailedCount, nDropCount);--��עһ
	local szMsg2 = "Th�i gian t�n t�i v�t ph�m ���c ��t th�nh %d gi�y";--��ע��
	if nExpireTime <= 0 then
		szMsg2 = "";
	else
		szMsg2 = format(szMsg2, nExpireTime);
	end
	local szMsg3 = "";--��ע��
	local szTongName = GetTongName() or "";
	
	if nMsg2Player ~= 0 then
		Msg2Player("B�n nh�n ���c "..strName.."x"..nOkCount);
	end
	
	--��������־��¼��ʽ
	gf_WriteLogEx(szLogTitle, szLogAction, nCount, strName, nil, szTongName, nil, szMsg1, szMsg2, szMsg3);
	if nCount > 1 then
		return 1;
	else
		return nRet, nItemIdx
	end
end