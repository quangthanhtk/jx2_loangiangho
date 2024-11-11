--脚本名称：邮箱
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-11-04
--代码修改记录

function main()
	MailBoxEnable(1);
	SendScript2Client('Open([[MailBox]]);Open([[Items]]);');
end
