#!/bin/sh
 # Node + NVM Install script

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo 'exportNVM_DIR="$([ -z"${XDG_CONFIG_HOME-}"] &&printf%s "${HOME}/.nvm"||printf%s "${XDG_CONFIG_HOME}/nvm")"[ -s"$NVM_DIR/nvm.sh"] &&\."$NVM_DIR/nvm.sh"#This loads nvm' >> ~/.zshrc
nvm install node

# gatsby
# make a git for site mate
# git clone https://github.com/hiringmanager/hiringmanager

mkdir ~/gatsby_sites
cd ~/gatsby_sites
npm install -g gatsby-cli
gatsby new <project name> # gatsby new my-gatsby-project https://github.com/hasura/gatsby-gitbook-starter
cd <project name>
nvm i # this is where you keep fucking up
gatsby develop
