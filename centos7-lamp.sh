#!/bin/bash
echo "install apache"
yum -y install httpd
echo "start httpd.service"
systemctl start httpd.service
echo "enable apache"
systemctl enable httpd.service
echo "open firewall"
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
echo "install php"
yum -y install php
echo "restart apache"
systemctl restart httpd.service
echo "create info.php"
vi /var/www/html/info.php
echo '<?php phpinfo(); ?>' >>info.php
echo 'install mariadb'
yum -y install mariadb-server mariadb
echo "start mariadb.service"
systemctl start mariadb.service
echo "enable mariadb.service"
systemctl enable mariadb.service
echo "mysql_secure_installation"
# root
# 201010
# 用mysql -u root -p登录
echo "install php-mysql"
# yum search php 选择你需要的安装：
yum -y install php-mysql
echo "install php modules"
yum -y install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel
echo "restart apache"
systemctl restart httpd.service
echo "finished!"





















