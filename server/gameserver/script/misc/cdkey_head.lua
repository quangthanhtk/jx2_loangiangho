--CDKey�����ű�

CDKeyUseType_BindOwner	= 1		--������Ȩ��
CDKeyUseType_NormalUse	= 2		--��ͨʹ��
CDKeyUseType_OwnerAward	= 3		--����Ȩ�˽���

tCDKeyTableName = {}
tCDKeyCallBackFuncName = {}

--apply functions
----------------------------------------------------------------------
function cdkey_apply_bind_owner(szTableName, szCallBackFuncName)
	tCDKeyTableName[GetName()] = szTableName
	tCDKeyCallBackFuncName[GetName()] = szCallBackFuncName
	AskClientForString("_cdkey_bind_owner_call_back","",1,64,"H�y nh�p CDKey");
end

function cdkey_apply_normal_use(szTableName, szCallBackFuncName)
	tCDKeyTableName[GetName()] = szTableName
	tCDKeyCallBackFuncName[GetName()] = szCallBackFuncName
	AskClientForString("_cdkey_normal_use_call_back","",1,64,"H�y nh�p CDKey");
end

function cdkey_apply_owner_award(szTableName, szCallBackFuncName)
	tCDKeyTableName[GetName()] = szTableName
	tCDKeyCallBackFuncName[GetName()] = szCallBackFuncName
	AskClientForString("_cdkey_owner_award_call_back","",1,64,"H�y nh�p CDKey");
end


--operate functions
----------------------------------------------------------------------
function cdkey_bind_owner(szTableName, szCDKey, szCallBackFuncName)
	UseCDKey(szTableName, szCDKey, CDKeyUseType_BindOwner, szCallBackFuncName)
end

function cdkey_normal_use(szTableName, szCDKey, szCallBackFuncName)
	UseCDKey(szTableName, szCDKey, CDKeyUseType_NormalUse, szCallBackFuncName)
end

function cdkey_owner_award(szTableName, szCDKey, szCallBackFuncName)
	UseCDKey(szTableName, szCDKey, CDKeyUseType_OwnerAward, szCallBackFuncName)
end

function _cdkey_bind_owner_call_back(szCDKey)
	local szTableName = tCDKeyTableName[GetName()]
	local szCallBackFuncName = tCDKeyCallBackFuncName[GetName()]
	local nRet = 0
	if szTableName and szCallBackFuncName then
		nRet = cdkey_bind_owner(szTableName, szCDKey, szCallBackFuncName)
	end
	tCDKeyTableName[GetName()] = nil
	tCDKeyCallBackFuncName[GetName()] = nil
	return nRet
end

function _cdkey_normal_use_call_back(szCDKey)
	local szTableName = tCDKeyTableName[GetName()]
	local szCallBackFuncName = tCDKeyCallBackFuncName[GetName()]
	local nRet = 0
	if szTableName and szCallBackFuncName then
		nRet = cdkey_normal_use(szTableName, szCDKey, szCallBackFuncName)
	end
	tCDKeyTableName[GetName()] = nil
	tCDKeyCallBackFuncName[GetName()] = nil
	return nRet
end

function _cdkey_owner_award_call_back(szCDKey)
	local szTableName = tCDKeyTableName[GetName()]
	local szCallBackFuncName = tCDKeyCallBackFuncName[GetName()]
	local nRet = 0
	if szTableName and szCallBackFuncName then
		nRet = cdkey_owner_award(szTableName, szCDKey, szCallBackFuncName)
	end
	tCDKeyTableName[GetName()] = nil
	tCDKeyCallBackFuncName[GetName()] = nil
	return nRet
end
