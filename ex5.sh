#!/bin/bash

readonly output_file="final_ex5.txt"

# clear output_file

> $output_file

file_names=("pre_a_ex5.txt" "pre_b_ex5.txt" "pre_c_ex5.txt")

total_fail=0
total_pass=0
total_notcheck=0

sums=() #khai báo array rỗng
count=0

# Best practice: luôn dùng "${array[@]}" -> Bảo vệ các phần tử có space, tab, newline
for file_name in "${file_names[@]}"; do
  # process save file
  local_fail=0
  local_pass=0
  local_notcheck=0

  # Read file line by line
  while IFS= read -r line || [[ -n "$line" ]]; do
    # Check if line contains FAIL
    if [[ $line =~ FAIL:[[:space:]]*([0-9]+) ]]; then
      value="${BASH_REMATCH[1]}"
      total_fail=$((total_fail + value))
      local_fail=$value
    fi

    # Check if line contains PASS
    if [[ $line =~ PASS:[[:space:]]*([0-9]+) ]]; then
      value="${BASH_REMATCH[1]}"
      total_pass=$((total_pass + value))
      local_pass=$value
    fi

    # Check if line contains NOTCHECK
    if [[ $line =~ NOTCHECK:[[:space:]]*([0-9]+) ]]; then
      value="${BASH_REMATCH[1]}"
      total_notcheck=$((total_notcheck + value))
      local_notcheck=$value
    fi
  done < "$file_name"

  # Calculate sum for this file
  local_sum=$((local_fail + local_pass + local_notcheck))
  sums+=($local_sum)  # thêm phần tử vào array

  count=$((count + 1))
done


echo "FAIL: $total_fail" >> $output_file
echo "PASS: $total_pass" >> $output_file
echo "NOTCHECK: $total_notcheck" >> $output_file

echo "**********" >> $output_file

echo "SUM1: ${sums[0]}" >> $output_file
echo "SUM2: ${sums[1]}" >> $output_file
echo "SUM3: ${sums[2]}" >> $output_file