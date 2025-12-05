#!/bin/bash

# Function to display date and time
show_datetime() {
    date "+%A, %d tháng %m năm %Y %H:%M:%S %z"
    echo ""
}

# Function to display running processes (simplified)
show_processes() {
    echo "Process:"
    echo ""
    ps
    echo ""
}

# Function to display memory status
show_memory() {
    echo "Memory usage:"
    free -h
    echo ""
}

# Function to display CPU load
show_cpu() {
    echo "CPU load:"
    echo ""
    uptime
    echo ""
}

# Function to display kernel version
show_kernel() {
    echo "Kernel version is:"
    echo ""
    uname -r
}

# Main execution
main() {
    show_datetime
    show_processes
    show_memory
    show_cpu
    show_kernel
}

# Run main function
main