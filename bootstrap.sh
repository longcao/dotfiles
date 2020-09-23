#!/usr/bin/env bash

cd "$(dirname "$0")"
git pull
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for filename in .aliases .bash_profile .bash_prompt .dir_colors .exports .gitconfig .inputrc .psqlrc .vimrc
  do
    ln -s -f "$(dirname "$0")"/$filename ~
  done
fi

mkdir -p ~/.config/fish
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/colors
mkdir -p ~/.sbt/1.0

ln -s -f ~/"$(dirname "$0")"/.vim/colors/molokai.vim ~/.vim/colors/molokai.vim

ln -s -f ~/"$(dirname "$0")"/.config/fish/config.fish ~/.config/fish/config.fish
ln -s -F ~/.dotfiles/.config/fish/functions/ ~/.config/fish/

ln -s -f ~/"$(dirname "$0")"/.sbt/1.0/local.sbt ~/.sbt/1.0/local.sbt

ln -s -f ~/.dotfiles/vscode/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -s -f ~/.dotfiles/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"

brew tap homebrew/bundle
brew bundle --file=~/.dotfiles/Brewfile

pyenv install 3.7.3
pyenv install 2.7.17

nodenv install 12.10.0
