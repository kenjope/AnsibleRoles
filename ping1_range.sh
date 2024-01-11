#!/bin/bash

total_steps=90
network="192.168.1"
for ((step=60; step<=total_steps; step++)); do
    # Perform the task for each step here

     ip="${network}.${step}"
     ping -c 1 -w 1 "$ip" > /dev/null
     if [ $? -eq 0 ]; then      # following code to execute if the last command was successful
             echo "Ping to $ip successful."
     fi



    # Calculate the percentage completion
    progress=$((step * 100 / total_steps))

    # Print the progress bar
    printf "Progress: [%-50s] %d%%\r" $(printf '#%.0s' {1..$((progress/2))}) "$progress"

    # Simulate some work being done (replace this with your actual task)
    sleep 0.1
done

# Add a new line to separate the progress bar from the next command
echo ""

