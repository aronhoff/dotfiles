# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context root_indicator dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time)
POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(archlinux sudo systemd wd zsh-syntax-highlighting git colored-man-pages bgnotify zsh-autosuggestions k rust cargo pipenv)

source $ZSH/oh-my-zsh.sh
. /usr/share/fzf/key-bindings.zsh

export GOPATH=$HOME/usr

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.cargo/bin:$(ruby -rrubygems -e 'puts Gem.user_dir')/bin:$HOME/projects/dotfiles/scripts:$HOME/.local/bin:/snap/bin:$GOPATH/bin"
# source /etc/profile.d/perlbin.sh

export PYTHONPATH="/opt/movidius/caffe/python:${PYTHONPATH}"

export EDITOR="nvim"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

TERM=xterm-256color

setopt extendedglob

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

unset SSH_ASKPASS

alias vim="nvim"
alias vimdiff="nvim -d"

alias kh="k -h"
alias kah="k -ah"

alias suss="systemctl suspend"
alias puff="systemctl poweroff"

# Override archlinux plugin
alias paupg="pacaur -Syu"

alias sudo="sudo "
alias python=/usr/bin/python3
alias ipython=~/.local/bin/ipython3
alias ipy=ipython

archey3
. /etc/profile.d/vte.sh

bindkey -v
KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^E' end-of-line
bindkey -v '^A' beginning-of-line
bindkey -v '\e\C-?' backward-kill-word # alt-backspace
bindkey -v '^X^E' edit-command-line
bindkey -v '^X^N' infer-next-history
bindkey -v '^[[1;5C' forward-word
bindkey -v '^[[1;5D' backward-word
bindkey -v '^W' forward-word
bindkey -v '^B' backward-word
bindkey -a '^[[1;5C' forward-word
bindkey -a '^[[1;5D' backward-word
bindkey -a '^W' forward-word
bindkey -a '^B' backward-word
bindkey -v '^[[Z' reverse-menu-complete
bindkey -v '^[[200~' bracketed-paste
bindkey -v '^S' sudo-command-line
bindkey -a '^S' sudo-command-line
bindkey -v ' ' magic-space
bindkey -a ' ' magic-space
bindkey -v '^[OA' up-line-or-beginning-search
bindkey -v '^[OB' down-line-or-beginning-search
bindkey -v '^P' up-line-or-beginning-search
bindkey -v '^N' down-line-or-beginning-search


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/intel/openvino/bin/setupvars.sh
