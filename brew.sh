sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Homebrew binaries
BINARIES=(
  coreutils
  findutils
  bash
  bash-completion
  git
  hh
  trash
  ack
  wget
  reattach-to-user-namespace
)

# Cask applications
APPS=(
  alfred
  dropbox
  google-chrome
  iterm2
  1password
  bartender
  caffeine
  dash
)

# Check for homebrew
# Install it if it isn't installed
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "Installing brew binaries"
brew install ${BINARIES[@]}

brew install vim --with-lua --override-system-vim

#Installing brew-cask if it doesn't exist
if test ! $(which brew-cask); then
  echo "Installing brew cask"
  brew install caskroom/cask/brew-cask
  echo "Taping versions"
  brew tap caskroom/versions
fi

echo "Installing apps"
brew cask install --appdir="/Applications" ${APPS[@]}

echo "Installing fonts"
brew tap caskroom/fonts

brew cleanup

