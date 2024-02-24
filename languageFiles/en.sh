#!/bin/bash

LANG_APP_BACKTITLE="BedrockTools - the simple server management for Minecraft Bedrock";
LANG_APP_TITLE="Tasks";
LANG_APP_MENU="Choose a task:";
LANG_APP_TITLE_SCMD="Server";
LANG_APP_MENU_SCMD="Choose a server:";
LANG_YOURCHOISEWAS="Your choice was"
LANG_LEAVESCMD="To quit the command console, just enter \"q\". For help, type .help (or just help for the Bedrock servers internal help)";

LANG_EXECUTE_QUESTION="Execute task?";
LANG_OFFLINE_QUESTION="Please only execute this if all servers are offline!";
LANG_DOWNLOAD_SERVER="Download link to the latest version of the Minecraft Bedrock server:";

LANG_CLEANUP="Cleaning up...";
LANG_TASKDONE="Done.";

MENU_SAVEBACKUPS="Save backups";
MENU_STARTSERVERS="Start servers";
MENU_STOPSERVERS="Stop servers";
MENU_RESTARTSERVERS="Restart servers";
MENU_UPDATESERVERS="Update servers";
MENU_SERVERCMDS="Send a command to a server";
MENU_CHANGECONFIG="Change bedrockTools configuration";
MENU_QUITBRTOOLS="Quit administration";
MENU_STOPSERVERSELECT="Cancel selection";
LANG_APP_MANUAL="\
BedrockTools Commands\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––\n\
 q            Quits the server console\n\
.help         Shows this help\n\
.clear        Clears the server console\n\
.tp           Runs \"tp\" as the user to be teleported\n\
              (allows teleport relative to users position)\n\
.tpd <user> <dimension> <x> <y> <z>\n\
              Runs \"tp\" in the dimension provided.\n\
              Dimensions: overworld nether the_end\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––\n\
Minecraft-Commands\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––\n\
tp <user> <x> <y> <z>\n\
              Teleports a user to x-y-z\n\
              \n\
fill <x> <y> <z> <x2> <y2> <z2> <object>\n\
              Fills from x-y-z to x2-y2-z2\n\
              \n\
say <text>    Writes a message on the server\n\
kick <user>   Kicks a user from the server\n\
kill <user>   Kills a user\n\
list          Lists all users on the server\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––";