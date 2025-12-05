#!/bin/bash


df_output=$(df)

echo "List of all filesystem"


# read each line from df command

while IFS= read -r line; do


 # split e line by space

 IFS=' ' read -ra split_line <<< "$line"

 usage_capacity_string=${split_line[4]}


 # remove percent character of usage capacity

 usage_capacity=${usage_capacity_string/"%"/""}


 # compare usage capacity with number

 if [[ $usage_capacity -gt 20 ]]

 then

     echo ${split_line[0]}

     echo $line

 fi

done <<< "$df_output"