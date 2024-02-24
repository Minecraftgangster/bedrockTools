#!/bin/bash

HOMEDIR=$PWD
source ./serverConfig.sh

echo "####################################################";
echo "#          Bedrock Backup collection tool          #";
echo "####################################################";

if [ -f ./backups.zip ]; then echo "Error: There already is a backup archive!"; else
    if [ ! -d ./backups ]; then
        mkdir ./backups/;
    fi

    for value in "${mServers[@]}"
    do
        echo "--- Collecting backups from $value..."
        find "${brToolsHOME}/$value/worlds/" -maxdepth 1 -iname "*_*" -exec echo {} \;
        find "${brToolsHOME}/$value/worlds/" -maxdepth 1 -iname "*_*" -exec cp -rf {} ./backups/ \;
    done

    echo "--- Compressing backups..."
    zip -r ./backups.zip ./backups/
    echo "--- Cleaning up..."
    rm -rf ./backups/
    for value in "${mServers[@]}"; do echo "Removing backups from $value..."; cd "$HOME/$value/worlds/"; rm -rf ./*_*; done
    echo "--- Done."
fi

sleep 1

cd "$HOMEDIR"
read -p "Move files to the download page? (Requires super user privileges) [y/N]: " moveFiles
moveFiles=${moveFiles:-n}
if [ ${moveFiles,,} == "y" ]; then
    echo "--- Moving..."
    sudo mv -f ./backups.zip /var/www/dl/;
    echo "--- Done."
fi

echo "--- Script execution ended successfully."
sleep 2
