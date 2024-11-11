--����˫ӥ½��ȼ
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\lib\\define.lua")
tInfo = {
	["Tr�i B�c Song �ng L�c Nhi�n Phong"]	= {923,"Tr�i B�c Song �ng L�c Nhi�n Phong",	"Tr�i B�c Song �ng L�c Nhi�n Phong",TASKID_SW_USE_ANTIDOTE,1},--�����ţ�ģ��������ʾ����TASKID����Ҫ��Ϊ1��
	["Chi�n M� Ch�y Xa"]			= {945,"Chi�n M� Ch�y Xa",			"Chi�n M� Ch�y Xa",nil,nil,{"C�m d�y c��ng c�a chi�n m�/#get_horse(��Զ��ս��)"}},
	}
function get_horse(nNpcName)
	if not tInfo[nNpcName] then
		return 0;
	end
	local tFollow = tInfo[nNpcName];
	tFollow[3] = tFollow[3] or tFollow[2]
	if GetFollower() ~= 0 then
--		KillFollower();
	end
	SummonNpc(tFollow[2],tFollow[3]);
	if tFollow[4]  then
		tFollow[5] = tFollow[5] or 1;
		SetTask(tFollow[4],tFollow[5]);
	end
end

function main()
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);
	local tFollow ;
	if not tInfo[nNpcName] then
		return 0;
	end
	tFollow = tInfo[nNpcName];
	if tFollow[4]  then
		tFollow[5] = tFollow[5] or 1;
		if GetTask(tFollow[4]) == tFollow[5] then
			return 0;
		end
	end
	if tFollow[1] and tFollow[2] and 1 == tGtTask:check_cur_task(tFollow[1]) then
		if  tFollow[6] then
			Say("Chi�n M� Ch�y Xa:",getn(tFollow[6]),tFollow[6]);
			return 0;
		else
			get_horse(nNpcName)
		end
	end
end
