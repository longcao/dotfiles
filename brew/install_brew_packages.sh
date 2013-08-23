#!/bin/sh

if [ -f brew_packages ]
	then 
		brew install `cat brew_packages`
fi