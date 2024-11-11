export SERVER_CONFIG="[Gmc]
Address=
LocalAddr=
Port=9991
Enable=0
EncryptionType=0
ReConnInterval=20000
PingInterval=90000

####################################################
[Bishop]
Address=
LocalAddr=
Port=5632
Enable=0
EncryptionType=0
#与Gmc断线重连时间间隔（毫秒）
ReConnInterval=20000
#给Gmc发ping包的时间间隔（毫秒）
PingInterval=90000

####################################################
[Goddess]
Address=
LocalAddr=
Port=5001
Enable=0
EncryptionType=0
#多久检查一次与goddess的连接状况（毫秒）
CheckConnInterval=30000

####################################################
[Relay]
PlayerCnt=10
precision=1
FreeBuffer=15
BufferSize=1048576
backup=0

####################################################
[Host]
#本地IP地址
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
#监听的端口
ListenPort=9003
#发包收包的超时时间
SendRecvTimeout=60000
#与GameSvr连接的处理器每帧循环后休眠的时间（毫秒）
LoopTime=50
#如果在PingTime这么长的时间内没有收到Game server的任何数据包，那么，Bishop会认为Game server已经挂了!
PingTime=60000
PlayerCnt=10
Precision=1
FreeBuffer=15
BufferSize=1048576
bLogSocket=0

####################################################
[Chat]
#本地IP地址
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
#监听的端口
ListenPort=9004
#发包收包的超时时间
SendRecvTimeout=60000
#与GameSvr连接的处理器每帧循环后休眠的时间（毫秒）
LoopTime=50
PlayerCnt=10
Precision=1
FreeBuffer=15
BufferSize=4096000

####################################################
[Tong]
#本地IP地址
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
#监听的端口
ListenPort=9005
#发包收包的超时时间
SendRecvTimeout=60000
#与GameSvr连接的处理器每帧循环后休眠的时间（毫秒）
LoopTime=50
PlayerCnt=10
Precision=1
FreeBuffer=15
BufferSize=1048576
flushinterval=30

####################################################
[Log]
FacSayLog=1

####################################################
[RuntimeStat]
ServerName=${GLOBAL_SERVER_NAME}
FlushIntervalSec=300

####################################################
[DataBase]
#数据库服务器：机器名或IP
DBHost=${DB_HOST}
#指定数据库服务器上的数据库
DBName=global_${SERVER_GATEWAY_NAME}_db
#LogDatabase库名
LogDBName=global_${SERVER_GATEWAY_NAME}_log
#操作数据库用的用户名
DBUser=${DB_USERNAME}
#操作数据库用的密码
DBPwd=${DB_PASSWORD_HASH}
EnableEncrypt=1
#数据库开放端口
DBPort=${DB_PORT}
#组名，用于标识组，如“一区一服”，允许多个relay连接到同一个数据库
;要求这些Relay的组名标识不同。
DBGroup=${SERVER_GROUP}
DBAreaGroup=${SERVER_GROUP}-${SERVER_GROUP}

####################################################
[GlobalDatabase]
Server=${DB_HOST}
Database=${SERVER_GATEWAY_NAME}_cdkey
User=${DB_USERNAME}
Password=${DB_PASSWORD_HASH}
EnableEncrypt=1
Port=${DB_PORT}

####################################################
[MyGlbDB]
Server=${DB_HOST}
Database=${SERVER_GATEWAY_NAME}_cdkey
User=${DB_USERNAME}
Password=${DB_PASSWORD_HASH}
EnableEncrypt=1
Port=${DB_PORT}
"