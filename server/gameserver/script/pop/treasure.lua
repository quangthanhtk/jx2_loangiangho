--���� �ر�ͼ
Include("\\script\\missions\\yp\\yp_head.lua")

TASK_ID_TREASURE = 3439;	--�����ر�ͼ

tTreasureTable = {
	{202,1531,2949},
	{202,1463,2836},
	{202,1402,2833},
	{202,1359,2939},
	{202,1371,3054},
	{202,1399,3171},
	{202,1566,3082},
	{202,1575,2884},
	{202,1471,2736},
}

function OnUse(nItemIndex)
	if GetTask(TASK_ID_TREASURE) == 0 then
		local nRand = random(1, getn(tTreasureTable));
		SetTask(TASK_ID_TREASURE, nRand);
	end

	local nIdx = GetTask(TASK_ID_TREASURE);
	local tSet = tTreasureTable[nIdx]
	local nMapID, nMapX, nMapY = GetWorldPos();

	--�ڱ��ɹ�
	if nMapID == tSet[1] and nMapX > tSet[2] - 50 and nMapX < tSet[2] + 50 and nMapY > tSet[3] - 50 and nMapY < tSet[3] + 50 then
		if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
			return
		end

		gf_AddItemEx({2, 96, 35, 1}, "Kho B�u Th�n B�");

		Talk(1, "", "H�nh nh� ng��i ��o ���c v�t g� ��, theo nh� T�ng B�o �� th� ��y ch�c l� khi b�u r�i, mang v� cho L� Gia Th�nh xem th�.");

		DelItem(2, 96, 34, 1);
		
		SetTask(TASK_ID_TREASURE, 0);
		return
	end

	--��ͼ����
	if nMapID ~= tTreasureTable[nIdx][1] then
		Talk(1, "", "Ng��i ��o kho b�u t�i ch�, nh�ng kh�ng t�m ���c g�. Theo nh� T�ng B�o �� th� kho b�u c�n c�ch r�t xa, h�y ��n H�nh Hoa Th�n t�m th�.");
		return
	end

	--����
	if tSet[2] - nMapX > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "Ng��i ��o kho b�u t�i ch�, nh�ng kh�ng t�m ���c g�. Theo nh� T�ng B�o �� th� kho b�u c�ch ��y kh�ng xa v� ph�a ��ng.");
		return
	end

	--����
	if nMapX - tSet[2] > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "Ng��i ��o kho b�u t�i ch�, nh�ng kh�ng t�m ���c g�. Theo nh� T�ng B�o �� th� kho b�u c�ch ��y kh�ng xa v� ph�a t�y.");
		return
	end

	--����
	if nMapY - tSet[3] > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "Ng��i ��o kho b�u t�i ch�, nh�ng kh�ng t�m ���c g�. Theo nh� T�ng B�o �� th� kho b�u c�ch ��y kh�ng xa v� ph�a b�c.");
		return
	end

	--����
	if tSet[3] - nMapY > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "Ng��i ��o kho b�u t�i ch�, nh�ng kh�ng t�m ���c g�. Theo nh� T�ng B�o �� th� kho b�u c�ch ��y kh�ng xa v� ph�a nam.");
		return
	end
end
