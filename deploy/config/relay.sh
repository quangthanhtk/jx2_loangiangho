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
Address=${INTERNAL_IP}
LocalAddr=${INTERNAL_IP}
Port=5632
Enable=1
EncryptionType=0
#��Gmc��������ʱ���������룩
ReConnInterval=20000
#��Gmc��ping����ʱ���������룩
PingInterval=90000

####################################################
[Goddess]
Address=${INTERNAL_IP}
LocalAddr=${INTERNAL_IP}
Port=5001
Enable=1
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
LocalAddr=${INTERNAL_IP}
#�����Ķ˿�
ListenPort=5003
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
LocalAddr=${INTERNAL_IP}
#�����Ķ˿�
ListenPort=5004
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
LocalAddr=${INTERNAL_IP}
#�����Ķ˿�
ListenPort=5005
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
ServerName=${SERVER_NAME}
FlushIntervalSec=300

####################################################
[DataBase]
#���ݿ����������������IP
DBHost=${DB_HOST}
#ָ�����ݿ�������ϵ����ݿ�
DBName=${SERVER_GATEWAY_NAME}_db
#LogDatabase����
LogDBName=${SERVER_GATEWAY_NAME}_log
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