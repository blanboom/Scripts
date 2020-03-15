#!/bin/zsh
# License: GPL

echo "\033[34m============ zplug ============\033[0m"
source ~/.zshrc
zplug update

echo "\033[34m============ macOS ============\033[0m"
softwareupdate --install --all

echo "\033[34m============ Mac App Store ============\033[0m"
mas upgrade

echo "\033[34m============ Homebrew ============\033[0m"
brew update
brew upgrade
brew cask upgrade

echo "\033[34m============ Visual Studio Code ============\033[0m"
code --list-extensions |
while read x; do
  code --install-extension "$x"
done

echo "\033[34m============ pip ============\033[0m"
# 参考 https://github.com/UpdateCommand/update/blob/master/bin/update-pip
for pip in "pip" "pip3"; do
  if command -v "$pip" >/dev/null 2>&1; then
    $pip install --upgrade pip
    $pip install --upgrade $pip
    $pip install --upgrade setuptools
    $pip freeze --local | sed -n 's/==.*//p' | xargs -n1 $pip install --upgrade
  fi
done

echo "\033[34m============ npm ============\033[0m"
npm update -g

echo "\033[34m============ gem ============\033[0m" 
gem update
gem update --system