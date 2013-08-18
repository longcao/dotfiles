#!/bin/bash
# Generates ctags using exuberant-ctags
if [ ! -d ~/.vim/tags ]; then
	mkdir ~/.vim/tags
fi
cd ~/gawkermedia/kinja/
ctags -f ~/.vim/tags/gawker-scala-tags.tag \
    -h [".scala"] -R \
    --exclude="target" \
    --exclude="public" \
    --exclude="scratchpad" \
    --exclude="resources" \
    --exclude="node_modules" \
    --exclude="scripts" \
    --exclude="utils" \
    --exclude="javascripts" \
    --totals=yes \
	--tag-relative=yes