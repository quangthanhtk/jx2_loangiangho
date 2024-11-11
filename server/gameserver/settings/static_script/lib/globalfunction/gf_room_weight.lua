-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Judge_Room_Weight / gf_JudgeRoomWeight
-- Content			: 	��鱳���Ƿ��㹻�ռ�/����?
-- Return value	:	0: ����/  1: ��
-- Parameter		:
--		+ nNeedRoom	(value)		:  �����ռ�����
--		+ nNeedWeight (value)	:  ��������
--		+ szMsgHead (string)		:  ���� �����涨)
-- Example		:	gf_Judge_Room_Weight ( 1, 10, " " ) --> =0 --> �����ռ�; =1 --> ���ռ�
-- **********************************************************************************************************************

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--������˵��������� (if the 3rd param isn't nil)
			Talk(1,"",szMsgHead.."H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!");
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