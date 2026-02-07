#!/bin/bash

pg_dump -U edson -h localhost esigdb > backup.sql

if [ $? -eq 0 ]; then
  echo "Backup realizado com sucesso!"
else
  echo "Erro no backup!"
fi
