--Include("\\script\\lib\\floyd.lua")
--Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\tong_activity\\activity_function.lua")
--Include("\\script\\missions\\tong_activity\\pos_cfg.lua")
Import("\\script\\lib\\define.lua")

tSeriesNpcs = {
	"Ng� H�nh Kim S�",
	"Ng� H�nh M�c S�",
	"Ng� H�nh Th� S�",
	"Ng� H�nh Th�y S�",
	"Ng� H�nh H�a S�",
}

tSeriesKind = {
	" Kim ",
	"M�c",
	"Th�",
	"Th�y",
	"H�a",
}

function get_this_npc_name(nSeriesNo)
	return format("<color=green>%s:<color>", tSeriesNpcs[nSeriesNo]);
end

function on_npc_talk(nSeriesNo)
	local szNpcName = "<color=green>".. tSeriesNpcs[nSeriesNo] .."<color>: ";
	local szContent = "Ta c� th� truy�n chi�u th�c c�a ng��i cho c�ng ph�p h�".. tSeriesNpcs[nSeriesNo] ..". Nh�ng s�c m�nh Ng� H�nh qu� m�nh, 1 l�n ch� nh�n ���c 1 lo�i c�ng ph�p, n�u b�n th�n �� c� 1 lo�i c�ng ph�p, sau khi c� thu�c t�nh kh�c, c�ng ph�p tr��c �� s� bi�n m�t."
	local tMsg = {
		format("Ban cho ta chi�u th�c c�ng ph�p h� %s/#get_ablity(%d)", tSeriesKind[nSeriesNo], nSeriesNo),
		"R�i kh�i/nothing"
		}
	Say(szNpcName .. szContent,
		getn(tMsg),
		tMsg);
end

function get_ablity(nSeriesNo)
	for k, v in tSkillIds do
		if k ~= nSeriesNo then
			RemoveSkill(v);
		end		
	end
	local nSkillId = tSkillIds[nSeriesNo];
	LearnSkill(nSkillId);
	SetLRSkill(nSkillId,0);  --��һ������������������Ҽ�ͼ��
	LimitSkill(nSkillId); --ֻ��ʹ�øü���
--	if GetTask(TASKID_TONG_ACTIVITY_SERIES_KIND) ~= 0 then
--		local szTip2 = "�Ѿ���ù����Ͳ�Ҫ�����ˡ�";
--		Talk(1, "", get_this_npc_name(nSeriesNo) .. szTip2);
--		return 0;
--	end

	SetTask(TASKID_TONG_ACTIVITY_SERIES_KIND, nSeriesNo);
	Talk(1, "", tSeriesNpcs[nSeriesNo] .. "Nh�n ���c c�ng ph�p h�" .. tSeriesKind[nSeriesNo] .. "!");
end

function get_series_kind()
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	for k, v in tSeriesNpcs do
		if szName == v then
			return k;
		end
	end	
	return 0;
end

function main()
	local nSeriesNo = get_series_kind();
	on_npc_talk(nSeriesNo);
end