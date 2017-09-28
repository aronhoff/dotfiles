# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(archlinux sudo systemd wd zsh-syntax-highlighting git colored-man-pages bgnotify zsh-autosuggestions k rust cargo)

source $ZSH/oh-my-zsh.sh
. /usr/share/fzf/key-bindings.zsh

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.cargo/bin:$(ruby -rubygems -e 'puts Gem.user_dir')/bin:/usr/bin/core_perl"
export EDITOR="nvim"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

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

archey3
. /etc/profile.d/vte.sh
