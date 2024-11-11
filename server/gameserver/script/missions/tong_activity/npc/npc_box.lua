Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\isolate\\functions\\tong_extension\\main.lua")

tBoxNpcName = {
	"R��ng Gi�i 1",
	"R��ng Gi�i 2",
	"R��ng T�ng B�o ��",
}

tTongActivity_TianGangPiece = {2,1,30390}

tPrizeContent = {
	[1] = {0, 500, 24}, --�������Ƭ���������飬��Ծ��
	[2] = {0, 250, 12},  --�������Ƭ���������飬��Ծ��
	[3] = {
		{2, 1, 31235, 1, 25}, 
		{2, 1, 31236, 1, 50}, 
		{2, 1, 31237, 1, 75}, 
		{2, 1, 31238, 1, 100}
	},
}

function get_box_index()
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	for k, v in tBoxNpcName do
		if szName == v then
			return k;
		end
	end	
	return 0;
end

--�������ս�
function fetch_final_prize(nIdx)
	--����Ƿ��Ѿ���ȡ������
	if gf_GetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 1) ~= 0 then
		Talk(1,"","kh�ng th� nh�n l�i m�t l�n n�a")
		return
	end
	local prize = tPrizeContent[nIdx];
	if not prize then
		return
	end
	--��鱳���ռ�	
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then
		return 
	end
	--�����Ѿ��콱���
	gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 1, 1);
	--���Ž���
	local nLevel = GetLevel();
	-- local tItem = tTongActivity_TianGangPiece;
	gf_Modify("Exp", nLevel*nLevel*prize[2]);
	-- AddItem(tItem[1],tItem[2],tItem[3],prize[1]);
	TongExt_AddLiveness(prize[3])
	Talk(1, "", "�� nh�n ph�n th��ng ho�t ��ng bang l�n n�y!");
end

--����������ر�ͼ��ȯ�ҽ���
function fetch_random_prize(nIdx)
	--����Ƿ��Ѿ���ȡ������
	if gf_GetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2) ~= 0 then
		Talk(1,"","kh�ng th� nh�n l�i m�t l�n n�a")
		return
	end
	local prize = tPrizeContent[nIdx];
	if not prize then
		return
	end
	--��鱳���ռ�	
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end	
	--�����Ѿ��콱���
	gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2, 1);
	local nRand = random(1,100);
	if nRand > 30 then
		Talk(1,"","Sau khi m� r��ng kh�ng ph�p hi�n c�i g�, nh�ng b�n nh�n ���c 100,000 kinh nghi�m.")
		gf_Modify("Exp",100000)
		return		--30%�����ر�ͼ��Ƭ
	end
	nRand = random(1,100);
	local nRes = 1;
	if nRand <= 25 then		nRes = 1;
	elseif nRand <=50 then nRes = 2;
	elseif nRand <=75 then nRes = 3;
	else					nRes = 4;
	end
	local tAward = prize[nRes];
	AddItem(tAward[1],tAward[2],tAward[3],1)
	Talk(1, "", "Nh�n ���c ph�n th��ng T�ng B�o ��!");
end

function main()
	local nIdx = get_box_index();
	if nIdx <= 2 then
		fetch_final_prize(nIdx);
	else
		fetch_random_prize(nIdx);
	end
end