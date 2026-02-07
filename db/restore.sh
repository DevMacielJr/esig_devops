#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: ./restore.sh arquivo.sql"
  exit 1
fi

psql -U edson -h localhost esigdb < "$1"

if [ $? -eq 0 ]; then
  echo "Restore realizado com sucesso!"
else
  echo "Erro no restore!"
fi
