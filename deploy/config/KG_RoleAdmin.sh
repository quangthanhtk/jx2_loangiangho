export KG_ROLEADMIN_CONFIG="[KG_RoleAdmin]
;在一组服务器内，一个帐号允许的最大角色数目
max_role_count=999

;数据库服务器：机器名或IP
server=${INTERNAL_IP}

;指定数据库服务器上的数据库，角色信息保存在这个数据库中
database=${SERVER_GATEWAY_NAME}_db

;操作数据库用的用户名
user=${DB_USERNAME}

;操作数据库用的密码
password=${DB_PASSWORD_HASH}

;修改数据库数据密码，当导入、删除角色时数据库时，需要提供此密码。
ModifyPassword=${DB_PASSWORD_HASH}
"