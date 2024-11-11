--���ļ�����д�������ű���һЩ��������
--���ļ�����һЩ��ϵͳ�Ĺ���������Mission����
Import("\\script\\lib\\missionfunctions.lua");
Import("\\settings\\static_script\\lib\\teamfunctions.lua");
Import("\\script\\lib\\time.lua");
Import("\\script\\lib\\string.lua");
Import("\\script\\lib\\lingshi_head.lua");
Import("\\script\\online_activites\\task_values.lua");
Import("\\script\\online_activites\\reborn\\tongban\\strings.lua");
Import("\\script\\class\\ktabfile.lua")
Import("\\script\\ks2vng\\lib\\globalfunctions.lua")
Import("\\settings\\static_script\\online\\general_award_group.lua")
Import("\\script\\meridian\\meridian_script_api.lua")
Import("\\script\\task_access_code_def.lua")
Import("\\script\\tmp_task_id_def.lua")
Import("\\script\\lib\\teamfunctions.lua")
Import("\\script\\lib\\define.lua");

----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----������ް�ȫ���ļ����Ǹ����� �������ܽ�ֹʹ�� �����Ƿֲ��ȥ�ĺ���
Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_award.lua")
----------------------------------------------------------------------

--ʦ��������������
G_N_FACTION_PRESTIGE_MAX = 10000000

--�ж����ϵĸ��Ӻ͸������������������������������˵Ļ���ʾҪ��Talk��ʾ����������ʾ�˵�����
strLog = ""
STR_OVERWEIGHT = "H�nh trang ho�c s�c l�c kh�ng ��, xin s�p x�p l�i!"

--==============================================
--function describe:������չ�Ի�TALK��������
--function params : fnNextTask��һ�����õĺ�����
--                  tbMsg npc˵�Ļ�
--function return value: �޷���ֵ
--===============================================
tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}
tMasterSkillInfo = {
		[0] = 0,
		[1] = 0,
		[2] = 32,	--�����׼�,�׽
		[3] = 57,	--������ɮ,ϴ�辭
		[4] = 44,	--������ɮ,��������
		[5] = 0,			--����
		[6] = 74,	--����,������
		[7] = 0,			--����
		[8] = 89,	--���ҷ��,������
		[9] = 102,	--�����׼�,���������
		[10] = 0,			--ؤ��
		[11] = 113,--ؤ�ﾻ��,����ʮ����
		[12] = 124,--ؤ������,�򹷹���
		[13] = 0,			--�䵱
		[14] = 146,--�䵱����,����̫����
		[15] = 159,--�䵱�׼�,̫����
		[16] = 0,			--����
		[17] = 732,--����ǹ��,��������ǹ
		[18] = 745,--���Ź���,��������
		[19] = 0,			--�嶾
		[20] = 775,--�嶾а��,����ħ��
		[21] = 774,--�嶾��ʦ,��Ӱħ��
		[23] = 1032,--��ʦ���޼����׾�
		[23] = 1032,--��ʦ���޼����׾�
		[24] = 0, --"����",
		[25] = 1066, --"����ʥս",
		[26] = 1096, --"�������",
		[27] = 1213, --"����Ѫ��",
		[28] = 0, --"����",
		[29] = 1196,--��Ů�������
		[30] = 1230,--��Ů����β���ɾ�
		[31] = 1883, --"��������",
		[32] = 1897, --"���ؽ���",
}

function gf_Talk(fnNextTask,tbMsg)
    local nNum = getn(tbMsg)
    local szMsg = ""
    for i = 1, nNum-1 do
        szMsg = szMsg..format("%q",tbMsg[i])..","
    end
    szMsg = szMsg..format("%q",tbMsg[nNum])
    szMsg = "Talk("..nNum..","..format("%q",fnNextTask)..","..szMsg..")"
    dostring(szMsg)
    return
end

--==============================================
--function describe:������չSay��������
--function params : tbMsg npc˵�Ļ���ѡ���
--function return value: �޷���ֵ
--remark: ��ṹֻ��һ�������tb = {"",""}
--===============================================
function gf_Say(tbMsg)
	if tbMsg == nil then return end
    local nNum = getn(tbMsg)
    local szMsg = ""
    local szOption = ""
    szMsg = szMsg..""..format("%q",tbMsg[1])..","..(nNum-1)..","
    for i = 2, nNum do
        szOption = szOption..format("%q",tbMsg[i])
        if i ~= nNum then
            szOption = szOption..","
        end
    end
    szMsg = "Say("..szMsg.."{"..szOption.."})"
    --Msg2Player(szMsg)
    dostring(szMsg)
    return
end


--�Ի���ҳ�������ٵ���ǰ��Ҫ����öԻ���
--����
--tbDialogList �Ի��б���ṹ���£�
--tbDiaList = {[0] = "tital",[1] = "1/#a(%d)",...}
--tbDiaList[0] ��ʾ�Ի�ͷ������ı�ʾ��ѡ�Ի���ֻ�ܴ�һ��������
--�������Ҫ������������ϲ�������Ҫ�޸ĺ���
--nStartDialogNum���ľ俪ʼ��ʾ������������ʾ��1��ʼ
--nEveryPage��ʾÿҳ��ʾ����Ի���Ĭ��Ϊ6,
--ע�⣬���ڶԻ����治����ʾ�ܶ��У����Բ�������6������ֵ


function gf_PageSay(tbDialogList1, n_start_dialog_num, n_every_page)
	tbDialogList = tbDialogList1
	function gf_pagesay(nStartDialogNum, nEveryPage)
    	if nStartDialogNum == nil then
        	nStartDialogNum = 1
    	end
    	if nEveryPage == nil then
      		nEveryPage = 6
    	end
    	local nCount = getn(tbDialogList)
    	local nLen = nEveryPage
    	if nStartDialogNum + nEveryPage - 1 > nCount then
      		nLen = nCount - nStartDialogNum + 1
    	end
    	local tbCurrentlyShow = {}
    	tinsert(tbCurrentlyShow,1,"K�t th�c ��i tho�i/gf_DoNothing")
    	if nStartDialogNum ~= 1 then
        	tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(1,%d)","tr� l�i",nEveryPage))
    	end
    	if nStartDialogNum + nEveryPage - 1 < nCount then
	        tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(%d,%d)","Trang k�",nStartDialogNum+nEveryPage,nEveryPage))
    	end
    	if nStartDialogNum ~= 1 then
        	tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(%d,%d)","Trang tr��c",nStartDialogNum-nEveryPage,nEveryPage))
	    end
    	for i = 1, nLen do
        	tinsert(tbCurrentlyShow,1,format(tbDialogList[nStartDialogNum+nLen-i],nStartDialogNum+nLen-i))
    	end
    	Say(tbDialogList[0],getn(tbCurrentlyShow),tbCurrentlyShow)
    end
    gf_pagesay(n_start_dialog_num,n_every_page)
end


function gf_SetLogCaption(strCap)
	strLog = strCap;
end

-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Modify
-- Content			:	��Ӿ���ֵ������ֵ�Լ���Ǯȫ���м�¼log
-- Return value	:	None
-- Parameter		:
--		+ strType	:
--				* Exp (value) 		:	����ֵ
--				* Rep (value) 		:	����ֵ
--				* Money (value)	:	��Ǯ
--		+ nCount	:	��Ǯ�������
-- Example		: gf_Modify ("Exp", 200000) -->Give 20000 of Exp
-- **********************************************************************************************************************
function gf_Modify(strType,nCount)
	if not nCount or nCount == 0 then
		return 1;
	end
	local strShow = "";
	if strType == "Exp" then
		if not nCount or nCount > 2000000000 or nCount < -2000000000 then
			WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." got "..nCount.." "..strType);
			return 0;
		end
		ModifyExp(nCount);
		strShow = nCount.."Kinh nghi�m";
	elseif strType == "Rep" then
		ModifyReputation(nCount,0);
		strShow = nil;
	elseif strType == "Money" then
		if nCount < 0 then
			WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." got "..nCount.." "..strType);
			return 0
		end
		Earn(nCount);
		strShow = gf_GetMoneyString(nCount);
	elseif strType == "ShiMen" then
		SetTask(336, GetTask(336) + nCount);
		strShow = nCount.."�i�m s� m�n";
	elseif strType == "ShiMenWeiWang" then
		if nCount == 0 then
			return 1
		end
		local nMax = G_N_FACTION_PRESTIGE_MAX
		local nCur = GetTask(TASKID_NFT_FACTION_PRESTIGE)
		local nChange = nCount
		if nCount > 0 then
			if nCur + nCount > nMax then
				nChange = nMax - nCur
			end
			if nChange <= 0 then
				Msg2Player(format("%s �� ��t m�c t�i �a %d, kh�ng th� nh�n n�a", "Danh V�ng S� M�n", nMax) )
				return 0
			end
		elseif nCount < 0 then
			if nCur + nCount < 0 then
				Msg2Player(format("%s kh�ng �� %d", "Danh V�ng S� M�n", nCount*(-1) ) )
				return 0
			end
		end
		gf_ModifyTask(TASKID_NFT_FACTION_PRESTIGE, nChange);
		strShow = nCount.."Danh V�ng S� M�n";
	elseif strType == "JunGong" then
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + nCount)
		else
			SetTask(701, GetTask(701) - nCount)
		end
		strShow = nCount.."C�ng tr�ng"
	elseif strType == "ZhenQi" then
		AwardGenuineQi(nCount);
		strShow = nil;
	elseif strType == "Popur2" then
		local TASKID_BOOK_POPUR2_TOTAL			= 3408; -- �һ���������
		local TASKID_BOOK_POPUR2				= 3409;	-- ��ǰ��������
		gf_ModifyTask(TASKID_BOOK_POPUR2, nCount);
		gf_ModifyTask(TASKID_BOOK_POPUR2_TOTAL, nCount);
		strShow = nCount.."L�ch luy�n"
	else -- Error
		WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." Modify "..nCount.." "..strType );
		return 0;
	end
	if strShow then
		Msg2Player("B�n nh�n ���c  "..strShow.." !");
	end
	WriteLog("["..strLog.."]\tgf_Modify:\t"..GetName().." got "..nCount.." "..strType);
	return 1;
end

