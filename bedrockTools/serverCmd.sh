#!/bin/bash

source "./serverConfig.sh"; # import configuration
source "../languageFiles/${LANG_SELECTED}.sh"; # load user-selected language (default: en)

function greet {
    echo "${LANG_YOURCHOISEWAS} ${mServers[$CHOICE]}";
    echo "${LANG_LEAVESCMD}";
    echo
}

function runOnServer {
        cd "${mDirs[CHOICE]}";
        rm -f ./screenlog.*;    # clear log so we won't see old stuff
        screen -x "${mServers[$CHOICE]}" -X stuff "${sCommand[*]}\n"; # send the command
        sleep .25; # wait for 250ms to collect log data
        LOGTEXT=`cat ./screenlog.* | tail -n +2`; echo "$LOGTEXT"; # display latest output from the server
        if [ ! -z "$LOGTEXT" ]; then echo; fi
        cd "${brToolsHOME}/bedrockTools/";
}

function extrap () {
    history -w ./tmp/history.txt
    exit
}
trap extrap INT

  tBold=`tput bold`;      # for bold text
  tNorm=`tput sgr0`;      # for normal text
   tRed=`tput setaf 1`;   # for red text
 tGreen=`tput setaf 2`;   # for green text

counter=0;
HEIGHT=15;
WIDTH=40;
CHOICE_HEIGHT=4;
BACKTITLE="${LANG_APP_BACKTITLE}";
TITLE="${LANG_APP_TITLE_SCMD}";
MENU="${LANG_APP_MENU_SCMD}";

for key in ${!mServers[@]}; do
    i=$((key + 1)); # Have menu indexes start by 1 instead of 0
    OPTIONS+=($i "${mServers[$key]}");
done

OPTIONS+=("Q" "${MENU_STOPSERVERSELECT}");

CHOICE=$(dialog --clear --no-cancel \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

case $CHOICE in
    "Q")
        exit 0;
        ;;
esac

CHOICE=$((CHOICE - 1)); # Indexes usually start with 0. Menu indexing starts with 1 in our case, so let's fix that difference.
greet
history -r ./tmp/history.txt
history -c
while [ 1 ]; do
    read -e -r -p "Befehl> " sCommand;
    history -s $sCommand;
    sCommand=($sCommand);

    if [ ! -z "${sCommand[*]}" ]; then
        if [ "${sCommand[*]}" == "q" ]; then
            $0
            exit
        elif [ "${sCommand[0]}" == ".tp" ]; then
            # Runs teleport as the one who is to be teleported
            myStr=""; for i in {2..10}; do myStr+="${sCommand[$i]} "; done ## fetch argument 3 by 10;
            sCommand=("execute as ${sCommand[1]} at ${sCommand[1]} run tp $myStr")
            echo "${tBold}${tGreen}Befehl:${tNorm}: ${sCommand[*]}";
            runOnServer
        elif [ "${sCommand[0]}" == ".tpd" ]; then
            myStr=""; for i in {3..11}; do myStr+="${sCommand[$i]} "; done ## fetch argument 3 by 11;
            sCommand=("execute as ${sCommand[1]} in ${sCommand[2]} run tp $myStr")
            echo "${tBold}${tGreen}Befehl:${tNorm}: ${sCommand[*]}";
            runOnServer
        elif [ "${sCommand[*]}" == ".clear" ]; then
            tput clear
            greet
        elif [ "${sCommand[0]}" == ".help" ]; then
            echo -e "${LANG_APP_MANUAL}";
        else
            runOnServer
        fi
    else
        echo "${tBold}${tRed}Achtung:${tNorm} Kein Befehl angegeben.";
    fi
done

$0