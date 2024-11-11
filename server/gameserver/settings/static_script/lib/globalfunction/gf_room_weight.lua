-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Judge_Room_Weight / gf_JudgeRoomWeight
-- Content			: 	¼ì²é±³°üÊÇ·ñ×ã¹»¿Õ¼ä/¸ºÖØ?
-- Return value	:	0: ²»¹»/  1: ¹»
-- Parameter		:
--		+ nNeedRoom	(value)		:  ±³°ü¿Õ¼äÐèÇó
--		+ nNeedWeight (value)	:  ¸ºÖØÐèÇó
--		+ szMsgHead (string)		:  ±êÌâ £¨²»¹æ¶¨)
-- Example		:	gf_Judge_Room_Weight ( 1, 10, " " ) --> =0 --> ²»¹»¿Õ¼ä; =1 --> ¹»¿Õ¼ä
-- **********************************************************************************************************************

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--Èç¹ûÌîÁËµÚÈý¸ö²ÎÊý (if the 3rd param isn't nil)
			Talk(1,"",szMsgHead.."Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!");
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