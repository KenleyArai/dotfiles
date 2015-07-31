export ZSH_TMUX_AUTOSTART=true
# Load functions
source ~/.zsh_functions
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

UNAME=`uname`
if [[ $UNAME == 'Darwin' ]]; then
	antigen bundle brew
	antigen bundle brew-cask
	antigen bundle gem
	antigen bundle osx
fi

antigen use oh-my-zsh
antigen theme S1cK94/minimal builds/minimal-path
antigen apply

# Fix for zsh auto complete
export LANG="en_US.UTF-8"

# Tmux settings
alias tmux="TERM=screen-256color-bce tmux"
export DISABLE_AUTO_TITLE="true"

# Default editor
export EDITOR=/usr/local/bin/vim
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Docker settings
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/kenleyarai/.boot2docker/certs/boot2docker-vm


# fzf settings
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_COMPLETION_OPTS='-x --tac'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source /Users/kenleyarai/.iterm2_shell_integration.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Base16 Shell
if [ -n "$PS1" ]; then # if statement guards adding these helpers for non-interative shells
  eval "$(~/repos/dotfiles/base16-shell/profile_helper.sh)"
fi

source /usr/local/opt/autoenv/activate.sh
