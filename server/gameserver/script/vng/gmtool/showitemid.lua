function OnPutinCheck(param, idx, genre, detail, particular)
	return 1
end


function OnPutinComplete(param)
	local szItem = "C�c v�t ph�m ���c x�a:\n"
	local tbDelList = GetPutinItem();
	for i=1, getn(tbDelList) do
		szItem = szItem .. tbDelList[i][1] .. ": <color=yellow>" .. tbDelList[i][5] .. ":<color> " .. tbDelList[i][2] .. "," .. tbDelList[i][3] .. "," .. tbDelList[i][4] .. "\n"
	end
	Talk(1,"",szItem)
end
