Include("\\script\\isolate\\functions\\tong_extension\\main.lua")

--***********************************����������*****************************
--------------------------------------------����������BOSSʹ�ö���
Zgc_conf_task_boss = {			--��һ�ȼ�BOSS
	"C�n L�n N�",
	"B�i H�ng",
	"Li�u Ngh�",
	"H�ng Tuy�n",
	"H� C�nh Th�ng",
	"Nhi�p ��i Ch�y",
	"B� Phi Y�n",
}

Zgc_conf_task_box = {
	"R��ng c�a C�n L�n N� �� l�i",
	"R��ng c�a B�i H�ng �� l�i",
	"R��ng c�a Li�u Ngh� �� l�i",
	"R��ng c�a H�ng Tuy�n �� l�i",
	"R��ng s�t c�a H� C�nh Th�ng",
	"R��ng s�t c�a Nhi�p ��i Ch�y",
	"B�o r��ng c�a B� Phi Y�n",
}
Zgc_cong_task_usemapid = {
	{302,"Thanh Th�nh s�n"},		
	{327,"� M�ng B�"},
	{401,"�i�m Th��ng s�n"},
	{306,"Giang T�n Th�n"},
	{307,"Phong ��"},
	{405,"Ch�n n�i V� L�ng"},
	{406,"V� L�ng s�n"},
	{326,"M� Tuy�t s�n trang"},
	{310,"Ki�m M�n quan"},
	{311,"Ph�c Ng�u s�n"},
	{218,"Linh B�o s�n"},
	{202,"H�nh Hoa th�n"},
	{151,"V�n M�ng Tr�ch"},			
	{601,"��i Th�o Nguy�n 1"},
	{602,"��i Th�o Nguy�n 2"},
	{103,"��ng H�i H�i T�n 1"},
	{104,"��ng H�i H�i T�n 2"},
	{102,"��o Hoa ��o"},
	{207,"Nh� Long s�n"},
	{217,"D� Tr� l�m"},
	{208,"L��ng S�n B�c"},
	{604,"Nh�n M�n quan"},
	{106,"Long Tuy�n Th�n"},
	{107,"V� Di s�n"},
	{600,"B� l�c V��ng K�"},
}

Zgc_award_lv1 = {
	{"V� ��i Trang S�c Ngo�i Trang",{2,1,31320,5,1},0,-1,1000,},
    {"R��ng Manh Manh",{2,1,31323,1,1},0,2592000,1000,},
    {"L�u Kim",{2,1,31096,1,1},0,-1,500,},
    {"Thi�n V�n Th�ch",{2,201,13,1,1},0,-1,100,},
    {"��ng T� Chi Nguy�n",{2,1,30913,1,1},0,-1,1000,},
    {"Phi�u ��i Ngo�i Trang",{2,1,31233,1,1},0,-1,1000,},
    {"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,1,1},0,-1,3100,},
    {"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,2,1},0,-1,1000,},
    {"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,5,1},0,-1,500,},
    {"Thi�n Cang L�nh",{2,95,204,1,1},1,-1,10,},
    {"Thi�n M�n Kim L�nh",{2,1,30370,1,1},1,-1,10,},
    {"C�y B�t Nh�",{2,0,398,1,1},0,-1,780,},
}

Zgc_award_lv2 = {
	{"V� ��i Trang S�c Ngo�i Trang",{2,1,31320,1,1},0,-1,500,},
	{"R��ng Manh Manh",{2,1,31323,1,1},0,2592000,1000,},
	{"L�u Kim",{2,1,31096,1,1},0,-1,1000,},
	{"Thi�n V�n Th�ch",{2,201,13,1,1},0,-1,500,},
	{"��ng T� Chi Nguy�n",{2,1,30913,1,1},0,-1,500,},
	{"Phi�u ��i Ngo�i Trang",{2,1,31233,1,1},0,-1,500,},
	{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,1,1},0,-1,2800,},
	{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,2,1},0,-1,2000,},
	{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,5,1},0,-1,500,},
	{"Thi�n Cang L�nh",{2,95,204,1,1},1,-1,5,},
	{"Thi�n M�n Kim L�nh",{2,1,30370,1,1},1,-1,5,},
	{"C�y B�t Nh�",{2,0,398,1,1},0,-1,690,},
}

Zgc_award_lv3 = {
	{"V� ��i Trang S�c Ngo�i Trang",{2,1,31320,1,1},0,-1,500,},
	{"R��ng Manh Manh",{2,1,31323,1,1},0,2592000,1000,},
	{"L�u Kim",{2,1,31096,1,1},0,-1,1000,},
	{"Thi�n V�n Th�ch",{2,201,13,1,1},0,-1,500,},
	{"��ng T� Chi Nguy�n",{2,1,30913,1,1},0,-1,500,},
	{"Phi�u ��i Ngo�i Trang",{2,1,31233,1,1},0,-1,500,},
	{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,1,1},0,-1,3500,},
	{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,2,1},0,-1,1000,},
	{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,5,1},0,-1,500,},
	{"C�y B�t Nh�",{2,0,398,1,1},0,-1,1000,},
}

