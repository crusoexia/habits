#!/bin/bash

set -e

# setup ubuntu fisrt
./setup.ubuntu.sh

echo ""
echo ""
echo "Setup wsl..."

echo -e "\ninstall wslu..."
sudo add-apt-repository -y ppa:wslutilities/wslu
sudo apt update
sudo apt install -y wslu

echo ""
echo -e "wsl setup complete"
echo -e "\nHappy Hacking!"
echo ""
