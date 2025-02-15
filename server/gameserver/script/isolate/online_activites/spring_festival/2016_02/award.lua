Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")


tItemCfg = {
	[PackItemId(2,1,31005)] = {"cailu"},
	[PackItemId(2,1,31006)] = {"newyearlishi"},
}
function handle_on_use_award(nIndex)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local nId = PackItemId(g,d,p)
	local t = tItemCfg[nId]
	
	if t then
		local szAward = t[1]
		if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
			return 0
		end
		if DelItemByIndex(nIndex, 1) == 1 then
    		if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
        		return 1
        	else
        		AddItem(g,d,p,1)
        	end
    	end
	end
end

function waizhuang( idx,nItemIdx )
	local tAward = {};
	local body = GetBody();
	tAward = tb_pt_award[idx][body]
	--award_by_list(tAward, 1, 是否提示, 0, 0)
	--
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
	 	return false;
	 end
	if DelItemByIndex(nItemIdx,1)~=1 then
		print(GetName(), "delete item fail", nItemIdx)
		return 
	end
	award_by_list(tAward, 1, 0, 0, 0)
end

function handle_use_ptwaizhuang( nItemIdx ) --1
	local Title = "<color=gold>Qu� Ngo筰 Trang-Thng<color>: H穣 ch鋘 m鉵 ngo筰 trang y猽 th輈h"
	local tbSay = {}
	tinsert(tbSay,format("%s/#waizhuang(1,%d)", "Nh竛h Уo Ti", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(2,%d)", "Con C�-Eo (п)", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(3,%d)", "Con C�-L璶g (п)", nItemIdx))
	tinsert(tbSay,format("%s/nothing", "H駓 b�"))
	Say(Title,getn(tbSay),tbSay)
end
function handle_use_hhwaizhuang( nItemIdx )	--2
	local Title = "<color=gold>Qu� Ngo筰 Trang-H祇 Hoa<color>: H穣 ch鋘 m鉵 ngo筰 trang y猽 th輈h"
	local tbSay = {}
	tinsert(tbSay,format("%s/#waizhuang(4,%d)", "Nh� � (Lam)", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(5,%d)", "Si猽 Phong (Lam)", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(6,%d)", "Oanh Tr莕 V� (Lam)", nItemIdx))
	tinsert(tbSay,format("%s/nothing", "H駓 b�"))
	Say(Title,getn(tbSay),tbSay)
end
function handle_use_taozhilihe( nItemIdx )	--3
	waizhuang(7,nItemIdx);
end

function handle_on_use_jubaoex()
	local szAward = "jubaoex"
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
		return 1
	end
	return 0
end