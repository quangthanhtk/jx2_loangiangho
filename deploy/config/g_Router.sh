export SERVER_CONFIG="--基础信息--
[BaseInfo]
IOTimeout=0
ReconnectCycle=1
PingCycle=30
WorkLoopCycle=1
SaveRoleData=0
--本机注册BIshop的IP--
LocalIP=${GLOBAL_SERVER_INTERNAL_IP}
ExternalIP=${GLOBAL_SERVER_EXTERNAL_IP}
Port=${GLOBAL_SERVER_PORT}
MaxPlayer=20

--本机的IP列表--
[LocalAddrList]
--IP数量，必须大于等于Router下面所连接的GameServer的数量加一--
LocAddrCount=2
LocAddr_0=${GLOBAL_SERVER_INTERNAL_IP}
--Net LocalIP of gameserver6
LocAddr_1=10.224.31.6

--给Router下面GameServer开放的端口信息--
[LocalGSSrvInfo]
--指示Router下面需要连接上来的Gameserver数量
GameServerCount=1
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
BishopSrvOpenPort=8871
GoddessSrvOpenPort=8872
RelayHostSrvOpenPort=8873
RelayChatSrvOpenPort=8874
RelayTongSrvOpenPort=8875

--跨区服GRelay的信息--
[LocalRelayInfo]
LocRelayAddr=${GLOBAL_SERVER_INTERNAL_IP}
LocRelayHostPort=9003
LocRelayChatPort=9004
LocRelayTongPort=9005

--加入跨区服的原区服数量--
[OriginGroupInfo]
OriginGroupCount=1

--原区服的信息--
[OriginGroupInfo_0]
--对应原区服的区服名（组名）
GroupName=THUONGLONG
BishopAddr=10.224.31.20
BishopPort=5633
GoddessAddr=10.224.31.20
GoddessPort=5001
RelayAddr=10.224.31.20
RelayHostPort=5003
RelayChatPort=5004
RelayTongPort=5005

[PATH]
ScriptFolder=script/
ScriptFileName=routerscript.lua
"