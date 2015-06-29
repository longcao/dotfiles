#!/bin/sh

if [ -f brew_packages ]
  then
    brew tap homebrew/versions
    brew install `cat brew_packages`
fi