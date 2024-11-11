--��ͯӱ\ͯ��֮
Import("\\script\\lib\\define.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

tInfo = {
	{930,},
	{77,},}

function goto_ziluoshan(nTask)
	nTask = nTask or 0;
--	if nTask == 0 then
--		NewWorld(5077,1606,3402);
--		return 0;
--	end
	CastState("state_block_left_skill",1,7*24*60*60);
	CastState("state_block_qinggong",2,7*24*60*60);
	CastState("state_lock",3,7*24*60*60);
	Restore()
	SetFightState(1);
	NewWorld(5077,1606,3402);
end

function leave_ziluoshan(nTask)
	nTask = nTask or 0;
	RemvoeTempEffect();
	SetFightState(0);
	NewWorld(5077,1627,3395);
end

function get_book()
	if gf_Judge_Room_Weight(1,10,"��o ��ng Khuynh Chi") ~= 1 then return 0; end
	if BigGetItemCount(2,96,142) >= 10  then
		Talk(1,"","Ng��i �� l�y �� kinh th� r�i, h�y mau �i giao cho ��o tr��ng T� La S�n-Nguy�n H� T� xem th�!");
		return 0;
	end
	local nCurLife = GetLife();
	local nMaxLife = GetMaxLife();
	local nValue = nCurLife/nMaxLife;
	local nCount = 1;
	if nCurLife == nMaxLife  then
		nCount = 5;
	elseif nValue  >= 0.8 then
		nCount = 4;
	elseif nValue >= 0.6 then
		nCount = 3;
	elseif nValue >= 0.4 then
		nCount = 2;		
	end
	gf_SetLogCaption("Nhi�m v� tu�n ho�n T� La S�n (Phi�n b�n 2012)")
	gf_AddItemEx({2,96,142,nCount,4},"T� La S�n Kinh Th�");
	Restore();
	NewWorld(5077,1606,3402);
end

function main()
	local nNpcIdx = GetTargetNpc()
	local sNpcName = GetNpcName(nNpcIdx);
	local nTask = 0;

	for i = 1,getn(tInfo) do
		if tGtTask:check_cur_task(tInfo[i][1]) == 1 then
			nTask = 1;
			break;
		end
	end
	if nTask == 0 then
		return 0;
	end
	local tMsg = {
	["��o ��ng D�nh Chi"] =  	format("Ta mu�n v�o T� La S�n-Khu Tu Luy�n!/#goto_ziluoshan(%d)",nTask),
	["��o ��ng M�n Chi"]	= 	format("Ta mu�n r�i kh�i T� La S�n-Khu Tu Luy�n!/#leave_ziluoshan(%d)",nTask),
	["��o ��ng Khuynh Chi"] = "Nh�n T� La S�n Kinh Th�./get_book",
	}
	if not tMsg[sNpcName] then
		return 0;
	end
	
	local strtab = {
		tMsg[sNpcName],
		"Ta ch� xem th� th�i./nothing",
		}
	Say(sNpcName .. ":",getn(strtab),strtab);
end