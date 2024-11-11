Include("\\script\\vng\\lib\\vnglib_textdata.lua");

function TestTool_Menu()
	local tbSay = {}
	tinsert(tbSay,"Set server ID/SetServerID_Form")
	tinsert(tbSay,"X�a Item/XoaItem")
	tinsert(tbSay,"Xem Item ID/XemItemID")
	tinsert(tbSay,"ReloadScript/gm_ReloadScript")
	if GetBit(GetExtPoint(0),1) == 1 then
		tinsert(tbSay,"Ki�m tra task gamer/gm_CheckTaskValue_form")
	end
	tinsert(tbSay,"Ki�m tra item/gm_CheckItemParam_form")
	tinsert(tbSay,"X�a s�ch h�nh trang/XoaHanhTrang")
	tinsert(tbSay,"Ch�nh s�a m�t t�ch/BookEdit_Form")
	tinsert(tbSay,"Tho�t/gf_DoNothing")
	Say("Ch�n ch�c n�ng",getn(tbSay),tbSay)
end

function SetServerID_Form()
	local nID = GetGlbValue(1023)
	local tbSay = {
		"Thay ��i serverID/SetServerID_Confirm",
		"Tho�t/gf_DoNothing",
	}
	Say("ID server hi�n t�i: ".. nID, getn(tbSay), tbSay)
end


function SetServerID_Confirm()
	AskClientForNumber("SetServerID_Done",1,999,"Server ID:")
end


function SetServerID_Done(nCount)
	LIB_txtData:Init("serverid.txt")
	LIB_txtData:LoadMultiColumn()
	LIB_txtData.tbTextData[1][1] = nCount
	LIB_txtData:SaveMultiColumn()
	Talk(1,"","ServerID m�i: "..LIB_txtData.tbTextData[1][1].."\nH�y restart server �� c� hi�u l�c..")
end

function gm_CheckTaskValue_form()
	AskClientForNumber("gm_CheckTask_done", 0, 9999, "TaskID")
end


function gm_CheckTask_done(nCount)
	local nTeamSize = GetTeamSize();
	local szRole = ""
	local nTaskValue = 0
	local nOldIndex = PlayerIndex;
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetName() ~= GetCaptainName() then
			szName = GetName()
			nTaskValue = GetTask(nCount)
			PlayerIndex = nOldIndex
			Talk(1,"", "<color=green>" .. szName .. "<color>:\n - Task <color=yellow>" .. nCount .. ":<color> " .. nTaskValue)
		end
	end
end


function gm_CheckItemParam_form()
	PutinItemBox("Ph�n t�ch item" ,1 , "X�c nh�n?", PHANTICHITEM_FILE, 1)
end

function XoaItem()
	local FILE_NAME = "\\script\\vng\\gmtool\\deleteitem.lua" 
	PutinItemBox("Nh� h�y v�t ph�m" ,5 , "X�c nh�n mu�n h�y?", FILE_NAME, 1)
end

function XemItemID()
	local FILE_NAME = "\\script\\vng\\gmtool\\showitemid.lua" 
	PutinItemBox("Nh� h�y v�t ph�m" ,5 , "X�c nh�n xem item id?", FILE_NAME, 1)
end

function gm_ReloadScript()
	ReloadAllScript()
end

function XoaHanhTrang()
	ClearItemInBox()
end

function BookEdit_Form()
	local EDITBOOK_FILE = "\\script\\vng\\gmtool\\editbook.lua" 
	PutinItemBox("S�a m�t t�ch" ,1 , "X�c nh�n �i�u ch�nh m�t t�ch?", EDITBOOK_FILE, 1)
end