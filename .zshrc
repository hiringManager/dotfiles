# This config assumes you have zsh and git installed.

# 1. Back up your existing ~/.zshrc if needed.
# 2. Copy this file to ~/.zshrc.
# 3. Start a new shell:    exec zsh
# 4. Compile with Znap:    znap compile

# At this point, everything should be installed and ready.
# Optional: You can remove any comments, exports, or aliases you don't need.


# Load Znap
[[ -f ~/.zsh/plugins/znap/znap.zsh ]] || {
  mkdir -p ~/.zsh/plugins
  git clone --depth 1 https://github.com/marlonrichert/zsh-snap ~/.zsh/plugins/znap
}
source ~/.zsh/plugins/znap/znap.zsh

# Basic settings
setopt promptsubst share_history
setopt HIST_REDUCE_BLANKS       # Strip out extra spaces
setopt HIST_IGNORE_SPACE        # Don't store commands that start with a space
HISTFILE=~/.zsh_history; HISTSIZE=90000; SAVEHIST=90000

# Load compinit via znap #Pretty sure this isn't needed at all
autoload -Uz compinit
znap eval compinit compinit -u

# Load plugins
#znap source zsh-users/zsh-completions # slows shit down a lot
#fpath+=(${ZNAP_DIR:-~/.zsh}/plugins/zsh-users---zsh-completions/src)
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source marlonrichert/zsh-autocomplete

# === Restore classic Tab behavior ===
#autoload -Uz complete-word

# Unbind autocomplete's override
bindkey -r '^I'

# Rebind Tab to standard menu-complete or expand-or-complete
bindkey '^I' menu-complete

# The ones from the ancient config
#zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 3

##############
# Ensure menu shows even on unambiguous matches
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
#zstyle ':autocomplete:tab*' widget-style menu-select

# Set up standard completion menus
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'

# Add custom completions path
# fpath=(~/.zsh/completions $fpath)

# If you update plugins, you need to run this
# znap compile

# Environment Variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.colortoys:$PATH"
export MANPAGER='nvim +Man!'
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='nvim'
export PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

# Probably shouldn't do this
export win='/mnt/c/Users/lidija'
export dl='/mnt/c/Users/lidija/Downloads'

source ~/.aliasrc

# This WILL break the config
#bindkey -v # vi-mode

autoload -Uz vcs_info; precmd() { vcs_info }; setopt PROMPT_SUBST; autoload -Uz colors && colors
PROMPT='%{$fg_bold[magenta]%}›%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%}%{$fg[cyan]%}${vcs_info_msg_0_}%{$reset_color%} '
zstyle ':vcs_info:git:*' formats ' [%b]'
zstyle ':vcs_info:*' enable git

# pywal
#[[ -f ~/.cache/wal/sequences ]] && cat ~/.cache/wal/sequences
# Run pywal restore (in background)
#(~/.local/bin/wal -qR &)

# Set terminal colors manually (from your theme)
set_colors() {
  # 16-color palette
  print -Pn "\e]4;0;#fff9e5\a"  # color0
  print -Pn "\e]4;1;#D57E85\a"  # color1
  print -Pn "\e]4;2;#A3B367\a"  # color2
  print -Pn "\e]4;3;#DCB16C\a"  # color3
  print -Pn "\e]4;4;#7297B9\a"  # color4
  print -Pn "\e]4;5;#BB99B4\a"  # color5
  print -Pn "\e]4;6;#69A9A7\a"  # color6
  print -Pn "\e]4;7;#8b8198\a"  # color7
  print -Pn "\e]4;8;#bfb9c6\a"  # color8
  print -Pn "\e]4;9;#D57E85\a"  # color9
  print -Pn "\e]4;10;#A3B367\a" # color10
  print -Pn "\e]4;11;#DCB16C\a" # color11
  print -Pn "\e]4;12;#7297B9\a" # color12
  print -Pn "\e]4;13;#BB99B4\a" # color13
  print -Pn "\e]4;14;#69A9A7\a" # color14
  print -Pn "\e]4;15;#585062\a" # color15

  # Special colors
  print -Pn "\e]10;#8b8198\a"  # foreground
  print -Pn "\e]11;#fff9e5\a"  # background
  print -Pn "\e]12;#8b8198\a"  # cursor
}

set_colors
