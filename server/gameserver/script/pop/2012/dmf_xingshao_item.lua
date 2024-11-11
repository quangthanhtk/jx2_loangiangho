--����������
Import("\\script\\lib\\define.lua");
Import("\\script\\lib\\globalfunctions.lua");

sOtherMapMsg = "Ph�ng ho�ng nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, khu v�c n�y kh�ng c� t�nh b�o, b�o ng��i ��n <color=red>V�n Trung<color>, <color=red>T�ng Tuy�t Th�nh<color>, <color=red>H�ng Li�n S�n<color> t�m th�."
sAllMapFindMsg = "T�t c� t�nh b�o ��u b� ph�t hi�n.";

tTreasureTable = {
	[5077] = {          --�����鱨
{5077,1694,3221,},	
{5077,1681,3194,},	
{5077,1610,3228,},	
{5077,1592,3245,},	
{5077,1610,3264,},	
{5077,1700,3340,},	
{5077,1680,3331,},	
{5077,1660,3328,},	
{5077,1701,3333,},	
{5077,1701,3346,},	
{5077,1732,3370,},	
{5077,1742,3394,},	
{5077,1745,3407,},	
{5077,1737,3420,},	
{5077,1713,3446,},	
{5077,1727,3453,},	
{5077,1737,3453,},	
{5077,1733,3471,},	
{5077,1763,3398,},	
{5077,1761,3390,},	},
  [5079] = {--��ѩ���鱨
{5079,4008,11174,},	
{5079,4100,11298,},	
{5079,4095,11297,},	
{5079,4082,11282,},	
{5079,4080,11314,},	
{5079,3982,11318,},	
{5079,3995,11299,},	
{5079,3989,11282,},	
{5079,4025,11281,},	
{5079,3954,11294,},	
{5079,3970,11318,},	
{5079,3975,11267,},	
{5079,3984,11256,},	
{5079,3980,11210,},	
{5079,3985,11116,},	
{5079,4027,11155,},	
{5079,4054,11129,},	
{5079,4069,11127,},	
{5079,4056,11155,},	
{5079,4106,11156,},},
[5078] = {
{5078,1738,3173,},	
{5078,1753,3198,},	
{5078,1787,2770,},	
{5078,1698,3150,},	
{5078,1675,2763,},	
{5078,1650,2798,},	
{5078,1822,2731,},	
{5078,1855,3195,},	
{5078,1740,3240,},	
{5078,1673,3246,},	
{5078,1832,3224,},	
{5078,1679,3083,},	
{5078,1768,2830,},	
{5078,1841,2889,},	
{5078,1851,3257,},	
{5078,1846,3036,},	
{5078,1698,3178,},	
{5078,1823,3054,},	
{5078,1640,2819,},	
{5078,1779,2835,},	},
	}
	
tBitIdx = {
	[5077] = 1, [5079] = 2,[5078] = 3,
	}	
	
tAward = {
	[5077] = {"V�n Trung T�nh B�o",	{2,96,118,1,4}},
	[5079] = {"T�ng Tuy�t Th�nh T�nh B�o",{2,96,119,1,4},},
	[5078] = {"H�ng Li�n S�n T�nh B�o",{2,96,120,1,4},},
	}		
		
--TASKID_SW_CHECK_DOUBTFUL_GOODS  bit_1 bit_2 bit_3 ��¼3����ͼ�ı����Ƿ��ҵ���byte_2 ��¼�浽�ĵ�ͼ�����Idx
function OnUse(nItemIndex)
	local nMapID, nMapX, nMapY = GetWorldPos();
	--��ͼ����
	local nIdx1 = gf_GetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,2);
	if nIdx1 == 0 then 
			nIdx1 = random(1,getn(tTreasureTable[5077]));
			gf_SetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,2,nIdx1);
	end	
	if not tTreasureTable[nMapID] then
		Talk(1,"",sOtherMapMsg);
		return 0;
	end
	local tMapName = {" <color=red>V�n Trung<color> "," <color=red>T�ng Tuy�t Th�nh<color> "," <color=red>H�ng Li�n S�n<color> "};
	local sMapMsg = "Ph�ng ho�ng nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, khu v�c n�y kh�ng c� t�nh b�o, b�o ng��i ��n ";
--	local tMapNum = {"��Ѱ��","��Ѱ��"};
	if  gf_GetTaskBit(TASKID_SW_CHECK_DOUBTFUL_GOODS,tBitIdx[nMapID]) == 1 then --�����ͼ���鱨�Ѿ��������ˡ�
		local nUnfindMap = 0;
		for i = 1,3 do
			if gf_GetTaskBit(TASKID_SW_CHECK_DOUBTFUL_GOODS,i) == 0 then
				nUnfindMap = nUnfindMap + 1;
				sMapMsg = sMapMsg .. tMapName[i];
			end
		end
		if nUnfindMap == 0 then
			Talk(1,"",sAllMapFindMsg);
			return 0;
		else
			sMapMsg = sMapMsg .. " t�m th�.";
			Talk(1,"",sMapMsg);
			return 0;
		end
	end

	local tSet = tTreasureTable[nMapID][nIdx1];
	--�ڱ��ɹ�
	if nMapID == tSet[1] and nMapX > tSet[2] - 50 and nMapX < tSet[2] + 50 and nMapY > tSet[3] - 50 and nMapY < tSet[3] + 50 then
		if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
			return
		end
		gf_SetTaskBit(TASKID_SW_CHECK_DOUBTFUL_GOODS,tBitIdx[nMapID],1);
		gf_AddItemEx(tAward[nMapID][2], tAward[nMapID][1]);
		Talk(1, "", "Ph�ng ho�ng nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, v�t n�y ch�c l� t�nh b�o r�i.");
		return 0;
	end

	--����
	if tSet[2] - nMapX > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "Ph�ng ho�ng nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a ��ng c�ch ng��i kh�ng xa.");
		return
	end

	--����
	if nMapX - tSet[2] > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "Ph�ng ho�ng nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a t�y c�ch ng��i kh�ng xa.");
		return
	end

	--����
	if nMapY - tSet[3] > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "Ph�ng ho�ng nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a b�c c�ch ng��i kh�ng xa.");
		return
	end

	--����
	if tSet[3] - nMapY > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "Ph�ng ho�ng nghe th�y ti�ng hu�t sao li�n h��ng v� ng��i ra hi�u, ch�c l� t�nh b�o � ph�a nam c�ch ng��i kh�ng xa.");
		return
	end
end
