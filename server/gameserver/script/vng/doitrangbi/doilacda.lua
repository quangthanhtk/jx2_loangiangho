Import("\\script\\lib\\globalfunctions.lua")

function OnPutinCheck(param, idx, genre, detail, particular)
	if genre ~= 0 or detail ~= 105 or particular ~= 30006 then
		Talk(1,"","C¸c h¹ chØ ®­îc ®æi Mao Ng­u!")
		return 0
	end
	return 1
end

function OnPutinComplete(param)
	if gf_Judge_Room_Weight(2, 100) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	
	local tbChangeList = GetPutinItem();
	local nG, nD, nP = tbChangeList[1][2], tbChangeList[1][3], tbChangeList[1][4]
	if nG == nil or nD == nil or nP == nil then
		return 0
	end
	
	DelItemByIndex(tbChangeList[1][1],-1)
	gf_AddItemEx2({0,105,30006,1,4,-1,-1,-1,-1,-1,-1,-1,0}, "Mao Ng­u", "DoiLacDa" , "nhËn", 7*24*3600, 1)
	Msg2Player("C¸c h¹ ®· ®æi thµnh c«ng!")
end