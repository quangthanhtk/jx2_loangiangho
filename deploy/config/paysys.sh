export SERVER_CONFIG="[Paysys]
szPaysysIPAddress=${INTERNAL_IP}
nPaysysPort=${PAYSYS_PORT}
nUseJXMode=0
nMaxAcceptEachWait=512
nMaxRecvBufSizePerSocket=2048
nMaxSendBufSizePerSocket=2048
nMaxEventCount=512

nBishopLoginResult=1
nBishopLoginReconnectResult=1
nBishopLogoutResult=1
nUserLoginResult=1
nUserLogoutResult=1
nUserLoginVerifyResult=1
nUserExtChangeResult=1
nUserIBBuyItemResult=1
nUserIBUseItemResult=1
uAccountState=0
szPhoneNumber=0

nAccountSetChargeResult=1
#KAccountSetChargeFlagRet nExtPoint
nExtPoint=1

nGetZoneChargeFlagResult=1

nZoneChargeFlag=0

nPasspodVerifyResult=0
nChargeFlag=0
nPasspodType=0
UserName=${PAYSYS_USERNAME}
PassWord=${PAYSYS_PASSWORD}

[Mysql]
Host=${INTERNAL_IP}
Username=${DB_USERNAME}
Password=${DB_PASSWORD}
DBName=paysys
"