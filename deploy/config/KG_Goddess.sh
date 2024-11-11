export SERVER_CONFIG="[Version]
Version=2

[KG_Goddess]
ListenIP=${INTERNAL_IP}
ListenPort=5001
LoopSleepTime=10
AutoDisconnectTime=120000
SendRecvTimeout=60000
Group=${SERVER_GROUP}
MaxRoleCountInAccount=3

[DatabaseServer]
Server=${INTERNAL_IP}
UserName=${DB_USERNAME}
Database=${SERVER_GATEWAY_NAME}_db
Password=${DB_PASSWORD_HASH}
EnableEncrypt=1

[RoleStatistic]
ListenIP=${INTERNAL_IP}
ListenPort=6001
SendRecvTimeout=60000
"