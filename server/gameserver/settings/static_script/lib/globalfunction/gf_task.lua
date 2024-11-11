--修改某个变量的值（偏移量）
function gf_ModifyTask(nTaskID, nChange, nAccessCode)
	nTaskID = nTaskID or 0
	nChange =  nChange or 0
	if nChange ~= 0 then
		SetTask(nTaskID, GetTask(nTaskID) + nChange, nAccessCode)
	end
end

-------------------------------------------------------------------
--设置某个任务变量的字节
function gf_SetTaskByte(nTaskID,nByte,nValue,nAccess)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskByte nValue > 255 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SetByte(GetTask(nTaskID),nByte,nValue),nAccess);
end;
--获得某个任务变量的某个字节的值
function gf_GetTaskByte(nTaskID,nByte)
	return GetByte(GetTask(nTaskID),nByte);
end;

function gf_SafeSetTaskByte(nTaskID,nByte,nValue,nAccess)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskByte nValue > 255 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SafeSetByte(GetTask(nTaskID),nByte,nValue),nAccess);
end;
--获得某个任务变量的某个字节的值
function gf_SafeGetTaskByte(nTaskID,nByte)
	return SafeGetByte(GetTask(nTaskID),nByte);
end;
--------------------------------
--设置某个临时任务变量的字节
function gf_SetTaskTempByte(nTaskID,nByte,nValue)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskTempByte nValue > 255 or nil");
	end
	SetTaskTemp(nTaskID,SetByte(GetTaskTemp(nTaskID),nByte,nValue));
end;
--获得某个临时任务变量的某个字节的值
function gf_GetTaskTempByte(nTaskID,nByte)
	return GetByte(GetTaskTemp(nTaskID),nByte);
end;

--nWordIdx = 1 or 2
function gf_SafeGetWord(nVal, nWordIdx)
	local nBytes = {SafeGetByte(nVal, 1),	SafeGetByte(nVal, 2),	SafeGetByte(nVal, 3),	SafeGetByte(nVal, 4),	}
	local nRet = 0
	if nWordIdx == 1 then
		nRet = nBytes[2] * 256 + nBytes[1]
	elseif nWordIdx == 2 then
		nRet = nBytes[4] * 256 + nBytes[3]
	else
		assert(0==1)
	end
	return nRet
end

function gf_SafeSetWord(nVal, nWordIdx, nWordVal)
	local nRet = nVal
	local nStartByte = 0
	if nWordIdx == 1 then
		nStartByte = 1
	elseif nWordIdx == 2 then
		nStartByte = 3
	else
		nStartByte = 0
		assert(0==1)
	end
	if nStartByte > 0 then
		if nWordVal < 0 or nWordVal > 65535 then
			print(format("gf_task.lua Role=%s setWord(nVal=%d, nWordIdx=%d, nWordVal=%d) nWordVal error", GetName() or "", nVal, nWordIdx, nWordVal))
			if nWordVal < 0 then
				nWordVal = 0
			else
				nWordVal = 65535
			end
		end
		local nNewTaskValueTemp = SafeSetByte(nVal, nStartByte, SafeGetByte(nWordVal, 1))
		local nNewTaskValue = SafeSetByte(nNewTaskValueTemp, nStartByte + 1, SafeGetByte(nWordVal, 2))
		nRet = nNewTaskValue
	end
	return nRet
end

--获取task的指定word 
function gf_SafeGetTaskWord(nTask, nWordIdx)
	local nValue = GetTask(nTask)
	return gf_SafeGetWord(nValue, nWordIdx)
end

--设定task的指定word nWordIdx = 1 or 2
function gf_SafeSetTaskWord(nTask, nWordIdx, nVal, nAccessCode)
	local nValue = GetTask(nTask)
	local nNewVal = gf_SafeSetWord(nValue, nWordIdx, nVal)
	return SetTask(nTask, nNewVal, nAccessCode)
end
function gf_SafeAddTaskWord(nTask, nWordIdx, nVal, nAccessCode)
	print("gf_SafeAddTaskWord call", nTask, nWordIdx, nVal, nAccessCode, GetName());
	local nValue = GetTask(nTask)
	local nWord = gf_SafeGetWord(nValue, nWordIdx) + nVal
	local nNewVal = gf_SafeSetWord(nValue, nWordIdx, nWord)
	return SetTask(nTask, nNewVal, nAccessCode)
end
--=======================================================
--设置某个任务变量的字节
function gf_SetTaskBit(nTaskID,nBit,nValue,nAccess)
	if not nValue or nValue > 1 then
		print("ERROR:gf_SetTaskBit nValue > 1 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SetBit(GetTask(nTaskID),nBit,nValue),nAccess);
end;
--获得某个任务变量的某个字节的值
function gf_GetTaskBit(nTaskID,nBit)
	return GetBit(GetTask(nTaskID),nBit);
end;
--------------------------------
--设置某个临时任务变量的位
function gf_SetTaskTempBit(nTaskID,nBit,nValue)
	if not nValue or nValue > 1 then
		print("ERROR:gf_SetTaskTempBit nValue > 1 or nil");
	end
	SetTaskTemp(nTaskID,SetBit(GetTaskTemp(nTaskID),nBit,nValue));
end;
--获得某个临时任务变量的某个位的值
function gf_GetTaskTempBit(nTaskID,nBit)
	return GetBit(GetTaskTemp(nTaskID),nBit);
end;
--============================================================
--获取任务变量任意连续字节的值
function gf_GetMyTaskByte(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskByte(nTask,i) * (256^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续字节
function gf_SetMyTaskByte(nTask,nStart,nEnd,nValue,nAccess)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	nAccess = nAccess or 0;
	local	nCount = (2^((nEnd - nStart + 1) * 8)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskByte(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskByte(nTask,i,mod(nValue,256),nAccess);
		nValue = floor(nValue / 256);
	end
end
--================================================================
--获取任务变量任任意连续位的值
function gf_GetMyTaskBit(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskBit(nTask,i) * (2^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续位
function gf_SetMyTaskBit(nTask,nStart,nEnd,nValue,nAccess)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	nAccess = nAccess or 0;
	local	nCount = (2^(nEnd - nStart + 1)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskBit(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskBit(nTask,i,mod(nValue,2),nAccess);
		nValue = floor(nValue / 2);
	end
end
--============================================================
--临时任务变量处理
--获取任务变量任意连续字节的值
function gf_GetMyTaskTempByte(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskTempByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskTempByte(nTask,i) * (256^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续字节
function gf_SetMyTaskTempByte(nTask,nStart,nEnd,nValue)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskTempByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local	nCount = (2^((nEnd - nStart + 1) * 8)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskTempByte(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskTempByte(nTask,i,mod(nValue,256));
		nValue = floor(nValue / 256);
	end
end
--================================================================
--获取任务变量任任意连续位的值
function gf_GetMyTaskTempBit(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskTempBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskTempBit(nTask,i) * (2^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续位
function gf_SetMyTaskTempBit(nTask,nStart,nEnd,nValue)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskTempBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local	nCount = (2^(nEnd - nStart + 1)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskTempBit(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskTempBit(nTask,i,mod(nValue,2));
		nValue = floor(nValue / 2);
	end
end
-----------------------------------------------------------------------