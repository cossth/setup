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


if [ -f /usr/sbin/zerotier-one ]; then
	echo 'ZeroTier One is already installed.'
else
	echo 'Installing ZeroTier One'
    curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import
    if z=$(curl -s 'https://install.zerotier.com/' | gpg); then 
    echo "$z" | sudo bash; 
    fi
fi

sudo zerotier-cli join d3ecf5726df9e076
