#!/bin/bash
user_name='sysadmin'
user_password='1'
db_name='sunbird'
orders='./queries/all_orders.sql'
rejected_orders='./queries/rejected_flights.sql'
report_file='./reports.txt'

touch $report_file

echo "" > $report_file

printf "ALL ORDERS:\n\n" >> $report_file
psql -U $user_name -d $db_name -f $orders >> $report_file

printf "REJECTED ORDERS:\n\n" >> $report_file
psql -U $user_name -d $db_name -f $rejected_orders >> $report_file

cat $report_file
