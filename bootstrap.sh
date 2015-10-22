#!/bin/bash
cd "$(dirname "$0")"
git pull
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for filename in .aliases .bash_profile .bash_prompt .bashrc .ctags .dir_colors .exports .functions .gitconfig .inputrc .psqlrc .vimrc
        do
            ln -s -f "$(dirname "$0")"/$filename ~
        done
fi
mkdir -p ~/.vim/tmp
mkdir -p ~/.psql_history
ln -s -f ~/"$(dirname "$0")"/.sbt/0.13/local.sbt ~/.sbt/0.13/local.sbt
source "$HOME/.bashrc"