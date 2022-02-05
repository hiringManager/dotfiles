source ~/.zsh/antigen.zsh
antigen use oh-my-zsh
#antigen bundle git
#antigen bundle pip 
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
# You are going to have to manually clone marlonricher/zsh-autocomplete into ~/.antigen/bundles/
#antigen bundle marlonricher/zsh-autocomplete
#antigen bundle MichaelAquilina/zsh-you-should-use
#antigen bundle chrissicool/zsh-256color 
# Syntax highlighting bundle.
# Replaced with next plugin
#antigen bundle zdharma/fast-syntax-highlighting
# This one uses italics
#antigen theme arrow
antigen theme kennethreitz 
# kennethreitz### 
# Dependency for Ueberzug is libxtst-dev
# xiong-chiamiov-pluss, rixius crunch arrow 
# Tell Antigen that you're done.
# Hardcore mode for you-should-use
#export YSU_HARDCORE=0
antigen apply

bindkey -v # vi-mode

#PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"
# Export PATH$
#export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH
alias ls='ls -lh --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'
#####################################################
# Auto completion / suggestion
#zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 4
#bindkey $key[Up] up-line-or-history
#bindkey $key[Down] down-line-or-history

source ~/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.antigen/bundles/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
#HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
# Don't use this in wsl, it's awful #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
#export TERM='xterm-256color'
export MANPAGER='nvim +Man!'
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export EDITOR='nvim'
# Cursor
#echo -e -n "\x1b[\x30 q" # changes to blinking block
#echo -e -n "\x1b[\x31 q" # changes to blinking block also
#echo -e -n "\x1b[\x32 q" # changes to steady block
#echo -e -n "\x1b[\x33 q" # changes to blinking underline   
#echo -e -n "\x1b[\x34 q" # changes to steady underline
#echo -e -n "\x1b[\x35 q" # changes to blinking bar
#echo -e -n "\x1b[\x36 q" # changes to steady bar
# export HISTFILE=~/.config/zsh/.zsh_history
export MANPATH="/usr/local/man:$MANPATH"

#This causes pasted URLs to be automatically escaped, without needing to disable globbing.
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
#autoload -Uz url-quote-magic
#zle -N self-insert url-quote-magic

# Additions

# Import colorscheme from wal
(~/.local/bin/wal -qR &)
# Fork Bomb # / :(){ :|: & };:
#eval $(thefuck --alias) 

# Find new executables in path
#zstyle ':completion:*' rehash true

# FIX - alias this find /thisdir -type f -name '*.ogg' -exec mv -i {} /somedir  \;

 # Environment Variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.colortoys:$PATH"
# export PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"

# Functions

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
#
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

# $ find . -type d -empty -print
# clear dirs that are empty append -delete
# |-- Fix alias winPicBackup='rsync /mnt/c/Users/zofia/AppData/Local/Packages/MicrosoftWindows.Client.CBS_cw5n1h2txyewy/TempState/Screenclip/*.png /mnt/c/Users/zofia/Pictures/Captures/'

#Aliases

#alias i3c="vim ~/.config/i3/config"
#alias orc="emacs ~/.config/openbox/rc.xml"
#alias arc="vim ~/.config/awesome/rc.lua"
alias cm='cmatrix'
#alias yt="rofi_mpvtube"
#alias ge="geany"
#alias tf="terraform"
#alias qq="howdoi"
#alias pip-upgrade="pip3 freeze --user | cut -d'=' -f1 | xargs -n1 pip3 install -U" #Is this safe to use use in Debian? FIX
#alias pip-upgrade-venv="pip3 freeze | cut -d'=' -f1 | xargs -n1 pip3 install -U"
alias em='emacs -nw'
alias zrc="vim ~/.zshrc"
alias p2="~/.color-toys/pipes2"
alias nf="neofetch --ascii_distro 'Windows'"
alias nfw="neofetch --ascii_distro Windows"
alias nfg="neofetch --ascii_distro Gentoo"
alias sai="sudo apt install "
alias sau="sudo apt update && sudo apt full-upgrade -y"
alias saaa="sudo apt autoremove && sudo apt clean && sudo apt autoclean && sudo apt update && sudo apt upgrade"
alias wkill='taskkill.exe /IM' 
alias vim='nvim'
alias v='vim'
alias qq='socli'
alias c="clear; fortune -s "
alias pwsh="powershell"
alias nmapz='nmap -sC -sV -oN nmap.txt -vv'
alias sfor='fortune -n 140'
alias sforo='while true ; do fortune -o -n 140; sleep 40; clear; done'  
alias sfors='while true; do fortune -n 140; sleep 25; clear; done'
# Awiases (pawsix compwiant!!) =^_*=

# alias awias='alias'
# alias whiwe='while'
# alias twue='true'
# alias duwu='do'
# alias sheww='sh'
# alias echowo='echo'
# alias ws='ls'
# alias sw='sl'
# alias gwep='grep'
# alias OwO='whiwe twue; duwu sw; done'
# Windows
alias wsl='wsl.exe'
alias kwsl='wsl.exe --shutdown'
alias cdw='cd /mnt/c/Users/iuseg/OneDrive/Workspaces'
alias cdh='cd /mnt/c/Users/iuseg/'
alias wgt='winget.exe '
alias wgti='winget.exe install '
alias wgts='winget.exe search'
alias jk='cmatrix'
alias spam='while true; do wal --theme random; done'
alias gc='git clone ' # This may interfere with shit
export win='/mnt/c/Users/iuseg'
alias cds='cd ~/sites/emma/'
alias rr='ranger .'
alias nano='while true; do sl; done'
alias vagrant='vagrant.exe'
alias cdd='cd $win/Onedrive/Workspaces/Markdown/daily'
# to kill all vagrant boxes
alias vdavda='vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f'
# Node and Node Accessories 

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm




# pipenv
#eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
#


fortune -s

alias ww='wal --theme random'
alias np='notepad.exe'

# Magic
# echo foo ^| wc

