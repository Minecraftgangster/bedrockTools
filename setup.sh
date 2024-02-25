#!/bin/bash

echo "####################################################";
echo "#              BedrockTools setup                  #";
echo "####################################################";

echo "- Checking dependencies...";

dependArr=("screen" "dialog" "zip"); # dependencies

for value in ${dependArr[*]}; do
    if [ `which $value` == "" ]; then
        echo "Error: $value missing on your system"; exit 1;
    else
        echo "$value found at `which $value`";
    fi
done

if [ ! -f ./bedrockTools/serverConfig.sh ]; then
    echo "No configuration found. Generating configuration files...";

    brToolsHOME=`pwd`/; # Set the current directory as the home directory for bedrockTools.
    ### TODO: Setup for Minecraft server(s) <HERE>

    read -p "Which language? [EN/de] " LANG_SELECTED; echo;
    LANG_SELECTED=${LANG_SELECTED:-en}; LANG_SELECTED=${LANG_SELECTED,,};

    ######################## SETUP SERVERS #####################################################
    read -p "Where are your Minecraft Bedrock servers located? " serverDir; echo;
    if [ "$serverDir" == "" ]; then echo "No server directory provided"; exit 1; fi
    cd $serverDir;
    for sDirs in */; do
        dirName=`echo $sDirs | head -c -2`;
        mServers+=($dirName);
        mDirs+=("${serverDir}${dirName}");
        read -p "World name for ${dirName}?" worldName;
        mWorlds+=("${worldName}");
    done
    tput setaf 4 # blue text
    echo -e "${mServers[*]@A}\n${mDirs[*]@A}\n${mWorlds[*]@A}";
    tput sgr0 # revert to normal
    ############################################################################################

    cd $brToolsHOME;

    declare -a backupTimes=("19:30");

    configFile="#!/bin/bash \n\
                \n\
                ${brToolsHOME@A};\n\
                ${mServers[*]@A};\n\
                ${mDirs[*]@A};\n\
                ${mWorlds[*]@A};\n\
                ${backupTimes[*]@A};\n\
                CTime=300;\n\
                LANG_SELECTED='${LANG_SELECTED}';";
    tput setaf 2; # green font color
    echo -e "${configFile}";
    tput sgr0; # reset terminal colors to defaults
    echo -e "${configFile}" > ./bedrockTools/serverConfig.sh; # write the newly generated configuration file
    echo "Done.";
fi