function Zgc_getmaxrate(tAward)
    local ret = 0
    for i=1, getn(tAward) do
        ret = ret + tAward[i][5]
    end
    return ret
end

Zgc_conf_task_boss_award = {
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv2, 5, Zgc_getmaxrate(Zgc_award_lv2), 2000},
	{Zgc_award_lv2, 5, Zgc_getmaxrate(Zgc_award_lv2), 2000},
	{Zgc_award_lv1, 10, Zgc_getmaxrate(Zgc_award_lv1),4000},
}
--======================================ʹ���������ٻ�BOSS==============================
function OnUse(id)
	SetItemUseLapse(id,90)
	local mapID,X,Y = GetWorldPos()
	local chk_flag = 0
	for i = 1, getn(Zgc_cong_task_usemapid) do				--ʹ�õ�ͼ�ж�
		if Zgc_cong_task_usemapid[i][1] == mapID then
			chk_flag = 1
			break
		end
	end
	if chk_flag == 0 then
		Say("N�i ��y quan binh canh gi� nghi�m ng�t, ��m ng��i B� Phi Y�n to gan c�ch m�y c�ng kh�ng d�m b�n m�ng t�i, ng��i th� ��n ch� kh�c xem!",
			2,
			"Ta mu�n bi�t h�nh tung c�a B� Phi Y�n/Zgc_bfy_actmap_inq",
			"Ta bi�t r�i/Zgc_end_dialog"
		)		
	else														--����BOSS	
		local del_flag = DelItemByIndex(id,1)
		if del_flag ~= 1 then
			WriteLog("X�a Sinh Th�n Cang th�t b�i, ID th�t b�i:"..del_flag)
		else
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
			if boss_step == 37 then
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				AddRuntimeStat(87, 7, 0, 1)
				SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra B� Phi Y�n!")
				AddGlobalNews(GetTongName().."C� tin b�n h� �ang giao ��u v�i B� Phi Y�n!")
			elseif boss_step <= 33 then
				boss_seq = random(5,6)
				AddRuntimeStat(87, boss_seq, 0, 1)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra:"..Zgc_conf_task_boss[boss_seq].."!")
			else
				boss_seq = random(1,4)
				AddRuntimeStat(87, boss_seq, 0, 1)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra:"..Zgc_conf_task_boss[boss_seq].."!")
			end
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")
			WriteLog("Nhi�m v?B?Phi Y�n: Ng��i ch�i ["..GetName().."] s� d�ng Sinh Th�n C��ng g�i ra "..Zgc_conf_task_boss[boss_seq])
		end
	end
end
--********************************�����ٿ�ʹ�õ�ͼ��ѯ*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid) do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/4)-(i/4) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(19-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("B� Phi Y�n h�nh tung b�t ��nh, ng��i bi�t tung t�ch h�n ta ch� c�: \n"..dialog_string,
		1,
		"Ta bi�t r�i/Zgc_end_dialog"
	)
end
--**********************************BOSS��������***********************************
function Zgc_dropaward(tAward, nTimes, m,x,y, maxrate, bossName)
    for i = 1, nTimes do
        local rand = random(1,maxrate)
        for j = 1, getn(tAward) do  
            if tAward[j][5] >= rand then
                local time = tAward[j][4]
                DropItemWithParam(tAward[j][2][1],tAward[j][2][2],tAward[j][2][3],m,x,y,0,300,tAward[j][2][4], tAward[j][4])
                if tAward[j][3] == 1 then
                    -- ����ʱ������
                    local szMsg = format("%s �� b� ��nh b�i, r�i ra %s x%d", bossName, tAward[j][1], tAward[j][2][4])
                    AddGlobalNews(szMsg, 1)
                    local nTongId = GetTongID()
                    if nTongId ~= 0 and nTongId ~= nil then
                        SendTongMessage(szMsg)
                    end
                    
                end
                break
            else
                rand = rand - tAward[j][5]
            end
        end
    end
end

function Zgc_kill_announce(szBossName)
    local szMsg = format("Ch�c m�ng [%s] �� ��nh b�i %s!",GetName(), szBossName)    
    AddGlobalNews(szMsg, 1)
    Msg2Global(szMsg)
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        SendTongMessage(szMsg)
    end
end
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	local npc_level = 0
	local MapID,X,Y	= GetNpcWorldPos(index)
	---------------------------------�ж����ĸ�BOSS����------------------------------
	for i = 1, 7 do
		if Zgc_conf_task_boss[i] == npc_name then
			AddRuntimeStat(88, i, 0, 1)
			local taward = Zgc_conf_task_boss_award[i][1]
			local ntime = Zgc_conf_task_boss_award[i][2]
			local maxrate = Zgc_conf_task_boss_award[i][3]
			local tongCash = Zgc_conf_task_boss_award[i][4]
			Zgc_kill_announce(npc_name)
			Zgc_dropaward(taward, ntime, MapID,X,Y, maxrate, npc_name)
			TongExt_AddTongCash( tongCash )
			FireEvent("event_mission_affairs", "tongboss", "killboss", index)
		end
	end
end

function Zgc_end_dialog()

end