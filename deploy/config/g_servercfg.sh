export SERVER_CONFIG="[Server]
ServerCount=${SERVER_COUNT}
ServerIndex=$((SERVER_COUNT+ServerIndex))
ServerName=${GLOBAL_SERVER_NAME}
IS_KINGSOFT_INNER_VERSION_acc_jh34ji84r347e8T56=0
RealmType=3
IsMatchRealm=true
bLogRelayPacket=1
IS_EXP_SVR=0
IS_INTERNAL_TEST_SVR=${SERVER_OPEN_TEST}

[Gateway]
Ip=${GLOBAL_SERVER_INTERNAL_IP}
Port=8871

[Database]
Ip=${GLOBAL_SERVER_INTERNAL_IP}
Port=8872

[Transfer]
Ip=${GLOBAL_SERVER_INTERNAL_IP}
Port=8873

[Chat]
Ip=${GLOBAL_SERVER_INTERNAL_IP}
Port=8874

[Tong]
Ip=${GLOBAL_SERVER_INTERNAL_IP}
Port=8875

[GameServer]
Port=${ServerPort}
GM=${SERVER_OPEN_GM}

[Net]
LocalIP=${GLOBAL_INTERNAL_IP_ADDRESS_MASK}.$((SERVER_COUNT+ServerIndex))
ExternalIP=${GLOBAL_SERVER_EXTERNAL_IP}

[Overload]
MaxPlayer=1800
Precision=50

[BugFix]
LiangShanNpcDebug=0

[Arbiter]
Url=
Log=0
"
