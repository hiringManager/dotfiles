# Installing antigen, zsh-autocomplete, and moving configuration.

# Creating junk directory
mkdir ~/.zsh

 # Installing Antigen
curl -L git.io/antigen > ~/.zsh/antigen.zsh
sleep 2

# Manually cloning this since it always breaks
git clone https://github.com/marlonrichert/zsh-autocomplete ~/.antigen/bundles/zsh-autocomplete 

# Moving configs
mv .zshrc .aliasrc ~/
