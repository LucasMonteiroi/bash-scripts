#!/bin/bash
# header="┌─────────────────────────────────────────┐"
# body="│                                         │"
# footer="└─────────────────────────────────────────┘"
git="./packages/git-install.sh"
nodejs="./packages/nodejs-install.sh"
yarn="./packages/yarn-install.sh"
docker="./packages/docker-install.sh"
slack="./packages/slack-install.sh"
vscode="./packages/vscode-install.sh"
mongodb="./packages/mongodb-compass-install.sh"
reactjs="./packages/reactjs-install.sh"
angular="./packages/angular-install.sh"
vscodeExtensions="./packages/vscode-extensions-install.sh"
postinstall="./packages/post-install.sh"

show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
	
	printf "\n${menu}┌─────────────────────────────────────────┐${normal}\n"
	printf "${menu}│${number}  1 -${menu} Git                  		  │${normal}\n"
	printf "${menu}│${number}  2 -${menu} Node JS                     	  │${normal}\n"
	printf "${menu}│${number}  3 -${menu} Yarn                       	  │${normal}\n"
	printf "${menu}│${number}  4 -${menu} Docker                      	  │${normal}\n"
	printf "${menu}│${number}  5 -${menu} Slack                       	  │${normal}\n"
	printf "${menu}│${number}  6 -${menu} VS Code                     	  │${normal}\n"
	printf "${menu}│${number}  7 -${menu} MongoDB Compass             	  │${normal}\n"
	printf "${menu}│${number}  8 -${menu} React JS                    	  │${normal}\n"
	printf "${menu}│${number}  9 -${menu} Angular                     	  │${normal}\n"
	printf "${menu}│${number}  10 -${menu} VS Code Extensions         	  │${normal}\n"
  printf "${menu}│${number}  11 -${menu} Post Install Scripts        	  │${normal}\n"
	printf "${menu}└─────────────────────────────────────────┘${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Initializing Git installation";
            bash $git
            show_menu;
        ;;
        2) clear;
            option_picked "Initializing NodeJS installation";
            bash $nodejs
            show_menu;
        ;;
        3) clear;
            option_picked "Initializing Yarn installation";
            bash $yarn
            show_menu;
        ;;
        4) clear;
            option_picked "Initializing Docker installation";
            bash $docker
            show_menu;
        ;;
        5) clear;
            option_picked "Initializing Slack installation";
            bash $slack
            show_menu;
            ;;
        6) clear;
            option_picked "Initializing VS Code installation";
            bash $vscode
            show_menu;
            ;;
        7) clear;
            option_picked "Initializing MongoDB Compass installation";
            bash $mongodb
            show_menu;
            ;;
        8) clear;
            option_picked "Initializing React JS installation";
            bash $reactjs
            show_menu;
            ;;
        9) clear;
            option_picked "Initializing Angular installation";
            bash $angular
            show_menu;
            ;;
        10) clear;
            option_picked "Initializing VS Code Extensions installation";
            option_picked "You can see all extensions in:"
            option_picked "https://github.com/LucasMonteiroi/bash-scripts/blob/master/vscode-extensions.txt"
            bash $vscodeExtensions
            show_menu;
        ;;
        11) clear;
            option_picked "Executing Post Install Scripts";
            bash $postinstall
            show_menu;
        ;;
        x) clear;
            printf "`echo "\033[33m"` Thank for use this script, buy me a beer 🍺!\n"
            printf "`echo "\033[36m"` https://www.buymeacoffee.com/lucasmonteiroi" 
            sleep 5
            exit
        ;;
        \n)exit;
        ;;
        *)clear;
			      option_picked "Wrong option\n";
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done