function gf_AddItemEx(sItemIds, strName, nCount)
	if type(sItemIds) ~= "table" then
		WriteLog(format("[%s] [AddItemEx Tham s� sai!] [Role:%s (acc:%s)] [Item:%s]",
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	strName = strName or GetItemName(sItemIds[1],sItemIds[2],sItemIds[3]);
	nCount = nCount or sItemIds[4];
	nCount = tonumber(nCount);
	if not nCount then
		WriteLog(format("[%s] [AddItemEx Tham s� sai!] [Role:%s (acc:%s)] [Item:%s]",
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	local nAmg = (nCount and 3) or 4;
	if getn(sItemIds) < nAmg then
		WriteLog(format("[%s] [AddItemEx Tham s� sai!] [Role:%s (acc:%s)] [Item:%s]",
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end

	local nRet, nItemIdx = 0;
	if sItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13],sItemIds[14],sItemIds[15], sItemIds[16]);
	else
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
	end
	if nCount < 0 then
		nCount = - nCount
	end
	if nRet == 0 then
		WriteLog(format("[%s] [AddItemEx: Th�t b�i] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
			strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	elseif nRet == 1 then
		Msg2Player("B�n nh�n ���c  "..strName.."x"..nCount);
		WriteLog(format("[%s] [AddItemEx:Nh�n ���c v�t ph�m] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d,%d)]",
			strLog or "", GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5] or -1));
		-- if strLog and strLog ~= "" then
		-- 	sendGetItemLog(strName, nCount, strLog, sItemIds);
		-- end
	elseif nRet == 2 then
		Msg2Player("M�t r�i "..strName.."x"..nCount);
		WriteLog(format("[%s] [AddItemEx:��nh r�i ph�n th��ng] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
			strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	end
	return nRet, nItemIdx;
end

--ת��Ǯ����������100323��������ַ�����1������3������23��ͭǮ
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetMoneyString
-- Content			:	������ʾ����Ϸ�е�������ʽ
-- Return value	:	None
-- Parameter		:
--		* nMoney	(value)	: The unit of param is coin!
-- Example		: 	Ͷ��  --> 1 �� 3 �� 23 ͭ
-- **********************************************************************************************************************
function gf_GetMoneyString(nMoney)
	local nGold = floor(nMoney/10000);
	local nSilver = floor(mod(nMoney,10000)/100)
	local nCopper = mod(nMoney,100);
	local sString = "";
	if nGold > 0 then
		sString = sString..nGold.."v�ng"
	end;
	if nSilver > 0 then
		sString = sString..nSilver.." b�c "
	end;
	if nCopper > 0 then
		sString = sString..nCopper.."��ng <color>"
	end;
	return sString;
end;
--��ʽ����ʹ֮�̶����ȣ��ַ��������֡���������("123456",3)�������"123"����������("123456",8)�������"123456  "
--����������Է�����Talk��Say�ж����ַ�����bLeftָ����뻹���Ҷ��룬Ĭ���������
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_FormatStringLength
-- Content			:	Deal string with some formats
-- Return value	:	string
-- Parameter		:
-- 		* sString (string)		: The string need deal
-- 		* nLength (value)		: Length of string which be returned
-- 		* bLeft (value)			: format string
-- Example		:
-- 			gf_FormatStringLength("abcdef",3,1)	--> abc
--	 		gf_FormatStringLength("abcdef",3)		--> abc
-- 			gf_FormatStringLength("abcdef",8,1)	--> abcdef__	(Align text left)
-- 			gf_FormatStringLength("abcdef",8,2)	--> __abcdef	(Align text right)
-- **********************************************************************************************************************
function gf_FormatStringLength(sString,nLength,bLeft)
	sString = tostring(sString);
	local nStrLen = strlen(sString);
	if nStrLen >= nLength then
		return strsub(sString,1,nLength)
	end;
	for i=1,nLength-nStrLen do
		if bLeft == nil or bLeft == 1 then
			sString = sString.." ";
		else
			sString = " "..sString;
		end;
	end;
	return sString;
end;
--�����ҵ��Ա�ƺ�
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetPlayerSexName
-- Content			:	Create the name of player's sex.
-- Return value	:	string
-- Parameter		:	None
-- Example		:
-- 			gf_GetPlayerSexName ( )
-- **********************************************************************************************************************
function gf_GetPlayerSexName()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "N� hi�p "
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end;
	return strSex;
end;
--�õ���������֮��ľ��룬����������ĸ����������Ĭ���������ĳ����ľ���
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetDistance
-- Content			:	Count the distance of two coordinates
-- Return value	:	value
-- Parameter	(value)	:
--		* nX 			:
--		* nY 			:
--		* nPosX 	:
--		* nPosY	:
-- Example		:
-- 			local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
--			if gf_GetDistance(nMapX,nMapY) > 10 then
--				Msg2Player("You are far away from the target!");
--				return 0;
--			end
-- **********************************************************************************************************************
function gf_GetDistance(nX,nY,nPosX,nPosY)
	if nPosX == nil or nPosY == nil then
		_,nPosX,nPosY = GetWorldPos();
	end;
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--����ʱ��ָ�nType���������д��Ϊ����ʾ��print�����������Msg2SubWorld���
--ʹ�����ָ����Ҫ����һ��DEBUG_VERSION������1��ʾ�ǵ��԰汾��0��ʾ�ǵ��԰汾
function gf_ShowDebugInfor(Arg,nType)
	if Arg == nil then
		Arg = "nil";
	end;
	if DEBUG_VERSION == nil then
		DEBUG_VERSION = 0;
	end;
	if DEBUG_VERSION == 1 then
		if nType == nil or nType == 0 then
			print("\n �i�u ch�nh tin t�c:"..Arg.."\n")
		elseif nType == 1 then
			Msg2SubWorld("Ch�nh tin t�c:"..Arg);
		end;
	else	--���Ϊ�ǵ��԰汾��Ϊ����־
		WriteLog(Arg);
	end;
end;
--��������ת��Ϊ����
function gf_GoldenExp2Exp(nGoldenExp)
	local nCurrGoldenExp = GetGoldenExp();
	if nCurrGoldenExp < nGoldenExp then
		nGoldenExp = nCurrGoldenExp
	end;
	ModifyGoldenExp(-nGoldenExp);
	ModifyExp(nGoldenExp)
	Msg2Player(nGoldenExp.."�i�m s�c kh�e �� ��i th�nh"..nGoldenExp.." �i�m kinh nghi�m");
	return nGoldenExp;
end;
--���������ĳ�Ա����Ϣ������һ���ַ�������������ʾ��Ϣ���ͣ�1��Msg2Player��2��Talk��3��Say
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Msg2Team
-- Content			:	Send a message to a team,Msg2Player / Talk / Say
-- Return value	:	string
-- Parameter		:
--		* sMsg (string)		:Content of mesage
--		* nType (value)	: The way of showing the message
--				+ 1 / nil		: Msg2Player
--				+ 2 				: Talk
--				+ 3				: Say
-- Example		:
--		* gf_Msg2Team ("Good luck!", 1)
-- **********************************************************************************************************************
function gf_Msg2Team(sMsg,nType)
	sMsg = tostring(sMsg);
	local nTeamSize = GetTeamSize();
	if nTeamSize <= 1 then	--���û��ӻ����ֻ���Լ�һ����  (neu ko co to doi)
		if nType == 1 or nType == nil then
			Msg2Player(sMsg);
		elseif nType == 2 then
			Talk(1,"",sMsg);
		elseif nType == 3 then
			Say(sMsg,0);
		end;
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if nType == 1 or nType == nil then
			Msg2Player(sMsg);
		elseif nType == 2 then
			Talk(1,"",sMsg);
		elseif nType == 3 then
			Say(sMsg,0);
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--�������Ƿ���������ɣ�ע�ⲻ��ָ����Ŷ��
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Check the route of playe is join the faction?
-- Return value	:	value, value
-- Parameter		:	None
-- Example		:
--		* gf_CheckPlayerRoute ( ) :
-- **********************************************************************************************************************
function gf_CheckPlayerRoute()
	local nRoute = GetPlayerRoute();
	--�����ǺϷ�������
	local tValidRoute = gf_GetRouteTable();
	for i=1,getn(tValidRoute) do
		if nRoute == tValidRoute[i] then
			return 1,i;
		end;
	end;
	return 0,0;
end;
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Check player is join the route?
-- Return value	:	value, value
-- Parameter		:	None
-- Example		:
--		* gf_CheckPlayerRoute ( ) :
-- **********************************************************************************************************************
--��������table
function gf_GetRouteTable()
	return {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30,31,32};
end;
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Return the number of the GS's Player
-- Return value	:	value
-- Example		:
--		* gf_GetServerPlayerCount ( ) : Return the number of the GS's Player
-- **********************************************************************************************************************
--��õ�ǰ���������������
function gf_GetServerPlayerCount()
	local nCount = 0;
	local player = FirstPlayer()
	while (player > 0) do
		nCount = nCount + 1;
		player = NextPlayer(player)
	end
	return nCount;
end;
--����һ���������table���������
--tbPlayerΪ�������table����Ҫ��������Ҽ���
--func��ִ�к�����tbArg��ִ�к�����Ψһ����
function gf_OperatePlayers(tbPlayer,func,tbArg)
	local nPlayerCount = getn(tbPlayer);
	local OldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = tbPlayer[i];
			if PlayerIndex > 0 then
				func(tbArg);
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--�������
function gf_OperateTeamMember(func,tbArg)
	local tbPlayer = gf_GetAllTeamMember();
	gf_OperatePlayers(tbPlayer,func,tbArg)
end;
--�ϲ�table����������table: {1,2,3},{4,5,6}���ϲ������һ���µ�table:{1,2,3,4,5,6}
--�˺���Ҳ������������table
function gf_MergeTable(...)
	local tbTable = {};
	local nIdx = 1;
	for i=1,arg.n do
		for j=1,getn(arg[i]) do
			tbTable[nIdx] = arg[i][j];
			nIdx = nIdx + 1;
		end;
	end;
	return tbTable;
end;
--��ȡ���뵱ǰtable������ͬ�����table����
function gf_GetNextRandomIndex(nCurIdx,nTableSize)
	local nRand = random(2,nTableSize);
	return mod(nCurIdx+nRand-2,nTableSize)+1;
end;
--��ȡ·������
function gf_GetRouteName(nRoute)
	nRoute = nRoute or GetPlayerRoute() or 9999
	local tRoute = 	--·��
	{
		[0] = "V� m�n ph�i",
		[1] = "Thi�u L�m",
		[2] = "Thi�u L�m �ao",
		[3] = "Thi�u L�m Tr��ng",
		[4] = "Thi�u L�m Quy�n",
		[5] = "���ng M�n",
		[6] = "���ng M�n",
		[7] = "Nga My",
		[8] = "Nga Mi Ki�m",
		[9] = "Nga Mi ��n",
		[10] = "C�i Bang",
		[11] = "C�i Bang Quy�n",
		[12] = "C�i Bang B�ng",
		[13] = "V� �ang",
		[14] = "V� �ang Ki�m",
		[15] = "V� �ang B�t",
		[16] = "D��ng M�n",
		[17] = "D��ng Gia Th��ng",
		[18] = "D��ng Gia Cung",
		[19] = "Ng� ��c",
		[20] = "Hi�p ��c",
		[21] = "C� S�",
		[22] = "C�n L�n",
		[23] = "C�n L�n",
		[24] = "Minh gi�o",
		[25] = "Th�nh Chi�n",
		[26] = "Tr�n Binh",
		[27] = "Huy�t Nh�n",
		[28] = "Th�y Y�n",
		[29] = "Th�y Y�n V� N�",
		[30] = "Linh N�",
		[31] = "���ng M�n Nh�m Hi�p",
		[32] = "C�n L�n Ki�m T�n",
	}
	if nRoute < 0 or nRoute > getn(tRoute) then
		return "Kh�ng r� h��ng";
	end;
	return tRoute[nRoute] or ""
end;
--���������
function gf_GetFactionName(nFac)
	nFac = nFac or GetPlayerFaction() or 9999
	local tFaction = --����
	{
		[0] = "V� m�n ph�i",
		[1] = "Thi�u L�m",
		[2] = "V� �ang",
		[3] = "Nga My",
		[4] = "C�i Bang",
		[5] = "���ng M�n",
		[6] = "D��ng M�n",
		[7] = "Ng� ��c",
		[8] = "C�n L�n",
		[9] = "Minh gi�o",
		[10] = "Th�y Y�n",
	}
	if nFac < 0 or nFac > getn(tFaction) then
		return "Kh�ng r� m�n ph�i";
	end;
	return tFaction[nFac] or "";
end;
--��һ��ֵ�޶���ĳ��������
function gf_MinMax(nNum,nMin,nMax)
	nNum = max(nNum,nMin);
	nNum = min(nNum,nMax);
	return nNum;
end;
--��װ�����Ӿ��麯������ϵͳ��Ϣ
function gf_ModifyExp(nExp)
	ModifyExp(nExp);
	Msg2Player(format("Thu ���c %d �i�m kinh nghi�m",nExp));
end;

--���table��
--����1������table
--����2����ʼλ�á�Ĭ��ֵΪ1
--����3������λ�á�Ĭ��ֵΪtable��С
function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;
--�����ַ�����ɫ
function gf_ColorReplace(szMsg)
	szMsg = gsub(szMsg,"<>","<color>");
	szMsg = gsub(szMsg,"<r>","<color=red>");
	szMsg = gsub(szMsg,"<y>","<color=yellow>");
	szMsg = gsub(szMsg,"<g>","<color=green>");
	szMsg = gsub(szMsg,"<p>","<color=purple>");
	return szMsg;
end;
--�������ƣ�NPC����ֵ�趨
--��        �ܣ�ֱ���趨NPC����λ�õ�ֵ
--1,4,5,6λ�üǵ���ֵ���Դ���99,�����Ĳ���
--1��NPC������ֵ������С�ڵ���0,����NPC�ᡰ������
function gf_SetUnitCurState(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("Thi�t l�p tr� s� NPC nh�m: V� tr�:"..att_seq.."Tr�:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

function gf_InRange(tbRange,nValue)
	for i,v in tbRange do
		if nValue >= v[1] and nValue <= v[2] then
			return 1;
		end;
	end;
	return 0;
end;
--�Ƴ�������ʱState��IDΪ2600001��2600010
function gf_RemoveTempState()
	for i=2600001,2600020 do
		RemoveState(i);
	end;
end
--������Ʒ����������Ʒ�Ĵ���ʱ��
--�����������Ϊ2,������SetItemExpireTime
--���������������2,��Ϊֱ��������Ʒ�ĵ���ʱ��
function gf_SetItemExpireTime(nItem, ...)
	if nItem == nil or nItem == 0 then
		return 0;
	end
	local nArgSize = getn(arg);
	if nArgSize == 1 then
		SetItemExpireTime(nItem,arg[1]);
		return 0;
	end;

	for i=1, 6 do
		arg[i] = arg[i] or 0;
	end;
	local nCurTime = GetTime();
	local nThatTime = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
	local nTimePassed = nThatTime - nCurTime;
	if nTimePassed < 0 then
		nTimePassed = 0;
	end;
	SetItemExpireTime(nItem,nTimePassed);
	return nTimePassed;
end;
--params����,��,��,ʱ,��,��
--return��Ŀ��ʱ�������ʱ�� ��
function gf_MkTimePass(...)
	if getn(arg) == 1 then
		return arg[1]
	end
	for i=1, 6 do
		arg[i] = arg[i] or 0
	end
	local nTimePassed = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]) - GetTime()
	if nTimePassed < 0 then
		nTimePassed = 0
	end
	return nTimePassed 
end
--��õ�ǰ��ͼID
function gf_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;
--���һ�����飬������1,4,6,7������һ��table = {1,4,6,7}
function gf_GetDataTable(...)
	local t = {};
	for i=1,arg.n do
		t[i] = arg[i];
	end;
	return t;
end;
--�����жϣ�֧�ָ���������
function gf_ProbabilityJudge(nProbability)
	local StringFind = function(sString,nTag)
		for i=1,strlen(sString) do
			if strsub(sString,i,i) == nTag then
				return i;
			end;
		end;
		return 0;
	end;
	if nProbability > 100 or nProbability < 0 then
		return 0;
	end;
	local nDotPos = StringFind(tostring(nProbability),".")
	local nStrLen = strlen(tostring(nProbability));
	local nRandomNum = random(1,100*(10^(nStrLen-nDotPos)));
	if nRandomNum <= nProbability*(10^(nStrLen-nDotPos)) then
		return 1;
	else
		return 0;
	end;
end;
--����һ��table
--orgΪԴtable��desΪ���Ƴ�������table
function gf_CopyTable(org,des)
	des = des or {};
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			if(not des[i]) then
				des[i]={}
				gf_CopyTable(j,des[i])
			end
		else
			if(not des[i]) then
				des[i]=j
			end
		end
	end
	return des;
end
--�������ɼ���
--nTypeΪ1ʱ��ʾ���Σ�Ϊ0ʱ��ʾ��
function gf_ForbidFactionSkill(nType)
	local nRoute = GetPlayerRoute();
	if nRoute == nil then
		return 0;
	end;
	local nSkillID = tMasterSkillInfo[nRoute];
	if nSkillID and nSkillID ~= 0 then
		if nType == 0 then
			UnBlockSkill(nSkillID);
		else
			BlockSkill(nSkillID);
		end;
	end;
end;
--���Say��Talk��Msg����
--nTypeΪ1ʱ��Say��Ϊ2ʱ��Talk��Ĭ��ֵΪ1
function gf_ShowMsg(szMsg,nType,nPIdx)
	local nOldPIdx = PlayerIndex;
	nType = nType or 1;
	PlayerIndex = nPIdx or PlayerIndex;
	if nType == 1 then
		Say(szMsg,0);
	else
		Talk(1,"",szMsg);
	end;
	gf_Msg2Player(szMsg);
	PlayerIndex = nOldPIdx;
end;
--��յ�Msg2Player��ȥ����ɫ�����ַ�
function gf_Msg2Player(szMsg,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	szMsg = sf_RemoveTag(szMsg,"<",">");
	Msg2Player(szMsg);
	PlayerIndex = nOldPIdx;
end;
--�����������֣�2008072808
--����2008,7,28,8
--������ʾ���ڣ�2008��7��28��8ʱ
function gf_GetDateData(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6));
	local nDay = tonumber(strsub(nDate,7,8));
	local nHour = tonumber(strsub(nDate,9,10));
	return nYear or 0,nMonth or 0,nDay or 0,nHour or 0;
end;
--��װ��WriteLog
--�����������Ч�������Ҫ��¼��ҵ�һЩ�����Ϣ
function gf_WriteLog(szHead,szEvenDescribe,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	if not PlayerIndex then	--���û���������
		WriteLog("["..szHead.."]:"..szEvenDescribe);
	else
		WriteLog("["..szHead.."]: T�i kho�n:"..GetAccount()..",Nh�n v�t:"..GetName()..",C�p:"..GetLevel()..",M�n ph�i:"..GetPlayerRoute()..",Th� h�nh:"..GetBody()..",Mi�u t�:"..szEvenDescribe);
	end;
	PlayerIndex = nOldPIdx;
end;
--���һ����׼table:{1,2,3,4,5,.....n,n+1,n+2}
function gf_GetNormalTable(nSize)
	local tbRet = {};
	for i=1,nSize do
		tbRet[i] = i;
	end;
	return tbRet;
end;


--task��غ�������\settings\static_script\lib\globalfunction\gf_task.lua



function gf_GetExtPointByte(nEp, nByte)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	return GetByte(GetExtPoint(nEp), nByte)
end
function gf_SetExtPointByte(nEp, nByte, nValue)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	local nNum = SetByte(GetExtPoint(nEp), nByte, nValue) - GetExtPoint(nEp)
	if nNum >= 0 then
		if AddExtPoint(nEp, nNum) == 1 then
			return 1
		end
	else
		nNum = 0 - nNum
		if PayExtPoint(nEp, nNum) == 1 then
			return 1
		end
	end
	return 0
end
function gf_GetExtPointBit(nEp, nBit)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	return GetBit(GetExtPoint(nEp), nBit)
end
function gf_SetExtPointBit(nEp, nBit, nValue)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	if nValue == 0 and gf_GetExtPointBit(nEp, nBit) == 1 then
		PayExtPoint(nEp, GetExtPoint(nEp) - SetBit(GetExtPoint(nEp), nBit, 0))
		return 1
	elseif nValue == 1 and gf_GetExtPointBit(nEp, nBit) == 0 then
		AddExtPoint(nEp, SetBit(GetExtPoint(nEp), nBit, 1) - GetExtPoint(nEp))
		return 1
	end
	return 0
end
-----------------------------------------------------------------------------
--gf_GetRandItemByTable()
--����˵����ȡ�������Ʒ by baiyun 2009.11.17
--������ITEM_PARAM��һ����ά���飬ÿһ��Ԫ�صĵ�һ��ֵ����Ʒ�����ڶ���ֵ
--			����Ʒ���ֵĸ��� * ���ʵĻ���
--������nMax ���ʵĻ�������100��1000��
--������nDefault��Ĭ�Ϸ��ص���Ʒ˳��
--����ֵ��������õ�����Ʒ�������е�λ�ã����û�еõ�����Χ�ڵ���Ʒλ�ã�
--				�򷵻ص�һ����Ʒ
--������ITEM_PARAM = {{"��ũ��", 900}, {"�׾���", 100}}
--			nMax = 1000
------------------------------------------------------------------------------
function gf_GetRandItemByTable(ITEM_PARAM, nMax, nDefault)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return nDefault;
end

--Խ�ϰ�ר�õ���־��¼��ʽ
function gf_WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
	local event_name = szevent_name or ""
	local action = szaction or ""
	local quantity = szquantity or ""
	local item_name = szitem_name or ""
	local item_code = szitem_code or ""
	local tong_name = sztong_name or ""
	local bug_desc = szbug_desc or ""
	local string_1 = szstring_1 or ""
	local string_2 = szstring_2 or ""
	local string_3 = szstring_3 or ""
	local reborn = gf_GetTaskByte(1538, 1) or ""
	local rolelevel = GetLevel() or ""
	local rank = GetTask(704) or ""
	local petlevel = 0
	if GetTask(TASK_VNG_PET) ~= nil then
		petlevel = mod(GetTask(TASK_VNG_PET), 100) or ""
	end
	local petid = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
	local pettype = ""
	if petlevel > 0 then
		if VET_201003_TONGBAN_STR_MODE_NAME[petlevel] then
			if VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] then
				pettype = VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] or ""
			end
		end
	end
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);

	local strLogs = "["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3.."\t"..reborn.."\t"..rolelevel.."\t"..rank.."\t"..petlevel.."\t"..pettype.."\t"..szCIP;
	if strLogs ~= "" then
		WriteLog(strLogs);
	else
		WriteLog("Error call WriteLogEx");
	end
end

function WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
	gf_WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
end
--Խ�ϰ������õ�����ʦ������õ�ĳ��Ʒ��ÿ���ȼ�ÿ�λ�õ�������ͬ������ÿ�����������ƣ���Ҫ�ڵ���֮���жϱ����͸���
--������
--tbItemIds ��Ʒ��id = {id1, id2, id3}
--szItemName ��Ʒ������
--LevelAwardListTable���ǵڼ���Ӧ�ܹ��õ����ٸ���Ʒ,�磺
--LevelAwardListTable = {
--	[1] = 10,
--	[2] = 10,
--	[3] = 10,
--nMaxCountÿ������ö��ٴ�
--nTaskGetDate�����������ǰ��ý���������
--nTaskGetCount�����������ǰ�Ѿ���ö��ٴ�
--szLogTitle
--nStartDate��ʼʱ�� tonumber(date("%y%m%d"))�����0�����ʾû�п�ʼʱ��
--nEndDate����ʱ�� �����0�����ʾû�н���ʱ��
function gf_EventFactionAward(tbItemIds, szItemName, LevelAwardListTable, nMaxCount, nTaskGetDate, nTaskGetCount, szLogTitle)
    local nDate = tonumber(date("%y%m%d"));
    local tbLogActions = {
        [1] = "Nhi�m v� s� m�n".." 1x",
        [2] = "Nhi�m v� s� m�n".." 2x",
        [3] = "Nhi�m v� s� m�n".." 3x",
        [4] = "Nhi�m v� s� m�n".." 4x",
        [5] = "Nhi�m v� s� m�n".." 5x",
        [6] = "Nhi�m v� s� m�n".." 6x",
        [7] = "Nhi�m v� s� m�n".." 7x",
        [8] = "Nhi�m v� s� m�n".." 8x",
        [9] = "Nhi�m v� s� m�n".." 9x",
    }
    local nCount = LevelAwardListTable[floor(GetLevel() / 10)];
    if GetTask(nTaskGetDate) < nDate then
        SetTask(nTaskGetCount, 0);
    end
    if GetTask(nTaskGetCount) < nMaxCount then
        tinsert(tbItemIds, nCount);
        if gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1) == 1 then
            SetTask(nTaskGetDate, nDate);
	    SetTask(nTaskGetCount, GetTask(nTaskGetCount) + 1);
        end
    end
end

--������õ������̻�����õ�ĳ��Ʒ��ÿ���ȼ�ÿ�λ�õ�������ͬ������ÿ�����������ƣ���Ҫ�ڵ���֮���жϱ����͸���
--������
--tbItemIds ��Ʒ��id = {id1, id2, id3}
--szItemName ��Ʒ������
--LevelAwardListTable���ǵڼ���Ӧ�ܹ��õ����ٸ���Ʒ,�磺
--LevelAwardListTable = {
--	[1] = 10,
--	[2] = 10,
--	[3] = 10,
--nTaskGetDate�����������ǰ��ý���������
--nTaskGetCount�����������ǰ�Ѿ���ö��ٴ�
--szLogTitle
--nBeginTime ��ʼ�������Ĵ���
--nEndTime �����������Ĵ���
function gf_EventCOFCAward(tbItemIds, szItemName, LevelAwardListTable, nBeginTime, nEndTime, nTaskGetDate, nTaskGetCount, szLogTitle)
    local nDate = tonumber(date("%y%m%d"));
    local tbLogActions = {
        [1] = "Nhi�m v� Th��ng h�i".." 1x",
        [2] = "Nhi�m v� Th��ng h�i".." 2x",
        [3] = "Nhi�m v� Th��ng h�i".." 3x",
        [4] = "Nhi�m v� Th��ng h�i".." 4x",
        [5] = "Nhi�m v� Th��ng h�i".." 5x",
        [6] = "Nhi�m v� Th��ng h�i".." 6x",
        [7] = "Nhi�m v� Th��ng h�i".." 7x",
        [8] = "Nhi�m v� Th��ng h�i".." 8x",
        [9] = "Nhi�m v� Th��ng h�i".." 9x",
    }
    local nCount = LevelAwardListTable[floor(GetLevel() / 10)];
    if GetTask(nTaskGetDate) < nDate then   --�ܽ���ú�����Ȼ��һ���̻������Ѿ���ɣ��µ�һ������
        SetTask(nTaskGetDate, nDate);
        SetTask(nTaskGetCount, 0);
    end
	SetTask(nTaskGetCount, GetTask(nTaskGetCount) + 1); --��¼�̻�������ɵĴ���
	if nBeginTime < 0 or nEndTime < 0 then          --�Ƿ�ֵ
	    return 0;
	end
	if nBeginTime == 0 and nEndTime == 0 then       --���޸�
	    tinsert(tbItemIds, nCount);
        gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
        return 1;
    end
    if nBeginTime == 0 and nEndTime ~= 0 then       --�ӵ�һ�ε���nEndTime��
        if GetTask(nTaskGetCount) <= nEndTime then
	        tinsert(tbItemIds, nCount);
            gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
            return 1;
        end
    end
    if nBeginTime ~= 0 and nEndTime == 0 then       --�ӵ�nBeginTime�ε����޴�
        if GetTask(nTaskGetCount) >= nBeginTime then
            tinsert(tbItemIds, nCount);
            gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
            return 1;
        end
    end                                             --�ӵ�nBeginTime�ε�nEndTime��
    if GetTask(nTaskGetCount) <= nEndTime and GetTask(nTaskGetCount)>= nBeginTime then
        tinsert(tbItemIds, nCount);
        gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
    end
    return 1;
end


--Խ�ϰ泣�õ���ͨ���ؽ�ɽׯĳ�ظ�ĳ����Ʒ, ��֤���ⲿ�ж�ʱ�����
--������
--StageAwardListTable��ÿ�ظ���Ʒ������StageAwardListTable = {[0] = 20, [1] = 20, [4] = 40};
--nTaskRecordChance��¼�ڼ��ν���ؽ����������
--nStage��ǰ�ǵڼ���
function gf_EventCangJiangAward(tbItemIds, szItemName, StageAwardListTable, nStage, szLogTitle)
    local tbMap = {
        [1] = 0,
        [2] = 1,
        [3] = 2,
        [4] = 3,
        [5] = 4,
        [8] = 5,
        [9] = 6,
        [10] = 7,
    };
    local strFullLogTitle = szLogTitle;
    local szLogAction = format("V��t �i %d t�ng ki�m nh�n ���c %s", tbMap[nStage], szItemName); --ͨ����0�ؼ��ոս����һ��
    local nOldPlayer = PlayerIndex;
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i);
	if PlayerIndex > 0 and StageAwardListTable[tbMap[nStage]] then
    		if GetTask(nTaskRecordChance) > 1 then---�շѽ���
  	    gf_AddItemEx2({tbItemIds[1], tbItemIds[2], tbItemIds[3], StageAwardListTable[tbMap[nStage]]}, szItemName, strFullLogTitle, szLogAction, 0, 1);
		end
	end
    end
    PlayerIndex = nOldPlayer;
end

--����Rand���������ֵ
function gf_SumRandBase(tRandList)
	if not tRandList or getn(tRandList) <= 0 then
		return 0;
	end
	local nRandBase = 0;
	for i = 1, getn(tRandList) do
		nRandBase = nRandBase + tRandList[i][2];
	end
	return nRandBase;
end



--����Ƿ���ĳ��ڼ�
--������nEventId��ʾ���ID
--����ֵ��1��ʾ�ڻ�ڼ䣬0��ʾ����
function gf_CheckEventDateEx(nEventId)
    if GetEventOpen(nEventId) == 0 then--���жϻ�Ƿ񿪷ţ����ж�ʱ��
        return 0;
    end
    local nDate = tonumber(date("%Y%m%d%H"));
    local nStartDate = GetEventStartDate(nEventId);
    local nEndDate = GetEventEndDate(nEventId);
    if not nStartDate or not nEndDate then
        return 0;
    end
    if nEndDate == 0 then
        if nDate >= nStartDate then
            return 1;
        else
            return 0;
        end
    else
        if nDate >= nStartDate and nDate < nEndDate then
            return 1;
        else
            return 0;
        end
    end
    return 0;
end

--����Ƿ���ĳ��ڼ�
--������[��ʼʱ�䣬����ʱ��), 0��ʾû�п�ʼ���������
--����ֵ��1��ʾ�ڻ�ڼ䣬0��ʾ����
function gf_CheckEventDateEx2(nStartDate, nEndDate)
    local nDate = tonumber(date("%Y%m%d%H"));
    if nEndDate == 0 then
        if nDate >= nStartDate then
            return 1;
        else
            return 0;
        end
    else
        if nDate >= nStartDate and nDate < nEndDate then
            return 1;
        else
            return 0;
        end
    end
end
--���һ����Ƿ����
function gf_CheckEventDateEnd(nActivityId)
	local nDate = tonumber(date("%Y%m%d%H"))
    local nEndDate = GetEventEndDate(nActivityId);
	if not(nEndDate) and nEndDate ~= 0 and nDate > nEndDate then
		return 1
	else
		return 0
	end
end
--�ж��Ƿ�ѧ��55������
function gf_Check55FullSkill()

    local TB_55_SKILL_INFO = {
        [2] = {21, 31},
		[3] = {45, 56},
		[4] = {33, 43},
		[6] = {58, 73},
		[8] = {75, 88},
		[9] = {90, 101},
		[11] = {103, 112},
		[12] = {114, 123},
		[14] = {125, 145},
		[15] = {147, 158},
		[17] = {720, 731},
		[18] = {733, 744},
		[20] = {364, 377},
		[21] = {347, 363},
		[23] = {1030, 1031},
		[25] = {1053, 1065},
		[26] = {1083, 1093},
		[27] = {1131, 1143},
		[29] = {1165, 1176},
		[30] = {1217, 1229},
		[31] = {1872, 1882 }, -- ����
		[32] = {1885, 1896 }, -- ����
    };
    local nPlayerRoute = GetPlayerRoute()
    if not TB_55_SKILL_INFO[nPlayerRoute]then
		return 0
    end
    for i = TB_55_SKILL_INFO[nPlayerRoute][1], TB_55_SKILL_INFO[nPlayerRoute][2] do
		if GetSkillLevel(i) == 0 then
			return 0;
		end
    end
    return 1;
end

function gf_Check55MaxSkill()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end;
	end;
end
function gf_Check55HaveSkill()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 1 then
			return 1
		else
			return 0
		end;
	end;
end
--���õĺϳ���Ʒ�ĺ���������ǰ��Ҫ���жϱ����͸���
--��������3������������1ԭ�ϱ�����2�����
--tbExchangeItemList = {
--  {
--      {"ԭ��1����", id1, id2, id3, count},
--      {"ԭ��2����", id1, id2, id3, count},
--      ....
--  }, --ԭ�ϱ�
--  --����������ж�����ݸ��ʳ���ĳһ�ĳһ����������ж���
--  {
--      {
--              "��һ������ܳ�",
--              ��һ�����ĸ���,
--              {"����1����", {id1, id2, id3, count}, nExpireTime},
--              {"����2����", {id1, id2, id3, count}, nExpireTime}
--      }, --��һ�����
--      {
--              "�ڶ�������ܳ�",
--              �ڶ������ĸ���,
--              {"����1����", {id1, id2, id3, count}, nExpireTime},
--              {"����2����", {id1, id2, id3, count}, nExpireTime}
--      }, --�ڶ������
--      ...
--  },
--}
--����0��ԭ�ϲ��㣬1Ϊ�ɹ�
function gf_ExchangeItemEx(tbExchangeItemList, szLogTitle, szLogAction)
    local tbSourceItem = tbExchangeItemList[1]; --ԭ�ϱ�
    local tbDestItem = tbExchangeItemList[2];   --�����

    local nCanExchange = 1; --�����Ƿ񹻣��Ƿ���Ժϳ�
    for i = 1, getn(tbSourceItem) do
        local tbSelectSourceItem = tbSourceItem[i];
        if GetItemCount(tbSelectSourceItem[2], tbSelectSourceItem[3], tbSelectSourceItem[4]) < tbSelectSourceItem[5] then
            nCanExchange = 0;
        end
    end
    if nCanExchange == 0 then
        return 0;
    end

    local nMaxPE = 0;          --���ʻ���
    local nDefault = 0;        --Ĭ��ѡ��

    for i = 1, getn(tbExchangeItemList[2]) do --�˶�Ϊ���ҳ����ʻ�����Ĭ���������
        local tbItem = tbExchangeItemList[2][i];
        nMaxPE = nMaxPE + tbItem[2];
        if tbItem[2] >= nDefault then
            nDefault = tbItem[2];
        end
    end

    local nRand = gf_GetRandItemByTable(tbDestItem, nMaxPE, nDefault);
    local tbSelectDestItem = tbDestItem[nRand];

    local nCanGive = 1; --�����Ƿ��Ѿ���ɾ���������Ը���Ʒ
    for i = 1, getn(tbSourceItem) do
        local tbSelectSourceItem = tbSourceItem[i];
        if DelItem(tbSelectSourceItem[2], tbSelectSourceItem[3], tbSelectSourceItem[4], tbSelectSourceItem[5]) ~= 1 then
            nCanGive = 0;--����Ʒɾ��ʧ���ˣ��Ͳ��ܸ��ϳɺ����Ʒ��
        end
    end

    if nCanGive == 1 then
        --�ҳ��ϳɵĶ����ˣ���������ͺ���
        for i = 3, getn(tbSelectDestItem) do-- �ӵ����ʼ������Ʒ��
            gf_AddItemEx2(tbSelectDestItem[i][2], tbSelectDestItem[i][1], szLogTitle, szLogAction, tbSelectDestItem[i][3], 1);
        end
        return 1;
    end
    return 0;
end

function gf_Add2XUAward(sItem, szItemName, szLogTitle, szLogAction)
	if GetFreeItemRoom() > 0 then
	gf_AddItemEx2(sItem, szItemName, szLogTitle, szLogAction, 0, 1);
	end
end

--���ַ���������ɫ(ע��Say�е�ѡ�����治�ܼ���ɫ)
--szColor=1 �Ǻ�ɫ
--szColor=2 ����ɫ
--szColor=3 ����ɫ
--szColor=4 �ǻ�ɫ
--�����
--nNpcName ~= nil ��ʾ��NPC���֣��Զ����ϡ�ð�š�
function gf_FixColor(szString, nColor, nIsNpcSay)
    local tbColor = {
        [1] = "red",
        [2] = "green",
        [3] = "blue",
        [4] = "yellow",
    };
    if nIsNpcSay == nil or nIsNpcSay == 0 then
        szString = format("<color=%s>%s<color>", tbColor[nColor], szString);
    else
        szString = format("<color=%s>%s:<color>", tbColor[nColor], szString);
    end
    return szString;
end

--�������ƣ��Ի��պ���
--��    �ܣ��Ի��պ���,��ݽ���
function gf_DoNothing()
end
-- ******************************************* Comment by Vilh *****************************************************

-- Name			: 	gf_ResetNumOfUsing_Day
-- Content			: 	Keep rate of the sequance of month!
-- Return value	:	None
-- Parameter		:
--		+ nTask	(value)		:  The Task_id
-- Example		:	gf_ResetNumOfUsing_Day ( 2530 )
-- Function created 11-12-2010
-- ******************************************* Comment by Vilh *****************************************************

function gf_ResetNumOfUsing_Day ( nTask )

	local nDate = tonumber( date( "%y%m%d" ) ) --101116

	-- Get the month sequance from the player's data.
	local nCurDate = floor ( GetTask( nTask ) / 100 )

	--Keep rate the data
	if nCurDate ~= nDate then
		SetTask ( nTask, nDate * 100 )   	-- reset so ngay su dung
	end
end



function gf_MsgToServer(sz, szItem, nForce)
	if nForce == 1 then
		Msg2SubWorld(sz)
		return
	end

	local nOldPlayer = PlayerIndex
	local szName = GetName()
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		if szName == GetName() then
			Msg2SubWorld(sz)
		end
	end
end
function gf_WriteCustomLog(szTitle, szAction, nType)
	local date_time = "["..date("%Y").."-"..date("%m").."-"..date("%d").." "..date("%H")..":"..date("%M")..":"..date("%S").."]"
	local event_name = szTitle or ""
	local action = szAction or ""
	local quantity = szquantity or ""
	local item_name = szitem_name or ""
	local item_code = szitem_code or ""
	local tong_name = sztong_name or ""
	local bug_desc = szbug_desc or ""
	local string_1 = szstring_1 or ""
	local string_2 = szstring_2 or ""
	local string_3 = szstring_3 or ""
	local reborn = gf_GetTaskByte(1538, 1) or ""
	local rolelevel = GetLevel() or ""
	local rank = GetTask(704) or ""
	local petlevel = 0
	if GetTask(TASK_VNG_PET) ~= nil then
		petlevel = mod(GetTask(TASK_VNG_PET), 100) or ""
	end
	local petid = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
	local pettype = ""
	if petlevel > 0 then
		if VET_201003_TONGBAN_STR_MODE_NAME[petlevel] then
			if VET_201003_TONGBAN_STR_MODE_NAME[petid] then
				pettype = VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] or ""
			end
		end
	end
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
	local strLogs = date_time.."\t".."INFO".."\t".."COMMON".."\t".."["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3.."\t"..reborn.."\t"..rolelevel.."\t"..rank.."\t"..petlevel.."\t"..pettype.."\t"..szCIP;
	if nType == 1 then
		local szDate = date("%Y%m%d")
		local szFileName = "logs/Ipbonus/"..szDate.."_ipbonus.log"
		local hFile = openfile(szFileName, "a+");
		if (hFile == nil) then
			execute(format("mkdir \"%s\"", "logs/Ipbonus/"));
			hFile = openfile(szFileName, "a+");
		end
		if (hFile ~= nil) then
			write (hFile, strLogs .. "\n");
			closefile (hFile);
		end
	else
		return
	end
end
-- Create By PhucBDB -20110316
function gf_SetTaskByDec(nTaskId  , nStart , nEnd , nValue)
	local  nLenValue = strlen(tostring(nValue))
	if  (nEnd - nStart +1)  < nLenValue then
		return 0
	end
	if nStart > nEnd then
		return 0
	end
	SetTask(nTaskId , nValue * (10^(nStart-1)))
	return 1
end
-- Create By PhucBDB -20110316
function  gf_GetTaskByDec(nTaskId  , nStart , nEnd)
	if nStart > nEnd then
		return 0
	end
	local nValue = GetTask(nTaskId)
	local nTmp1 = floor(nValue / (10^(nStart - 1)))
	local  nRange = nEnd - nStart + 2
	return mod(nTmp1 , (10^nRange))
end

--Խ�ϰ汾���ع����������峤��2011-3-29��ӣ�
SINI_CHG_INI_FILE = "\\script\\online_activites\\ini\\VnChangeMain.ini"
g_objOnlineChgRule = ff_GetIniFileObj(SINI_CHG_INI_FILE)
if g_objOnlineChgRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SINI_CHG_INI_FILE)
end
SkeyChangeMain="VNChangeMain"
SkeyPrizeNum = "nPrizeCount"
SkeyConsumptionNum = "nConsumptionCount"
SkeyPrizeElement="PrizeElement"
SkeyConsumptionElement="ConsumptionElement"
SKeyProbability="nProbability"

--��Ʒ�һ��Ի�����
function gf_VnGetChangeSaySel(sInfoKey)
	return "��i "..gf_VnGetItemChgPrizeInfo(sInfoKey,SkeyPrizeNum,SkeyPrizeElement).."(c�n"..gf_VnGetItemChgInfo(sInfoKey,SkeyConsumptionNum,SkeyConsumptionElement)..")"
end

--��ȡ�����Ķһ���ʽ
function gf_VnGetItemChgPrizeInfo(sInfoKey,sKeyElementCount,SkeyElement)
	local sElenmentInfo = ""
	local nElementCount = g_objOnlineChgRule:GetNum(sInfoKey,sKeyElementCount) or 0
	for nElemenSeq = 1,nElementCount do
		if nElemenSeq > 1 then
			--���Ԫ����Ҫ��ǰ�����+��
			sElenmentInfo = sElenmentInfo.." ho�c "
		end
		local tElementInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyElement..nElemenSeq)
		if tElementInfo == nil then
			return 0;
		end
		--���ݲ�ͬ����Ʒ�������ɲ�ͬ�Ķһ���ʽ�Ի�
		if tElementInfo[1] == "item" then
			sElenmentInfo = sElenmentInfo..tElementInfo[5]..tElementInfo[6]..tElementInfo[7]
		end
	end
	return sElenmentInfo
end

--��ȡ��Ʒ�Ķһ���ʽ
function gf_VnGetItemChgInfo(sInfoKey,sKeyElementCount,SkeyElement)
	local sElenmentInfo = ""
	local nElementCount = g_objOnlineChgRule:GetNum(sInfoKey,sKeyElementCount)
	for nElemenSeq = 1,nElementCount do
		if nElemenSeq > 1 then
			--���Ԫ����Ҫ��ǰ�����+��
			sElenmentInfo = sElenmentInfo.."+"
		end
		local tElementInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyElement..nElemenSeq)
		--���ݲ�ͬ����Ʒ�������ɲ�ͬ�Ķһ���ʽ�Ի�
		if tElementInfo[1] == "item" then
			sElenmentInfo = sElenmentInfo..tElementInfo[5]..tElementInfo[6]..tElementInfo[7]
		end
		if tElementInfo[1] == "money" then
			sElenmentInfo = sElenmentInfo..tostring(ceil(tElementInfo[2]/10000)).." Kim "
		end
	end
	return sElenmentInfo
end
--��Ʒ�Ի�����
function gf_VnItemChgDeal(sInfoKey)
	--����Ʒ���
	local nConsumptionCount=g_objOnlineChgRule:GetNum(sInfoKey,SkeyConsumptionNum)
	local nChkFlag = 1
	local sChgClew = "<color=green>Nh�c nh�<color>:"
	for nCounsumptionSeq = 1,nConsumptionCount do
		local tConsumptionInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyConsumptionElement..nCounsumptionSeq)
		--��Ʒ�Ĵ���
		if tConsumptionInfo[1] == "item" and GetItemCount(tConsumptionInfo[2],tConsumptionInfo[3],tConsumptionInfo[4]) < tConsumptionInfo[5] then
			nChkFlag = 0
			sChgClew = sChgClew.."\n    <color=green>"..tConsumptionInfo[7].." <color>kh�ng ��<color=red>"..tConsumptionInfo[5].."<color>"..tConsumptionInfo[6]
		end
		if tConsumptionInfo[1] == "money" and GetCash() < tonumber(tConsumptionInfo[2]) then
			nChkFlag = 0
			sChgClew = sChgClew.."\n    <color=green>v�ng trong t�i <color> kh�ng �� <color=red>"..ceil(tonumber(tConsumptionInfo[2]) / 10000).."<color>"
		end
	end
	if nChkFlag ~= 1 then
		sChgClew = sChgClew.."\n kh�ng th� ��i!"
		Talk(1,"",sChgClew)
		return
	end
	--�ռ���
	local nPrizeCount = g_objOnlineChgRule:GetNum(sInfoKey,SkeyPrizeNum)
	local nFreeRoomNeedCount = 0
	for nPrizeSeq = 1,nPrizeCount do
		local tPrizeInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyPrizeElement..nPrizeSeq)
		if tPrizeInfo[1] == "item" and tPrizeInfo[8] ~= nil and tPrizeInfo[8] ~= 0 then
			nFreeRoomNeedCount = nFreeRoomNeedCount + tPrizeInfo[8]
		end
	end
	if GetFreeItemRoom() < nFreeRoomNeedCount then
		Talk(1,"","<color=green>th�ng b�o<color>#\n    <color=green>kh�ng gian h�nh trang <color>kh�ng ��<color=red>"..nFreeRoomNeedCount.."<color> \n kh�ng th� ��i !")
		return
	end
	--�һ�����
		--ɾ������Ʒ
	local bDelFlag = 1
	local sDelClew = ""
	for nCounsumptionSeq = 1,nConsumptionCount do
		if bDelFlag == 0 then
			break
		end
		bDelFlag,sDelClew = gf_VnConsumptionDelMain(g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyConsumptionElement..nCounsumptionSeq))
	end
	if bDelFlag ~= 1 then
		Talk(1,"","<color=green>Nh�c nh�<color>:"..sDelClew.."\n kh�ng th� ��i!")
		return
	end
		--���ӽ�����Ʒ
	local nPrizeCount = g_objOnlineChgRule:GetNum(sInfoKey,SkeyPrizeNum)
	gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
