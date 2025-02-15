-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Judge_Room_Weight / gf_JudgeRoomWeight
-- Content			: 	检查背包是否足够空间/负重?
-- Return value	:	0: 不够/  1: 够
-- Parameter		:
--		+ nNeedRoom	(value)		:  背包空间需求
--		+ nNeedWeight (value)	:  负重需求
--		+ szMsgHead (string)		:  标题 （不规定)
-- Example		:	gf_Judge_Room_Weight ( 1, 10, " " ) --> =0 --> 不够空间; =1 --> 够空间
-- **********************************************************************************************************************

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--如果填了第三个参数 (if the 3rd param isn't nil)
			Talk(1,"",szMsgHead.."H祅h trang c馻 i hi謕 kh玭g  ch� tr鑞g ho芻 s鴆 l鵦 kh玭g , xin h穣 s緋 x誴 l筰 h祅h trang!");
		end;
		return 0;
	else
		return 1;
	end;
end;
function gf_JudgeRoomWeight(nNeedRoom,nNeedWeight,bShowMsg)
	return gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,bShowMsg);
end;

gf_CheckInv = gf_JudgeRoomWeight;