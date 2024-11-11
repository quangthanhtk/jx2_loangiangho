--File name:	ginseng_item.lua
--Describe:		�����˲νű�
--Create Date:	2009-3-25 15:51
--Author:		chenbenqian

Import("\\script\\lib\\globalfunctions.lua")

TASK_ID_GINSENG_NUM = 2129
TASK_ID_GINSENG_DATE = 2130
GINSENG_GIVE_EXP = 8000000

g_szLogTitle = "Nh�n S�m V�n N�m"

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"))
	if GetTask(TASK_ID_GINSENG_DATE) < nDate then
		SetTask(TASK_ID_GINSENG_DATE, nDate)
		SetTask(TASK_ID_GINSENG_NUM, 0)
	end

	if GetTask(TASK_ID_GINSENG_NUM) >= 200 then
		Talk(1,"","M�i nh�n v�t ch� c� th� s� d�ng t�i �a 200 Nh�n S�m V�n N�m trong 1 ng�y")
		return
	end

	if GetLevel() < 60 then
		Talk(1,"","��ng c�p kh�ng ��.")
		return
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		local szItemName = "Kinh nghi�m"
		local nItemNum = GINSENG_GIVE_EXP
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		ModifyExp(nItemNum)
		Msg2Player("B�n nh�n ���c  "..nItemNum.." "..szItemName)
		SetTask(TASK_ID_GINSENG_NUM, (GetTask(TASK_ID_GINSENG_NUM) + 1))
		WriteLogEx(g_szLogTitle, "Nh�n ���c", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
end
