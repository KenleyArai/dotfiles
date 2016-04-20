export ZSH_TMUX_AUTOSTART=true
# Load Antigen
source ~/.functions.zsh
source ~/.antigen/antigen.zsh

# Antigen Bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

# Python Plugins
antigen bundle pip
antigen bundle python

antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle tmux
antigen bundle npm
antigen bundle bower
antigen bundle tarruda/zsh-autosuggestions.git
antigen bundle joel-porquet/zsh-dircolors-solarized.git

UNAME=`uname`
if [[ $UNAME == 'Darwin' ]]; then
	antigen bundle brew
	antigen bundle brew-cask
	antigen bundle gem
	antigen bundle osx
fi

antigen use oh-my-zsh
antigen theme S1cK94/minimal minimal

antigen apply

export ZSH_THEME="minimal"

# Fix for zsh auto complete
export LANG="en_US.UTF-8"

# Tmux settings
alias tmux="TERM=screen-256color-bce tmux"
export DISABLE_AUTO_TITLE="true"

# Default editor
export EDITOR=/usr/local/bin/vim
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_COMPLETION_OPTS='-x --tac'

# Base16 Shell
BASE16_SHELL="$HOME/Documents/dotfiles/base16-shell/base16-solarized.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PATH=/usr/local/CrossPack-AVR/bin:$PATH

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)
alias rm=trash
alias t='todo.sh -d ~/.todo/config'
eval $(thefuck --alias)
alias wifi='osx-wifi-cli'
