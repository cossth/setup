#!/bin/bash
echo "Remove Files if exist"
rm githubkeys
rm userkeys
echo "Download keys from github" 
curl -L https://github.com/cossth.keys > githubkeys
echo "Move key"
mv authorized_keys userkeys
echo "Sort Keys"
sort -mu githubkeys userkeys > authorized_keys
echo "Cleanup"
rm githubkeys
rm userkeys

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update

LIST_OF_APPS="mysql-server nginx dotnet-sdk-3.1 dotnet-runtime-3.1"

aptitude update
aptitude install -y $LIST_OF_APPS
