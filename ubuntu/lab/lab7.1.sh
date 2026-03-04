read -p "Enter n: " n

total=0
for ((i=2; i<=n; i+=2)); do
    total=$((total + i))
done

echo "Total is: $total"


#!/bin/bash

n=$1

total=0
for ((i=1; i<=n; i+=2)); do
    total=$((total + i))
done

echo "Total is: $total"
