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

    for i in "${!mServers[@]}"
    do
        value=${mServers[$i]};
        sDir=${mDirs[$i]};

        echo "--- Collecting backups from $value... (Directory $sDir/worlds/)"
        find "$sDir/worlds/" -maxdepth 1 -iname "*_*" -exec echo {} \;
        find "$sDir/worlds/" -maxdepth 1 -iname "*_*" -exec cp -rf {} ./backups/ \;
    done

    echo "--- Compressing backups..."
    zip -r ./backups.zip ./backups/
    echo "--- Cleaning up..."
    rm -rf ./backups/
    for i in "${!mServers[@]}";
    do
        value=${mServers[$i]};
        sDir=${mDirs[$i]};

        echo "Removing backups from $value..."; cd "$sDir/worlds/"; rm -rf ./*_*;
    done
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
