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
    		if CustomAwardGiveGroup(szAward, 0) > 0 then     --���Ų���Ϊ�Ƿ����ȫ������,�������1
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
	--award_by_list(tAward, 1, �Ƿ���ʾ, 0, 0)
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
	local Title = "<color=gold>Qu� Ngo�i Trang-Th��ng<color>: H�y ch�n m�n ngo�i trang y�u th�ch"
	local tbSay = {}
	tinsert(tbSay,format("%s/#waizhuang(1,%d)", "Nh�nh ��o T��i", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(2,%d)", "Con C�-Eo (��)", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(3,%d)", "Con C�-L�ng (��)", nItemIdx))
	tinsert(tbSay,format("%s/nothing", "H�y b�"))
	Say(Title,getn(tbSay),tbSay)
end
function handle_use_hhwaizhuang( nItemIdx )	--2
	local Title = "<color=gold>Qu� Ngo�i Trang-H�o Hoa<color>: H�y ch�n m�n ngo�i trang y�u th�ch"
	local tbSay = {}
	tinsert(tbSay,format("%s/#waizhuang(4,%d)", "Nh� � (Lam)", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(5,%d)", "Si�u Phong (Lam)", nItemIdx))
	tinsert(tbSay,format("%s/#waizhuang(6,%d)", "Oanh Tr�n V� (Lam)", nItemIdx))
	tinsert(tbSay,format("%s/nothing", "H�y b�"))
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
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --���Ų���Ϊ�Ƿ����ȫ������,�������1
		return 1
	end
	return 0
end