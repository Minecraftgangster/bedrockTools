#!/bin/bash
if [ -z $1 ]; then
    echo "BedrockTools v1.0-stable; Copyright(C) 2024 Eric Freiberg";
    echo "Available under GNU GPLv3 – https://dev.minecraftgangster.net/";
    sleep 1;
fi

if [ ! -f "./bedrockTools/serverConfig.sh" ]; then echo "Error: Run setup.sh to create configuration files first"; exit 1; fi
source "./bedrockTools/serverConfig.sh"; # import configuration
source "./languageFiles/${LANG_SELECTED}.sh"; # load user-selected language (default: en)

HEIGHT=0
WIDTH=0
CHOICE_HEIGHT=4
BACKTITLE="${LANG_APP_BACKTITLE}"
TITLE="${LANG_APP_TITLE}"
MENU="${LANG_APP_MENU}"

OPTIONS=(1      "${MENU_SAVEBACKUPS}"
         2      "${MENU_STARTSERVERS}"
         3      "${MENU_STOPSERVERS}"
         4      "${MENU_RESTARTSERVERS}"
         5      "${MENU_UPDATESERVERS}"
         6      "${MENU_SERVERCMDS}"
         7      "${MENU_CHANGECONFIG}"
         "Q"    "${MENU_QUITBRTOOLS}")

CHOICE=$(dialog --clear --no-cancel \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
cd ./bedrockTools/

case $CHOICE in
        1)
            read -n 1 -p "${LANG_EXECUTE_QUESTION} (y/N) " CHOICE; echo;
            if [ "${CHOICE,,}" == "y" ]; then
                ./mcBackups.sh
            fi
            ;;
        2)
            read -n 1 -p "${LANG_EXECUTE_QUESTION} (y/N) " CHOICE; echo;
            if [ "${CHOICE,,}" == "y" ]; then
                ./startServers.sh
            fi
            ;;
        3)
            read -n 1 -p "${LANG_EXECUTE_QUESTION} (y/N) " CHOICE; echo;
            if [ "${CHOICE,,}" == "y" ]; then
                ./quitServers.sh
            fi
            ;;
        4)
            read -n 1 -p "${LANG_EXECUTE_QUESTION} (y/N) " CHOICE; echo;
            if [ "${CHOICE,,}" == "y" ]; then
                ./quitServers.sh
                ./startServers.sh
            fi
            ;;
        5)
            read -n 1 -p "${LANG_EXECUTE_QUESTION} [${LANG_OFFLINE_QUESTION}] (y/N) " CHOICE; echo;
            if [ "${CHOICE,,}" == "y" ]; then
                read -p "${LANG_DOWNLOAD_SERVER} " FILE
                if [ ! -z $FILE ]; then
                    wget -O ./update.zip "$FILE";
                    ./updateServer.sh ./update.zip
                    echo "-- ${LANG_CLEANUP} ..."
                    rm -rf ./update.zip
                    echo "--- ${LANG_TASKDONE}."
                fi
            fi
            ;;
        6)
            ./serverCmd.sh
            ;;
        7)
            nano "./serverConfig.sh";
            ;;
        "Q") 
            clear
            exit 0;
            ;;
esac

cd ../
$0 re