end
--��Ʒʹ�öһ�����ͨ�ô���
SkeyItemInfo = "ItemInfo"
function gf_VnItemUsePrize(nItemIndex,sKeyInfo)
	--��Ʒ��Ϣ��ȡ��У��
	local tItemInfo = g_objOnlineChgRule:GetMixTable(sKeyInfo,SkeyItemInfo)
	local nItemGId,nItemDId,nItemPId = GetItemInfoByIndex(nItemIndex)
	if tItemInfo[1] ~= nItemGId or nItemDId ~= tItemInfo[2] or nItemPId ~= tItemInfo[2] then
		return
	end
	--��Ʒɾ��
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		local nPrizeCount = g_objOnlineChgRule:GetMixTable(sKeyInfo,SkeyItemInfo) or 1
		gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
	end
end
--��������
function gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
	local nProbability = 0
	local nTempProbability = random(100)
	for nTbCount = 1,nPrizeCount do
		local tPrizeInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyPrizeElement..nTbCount)
		nProbability = nProbability + (g_objOnlineChgRule:GetNum(sInfoKey,SKeyProbability..nTbCount) or 0)
		if tPrizeInfo == nil then
			return
		else
			if nTempProbability <= nProbability*100 or nProbability == 0 then
				if tPrizeInfo[1] == "item" then
					local bAddFlag = AddItem(tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4],tPrizeInfo[5])
					if bAddFlag == 1 then	--test:�������Ӹ��˻�������Ϣ�����ܼ���־

					else	--test
						WriteLog()
					end
				elseif tPrizeInfo[1] == "exp" then
					ModifyExp(tPrizeInfo[2])
					Msg2Player(format("C�c h� nh�n ���c %d �i�m kinh nghi�m!",tPrizeInfo[2]))
				end
				return
			end
		end
	end
