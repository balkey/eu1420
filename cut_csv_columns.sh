#!/bin/bash

echo $FILE_NAME
csvcut -c $COLUMNS $FILE_NAME > $FINAL_FILE_NAME