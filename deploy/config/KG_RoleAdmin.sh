export KG_ROLEADMIN_CONFIG="[KG_RoleAdmin]
;��һ��������ڣ�һ���ʺ����������ɫ��Ŀ
max_role_count=999

;���ݿ����������������IP
server=${INTERNAL_IP}

;ָ�����ݿ�������ϵ����ݿ⣬��ɫ��Ϣ������������ݿ���
database=${SERVER_GATEWAY_NAME}_db

;�������ݿ��õ��û���
user=${DB_USERNAME}

;�������ݿ��õ�����
password=${DB_PASSWORD_HASH}

;�޸����ݿ��������룬�����롢ɾ����ɫʱ���ݿ�ʱ����Ҫ�ṩ�����롣
ModifyPassword=${DB_PASSWORD_HASH}
"