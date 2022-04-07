source ~/.zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme kennethreitz 
antigen apply
source $HOME/.antigen/bundles/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.aliasrc
bindkey -v # vi-mode
(~/.local/bin/wal -qR &) # Loading wal early to avoid eyes getting blasted
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 4
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
HIST_STAMPS="mm/dd/yyyy"

#antigen bundle git
#antigen bundle pip
#antigen bundle lukechilds/zsh-nvm
#antigen bundle lukechilds/zsh-better-npm-completion
#antigen bundle zsh-users/zsh-completions
#antigen bundle marlonricher/zsh-autocomplete
#antigen bundle MichaelAquilina/zsh-you-should-use
#antigen bundle chrissicool/zsh-256color 
#antigen bundle zdharma/fast-syntax-highlighting
# This one uses italics
# antigen theme awesomepanda
# xiong-chiamiov-pluss, rixius crunch arrow

#source ~/.profile

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
#HYPHEN_INSENSITIVE="true"

#PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"

# Export PATH$
# Auto completion / suggestion
# zstyle ':autocomplete:tab:*' insert-unambiguous yes
# bindkey $key[Up] up-line-or-history
# bindkey $key[Down] down-line-or-history


# Uncomment the following line if pasting URLs and other text is messed up.
#DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# Don't use this in wsl, it's awful #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
# export TERM='xterm-256color'
# Cursor
#echo -e -n "\x1b[\x30 q" # changes to blinking block
#echo -e -n "\x1b[\x31 q" # changes to blinking block also
#echo -e -n "\x1b[\x32 q" # changes to steady block
#echo -e -n "\x1b[\x33 q" # changes to blinking underline   
#echo -e -n "\x1b[\x34 q" # changes to steady underline
#echo -e -n "\x1b[\x35 q" # changes to blinking bar
#echo -e -n "\x1b[\x36 q" # changes to steady bar
# export HISTFILE=~/.config/zsh/.zsh_history

#This causes pasted URLs to be automatically escaped, without needing to disable globbing.
#autoload -Uz url-quote-magic
#zle -N self-insert url-quote-magic

# Additions

# Import colorscheme from wal
# Fork Bomb # / :(){ :|: & };:
#eval $(thefuck --alias) 

# Find new executables in path
#zstyle ':completion:*' rehash true

# FIX - alias this find /thisdir -type f -name '*.ogg' -exec mv -i {} /somedir  \;

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Environment Variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.colortoys:$PATH"
export MANPAGER='nvim +Man!'
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='nvim'
export win='/mnt/c/Users/iuseg'
export PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"

# Functions

# Fix ZSH history
alias fixhistory='mv ~/.zsh_history ~/.zsh_history_bad; strings -eS ~/.zsh_history_bad > ~/.zsh_history; fc -R ~/.zsh_history; rm ~/.zsh_history_bad'

# invoke builtin to allow it in zsh. for bash we'd substitute 'command'
cd() {
       if [ "$#" -eq 0 ]; then
          builtin cd
       elif [ "$(printf '%s' "$1" | wc -l)" -eq 0 ]; then
          builtin cd "$(printf '%s' "$1" | sed '/^\.\.\+$/ {s|..|.|; s|.|../|g }')";
       else
          builtin cd "$1"
       fi
     }

# pywal
wal-tile() {
    wal -n -i "$@"
    feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
}

# regex to remove garbage from history #FIX
#function zshaddhistory() {
#  emulate -L zsh
#  if ! [[ "$1" =~ "(^ |^ykchalresp|--password)" ]] ; then
#      print -sr -- "${1%%$'\n'}"
#      fc -p
#  else
#      return 1
#  fi
#}

# find . -type d -empty -print
# clear dirs that are empty append -delete
# |-- Fix alias winPicBackup='rsync /mnt/c/Users/zofia/AppData/Local/Packages/MicrosoftWindows.Client.CBS_cw5n1h2txyewy/TempState/Screenclip/*.png /mnt/c/Users/zofia/Pictures/Captures/'

# Node and Node Accessories 

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# pipenv
#eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
#
# Magic
# echo foo ^| wc

#wal --theme base16-codeschool
#alias c='fortune -s | lolcat -d 6 -a '

#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Dependency for Ueberzug is libxtst-dev


fortune -s
