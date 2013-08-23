#!/bin/sh

# Exports the current installed brew packages to a nice little file for later usage.

brew ls | sort > ~/.dotfiles/brew/brew_packages