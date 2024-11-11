export SERVER_CONFIG="[Server]
;ServerCount=5
;ServerIndex=1,3,5
;ServerIndex=2,4
ServerCount=${SERVER_COUNT}
ServerIndex=${ServerIndex}
ServerName=${SERVER_NAME}
IS_INTERNAL_TEST_SVR=${SERVER_OPEN_TEST}

[Gateway]
Ip=${INTERNAL_IP}
Port=5633

[Database]
Ip=${INTERNAL_IP}
Port=5001

[Transfer]
Ip=${INTERNAL_IP}
Port=5003

[Chat]
Ip=${INTERNAL_IP}
Port=5004

[Tong]
Ip=${INTERNAL_IP}
Port=5005

[GameServer]
Port=${ServerPort}
GM=${SERVER_OPEN_GM}

[Net]
LocalIP=${INTERNAL_IP_ADDRESS_MASK}.${ServerIndex}
ExternalIP=${EXTERNAL_IP}

[Overload]
MaxPlayer=1800
Precision=50

[BugFix]
LiangShanNpcDebug=0

[Arbiter]
Url=
Log=0
"