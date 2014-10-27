#!/bin/bash
# Generates ctags using exuberant-ctags
if [ ! -d ~/.vim/tags ]; then
	mkdir ~/.vim/tags
fi
cd ~/pellucid/
ctags -f ~/.vim/tags/pellucid-scala-tags.tag \
    -h [".scala"] -R \
    --exclude="target" \
    --exclude="public" \
    --exclude="resources" \
    --exclude="node_modules" \
    --exclude="scripts" \
    --exclude="utils" \
    --exclude="javascripts" \
    --exclude="*.js" \
    --exclude="build" \
    --totals=yes \
	--tag-relative=yes