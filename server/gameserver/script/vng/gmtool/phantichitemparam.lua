function OnPutinCheck(param, idx, genre, detail, particular)
	return 1
end


function OnPutinComplete(param)
	local szItem = "C∏c vÀt ph»m Æ≠Óc x„a:\n"
	local tbItemList = GetPutinItem();
	local nOp1, nLv1 = GetItemAttr(tbItemList[1][1],1)
	local nOp2, nLv2 = GetItemAttr(tbItemList[1][1],2)
	local nOp3, nLv3 = GetItemAttr(tbItemList[1][1],3)	
	Talk(1,"","Item ID: "..tbItemList[1][1].."\nOption ID:\n" .. nOp1 .. " - " .. nLv1 .. "\n" .. nOp2 .. " - " .. nLv2 .. "\n" .. nOp3 .. " - " .. nLv3)
end
