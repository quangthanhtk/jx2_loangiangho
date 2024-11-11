--Ã¿ÈÕÖ¸Òý½çÃæ»Øµ÷
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task_access_code_def.lua")

TASKID_DAILY_REGISTRATION = 3230
TASKID_DAILY_REG_AWARD_TAG = 3403

function dra_GetAwardTable()
	local szFile = "\\settings\\task\\daily_reg_award.txt";
	local tbFile = new(KTabFile, szFile)
	if not tbFile then
		TabFile_Unload(szFile)
		error(szFile);
	end
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	for i = 3, nRow do
		tbRet[i-2] = {};
		tbRet[i-2][1] = tonumber(tbFile:getCell(i, 1));
		for j = 1, 4 do
			local nScale = (j - 1) * 6 + 1;
			local nG = tonumber(tbFile:getCell(i, 1 + nScale))
			local nD = tonumber(tbFile:getCell(i, 2 + nScale))
			local nP = tonumber(tbFile:getCell(i, 3 + nScale))
			local nNum = tonumber(tbFile:getCell(i, 4 + nScale))
			local bBind = tonumber(tbFile:getCell(i, 5 + nScale))
			local nExpire = tonumber(tbFile:getCell(i, 6 + nScale))
			if nNum and nNum > 0 then
				tinsert(tbRet[i-2], {{nG, nD, nP, nNum, bBind}, nExpire})
			end
		end
	end
	TabFile_Unload(szFile);
	--gf_PrintTable(tbRet)
	return tbRet;
end

function dra_callback(nParam)
	local nBit = nParam + 1;
	if gf_GetTaskBit(TASKID_DAILY_REG_AWARD_TAG, nBit) ~= 0 then
		Talk(1,"",format("%s ®· nhËn phÇn th­ëng nµy råi", gf_GetPlayerSexName()));
		return 0;
	end
	if gf_Judge_Room_Weight(4, 10, " ") ~= 1 then
		return 0;
	end
	if not g_DraAwardTable then
		g_DraAwardTable = dra_GetAwardTable();
	end
	local tAward = g_DraAwardTable[nBit];
	if not tAward then 
		error(format("nBit = %d, getn(g_DraAwardTable) = %d", nBit, getn(g_DraAwardTable)));
	end
	local nDay = date("%d");
	local nAccumDay = 0;
	for i = nDay, 1, -1 do
		if gf_GetTaskBit(TASKID_DAILY_REGISTRATION, i) ~= 0 then
			nAccumDay = nAccumDay + 1;
		else
			break
		end
	end
	if nAccumDay < tAward[1] then
		Talk(1,"",format("%s tÝch lòy sè ngµy b¸o danh kh«ng ®ñ %d ngµy", gf_GetPlayerSexName(), tAward[1]));
		return 0;
	end
	gf_SetTaskBit(TASKID_DAILY_REG_AWARD_TAG, nBit, 1, TASK_ACCESS_CODE_DAILY_REGISTRATION);
	for i = 2, getn(tAward) do
		gf_AddItemEx2(tAward[i][1], GetItemName(tAward[i][1][1], tAward[i][1][2], tAward[i][1][3]), "H­íng dÉn h»ng ngµy ", "Th­ëng tÝch lòy b¸o danh", tAward[i][2], 1);
	end
	FireEvent("event_task_award", "daily_reg_accum", tAward[1]);
	local tStat = {
		[3] = 1,
		[5] = 2,
		[7] = 3,
		[14] = 4,
		[21] = 5,
		[28] = 6,
	}
	if not tStat[tAward[1]] then return 0; end
	AddRuntimeStat(37, tStat[tAward[1]], 0, 1);
end

--Ã¿ÈÕ×Ô¶¯Ç©µ½½±Àø
function dra_daily_register(nDay)
	if CustomAwardCheckCondition("everydayaward") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("everydayaward", 0);
end