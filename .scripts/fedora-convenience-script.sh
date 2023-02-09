#!/bin/bash

# Adding flathub to repos. Allows 3rd party stuff. Also consider rpm fusion if you don't have it already
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Docker

# Removing older versions of docker if they exist
# https://docs.docker.com/engine/install/fedora/#prerequisites
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

# Installing repo manager shit
sudo dnf -y install dnf-plugins-core

# Adding docker repo
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# Docker installation
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# May need to enable
sudo systemctl start docker
# sudo systemctl enable docker

# Hopefully fucking users aren't a problem here. Dumb Docker

# Vscode 

# Vscode repo
# https://code.visualstudio.com/docs/setup/linux
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sleep 1
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update

# Vscode installation
sudo dnf install code

# Node 

# No unnecessary stuff with npm/npx etc in fedora
# sudo dnf install nodejs
