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
#��Gmc��������ʱ���������룩
ReConnInterval=20000
#��Gmc��ping����ʱ���������룩
PingInterval=90000

####################################################
[Goddess]
Address=
LocalAddr=
Port=5001
Enable=0
EncryptionType=0
#��ü��һ����goddess������״�������룩
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
#����IP��ַ
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
#�����Ķ˿�
ListenPort=9003
#�����հ��ĳ�ʱʱ��
SendRecvTimeout=60000
#��GameSvr���ӵĴ�����ÿ֡ѭ�������ߵ�ʱ�䣨���룩
LoopTime=50
#�����PingTime��ô����ʱ����û���յ�Game server���κ����ݰ�����ô��Bishop����ΪGame server�Ѿ�����!
PingTime=60000
PlayerCnt=10
Precision=1
FreeBuffer=15
BufferSize=1048576
bLogSocket=0

####################################################
[Chat]
#����IP��ַ
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
#�����Ķ˿�
ListenPort=9004
#�����հ��ĳ�ʱʱ��
SendRecvTimeout=60000
#��GameSvr���ӵĴ�����ÿ֡ѭ�������ߵ�ʱ�䣨���룩
LoopTime=50
PlayerCnt=10
Precision=1
FreeBuffer=15
BufferSize=4096000

####################################################
[Tong]
#����IP��ַ
LocalAddr=${GLOBAL_SERVER_INTERNAL_IP}
#�����Ķ˿�
ListenPort=9005
#�����հ��ĳ�ʱʱ��
SendRecvTimeout=60000
#��GameSvr���ӵĴ�����ÿ֡ѭ�������ߵ�ʱ�䣨���룩
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
#���ݿ����������������IP
DBHost=${DB_HOST}
#ָ�����ݿ�������ϵ����ݿ�
DBName=global_${SERVER_GATEWAY_NAME}_db
#LogDatabase����
LogDBName=global_${SERVER_GATEWAY_NAME}_log
#�������ݿ��õ��û���
DBUser=${DB_USERNAME}
#�������ݿ��õ�����
DBPwd=${DB_PASSWORD_HASH}
EnableEncrypt=1
#���ݿ⿪�Ŷ˿�
DBPort=${DB_PORT}
#���������ڱ�ʶ�飬�硰һ��һ������������relay���ӵ�ͬһ�����ݿ�
;Ҫ����ЩRelay��������ʶ��ͬ��
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