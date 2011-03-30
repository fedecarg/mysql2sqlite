#!/bin/bash
if [ "$1" == "" ]; then
  echo "Usage: $0 <filename> eg. filename-version.sql"
  exit 0
fi

DB_USER="root"
DB_PASS="root"
DB_HOST="127.0.0.1"
DB_NAME="example"

mysqldump -u $DB_USER -p$DB_PASS -h $DB_HOST --skip-add-locks --compatible=ansi --default-character-set=binary $DB_NAME > mysql/$1
cp mysql/$1 mysql/latest.sql

./convert.sh mysql/$1 sqlite/$1
cp sqlite/$1 sqlite/latest.db
