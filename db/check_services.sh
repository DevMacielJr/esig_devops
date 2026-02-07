#!/bin/bash

LOG=logs/status.log
DATA=$(date "+%Y-%m-%d %H:%M:%S")

echo "==== $DATA ====" >> $LOG

check_service () {
  SERVICE=$1

  if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE: OK" >> $LOG
  else
    echo "$SERVICE: DOWN - Restarting" >> $LOG
    sudo systemctl restart $SERVICE
  fi
}

check_service postgresql
check_service tomcat9
check_service wildfly

echo "" >> $LOG

