Import("\\script\\lib\\globalfunctions.lua")

function OnPutinCheck(param, idx, genre, detail, particular)
	if genre ~= 0 or detail ~= 105 or particular ~= 30006 then
		Talk(1,"","C�c h� ch� ���c ��i Mao Ng�u!")
		return 0
	end
	return 1
end

function OnPutinComplete(param)
	if gf_Judge_Room_Weight(2, 100) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	
	local tbChangeList = GetPutinItem();
	local nG, nD, nP = tbChangeList[1][2], tbChangeList[1][3], tbChangeList[1][4]
	if nG == nil or nD == nil or nP == nil then
		return 0
	end
	
	DelItemByIndex(tbChangeList[1][1],-1)
	gf_AddItemEx2({0,105,30006,1,4,-1,-1,-1,-1,-1,-1,-1,0}, "Mao Ng�u", "DoiLacDa" , "nh�n", 7*24*3600, 1)
	Msg2Player("C�c h� �� ��i th�nh c�ng!")
end