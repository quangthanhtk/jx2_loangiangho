TSKTEMP = 210
function OnPutinCheck(param, idx, genre, detail, particular)
	if genre ~= 0 or detail ~= 107 then
		Talk(1,"","Chÿ Æi“u chÿnh Æ≠Óc mÀt tﬁch")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	local tbItemList = GetPutinItem();
	local nItemID = tbItemList[1][1]
	SetTaskTemp(TSKTEMP, nItemID)
	AskClientForString("BookEdit_Done","",1,20, "NhÀp chÿ sË:")
end

function BookEdit_Done(szValue)
	local nItemID = GetTaskTemp(TSKTEMP) or 0
	if nItemID == 0 then
		return 0
	end
	local tbBookValue = SplitString(szValue)
	if getn(tbBookValue) < 6 then
		Talk(1,"","Gi∏ trﬁ kh´ng hÓp l÷.")
		return 0
	end
	SetBookInfo(nItemID, tbBookValue[1], tbBookValue[2], tbBookValue[3],tbBookValue[4] , tbBookValue[5], tbBookValue[6])
end


function SplitString(szData)
	tbDataTemp = {}
	while strlen(szData) > 0 do
		local nPosition = strfind(szData," ")
		local szDataTemp = ""
		if nPosition ~= nil then
			szDataTemp = strsub(szData,1,nPosition-1)
			szData = strsub(szData, nPosition + 1, strlen(szData))
		else
			szDataTemp = szData
			szData =""
		end
		tinsert(tbDataTemp, szDataTemp)
	end
	return tbDataTemp
end