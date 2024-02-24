#!/bin/bash

source ./serverConfig.sh

for i in "${!mServers[@]}"
do
    echo "Attempting to start ${mServers[$i]}";
    cd "${mDirs[$i]}";
    rm -f ./screenlog.*; # delete logs if there are any
    screen -SdmL "${mServers[$i]}" "./bedrock_server"; # start the Server as a daemon (fork in the background) and activate logging
    screen -x "${mServers[$i]}" -X logfile flush 0; # set logfile flush to 0 – which means logs are generated in real-time
    sleep 1;
done

cd "${brToolsHOME}/shakeSpeare";
echo "Attempting to start shakeSpeare bot";
screen -Sdm shakeSpeare ./shakespeare.sh;
sleep 1;

screen -ls;

sleep 1;
echo "All servers should be running now.";
echo "--- Script execution ended successfully.";
sleep 2;
