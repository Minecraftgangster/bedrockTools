#!/bin/bash

LANG_APP_BACKTITLE="BedrockTools - die einfache Serververwaltung für Minecraft Bedrock";
LANG_APP_TITLE="Aufgaben";
LANG_APP_MENU="Wähle eine Aufgabe:";
LANG_APP_TITLE_SCMD="Server";
LANG_APP_MENU_SCMD="Wähle einen Server:";
LANG_YOURCHOISEWAS="Deine Auswahl war";
LANG_LEAVESCMD="Um die Befehlskonsole zu beenden, gebe einfach \"q\" ein. Für Hilfe, .help (oder help für die Bedrock-Server-interne Hilfe.)";

LANG_EXECUTE_QUESTION="Vorgang durchführen?";
LANG_OFFLINE_QUESTION="Bitte nur, wenn sicher alle Server offline sind!";
LANG_DOWNLOAD_SERVER="Downloadlink für die aktuelle Serverversion für Minecraft Bedrock:";

LANG_CLEANUP="Aufräumen...";
LANG_TASKDONE="Fertig.";

MENU_SAVEBACKUPS="Backups sichern";
MENU_STARTSERVERS="Server starten";
MENU_STOPSERVERS="Server stoppen";
MENU_RESTARTSERVERS="Server neustarten";
MENU_UPDATESERVERS="Update der Serverversion";
MENU_SERVERCMDS="Befehl an einen Server senden";
MENU_QUITBRTOOLS="Administration beenden";
MENU_CHANGECONFIG="bedrockTools-Einstellungen ändern";
MENU_STOPSERVERSELECT="Auswahl abbrechen";
LANG_APP_MANUAL="\
BedrockTools Serverbefehle\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––\n\
 q            Beendet die Serverkonsole\n\
.help         Zeigt diese Hilfe an\n\
.clear        Leert die Serverkonsole\n\
.tp           Führt \"tp\" auf dem Server als zu\n\
               teleportierender Nutzer aus\n\
              (ermöglicht Teleport relativ zur Nutzerposition)\n\
.tpd <Nutzer> <Dimension> <x> <y> <z>\n\
              Führt \"tp\" in der angegebenen Dimension aus.\n\
              Dimensionen: overworld nether the_end\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––\n\
Minecraft-Befehle (grobe Auflistung)\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––\n\
tp <Nutzer> <x> <y> <z>\n\
             Teleportiert einen Nutzer nach x-y-z\n\
              \n\
fill <x> <y> <z> <x2> <y2> <z2> <objekt>\n\
              Füllt von x-y-z zu x2-y2-z2 Blöcke aus\n\
              \n\
say <text>    Schreibt eine Nachricht auf dem Server\n\
kick <nutzer> Kickt einen Nutzer vom Server\n\
kill <nutzer> Tötet einen Nutzer\n\
list          Listet alle aktiven Nutzer auf dem Server\n\
––––––––––––––––––––––––––––––––––––––––––––––––––––";