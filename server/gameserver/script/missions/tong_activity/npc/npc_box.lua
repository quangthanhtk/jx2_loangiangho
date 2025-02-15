Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\isolate\\functions\\tong_extension\\main.lua")

tBoxNpcName = {
	"Rng Gi秈 1",
	"Rng Gi秈 2",
	"Rng T祅g B秓 у",
}

tTongActivity_TianGangPiece = {2,1,30390}

tPrizeContent = {
	[1] = {0, 500, 24}, --天罡令碎片数量，经验，活跃度
	[2] = {0, 250, 12},  --天罡令碎片数量，经验，活跃度
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

--阳光普照奖
function fetch_final_prize(nIdx)
	--检查是否已经领取过奖励
	if gf_GetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 1) ~= 0 then
		Talk(1,"","kh玭g th� nh薾 l筰 m閠 l莕 n鱝")
		return
	end
	local prize = tPrizeContent[nIdx];
	if not prize then
		return
	end
	--检查背包空间	
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then
		return 
	end
	--设置已经领奖标记
	gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 1, 1);
	--发放奖励
	local nLevel = GetLevel();
	-- local tItem = tTongActivity_TianGangPiece;
	gf_Modify("Exp", nLevel*nLevel*prize[2]);
	-- AddItem(tItem[1],tItem[2],tItem[3],prize[1]);
	TongExt_AddLiveness(prize[3])
	Talk(1, "", "Х nh薾 ph莕 thng ho箃 ng bang l莕 n祔!");
end

--随机奖励（藏宝图奖券兑奖）
function fetch_random_prize(nIdx)
	--检查是否已经领取过奖励
	if gf_GetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2) ~= 0 then
		Talk(1,"","kh玭g th� nh薾 l筰 m閠 l莕 n鱝")
		return
	end
	local prize = tPrizeContent[nIdx];
	if not prize then
		return
	end
	--检查背包空间	
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end	
	--设置已经领奖标记
	gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2, 1);
	local nRand = random(1,100);
	if nRand > 30 then
		Talk(1,"","Sau khi m� rng kh玭g ph竝 hi謓 c竔 g�, nh璶g b筺 nh薾 頲 100,000 kinh nghi謒.")
		gf_Modify("Exp",100000)
		return		--30%产生藏宝图碎片
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
	Talk(1, "", "Nh薾 頲 ph莕 thng T祅g B秓 у!");
end

function main()
	local nIdx = get_box_index();
	if nIdx <= 2 then
		fetch_final_prize(nIdx);
	else
		fetch_random_prize(nIdx);
	end
end