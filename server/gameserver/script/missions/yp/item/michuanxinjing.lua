--�ؽ��ش��ľ�
Include("\\script\\missions\\yp\\award.lua")
Import("\\script\\tmp_task_id_def.lua")

g_nReadTime = 4*60;

tItemInfo = {
	{"T�ng Ki�m B� Truy�n T�m Kinh",2,95,823},
	{"B�ch Hi�u Sinh B� Ph�p",2,95,824},
}

function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	local nType = 0;
	for i = 1,getn(tItemInfo) do
		if g == tItemInfo[i][2] and d == tItemInfo[i][3] and p == tItemInfo[i][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then return 0; end
	
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","C�n ph�i gia nh�p th� l�c m�i ���c d�ng v�t ph�m n�y!");
		return 0;
	end
	if tMainMapID[nCamp][1] ~= nMapID then
--		print(nCamp)
--		print("tMainMapID[nCamp][1]",tMainMapID[nCamp][1],nMapID)
		Talk(1,"","V�t ph�m n�y ch� ���c d�ng � b�n �� th� l�c t��ng �ng c�a ��i hi�p!");
		return 0;
	end
	local nBookType = GetTask(TASK_FIELD_PVP_READ_TYPE);
	if nBookType ~= 0 and nBookType ~= nType then
		Talk(1,"","  "..tItemInfo[nBookType][1].."V�n ch�a ��c xong!");
		return 0;
	end
	local nReadTime = GetTask(TASK_FIELD_PVP_READING_TIME);
	if nReadTime ~= 0 and nReadTime >= g_nReadTime then
		Say("",
			2,
			"\n Nh�n ph�n th��ng/#bk_getAward("..nType..",2)",
			"\nK�t th�c ��i tho�i/nothing")	
		return 1;	
	end
	local nDistance = 0;
	local nTime = tonumber(date("%H%M"));
	for i=1,getn(tCreatTime) do
		if nTime >= tCreatTime[i] and nTime < tCreatTime[i]+15 then --15������
			for k = 1,getn(tPos[nMapID].chd) do
				local d = abs(nPosX-tPos[nMapID].chd[k][1])+abs(nPosY-tPos[nMapID].chd[k][2])
				if nDistance == 0 or nDistance > d then
					nDistance = d;
				end
			end
		end
	end
	if nDistance == 0 then
		Talk(1,"","Kh�ng ph�i th�i gian truy�n ��o kh�ng th� tham ng�!");
		return 0;
	end
	if nDistance > 40 then
		Talk(1,"","V�t ph�m n�y ph�i ��ng g�n �i�m C�i L�a m�i ���c s� d�ng!");
		return 0;
	end
	if nReadTime ~= 0 and nReadTime < g_nReadTime then
--		if GetTask(TASK_FIELD_PVP_READ_AWARD) ~= 1 then
--			Say("",
--				2,
--				"\n��ȡ����/#bk_getAward("..nType..",1)",
--				"\n�����Ի�/nothing")
--			if GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then --����״̬��
--				return 1;
--			end
		if GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then --����״̬��
			Talk(1,"","H�y ki�n nh�n ��c xong.");
			return 1;
		end
	elseif nReadTime ~= 0 and nReadTime >= g_nReadTime then
		Say("",
			2,
			"\n Nh�n ph�n th��ng/#bk_getAward("..nType..",2)",
			"\nK�t th�c ��i tho�i/nothing")	
		return 1;
	elseif GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then
		Talk(1,"","H�y ki�n nh�n ��c xong.");
		return 1;		
	end
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	NpcCommand(nPidxNpc,14,0,0,0); --����
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTask(TASK_FIELD_PVP_READ_STAR_TIME,GetTime());
	SetTask(TASK_FIELD_PVP_READ_TYPE,nType);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,1);
	nSecond = g_nReadTime-nReadTime
	SetCurrentNpcSFX(nPidxNpc,973,2,0,nSecond); --��Ч
	DoWait(123,124,nSecond);
end

function bk_readSuc()
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
	SetTask(TASK_FIELD_PVP_READING_TIME,g_nReadTime);
	Msg2Player("S�ch �� nghi�n c�u ho�n t�t, h�y nh�p �� nh�n th��ng!");
end

function bk_readFail()
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
	local nReadTime = GetTime();
	SetTask(TASK_FIELD_PVP_READING_TIME,GetTask(TASK_FIELD_PVP_READING_TIME)+nReadTime-GetTask(TASK_FIELD_PVP_READ_STAR_TIME));
	return 0;
end

function bk_getAward(nType,nAward)
	if nAward == 1 and GetTask(TASK_FIELD_PVP_READ_AWARD) ~= 1 then
		if gf_Judge_Room_Weight(5,200,"") ~= 1 then
			return 0;
		end
		SetTask(TASK_FIELD_PVP_READ_AWARD,1);
		bk_giveAward(nType);
	end
	if nAward == 2 then
		if gf_Judge_Room_Weight(5,200,"") ~= 1 then
			return 0;
		end		
		if DelItem(tItemInfo[nType][2],tItemInfo[nType][3],tItemInfo[nType][4],1) == 1 then
			SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
			SetTask(TASK_FIELD_PVP_READING_TIME,0);
			SetTask(TASK_FIELD_PVP_READ_STAR_TIME,0);
			SetTask(TASK_FIELD_PVP_READ_TYPE,0);
			SetTask(TASK_FIELD_PVP_READ_AWARD,0);
			bk_giveAward(nType);
		end
	end
end

function bk_giveAward(nType)
	if nType == 1 then
		yp_aw_giveAward_2();	
	elseif nType == 2 then
		yp_aw_giveAward_3();
	end
end