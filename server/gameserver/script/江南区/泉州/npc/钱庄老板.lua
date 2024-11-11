
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ç®×¯ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\saleoff\\proday.lua")

szNpcName = "<color=yellow>Chñ TiÒn Trang: <color>"
function main()
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	local nHour = tonumber(date("%H%M"))
	if nDate >= 20150211 and nDate <= 20150228 then
		tinsert(tbSay,"Ta muèn ®æi tiÒn lÎ (1 Thiªn Kiªu LÖnh ®æi ®­îc 20 tiÒn lÎ)/DoiTien")	
	end
	local nQuay = VNG_GetTaskPos(TSK_MATTICH_TIEUDAO, 7,6)	
	if nDate <= 20151030 then
		--if nHour >= 1900 and nHour < 2100 then
			local nLan = 15 - nQuay
			tinsert(tbSay, "Thö vËn may Hallowen, cßn l¹i: "..nLan.." lÇn/get_lucky_2thang9")
		--end
	end	
	tinsert(tbSay,"Rêi Khái/nothing")
	Say(szNpcName.."Thö vËn may ®ñ 15 lÇn th× ta cã quµ ®Æc biÖt cho ®¹i hiÖp.",getn(tbSay),tbSay)
	return
end

function DoiTien()
	AskClientForNumber("DoiTien_01",1,100,"Ng­¬i muèn ®æi bao nhiªu?");
end

function DoiTien_01(nMoney)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Ng­êi cßn sèng míi cã thÓ ®æi tiÒn!")
		return
	end	

	if gf_Judge_Room_Weight(1,100,1) ~= 1 then
		return
	end
	
	if GetItemCount(2,97,236) < nMoney then
		Talk(1,"",szNpcName.."Trong ng­êi kh«ng cã ®ñ sè l­îng Thiªn Kiªu LÖnh!")
		return
	end
	
	if DelItem(2,97,236,nMoney) == 1 then
		gf_AddItemEx2({2, 1, 30778, nMoney * 20}, "TiÒn LÎ", "§æiTiÒnLÎ", "NhËn", 0, 1);	
	end
end