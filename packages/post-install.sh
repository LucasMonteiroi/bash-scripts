echo "Running scripts to use docker without sudo mode"
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Running scripts to use npm without sudo mode"
wget https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh
chmod +x npm-g-nosudo.sh
./npm-g-nosudo.sh

source ~/.bashrc

echo "Thank for use this script, buy me a 🍺!"
echo "https://www.buymeacoffee.com/lucasmonteiroi" 
sleep 5
exit
