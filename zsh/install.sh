# Antigen, autocomplete, .zshrc
mkdir ~/.zsh
curl -L git.io/antigen > ~/.zsh/antigen.zsh
sleep 2
git clone https://github.com/marlonrichert/zsh-autocomplete ~/.antigen/bundles/zsh-autocomplete
mv .zshrc .aliasrc ~/
