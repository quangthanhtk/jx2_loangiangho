export KG_STATGAMEDATA_CONFIG="[Database]
Server=${INTERNAL_IP}
Username=${DB_USERNAME}
DatabaseName=${SERVER_GATEWAY_NAME}_db
Password=${DB_PASSWORD_HASH}
EnableEncrypt=1

[Goddess]
IP=${INTERNAL_IP}
Port=6001
Group=1
SendRecvTimeout=60000

[StatPara]
;switch of old stat, item player...([/stat_item.txt]->[/Statistic])
DoStateForGoddess=1
EnableItemStat=1
EnableCharacterStat=1
;switch of new stat([/stat_cfg]->[/stat_result])
DoStatForStatCfg=0
LastLogoutDaysLimit=0
StatIdentify=localhost
"