#!/bin/bash

echo "ShakeSpeare Minecraft Bot v1.0 (part of bedrockTools)";

source ../bedrockTools/serverConfig.sh
nextTime=$(date +%s);

function sendQuote {
    qFile="./quotes-${LANG_SELECTED}";
    if [ ! -f $qFile ]; then return 0; fi # if the quotes file doesn't exist; don't send quotes.

    Quote=`shuf -n1 $qFile`;
    echo "${Quote}";
    for i in ${!mServers[@]}; do
        screen -x "${mServers[$i]}" -X stuff "tellraw @a {\"rawtext\": [{\"text\": \"$Quote\"}]}\n";
    done
}

function isBackupTime {
    currentClock=`date +%H:%M:%S`;
    for value in ${backupTimes[@]}; do
        if [ "$currentClock" == "${value}:00" ]; then
            echo true;
            return 0;
        fi
    done
}

while [ true ]; do
    if [ "$(date +%s)" -ge "$nextTime" ]; then
        sendQuote;
        nextTime=$((nextTime + CTime));
    fi

    backupTime=$(isBackupTime);
    if [ "$backupTime" == "true" ]; then
        for i in ${!mServers[@]}; do
            worldDir="${mDirs[$i]}worlds/${mWorlds[$i]}";
            echo "SERVER    ${mServers[$i]}";
            echo "DIRECTORY ${mDirs[$i]}";
            echo "WORLDDIR  $worldDir";
            echo "-- Backup created.";
            cp -r "$worldDir" "${worldDir}_$(date +%Y-%m-%d_%H-%M)";
            screen -x "${mServers[$i]}" -X stuff "tellraw @a {\"rawtext\": [{\"text\": \"Backup created.\"}]}\n";
        done
    fi

    source ../bedrockTools/serverConfig.sh
    sleep 1;
done