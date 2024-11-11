--��ǿ���\�����������
Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")
function nothing()
end

function give_horse()
	local nFollowIdx = GetFollower();
	if nFollowIdx == 0 then
		Talk(1,"","��i hi�p kh�ng c� Chi�n M� Ch�y Xa.");
		return 0;
	end
	local sName, sTemplateName = GetNpcName(nFollowIdx);
	if sName == "Chi�n M� Ch�y Xa" and sTemplateName == "Chi�n M� Ch�y Xa" then
		KillFollower();
		SetTask(TASKID_SW_USE_ANTIDOTE,GetTask(TASKID_SW_USE_ANTIDOTE) + 1);
		Talk(1,"","Ng��i Canh Chu�ng: �a t�, ��i hi�p �� gi�p ta t�m ���c chi�n m�.");
	else
		Talk(1,"","��i hi�p kh�ng c� Chi�n M� Ch�y Xa.");
		return 0;
	end
end

function OnDeath()
	SetFightState(0);
	SetPos(1529,3339);
	SetTask(TASKID_SW_TASK1013,0);
	SetDeathScript("");
	return 1;
end

function go_to_exercise()
	local nRet =  NewWorld(5077,1574,3297);
	SetTask(TASKID_SW_TASK1013,1);
	if nRet == 0 then return 0; end
	SetFightState(1);
	RemvoeTempEffect();
	SetDeathScript("\\script\\pop\\2012\\horse_watcher_npc.lua");
	Restore();
	CastState("state_block_left_skill",1,7*24*60*60);
	CastState("state_block_qinggong",2,7*24*60*60);
	CastState("state_lock",3,7*24*60*60);
end

function leave_dmf()
	SetFightState(0);
	SetDeathScript("");
	SetTask(TASKID_SW_TASK1013,0);
	SetPos(1529,3339);
	RemvoeTempEffect();
end

function go_to_execution_ground()
	NewWorld(5078,1783,3324);
	RemvoeTempEffect();
	Restore();
--	LearnSkill(1781);
end

function leave_execution_ground()
	NewWorld(5078,1823,3264);
	RemvoeTempEffect();
--	RemoveSkill(1781)
end




	
tInfo = {
	["Ng��i Canh Chu�ng"]			= {{945},		"Ta mu�n giao n�p Chi�n M� Ch�y Xa/give_horse",},
	["��i Danh Ph� Di�n V� Quan"]	= {{76},	"Ta mu�n ti�n h�nh luy�n t�p di�n v�!/go_to_exercise","Ta ch� ti�n ���ng gh� ngang/nothing",},
	["V� Binh Di�n V� Tr��ng"]		= {nil,		"Ta mu�n r�i kh�i di�n v� tr��ng!/leave_dmf","Ta ch� ti�n ���ng gh� ngang/nothing",},
	["V� T��ng T�ng-Ph�p Tr��ng Kh�n Th�"] = {{78},	"Ta mu�n v�o Ph�p Tr��ng V� T��ng T�ng!/go_to_execution_ground","Ta ch� ti�n ���ng gh� ngang/nothing",},
	["�ao Ph� Ph�p Tr��ng"]		= {nil,		"Ta mu�n r�i kh�i Ph�p Tr��ng V� T��ng T�ng!/leave_execution_ground","Ta ch� ti�n ���ng gh� ngang/nothing",},
--	["��ͯӱ"]				= {{930,1014},	"��Ҫ��������ɽ�޵�����/goto_ziluoshan","��Ҫ�뿪����ɽ�޵�����/leave_ziluoshan"},
	}

function main()
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);
	if not tInfo[nNpcName] then
		return 0;
	end
	local bIfTask = 0;
	if type(tInfo[nNpcName][1]) == "table" then
		for i = 1,getn(tInfo[nNpcName][1]) do
			if type(tInfo[nNpcName][1][i]) == "number" and 1 == tGtTask:check_cur_task(tInfo[nNpcName][1][i]) then
				bIfTask = 1
				break;
			end
		end
	else
		bIfTask = 1;
	end
	
	if bIfTask ~= 1 then
		return 0;
	end
	
	local strtab = {}
	for i = 2,getn(tInfo[nNpcName]) do
		if type(tInfo[nNpcName][i]) == "string" then
			tinsert(strtab,tInfo[nNpcName][i])
		end
	end
	Say(nNpcName .. ":",
		getn(strtab),
		strtab)
end
