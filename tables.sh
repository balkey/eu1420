#!/bin/bash

find ./data/input_final/ -name "*1_table.sql" -print0 | while read -d $'\0' file
do
	psql -h localhost -U batch_user -d eu1420 -v ON_ERROR_STOP=1 < $file
done