end
--���Ŀ۳�
function gf_VnConsumptionDelMain(tConsumptionInfo)
	local bDelFlag = 1
	local sDelClew = ""
	if tConsumptionInfo[1] == "item" then
		if DelItem(tConsumptionInfo[2],tConsumptionInfo[3],tConsumptionInfo[4],tConsumptionInfo[5]) ~= 1 then
			bDelFlag = 0
			sDelClew = nDelClew.."\n    <color=green>"..tConsumptionInfo[7].." <color>kh�ng ��<color=red>"..tConsumptionInfo[5].."<color>"..tConsumptionInfo[6]
		end
	end
	if tConsumptionInfo[1] == "money" then
		if Pay(tonumber(tConsumptionInfo[2])) ~= 1 then
			bDelFlag = 0
			sDelClew = sDelClew.."\n    <color=green>v�ng trong t�i <color> kh�ng �� <color=red>"..ceil(tonumber(tConsumptionInfo[2]) / 10000).."<color>"
		end
	end
	return bDelFlag,sDelClew
end
--�̳�
function gf_Inherit(base)	--����һ���̳к���
	local derive = {};
	local foo = function(t,i)	--����"index"����
		return %base[i];
	end;
	settag(derive,newtag());
	settagmethod(tag(derive),"index",foo);
	for i,v in base do
		if type(v) == "table" then
			derive[i] = gf_Inherit(v);
		end;
	end;
	return derive;
