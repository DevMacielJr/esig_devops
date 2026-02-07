#!/bin/bash

SERVICE="tomcat9"

STATUS=$(systemctl is-active $SERVICE)
UPTIME=$(systemctl show $SERVICE --property=ActiveEnterTimestamp)

echo "Status: $STATUS"
echo "Desde: $UPTIME"

if [ "$STATUS" != "active" ]; then
  echo "Tomcat parado. Reiniciando..."
  sudo systemctl start $SERVICE
fi
