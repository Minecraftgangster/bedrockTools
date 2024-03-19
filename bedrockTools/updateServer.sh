#!/bin/bash

source ./serverConfig.sh

if [ -d ./upd/ ]
then
    echo "Warning: Forgot to delete ./upd/ directory. Cleaning up...";
    rm -rf ./upd/;
fi


echo "####################################################";
echo "#          Bedrock Update tool                     #";
echo "####################################################";

if [ -z $1 ]
then
    echo "Error: Please specify the ZIP file containing the bedrock server files.";
    exit 1;
else
    if [ ! -f $1 ]
    then
        echo "Error: Server files archive $1 doesn't exist.";
        exit 1;
    fi
    echo "Extracting files...";
    unzip -d ./upd/ $1;

    for i in "${!mServers[@]}"
    do
        value="${mServers[$i]}";
         sDir="${mDirs[$i]}";

        echo "--- Updating '$value'...";
        cp -rf "./upd/bedrock_server" "${sDir}/bedrock_server"; echo "$value :: bedrock_server";
        cp -rf "./upd/release-notes.txt" "${sDir}/release-notes.txt"; echo "$value :: release-notes.txt";
        cp -rf "./upd/behavior_packs/" "${sDir}/behavior_packs/"; echo "$value :: behavior_packs/";
        cp -rf "./upd/config/" "${sDir}/config/"; echo "$value :: config/";
        cp -rf "./upd/definitions/" "${sDir}/definitions/"; echo "$value :: definitions/";
        cp -rf "./upd/bedrock_server_symbols.debug" "${sDir}/bedrock_server_symbols.debug"; echo "$value :: bedrock_server_symbols.debug";
        echo "--- Done for '$value'..."
    done

    rm -rf ./upd/;
    echo "Update done. All servers should be ready now.";
    echo "All servers may not be restarted.";

fi
echo "--- Script execution ended successfully."
sleep 2