#!/bin/bash
cd "$(dirname "$0")"
git pull
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for filename in .aliases .bash_profile .bash_prompt .ctags .dir_colors .exports .functions .gitconfig .inputrc .psqlrc .vimrc
        do
            ln -s -f "$(dirname "$0")"/$filename ~
        done
fi

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/colors
mkdir -p ~/.psql_history
mkdir -p ~/.sbt/0.13
mkdir -p ~/.lein

ln -s -f ~/"$(dirname "$0")"/.sbt/0.13/local.sbt ~/.sbt/0.13/local.sbt
ln -s -f ~/"$(dirname "$0")"/.lein/profiles.clj ~/.lein/profiles.clj
ln -s -f ~/"$(dirname "$0")"/.vim/colors/molokai.vim ~/.vim/colors/molokai.vim

brew tap homebrew/bundle
brew bundle --file=~/.dotfiles/Brewfile