end;
--��ҳ��ʾ��Say
--nPage:�ڼ�ҳ��ʼ
--tbInfo:�Ի�����table
function gf_SayEx(nPage,tbInfo)
	if not tbInfo then
		tbInfo = g_tbTempArg[GetName()]["gf_SayEx_Table"];
	else
		if not g_tbTempArg[GetName()] then
			g_tbTempArg[GetName()] = {};
		end;
		g_tbTempArg[GetName()]["gf_SayEx_Table"] = tbInfo;
	end;
	local nTotalPage = getn(tbInfo);
	local selTab = {};
	local szSayString = "";
	szSayString = tbInfo[nPage];
	if nPage ~= 1 then	--������ǵ�1ҳ���С���һҳ��
		tinsert(selTab,format("Trang tr��c/#gf_SayEx(%d)",nPage-1));
	end;
	if nPage ~= nTotalPage then	--����������һҳ���С���һҳ��
		tinsert(selTab,format("Trang k�/#gf_SayEx(%d)",nPage+1));
	end;
	tinsert(selTab,"K�t th�c ��i tho�i/nothing");
	Say(format(szSayString.."\n (hi�n t�i trang %d, t�ng %d trang)",nPage,nTotalPage),getn(selTab),selTab);
end;

function gf_ListSay(nCurPage,szCaption,tbString,nMaxRecordNumPerPage)
	nMaxRecordNumPerPage = nMaxRecordNumPerPage or 5;
	local tbInfo = {};
	local nTotalRecordNum = getn(tbString);
	local nMaxPage = ceil(nTotalRecordNum/nMaxRecordNumPerPage);
	for i=1,nMaxPage do
		local szString = "";
		for j=nMaxRecordNumPerPage*(i-1)+1,nMaxRecordNumPerPage*i do
			if tbString[j] then
				szString = szString..tbString[j].."\n"
			else
				szString = strsub(szString,1,strlen(szString)-2);
			end;
		end;
		szString = szCaption.."\n"..szString;
		tinsert(tbInfo,szString);
	end;
	gf_SayEx(1,tbInfo)
