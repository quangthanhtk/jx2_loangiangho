--�һ����ű�
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\function\\ornament\\ornament.lua")

function main()
	sp_DailyReset();
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85, 1) ~= 1 then
		return 0;
	end
	local nTimes = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsDrop);
	if nTimes >= 3 then
		Talk(1,"",format("N�m m�i vui v�! ��i hi�p h�m nay �� nh�n h�t %d ph�n th��ng, h�y ��n ng�m hoa ��o v� nh�n th��ng v�o ng�y mai nh� !", 3));
		return 0;
	end
	--������60s
	if GetTime() - SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsChickTime) < 60 then
		Talk(1,"",format("C�n ��i %d gi�y m�i c� th� b�m ti�p �� r�t th��ng, ch�c c�c b�n may m�n!", 60));
		return 0;
	end
	if random(1000) <= 500 then
		return 0;
	end
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsDrop, nTimes + 1);
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsChickTime, GetTime());
	local tAward = {
		{31, 50, "spths_Exp()", 1},
		{31, 40, "spths_Fenghua()", 1},
		{31, 10, "spths_ClothesTicket()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1);
end

function spths_Exp()
	local tAward = {
		{2, 25, 66666666, 1},
		{2, 25, 88888888, 1},
		{2, 25, 166666666, 1},
		{2, 20, 288888888, 1},
		{2, 5, 388888888, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event T�t Kingsoft", "��o Hoa th�");
end

function spths_Fenghua()
	local nRand = random(1,100)
	local nScore = 0
	if nRand >= 1 and nRand <=60 then nScore = 1
	elseif nRand >=61 and nRand <= 90 then nScore = 5
	elseif nRand >=91 and nRand <= 95 then nScore = 10
	elseif nRand >=96 and nRand <= 99 then nScore = 20
	else   nScore = 40 end
	if nScore ~= 0 then
		ornament_add_score(nScore)
		Msg2Player(format("B�n nh�n ���c %d �i�m Phong Hoa!",nScore))
	end
end

-- function spths_ZhenQi() --���� ��Ϊ���绪����
-- 	local tAward = {
-- 		{31, 60, "AwardGenuineQi(10)", 1},
-- 		{31, 30, "AwardGenuineQi(50)", 1},
-- 		{31, 5, "AwardGenuineQi(100)", 1},
-- 		{31, 4, "AwardGenuineQi(500)", 1},
-- 		{31, 1, "AwardGenuineQi(1000)", 1},
-- 	}
-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "�з����ڻ", "�һ���");
-- end

function spths_getClothesTicket(nNum) -- ��װ�һ�ȯ
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2,1,31233,nNum,4}, "Phi�u ��i Ngo�i Trang", "Event T�t Kingsoft", "��o Hoa th�", 0, 1);
end

function spths_ClothesTicket()
	local nRand = random(1,100)
	if 	nRand >= 1 and nRand <= 50 then 
		spths_getClothesTicket(1)
	elseif nRand >= 51 and nRand <= 90 then 
		spths_getClothesTicket(2)
	else
		spths_getClothesTicket(4) 
	end
end

-- function spths_YinJuan()  ��������Ϊ��װ�һ�ȯ
-- 	local tAward = {
-- 		{31, 50, "ModifyYinJuan(10, 1)", 1},
-- 		{31, 40, "ModifyYinJuan(100, 1)", 1},
-- 		{31, 10, "ModifyYinJuan(1000, 1)", 1},
-- 	}
-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "�з����ڻ", "�һ���");
-- end