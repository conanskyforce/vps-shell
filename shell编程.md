##shell编程

$0 表示执行的shell脚本名  
$1,2,3,4....分别表示传入的第1,2,3,4个参数  
$*表示传入的所有参数  
$#表示传入的参数个数  
$?表示上一个命令是否成功,成功的话返回0即$?==0  
$PWD表示当前路径  
echo -e '\033[32m---------------\033[0m'中间-显示颜色  

逻辑运算符解析  
-f 判断文件是否存在rg： if [ -f filename]  
-d 判断目录是否存在  
-eq 等于  
-ne 不等于  
-lt 小于  
-gt 大于  
-le 小于等于  
-ge 大于等于  
-a  且  
-o  或  
-z  空字符串  

判断目录是否存在  
	
	#!/bin/bash
	#dir.sh
	DIR=/home/conan/flarum
	if [ ! -d $DIR ]; then
		mkdir -p $DIR
		echo -e "\033[32mcreate dir $DIR.\033[0m"
	else
		rm -rf $DIR
		echo -e "\033[32mdelete dir $DIR\033[0m"
	fi

	sh -n dir.sh 测试shell脚本是否有问题

echo "ok" >file #ok覆盖到file中  
echo "ok" >>file #ok追加到file中  


/stats/participation

/users/conanskyforce/repos

https://api.github.com/users/conanskyforce/repos

https://api.github.com/repos/conanskyforce/123/commits

https://api.github.com/repos/conanskyforce/conanskyforce.github.io/stats/commit_activity

mysql备份脚本  

	#!/bin/bash
	#auto backup mysql db
	#by conan 2017.5.25
	
	BAK_DIR=/data/backup/`date +%Y%m%d`
	mysqldb=
	mysqluser=
	mysqlpasswd=
	mysqldcmd=
	if [ $UID -ne 0];then
	  echo "Need root privilege."
	  exit
	fi
	
	if [ -d $BAK_DIR ];then
	  mkdir -p $BAK_DIR
	  echo -e '\033[32mThe $BAK_DIR created successfully!\033[0m'
	else
	  echo "This $BAK_DIR is exists."
	fi
	
	$mysqldcmd -u$mysqluser -p$mysqlpasswd $mysqldb>$BAK_DIR/$mysqldb.sql
	
	if [$? -eq 0];then
	  echo -e '\033[32mThe mysql backup $mysqldb successfully!\033[0m'
	else
	  echo -e '\033[32mThe mysql backup $mysqldb failed!\033[0m'
	fi

crontab -e 设置定时执行任务，保存后的文件保存在 /var/spool/cron目录下，也可以vi /etc/crontab 添加要定时执行的任务  

	0  0  *  *  *  /bin/bash /root/conan/auto_bakup_mysql.sh >>/tmp/mysql_bak.log