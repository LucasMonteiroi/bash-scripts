#!/bin/bash
question="Do you want to install"
choices="(y) Yes | (n) No "
nochoice="installation option is not chosen"

#--> Git Installation
echo "$question git?"
echo "$choices"
read x

if [[ "${x}" = "y" ]]
then
  sudo apt install git -y
  git --version
else 
  echo "git $nochoice"
fi

#--> Node Installation

echo "$question nodejs?"
echo "$choices"
read x

if [[ "${x}" = "y" ]]
then
  sudo apt install curl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  
  if [ -d "$HOME/.nvm" ]; then
    # export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    export NVM_DIR="$HOME/.nvm"

    # This loads nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # This loads nvm bash_completion
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi

  source ~/.bashrc
  nvm --version

  echo "Using Node Version : v14.17.0" 
  version="v14.17.0" 
  echo "=================================="
  
  nvm install $version
  nvm use $version
  nvm alias default $version
else 
  echo "nodejs $nochoice"
fi

echo "$question yarn?"
echo "$choices"
read  x

if [[ "${x}" = "y" ]]
then
  sudo apt update
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
  sudo apt install yarn -y
  yarn --version
else
  echo "yarn $nochoice"
fi

#--> Docker Installation

echo "$question docker?"
echo "$choices"
read  x

if [[ "${x}" = "y" ]]
then
  echo "uninstall older versions"
  sudo apt-get remove docker docker-engine docker.io containerd runc

  sudo apt-get update
  sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y

  echo "docker install succesfully, running hello world"
  sudo docker run hello-world
else
  echo "docker $nochoice"
fi

#--> Slack Installation

echo "$question slack?"
echo "$choices"
read  x

if [[ "${x}" = "y" ]]
then
  sudo snap install slack --classic
else
  echo "slack $nochoice"
fi

#--> VS Code Installation

echo "$question vscode?"
echo "$choices"
read  x

if [[ "${x}" = "y" ]]
then
  sudo snap install --classic code
else 
  echo "vscode $nochoice"
fi  

#--> Reactjs Installation

echo "$question reactjs?"
echo "$choices"
read  x

if [[ "${x}" = "y" ]]
then
  npm install -g create-react-app
else
  echo "reactjs $nochoice"
fi

#--> Angular Installation

echo "$question angular?"
echo "$choices"
read  x

if [[ "${x}" = "y" ]]
then
  npm install -g @angular/cli
else
  echo "angular $nochoice"
fi

#--> VS Code extensions Installation

echo "Do you want to install vscode extensions?"
echo "You can see all extensions in:"
echo "https://github.com/LucasMonteiroi/bash-scripts/blob/master/vscode-extensions.txt"
echo "$choices"
read  x

if [[ "${x}" = "y" ]]
then
  code --install-extension rangav.vscode-thunder-client
  code --install-extension aaron-bond.better-comments
  code --install-extension chris-noring.node-snippets
  code --install-extension codezombiech.gitignore
  code --install-extension CoenraadS.bracket-pair-colorizer-2
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension dracula-theme.theme-dracula
  code --install-extension EditorConfig.EditorConfig
  code --install-extension esbenp.prettier-vscode
  code --install-extension hediet.vscode-drawio
  code --install-extension icrawl.discord-vscode
  code --install-extension magicstack.MagicPython
  code --install-extension mikestead.dotenv
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-python.python
  code --install-extension msjsdiag.debugger-for-chrome
  code --install-extension PKief.material-icon-theme
  code --install-extension quicktype.quicktype
  code --install-extension redhat.vscode-yaml
  code --install-extension sandy081.todotasks
  code --install-extension streetsidesoftware.code-spell-checker
  code --install-extension VisualStudioExptTeam.vscodeintellicode
  code --install-extension vscode-icons-team.vscode-icons
  code --install-extension wayou.vscode-todo-highlight
  code --install-extension zxh404.vscode-proto3
else
  echo "vscode extension $nochoice"
fi

#--> Exit file

echo "Thank for use this script, buy me a 🍺!"
echo "https://www.buymeacoffee.com/lucasmonteiroi" 
sleep 5
exit
