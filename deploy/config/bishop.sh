export SERVER_CONFIG="[Version]
[AppServer]
LocalIPAddress=${INTERNAL_IP}
IPAddress=${INTERNAL_IP}
Port=5009
SendRecvTimeout=60000
ReconnectTime=10000
LoopTime=100
PingTime=20000
Enable=0

[Paysys]
IPAddress=${PAYSYS_IP}
LocalIPAddress=${INTERNAL_IP}
InternalIPAddressMask=${INTERNAL_IP_ADDRESS_MASK}.0
Port=${PAYSYS_PORT}
UserName=${PAYSYS_USERNAME}
Password=${PAYSYS_PASSWORD}
SendRecvTimeout=60000
ReconnectTime=10000
LoopTime=100
PingTime=10000
UseLocalNetCard=${PAYSYS_USE_LOCAL_NETCARD}

[Goddess]
LocalIPAddress=${INTERNAL_IP}
IPAddress=${INTERNAL_IP}
Port=5001
SendRecvTimeout=60000
ReconnectTime=10000
LoopTime=100
PingTime=20000

[Relay]
LocalIPAddress=${INTERNAL_IP}
OpenPort=5632
SendRecvTimeout=60000
LoopTime=100
PingTime=20000
AccountInRelayTimeout=60000

[GameServer]
LocalIPAddress=${INTERNAL_IP}
OpenPort=5633
SendRecvTimeout=180000
AccountInManagerTimeout=300000
LoopTime=100
PingTime=60000

[Player]
LocalIPAddress=${EXTERNAL_IP}
OpenPort=${LOGIN_PORT}
MaxPlayers=50
MaxPlayerInLoginSection=20
SendRecvTimeout=180000
PlayerOperateTimeout=60000
IBSupport=1
NeedEmailEnable=0
NeedIDCardEnable=0

[LiveTimeLogger]
LiveTimeLoggerLoopTime=5000

[Debug]
SyncTime=1

[Test]
TestEnable=0
LimitPlayTimeFlag=-1
LimitOnlineSecond=-1
LimitOfflineSecond=-1
"