#!/bin/bash

source ./serverConfig.sh

for value in "${mServers[@]}"
do
    echo "--- Attempting to stop $value"
    echo "Saving world and stopping server..."
    screen -x "$value" -X stuff "stop\n"
    sleep 5
done

echo "Attempting to stop shakeSpeare bot"
screen -x shakeSpeare -X stuff "^C"

sleep 1
screen -ls
sleep 1

echo All servers should be stopped now.
echo "--- Script execution ended successfully."
sleep 2
