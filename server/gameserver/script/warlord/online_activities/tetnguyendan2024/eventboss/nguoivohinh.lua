Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\masonmy\\task_manager.lua")
Import("\\script\\warlord\\preload.lua");

function OnRemove(NpcIdx)

	--local nValue= GetUnitCurStates(NpcIdx, 1) or 1;
	local nMapID,nX,nY = GetNpcWorldPos(NpcIdx)
	SetNpcRemoveScript(NpcIdx,"")
	SetNpcLifeTime(NpcIdx,0)
	--if WDate:Today() > 20240216 then
	--	return
	--end
	local szMsg = "Ng‰c S¨n Chi Linh xu t hi÷n trong Linh B∂o S¨n !";
	Msg2Global(szMsg);
	AddGlobalNews(szMsg);
	local nBossIdx = CreateNpc("WorldBoss_TJ", "Ng‰c S¨n Chi Linh", 218,random(204,233)*8, random(204,227)*16);
	if nBossIdx ~= 0 then
		SetNpcScript(nBossIdx,"\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\nienthu.lua")
		SetNpcRemoveScript(nBossIdx,  "\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\nguoivohinh.lua")
		WriteLog("[WBOSS_TNC:CreateBossEvent2024] success!");
		SetNpcLifeTime(nBossIdx, 600);
	else
		WriteLog("[WBOSS_TNC:CreateBossEvent2024] error!");
	end
end