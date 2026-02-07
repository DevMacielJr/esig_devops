#!/bin/bash

SERVICE="wildfly"

STATUS=$(systemctl is-active $SERVICE)
UPTIME=$(systemctl show $SERVICE --property=ActiveEnterTimestamp)

echo "Status: $STATUS"
echo "Desde: $UPTIME"

if [ "$STATUS" != "active" ]; then
  echo "JBoss parado. Reiniciando..."
  sudo systemctl start $SERVICE
fi
