export SERVER_CONFIG="--������Ϣ--
[BaseInfo]
IOTimeout=0
ReconnectCycle=1
PingCycle=30
WorkLoopCycle=1
SaveRoleData=0
--����ע��BIshop��IP--
LocalIP=${GLOBAL_SERVER_INTERNAL_IP}
ExternalIP=${GLOBAL_SERVER_EXTERNAL_IP}
Port=${GLOBAL_SERVER_PORT}
MaxPlayer=20

--������IP�б�--
[LocalAddrList]
--IP������������ڵ���Router���������ӵ�GameServer��������һ--
LocAddrCount=2
LocAddr_0=${GLOBAL_SERVER_INTERNAL_IP}
--Net LocalIP of gameserver6
LocAddr_1=10.224.31.6

--��Router����GameServer���ŵĶ˿���Ϣ--
[LocalGSSrvInfo]
--ָʾRouter������Ҫ����������Gameserver����
GameServerCount=1
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
BishopSrvOpenPort=8871
GoddessSrvOpenPort=8872
RelayHostSrvOpenPort=8873
RelayChatSrvOpenPort=8874
RelayTongSrvOpenPort=8875

--������GRelay����Ϣ--
[LocalRelayInfo]
LocRelayAddr=${GLOBAL_SERVER_INTERNAL_IP}
LocRelayHostPort=9003
LocRelayChatPort=9004
LocRelayTongPort=9005

--�����������ԭ��������--
[OriginGroupInfo]
OriginGroupCount=1

--ԭ��������Ϣ--
[OriginGroupInfo_0]
--��Ӧԭ��������������������
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