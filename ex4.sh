#!/bin/bash

# ./ex4.sh note.txt
# Đọc tên file từ argument
file_name="$1"
output_file="output.txt"

# Xóa nội dung output.txt
> $output_file

# Nhập số n
echo "Nhap so n:"
read n

count=1
result=""

# Đọc từng dòng trong file
while IFS= read -r line; do
    # Ghi các dòng chẵn vào output.txt
    if [ $(($count % 2)) == 0 ]; then
        echo "$count: $line" >> $output_file
    fi
    
    # Chỉ in các dòng có số thứ tự > n
    if [ $count -gt $n ]; then
        echo "$count: $line"
        result="$result$count: $line"$'\n'
    fi
    
    count=$(($count + 1))
done < "$file_name"

# Ghi các dòng có số thứ tự > n vào output.txt
echo "$result" >> $output_file