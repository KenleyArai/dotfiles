export ZSH_TMUX_AUTOSTART=true
# Load Antigen
source ~/.antigen.zsh


# Antigen Bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv
antigen bundle tmux
antigen bundle vi-mode

UNAME=`uname`
if [[ $UNAME == 'Darwin' ]]; then
	antigen bundle brew
	antigen bundle brew-cask
	antigen bundle gem
	antigen bundle osx
fi

antigen use oh-my-zsh
antigen theme S1cK94/minimal builds/minimal-vimode-path-git
antigen apply

export EDITOR=/usr/local/bin/nvim
alias tmux="TERM=screen-256color-bce tmux"

export DISABLE_AUTO_TITLE="true"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -v
export KEYTIMEOUT=1
