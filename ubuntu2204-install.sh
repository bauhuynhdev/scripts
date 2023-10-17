#!/bin/bash
# shellcheck disable=SC2164

export NEEDRESTART_MODE=a
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical

# Common
apt update
apt upgrade -y
apt install -yq software-properties-common ca-certificates gnupg apt-transport-https curl dirmngr nano htop wget

# Git
add-apt-repository ppa:git-core/ppa -y
apt update
apt install git -y

# Node js
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install nodejs -y
npm install yarn pm2 -g

# qBittorrent
add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
apt update
apt install qbittorrent-nox -y
mkdir -p ~/.config ~/.config/qBittorrent
echo -e "[LegalNotice]\nAccepted=true" >> ~/.config/qBittorrent/qBittorrent.conf
pm2 start "/usr/bin/qbittorrent-nox" --name qbittorrent
#qbittorrent-nox -d
# Login: admin/adminadmin

# Puppeteer
apt install -yq libgtk-3-dev libnotify-dev gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libnss3 lsb-release xdg-utils

# Chromium
#npx @puppeteer/browsers install chromium -y
apt update
apt install chromium-browser -y