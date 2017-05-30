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