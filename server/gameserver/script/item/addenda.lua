--Õ³ÌùĞÄµÃ
function OnUse(id)
	local nRet = InsertAddenda(id)--Õ³Ìù¸½Â¼
	if nRet == -2 then
		Msg2Player("MËt tŞch cña b¹n ®· khãa, kh«ng thÓ thªm bİ kiÕp vµo!")
	elseif nRet == -3 then
		Msg2Player("Bİ kiÕp ®· khãa! Kh«ng thÓ thªm mËt tŞch vµo!")
	elseif nRet == -4 then
		Msg2Player("QuyÕt yÕu kü n¨ng gièng nhau chØ ®­îc sö dông 1 c¸i!")
	elseif nRet == -5 then
		Msg2Player("L­u ph¸i kh«ng thÓ n¹p vµo bİ quyÕt nµy!")
	end
end
