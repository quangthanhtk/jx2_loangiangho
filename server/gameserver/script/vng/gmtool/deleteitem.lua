function OnPutinCheck(param, idx, genre, detail, particular)
	return 1
end


function OnPutinComplete(param)
	local szItem = "C∏c vÀt ph»m Æ≠Óc x„a:\n"
	local tbDelList = GetPutinItem();
	for i=1, getn(tbDelList) do
		szItem = szItem .. "<color=yellow>" .. tbDelList[i][5] .. ":<color> " .. tbDelList[i][2] .. "," .. tbDelList[i][3] .. "," .. tbDelList[i][4] .. "\n"
		DelItemByIndex(tbDelList[i][1],-1)
	end
	Talk(1,"",szItem)
end