end;

function gf_ConfirmSay(szCaption,szFunction)
	local selTab = {
				"��ng �/#"..szFunction,
				"H�y b�/nothing",
				}
	Say(szCaption,getn(selTab),selTab);
end;

--��ö��������Ա������
function gf_GetAllTeamMember()
	local tbPlayer	= GetTeamMemberIndex(GetTeamID());
	local nTeamSize = GetTeamSize();
	tbPlayer	= tbPlayer	or {};
	nTeamSize	= nTeamSize	or 0;
	return tbPlayer,nTeamSize;
end;

function gf_StartTimeGuage(szCaption,nTime,bRepeate,nID,tbPlayer)
	if not tbPlayer then
		StartTimeGuage(szCaption,nTime,bRepeate,nID);
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		StartTimeGuage(szCaption,nTime,bRepeate,nID);
	end;
	PlayerIndex = nOldPIdx;
end;

function gf_StopTimeGuage(nID,tbPlayer)
	if not tbPlayer then
		StopTimeGuage(nID);
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		StopTimeGuage(nID);
	end;
	PlayerIndex = nOldPIdx;
end;
function gf_GetWorldPos(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nMapID,nMapX,nMapY = GetWorldPos();
	PlayerIndex = nOldPIdx;
	return nMapID,nMapX,nMapY;
end;
--���ĳ�ŵ�ͼ�Ķ�̬��ͼID table
function gf_GetMapIDTable(nMapID)
	local tbMapID = gf_GetDataTable(GetSameMaps(nMapID));
	return tbMapID;
end;
--�ж�һ�������ĳ������ľ���
--tbPlayer:��Ҫ���жϵ��������table
--nMapID,nMapX,nMapY:��������
--nScale:�뾶����Χ��
--����ֵ1���Ƿ�ȫ����Ҷ��ڷ�Χ��
--����ֵ2����Χ����������table
function gf_CheckPlayersDistance(tbPlayer,nMapID,nMapX,nMapY,nScale)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nMapID1,nMapX1,nMapY1 = GetWorldPos();
		if nMapID1 ~= nMapID then
			tinsert(tbRetPlayer,PlayerIndex);
		else
			if gf_GetDistance(nMapX,nMapY,nMapX1,nMapY1) > nScale then
				tinsert(tbRetPlayer,PlayerIndex);
			end
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--�ж϶���������������Լ��ľ���
function gf_CheckTeamMemberDistance(nScale)
	local tbPlayer = gf_GetAllTeamMember();
	local nMapID,nMapX,nMapY = GetWorldPos();
	local nRetCode,tbRetPlayer = gf_CheckPlayersDistance(tbPlayer,nMapID,nMapX,nMapY,nScale);
	return nRetCode,tbRetPlayer;
end;
--��鼯���������ҵȼ��Ƿ����Ҫ��
--nMinLevel:Ҫ�����С�ȼ���Ĭ��Ϊ1��
--nMaxLevel:Ҫ������ȼ���Ĭ��Ϊ99��
function gf_CheckPlayersLevel(tbPlayer,nMinLevel,nMaxLevel)
	nMinLevel = nMinLevel or 1;
	nMaxLevel = nMaxLevel or MAX_PLAYER_LEVEL;
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nLevel = GetLevel();
		if nLevel < nMinLevel or nLevel > nMaxLevel then
			tinsert(tbRetPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--�������������ҵȼ��Ƿ����Ҫ��
function gf_CheckTeamMemberLevel(nMinLevel,nMaxLevel)
	local tbPlayer = gf_GetAllTeamMember();
	local nRetCode,tbRetPlayer = gf_CheckPlayersLevel(tbPlayer,nMinLevel,nMaxLevel);
	return nRetCode,tbRetPlayer;
end;
--�����������ַ������磺 "���A,���B,���C,���D"
function gf_GetPlayersName(tbPlayer)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	local szRetString = "";
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local szName = GetName();
		szRetString = szRetString..szName..",";
	end;
	if szRetString ~= "" then
		szRetString = strsub(szRetString,1,strlen(szRetString)-1);
	end;
	PlayerIndex = nOldPIdx;
	return szRetString;
end;

function gf_CheckPlayersTaskValue(tbPlayer,nTaskID,tbRule)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nTaskValue = GetTask(nTaskID);
		if tbRule.Rule == "==" and tbRule.Value ~= nTaskValue then
			tinsert(tbRetPlayer,PlayerIndex);
		elseif tbRule.Rule == "<" and nTaskValue >= tbRule.Value then
			tinsert(tbRetPlayer,PlayerIndex);
		elseif tbRule.Rule == ">" and nTaskValue <= tbRule.Value then
			tinsert(tbRetPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--����������������������Ƿ����Ҫ��
function gf_CheckTeamMemberTaskValue(nTaskID,tbRule)
	local tbPlayer = gf_GetAllTeamMember();
	local nRetCode,tbRetPlayer = gf_CheckPlayersTaskValue(tbPlayer,nTaskID,tbRule);
	return nRetCode,tbRetPlayer;
end;
--�����ַ�����Ϊ������table�����жϵ�������nDataIdx����������һ���µ����ݸ�ʽ��table
--��table:
--table =
--{
--	name1 = {1,2,3},
--	name2 = {32,2,12},
--	name3 = {-1,5,3},
--}
--gf_SortKeyTable(table,1)��ʾ�Ե�1�е����ݽ������򣬽���������tableΪ���£�
--new_table
--{
--	[1] = {32,3,12,Key=name2},
--	[2] = {1,2,3,Key=name1},
--	[3] = {-1,5,3,Key=name3},
--}
function gf_SortKeyTable(tbOrg,nDataIdx,nSortType)
	nSortType = nSortType or 1;	--Ĭ��Ϊ����
	local tbRet ={};
	for k,v in tbOrg do
		local tb = gf_UnPack(v);
		for i=1,getn(v) do
			tbRet[i] = v[i];
		end;
		tbRet.Key = k
	end;
	local funSort1 = function(tb1,tb2)	--����
		if tb1[%nDataIdx] > tb2[%nDataIdx] then
			return 1;
		else
			return nil;
		end;
	end;
	local funSort2 = function(tb1,tb2)	--����
		if tb1[%nDataIdx] < tb2[%nDataIdx] then
			return 1;
		else
			return nil;
		end;
	end;
	local funSort = nil;
	if nSortType == 1 then
		funSort = funSort1;
	else
		funSort = funSort2;
	end;
	sort(tbRet,funSort);
	return tbRet;
end;
--�����ַ����е�һЩ�Ƿ��ַ�
function gf_FormatString(szName)
	local tbIllegal = {"/","|",":"};
	for i=1,getn(tbIllegal) do
		szName = sf_Replace(szName,tbIllegal[i],"-");
	end;
	return szName;
end;

function gf_CopyInherit(...)
	local base = gf_Merge2(gf_UnPack(arg));
	local derive = new(base);
	return derive
end

function gf_Merge2(...)
	local base = {}
	for i = 1, arg.n do
		for k,v in arg[i] do
			base[k] = arg[i][k];
		end
	end
	return base;
end

function nothing()

end;

function gf_RandRate(tRate, nMax, nLine)
	nLine = nLine or 1;
	if not nMax then
		nMax = 0;
		for i = 1, getn(tRate) do
			nMax = nMax + tRate[i][nLine];
		end
	end
	local nRand = random(nMax)
	for i = 1, getn(tRate) do
		if nRand <= tRate[i][nLine] then
			return tRate[i],i;
		else
			nRand = nRand - tRate[i][nLine];
		end
	end
end
function gf_TeamOperate(func, ...)
	local nSize = GetTeamSize()
	if nSize < 1 then
		func(gf_UnPack(arg));
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i)
			func(gf_UnPack(arg));
		end
		PlayerIndex = oldPlayerIndex;
	end
end
function gf_TeamOperateEX(func, ...)
	local tPlayer = GetTeamMemberIndex(GetTeamID()) or {};
	local nSize = getn(tPlayer);
	if nSize < 1 then
		func(gf_UnPack(arg));
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = tPlayer[i]
			func(gf_UnPack(arg));
		end
		PlayerIndex = oldPlayerIndex;
	end
end
function gf_RandomSelected(tData, nRndIdx)
	if not tData or 0 == getn(tData) then
		return 0;
	end

	local nMax = 0;
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nMax = nMax + tInfo[nRndIdx];
		end
	end

	local nRand = random(1, nMax);
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nRand = nRand - tInfo[nRndIdx];
			if nRand <= 0 then
				return idx;
			end
		end
	end

	return 0;
end
function gf_CallBack(...)
	if arg.n == 1 then
		arg = gf_UnPack(arg);
	end
	local func = arg[1];
	func(gf_UnPack(arg, 2));
end

function callout(f, ...)
	if type(f) ~= "function" then
		debug("[Error] [callout] [func=%s, type=%s]",Val2Str(f), type(f));
	end
	local targ = arg;
	return function (...)
		local p = gf_MergeTable(%targ, arg);
		%f(gf_UnPack(p))
	end
end

function rcallout(f, ...)
	local targ = arg;
	return function (...)
		local p = {};
		for k,v in %targ do
			p[k] = v;
		end
		for k,v in arg do
			p[k] = v;
		end
		p.n = nil
		%f(gf_UnPack(p))
	end
end

function gf_GetRealmName(strTongName)
	local aa,bb,strGbGroup,strGbName = strfind(strTongName,"(.-)*(.*)");
	if strGbName == nil then
		strGbGroup = "";
		strGbName = strTongName;
	end
	return strGbGroup,strGbName;
end

function gf_GetRealmTongName()
	local szTongName = GetTongName();
	
	if not szTongName or szTongName == "" then
		return szTongName
	end

	local strGbGroup, sName = gf_GetRealmName(GetName());

	if strGbGroup and strGbGroup ~= "" and szTongName then
		szTongName = strGbGroup.."*"..szTongName;
	end

	return szTongName
end

--�µ�LogDB���÷���
--gf_StartLog(type,name)
--gf_Log(str)
--����
--gf_EndLog()
--Start��End֮�������Log����ϳ�һ����¼����\t�ָ���

function gf_StartLog(strType, strName)
	strLogType = strType
	strLogName = strName
	strLogContent = nil
end

function gf_EndLog()
	local ret = 0
	if strLogType and strLogName and strLogContent then
		ret = WriteLogDB(strLogType, strLogName, strLogContent)
	end
	strLogType, strLogName = nil, nil
	return ret
end

function gf_Log(strLog)
	if strLogType and strLogName then
		if strLogContent then
			strLogContent = strLogContent .. "\t" .. strLog
		else
			strLogContent = strLog
		end
		WriteLog(format("[%s] [%d] [Role:%s (acc:%s)] %s",
				strLogName, strLogType, GetName(), GetAccount(), strLog))
	end
end

function gf_DelItem(nG, nD, nP, nCount)
	if DelItem(nG,nD,nP,nCount) == 1 then
		WriteLog(format("[%s][gf_DelItem:%s*%d (%d,%d,%d) Success][Role:%s (acc:%s)]", strLog or "", GetItemName(nG,nD,nP), nCount, nG,nD,nP, GetName(), GetAccount()));
		return 1
	else
		--WriteLog(format("[%s][gf_DelItem:%s*%d Failed][Role:%s (acc:%s)]", strLog or "", GetItemName(nG,nD,nP), nCount, GetName(), GetAccount()));
		return 0
	end
end

function gf_DelItemByIndex(nItemIdx, nCount)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	local bBind = tonumber(GetItemSpecialAttr(nItemIdx,"BIND")) or -1;

	if DelItemByIndex(nItemIdx, nCount) == 1 then
		WriteLog(format("[%s][gf_DelItem:%s*%d (%d,%d,%d,bBind=%d), Success][Role:%s (acc:%s)]", strLog or "", GetItemName(nItemIdx), nCount, nG,nD,nP,bBind, GetName(), GetAccount()));
		return 1
	else
		--WriteLog(format("[%s][gf_DelItem:%s*%d Failed][Role:%s (acc:%s)]", strLog or "", GetItemName(nItemIdx), nCount, GetName(), GetAccount()));
		return 0
	end
end

function gf_AddItems(sItemIds, strName, nCount)
	if type(sItemIds) ~= "table" then
		WriteLog(format("[%s] [AddItemEx Tham s� sai!] [Role:%s (acc:%s)] [Item:%s]",--������Ϣ������ϵ���־
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	strName = strName or GetItemName(sItemIds[1],sItemIds[2],sItemIds[3]);
	nCount 	= nCount or sItemIds[4];
	local nAmg = (nCount and 3) or 4;
	if getn(sItemIds) < nAmg then
		WriteLog(format("[%s] [AddItemEx Tham s� sai!] [Role:%s (acc:%s)] [Item:%s]",--������Ϣ������ϵ���־
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end

	local nRet, nItemIdx = 0;
	if sItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13],sItemIds[14]);
	else
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
	end
	if nRet == 0 then
		WriteLog(format("[%s] [AddItemEx: Th�t b�i] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",--ʧ�ܼ�¼���ϵ���־
			strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	elseif nRet == 1 then
		Msg2Player("C�c h� nh�n ���c ["..strName.."]x"..nCount);
		gf_Log(format("%s(%d,%d,%d)\t%d",
				strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount))
	elseif nRet == 2 then
		Msg2Player("C�c h� �� r�i["..strName.."]x"..nCount);
		gf_Log(format("%s(%d,%d,%d)\t%d",
			strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	end
	return nRet, nItemIdx;
end

function gf_PrintTable(t, n)
	if "table" ~= type(t) then
		return 0;
	end

	n = n or 0;

	local str_space = "";
	for i = 0, n do
		str_space = str_space.."  ";
	end
	print(str_space.."{");

	for k, v in t do
		local str_k_v = str_space.."  ["..tostring(k).."] = ";
		if "table" == type(v) then
			print(str_k_v);
			gf_PrintTable(v, n + 1);
		else
			str_k_v = str_k_v..tostring(v);
			print(str_k_v);
		end
	end

	print(str_space.."}");
end

function gf_CreateTraps(tTraps)
	for _, t in tTraps do
		local tPoint = gf_Line(t[2][1], t[2][2], t[3][1], t[3][2]);
		if tPoint then
			for i = 1, getn(tPoint) do
				AddMapTrap(t[1], tPoint[i][1] * 32, tPoint[i][2] * 32, t[4]);
			end
		end
	end
end

function gf_Line(x1, y1, x2, y2)
	local t, dx, dy = 0;
	local tPoint = {};
	if x2 == x1 then
		dx, dy = 0, 1;
	else
		local d = abs((y2 - y1) / (x2 - x1));
		if abs(d) > 1 then
			dx, dy = 1/d, 1;
		else
			dx, dy = 1 , d;
		end
	end
	if x2 < x1 then dx = -dx end
	if y2 < y1 then dy = -dy end

	while 1 do
		local x = x1 + t * dx;
		local y = y1 + t * dy;
		t = t + 1;
		tinsert(tPoint, {floor(x+0.1), floor(y+0.1)});
		if t > 1000 or (x == x2 and y == y2) then break end
	end
	if t >= 1000 then
		print(format("[ERROR] [autoexec:Line] [(%d, %d) -> (%d, %d)] [t >= 1000]", x1, y1, x2, y2));
		return
	end
	return tPoint;
end

function gf_get_table_count(tTable)
	if not tTable or 'table' ~= type(tTable) then return 0 end

	local nCount	= 0;
	for _, _ in tTable do
		nCount		= nCount + 1;
	end

	return nCount;
end

function gf_GetSafeStr(str)
	str = sf_Replace(str, "\\", "\\\\");
	str = sf_Replace(str, "'", "\\'");
	str = sf_Replace(str, '"', '\\"');
	str = sf_Replace(str, "\t", "\\t");
	str = sf_Replace(str, "\10", "\\010");
	str = sf_Replace(str, "\13", "\\013");
	str = sf_Replace(str, "\0", "\\000");
	str = sf_Replace(str, " ", "\032");
	str = sf_Replace(str, "%", "\%");
	str = sf_Replace(str, "|", "_");
	return str;
end

function gf_GetSafeName()
	return gf_GetSafeStr(GetName());
end

--��ö���������������55�����ж�Ϊǰ�ᣩ
function gf_GetRouteCount()
	local RouteTable = {}
	local nCount = 1
	local nRoute = 0
	local flagInTable = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute()
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1
				break
			end
		end
		if flagInTable == 1 then
			flagInTable = 0
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldIndex
	return nCount - 1
end

--��ȡ��Ա����ָ����������
function gf_GetTeamSameTongNum(strTongName)
	if strTongName == nil or strTongName == "" then
		return -1;
	end
	local nCount = 0;
	local OldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetTongName() == strTongName then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = OldPlayerIndex;
	return nCount;
end

--�ȼ��������ж�
function gf_CheckBaseCondition(nBaseLevel, bNotMsg)
	local nLevel = gf_GetTransLevel();
	if nLevel < nBaseLevel or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		if not bNotMsg or bNotMsg ~= 1 then
			Talk(1,"",format("Ng��i ch�i c�p <color=green>%d<color> tr� l�n �� gia nh�p h� ph�i h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia ho�t ��ng.",nBaseLevel));
		end
		return 0;
	end
	return 1;
end

--��ͼ�Ƿ�����
function gf_MapIsAllow(tbMapID,nMapID)
	for i = 1, getn(tbMapID) do
		if nMapID == tbMapID[i] then
			return 1;
		end
	end
	return 0;	
end

--ͨ��װ�����------------------------------------------------
--�ǿ�
function gf_RandXingKe()
	local tbTemp = {
		_XINGKE_WEAPON_TABLE,
		_XINGKE_CAP_TABLE,
		_XINGKE_CLOTH_TABLE,
		_XINGKE_SHOE_TABLE,
		_XINGKE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandXingKe_Weapon()
	return gf_EventGiveRandAward(_XINGKE_WEAPON_TABLE, 10000, 1);
end

function gf_RandXingKe_Cap()
	return gf_EventGiveRandAward(_XINGKE_CAP_TABLE, 10000, 1);
end

function gf_RandXingKe_Cloth()
	return gf_EventGiveRandAward(_XINGKE_CLOTH_TABLE, 10000, 1);
end

function gf_RandXingKe_Shoe()
	return gf_EventGiveRandAward(_XINGKE_SHOE_TABLE, 10000, 1);
end

function gf_RandXingKe_Ring()
	return gf_EventGiveRandAward(_XINGKE_RING_TABLE, 10000, 1);
end

--����
function gf_RandTianYi()
	local tbTemp = {
		_TIANYI_WEAPON_TABLE,
		_TIANYI_CAP_TABLE,
		_TIANYI_CLOTH_TABLE,
		_TIANYI_SHOE_TABLE,
		_TIANYI_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandTianYi_Weapon()
	return gf_EventGiveRandAward(_TIANYI_WEAPON_TABLE, 10000, 1);
end

function gf_RandTianYi_Cap()
	return gf_EventGiveRandAward(_TIANYI_CAP_TABLE, 10000, 1);
end

function gf_RandTianYi_Cloth()
	return gf_EventGiveRandAward(_TIANYI_CLOTH_TABLE, 10000, 1);
end

function gf_RandTianYi_Shoe()
	return gf_EventGiveRandAward(_TIANYI_SHOE_TABLE, 10000, 1);
end

function gf_RandTianYi_Ring()
	return gf_EventGiveRandAward(_TIANYI_RING_TABLE, 10000, 1);
end

--���
function gf_RandHaoYue()
	local tbTemp = {
		_HAOYUE_WEAPON_TABLE,
		_HAOYUE_CAP_TABLE,
		_HAOYUE_CLOTH_TABLE,
		_HAOYUE_SHOE_TABLE,
		_HAOYUE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandHaoYue_Weapon()
	return gf_EventGiveRandAward(_HAOYUE_WEAPON_TABLE, 10000, 1);
end

function gf_RandHaoYue_Cap()
	return gf_EventGiveRandAward(_HAOYUE_CAP_TABLE, 10000, 1);
end

function gf_RandHaoYue_Cloth()
	return gf_EventGiveRandAward(_HAOYUE_CLOTH_TABLE, 10000, 1);
end

function gf_RandHaoYue_Shoe()
	return gf_EventGiveRandAward(_HAOYUE_SHOE_TABLE, 10000, 1);
end

function gf_RandHaoYue_Ring()
	return gf_EventGiveRandAward(_HAOYUE_RING_TABLE, 10000, 1);
end

--1������
function gf_Rand1YunLing()
	return gf_EventGiveRandAward(_YUNLING_1_TABLE, 10000, 1);
end

--2������
function gf_Rand2YunLing()
	return gf_EventGiveRandAward(_YUNLING_2_TABLE, 10000, 1);
end

--3������
function gf_Rand3YunLing()
	return gf_EventGiveRandAward(_YUNLING_3_TABLE, 10000, 1);
end

--��ͽװ��
function gf_RandLingTu(nType, bIsBody)
	local tEquip = {
			[1] = _LINGTU_CAP_TABLE_, --ͷ
			[2] = _LINGTU_CLOTH_TABLE_, --��
			[3] = _LINGTU_SHOE_TABLE_,	--��
	}
	local tAward = tEquip[nType];
	if not tAward then return 0; end
	local nBody = GetBody();
	if not bIsBody or bIsBody ~= 1 then
		nBody = random(1, 4); --�Ƿ�����
	end
	local tCell = tAward[nBody];
	if not tCell then return 0; end
	local nIndex = random(getn(tCell));
	gf_AddItemEx2(tCell[nIndex], GetItemName(tCell[nIndex][1], tCell[nIndex][2], tCell[nIndex][3]), "Trang b� Linh �� (Ng�u nhi�n)", tostring(nBody), 0, 1);
	return tCell[nIndex][1], tCell[nIndex][2], tCell[nIndex][3], tCell[nIndex][4];
end
-----------------------------------------------------------------

--ͨ��Ͷ��ROLL����
--roll����
--����Ҫ����NPCIndex
function gf_ThrowDice(tbItem, sFilePath, cbFunc, nMax, nTime, targetNpc)
	if type(tbItem) ~= "table" then return end
	if not targetNpc or targetNpc == 0 then
		print("Error:gf_ThrowDice(tbItem, sFilePath, cbFunc, nMax, nTime, targetNpc) targetNpc invalid");
		return 0;
	end 
	sFilePath = sFilePath or "\\script\\lib\\globalfunctions.lua";
	cbFunc = cbFunc or "gf_ThrowDiceCallBack";
	local diceId = ApplyItemDice(1, nMax or 100, nTime or 150, sFilePath, cbFunc, GetTeamSize() or 1, targetNpc);
	AddDiceItemInfo(diceId, gf_UnPack(tbItem))
	if GetTeamSize() > 1 then
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			RollItem(diceId);
		end
		PlayerIndex = nPlayerOld;
	else
		RollItem(diceId);
	end
end

--roll�ص�
function gf_ThrowDiceCallBack(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1;
	if type(t) ~= "table" then return end
	for index, value in t do
		local str = value[1].."N�m"..value[2].." �i�m"
		if value[3] == 0 then
			str = value[1].."Ph�ng"
		elseif value[3] == 1 then
			str = str.." (Tuy�t c�u)"
			if value[4] == 1 then
				str = str.." -�� nh�t ���c"..szItem
				gf_WriteLogEx("gf_ThrowDice", "gf_ThrowDiceCallBack", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -�� nh�t ���c"..szItem
				gf_WriteLogEx("gf_ThrowDice", "gf_ThrowDiceCallBack", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("T�t c� ng��i ch�i �� b� cu�c")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh�ng ng��i ch�i kh�c �� v��t qu� th�i gian, xem nh� b� cu�c")
	end
end

--�����������û�ж�������
function gf_GetTeamSize()
	local nTeamSize = GetTeamSize();
	if nTeamSize <= 0 then
		return 1;
	else
		return nTeamSize;
	end
end

function gf_GetCaptainName()
	if GetTeamSize() <= 0 then
		return GetName();
	else
		return GetCaptainName();
	end
end

function gf_GetTeamMember(nIndex)
	if nIndex < 0 then 
		return PlayerIndex; 
	end
	local nPlayerIndex = GetTeamMember(nIndex);
	if nPlayerIndex <= 0 then
		return PlayerIndex;
	else
		return nPlayerIndex;
	end
end

--���nNum�����ظ�����
--nNum ���ص�������Ŀ
--nStart ��ʼ����
--nEnd ��������
function gf_Random(nStart, nEnd, nNum)
	local tRezult = {};
	if not nStart or not nEnd or not nNum then
		print("UDERROR:gf_Random nStart or nEnd or nNum is nil");
		return tRezult;
	end
	if nStart > nEnd then
		print("UDERROE:gf_Random nStart > nEnd");
		return tRezult;
	end
	if nNum > nEnd then
		print("UDERROR:gf_Random nNum > nEnd");
		return tRezult;
	end
	if nNum < 1 then
		print("UDERROR: gf_Random nNum < 1");
		return tRezult;
	end
	local nInc = floor(nEnd / nNum);
	local nTemp1 = nStart;
	local nTemp2 = nInc;
	for i = 1, nNum do
		if nNum == i then
			nTemp2 = nEnd;
		end
		tinsert(tRezult, random(nTemp1, nTemp2));
		nTemp1 = nTemp2 + 1;
		nTemp2 = nTemp2 + nInc;
	end
	if nNum ~= getn(tRezult) then
		print("UDERROR: gf_Random nNum ~= getn(tRezult)")
	end
	return tRezult;
end

--��ö���ָ���ȼ�������
--ǰ�պ�����
function gf_GetTeamPlayerCountByLevel(nMinLevel, nMaxLevel)
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel >= nMinLevel and nLevel < nMaxLevel then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	return nCount;
end

-- ת���ж�
function gf_TeamCheckRebornAndLv(nTeamID, nReborn, nLevel)
	local f_check_level = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local nRet = 0
		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;

		if gf_CheckLevel(%nReborn, %nLevel) == 1 then
			nRet = 1
		else
			nRet = 0 
		end
		
		PlayerIndex				= OldPlayerIndex;
		return nRet;
	end
	
	return gf_team_operate_member(nTeamID, f_check_level, 0, nil);
end

--����ת���ȼ�
function gf_GetPlayerRebornCount()
	local nAddvanceTrans = GetPlayerRebornParam(0)
	if nAddvanceTrans > 0 then
		--Խ��ת������������5ת��6ת�����з�ϵͳ��¼
		return nAddvanceTrans + 5
	end
	
	return GetByte(GetTask(1538), 1)
end

function gf_GetTransLevel()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end

--��ö���ת������
function gf_GetTeamRebornPlayerCount()
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if gf_GetPlayerRebornCount() > 0 then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	return nCount;
end

function gf_TodayDate()
	return tonumber(date("%Y%m%d"));
end

function callout(f, ...)
	if type(f) ~= "function" then
		debug("[Error] [callout] [func=%s, type=%s]",Val2Str(f), type(f));
	end
	local targ = arg;
	return function (...)
		local p = gf_MergeTable(%targ, arg);
		%f(gf_UnPack(p))
	end
end

function rcallout(f, ...)
	local targ = arg;
	return function (...)
		local p = {};
		for k,v in %targ do
			p[k] = v;
		end
		for k,v in arg do
			p[k] = v;
		end
		p.n = nil
		%f(gf_UnPack(p))
	end
end

function StatLog(...)
	local key, n1, n2 = arg[1] or 0, arg[2] or 0, arg[3] or 0;
	WriteLog(format("[StatLog] [%s] [%d, %d]", key, n1, n2));
end

function totable(...)
	arg.n = nil;
	return arg;
end

--Խ���ۼƵ�¼ʱ��ӿ�
function gf_GetAccTime()
	return GetTask(2536) --�ۼƵ�½����min
end

--Խ���ۼƵ�¼ʱ��ӿ�
function gf_SetAccTime(nMinute)
	local nCurrAccTime = GetTask(2536)
	SetTask(2536, nMinute) --�����ۼ�ʱ��min
	WriteLog(format("[gf_SetAccTime] Set Accumulative Time %d To %d", nCurrAccTime, GetTask(2536)))
end

--��鵱ǰʱ���Ƿ�������֮��
--tStart, tEnd = {year,month,day,hour,min,sec}
--�ɹ�����1�����ڷ���0
function gf_CheckDuration(tStart, tEnd)
	local nCurTime = GetTime();
	local nStaTime = MkTime(tStart[1],tStart[2],tStart[3],tStart[4],tStart[5],tStart[6]);
	local nEndTime = MkTime(tEnd[1],tEnd[2],tEnd[3],tEnd[4],tEnd[5],tEnd[6]);
	if nCurTime >= nStaTime and nCurTime <= nEndTime then
		return 1;
	end
	return 0;
end

--������
--ʧ�ܷ���0���ɹ�����1
--f������0��1
--msg��say̧ͷ
function gf_CheckTeam(f, msg)
	if type(f) ~= "function" then
		debug("[Error] [gf_CheckTeam] [func=%s, type=%s]", Val2Str(f), type(f));
	end
	local bCheck = nil;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if f() ~= 1 then
			msg = msg..format("<color=red>%s<color>\n", GetName());
			bCheck = 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if bCheck then
		Say(msg, 0)
		return 0;
	end
	return 1;
end

--�жϵ�ǰ�Ƕ��г�ս����
function gf_IsWorkingPet()
	local nNum, tPet = GetPetList();
	if nNum <= 0 then
		return 0;
	end
	for k, v in tPet do
		if v["nStatus"] ~= 0 then
			return 1;
		end
	end
	return 0;
end

--��������ֵ
function gf_ModifyPetLingli(nValue)
	local nTaskValue = GetTask(1535);
	nTaskValue = nTaskValue + (nValue * 100);
	SetTask(1535, nTaskValue);
	Msg2Player(format("B�n nh�n ���c %d �i�m linh l�c th� c�ng", nValue));
end

--��ý������ȼ���ѱ�޵ȼ���
function gf_GetPetSkillLevel()
	return GetSkillLevel(30149)--mod(GetTask(2560), 100);
end

--�޸Ľ������ȼ���ѱ�޵ȼ���
function gf_SetPetSkillLevel(nValue)
--	local nTaskValue = GetTask(2560);
--	nTaskValue = nTaskValue - mod(nTaskValue, 100);
--	nTaskValue = nTaskValue + nValue;
--	SetTask(2560, nTaskValue);
	local nSkillId = 30149
	if gf_GetPetSkillLevel() < nValue then
    	while gf_GetPetSkillLevel() < nValue do
    		if gf_GetPetSkillLevel()==0 then
    			LearnSkill(nSkillId)
    		else
    			LevelUpSkill(nSkillId)
    		end
    	end
    	Msg2Player(format("Gi�ng Linh Thu�t t�ng l�n c�p %d", nValue));
	end
end

--�������ƣ�������ƹ��˺���
--�������ܣ��滻��������еķǷ��ַ�
function gf_FilterName(str,pattern,s)
	local startS, endS = strfind(str, pattern)
	while(startS) do
		str = strsub(str, 1, startS-1)..s..strsub(str, endS+1, strlen(str))
		startS, endS = strfind(str, pattern)
	end
	return str
end

--�������ƣ���Ӽ�⺯��
--�������ܣ���⴫���player_index�Ƿ�͵�ǰ��PlayerIdex��ͬһ��������
function gf_IsInTeam(player_index)
	local team_member_num = GetTeamSize()
	local chk_flag = 0
	if team_member_num ~= 0 then
		for i = 1, team_member_num do
			if GetTeamMember(i) == player_index then
				chk_flag = 1
			end
		end
	end	
	return chk_flag
end

--�Ƿ�ﵽnRebornתnlevel��
function gf_CheckLevel(nReborn, nLevel, bNotify)
	local nReb = gf_GetPlayerRebornCount();
	if (nReb >= nReborn and GetLevel() >= nLevel) or
			nReb >= nReborn + 1 
	then
		return 1;
	end
	if bNotify and bNotify == 1 then
		Talk(1, "", format("Ch�a ��t chuy�n sinh %d c�p %d",nReborn, nLevel))
	end
	return 0;
end

--�ж�Խ�ϻ�鸴�������Ƿ����
function gf_CheckVeitPetTaskFinish()
	--LongDaiKa: h�m c� ki�m tra ph�c sinh b�n ��ng h�nh kh�ng hi�u v� sao task b� ��ng
	--local TSK_PHUCSINH2 = 2175;
	--local nMISSION_QTY = 50;
	--if gf_GetTaskByte(TSK_PHUCSINH2, 2) == nMISSION_QTY and gf_GetTaskByte(TSK_PHUCSINH2, 3) == 127 then
	--	return 1;
	--end
	--return 0;

	--LongDaiKa: h�m m�i theo check �i�u ki�n b�c ��u l�o nh�n
	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	if nIsPS >= 1 then
		return 1; -- ph�c sinh r�i
	end
	return 0;
end

--��õ�ǰ����(ÿ����24�����)
function gf_GetWeekly()
	local nTime = MkTime(1970,01,05);
	local weekno = floor((GetTime()-nTime)/(7*24*3600));
	--Msg2Player(format("weekno=%d",weekno));
	--Msg2Player(date());
	--Msg2Player(GmTime(weekno*(7*24*3600)+4*24*3600))
	return weekno;
end

--�ַ����ָ�
--Ĭ���Զ��ŷָ�
--����table
function gf_StrSplit(src, sep)
	src = src or "";
	sep = sep or ",";
	local fields = {};
	local op = function (c)
		%fields[getn(%fields) + 1] = gsub(c, "^%s*(.-)%s*$", "%1");
	end
	local pattern = format("([^%s]+)", sep);
	gsub(src, pattern, op)
	--print(src)
	--gf_PrintTable(fields)
	return fields;
end

function gf_AddCampPop(nValue)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nRet = AddPop(nCamp - 1, nValue);
	if nRet and nRet ~= 0 then
		Msg2Player(format("B�n nh�n ���c %d �i�m danh v�ng th� l�c", nValue));
	end
end

--��ȡtable file
--��һ���Ǳ�ͷ����
--��һ����table����(Լ��Ϊ����)
--szFile�ļ�·����nRowStart�ڼ��п�ʼ
function gf_GetTableFile(szFile, nRowStart)
	local tbFile = new(KTabFile, szFile);
	if not tbFile then
		TabFile_Unload(szFile);
		error(szFile);
	end
	nRowStart = nRowStart or 1;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	for i = nRowStart, nRow do
		local nIndex = tonumber(tbFile:getCell(i, 1))
		tbRet[nIndex] = {};
		for j = 2, nCol do
			tbRet[nIndex][j-1] = tonumber(tbFile:getCell(i, j));
		end
	end
	TabFile_Unload(szFile);
	return tbRet;
end

--ƴg,d,pΪnumber
function gf_PackItemGDP(nG, nD, nP)
	local _BIT_16	= 65536;
	local _BIT_24	= 16777216;

	if not nG or 0 > nG or nG > 255	then return 0;	end
	if not nD or 0 > nD or nD > 255	then return 0;	end
	if not nP or 0 > nP or nP > 65535	then return 0;	end

	return nG * _BIT_24 + nD * _BIT_16 + nP;
end

function gf_UnpackItemGDP(nGDP)
	local _BIT_16	= 65536;
	local _BIT_24	= 16777216;

	local nG, nD	= 0, 0;

	if nGDP > _BIT_24 then
		nG		= floor(nGDP / _BIT_24);
		nGDP	= nGDP - _BIT_24 * nG;
	end

	if nGDP > _BIT_16 then
		nD		= floor(nGDP / _BIT_16);
		nGDP	= nGDP - _BIT_16 * nD;
	end

	return nG, nD, nGDP;
end

function gf_CheckIsCollected(nType, nG, nD, nP)
	local nCoIndex = GetCollectionIndex(nType, nG, nD, nP);
	if not nCoIndex or nCoIndex <= 0 then
		return -1;
	end

	return GetPlayerCollectionData(nType, nCoIndex) or -1;
end