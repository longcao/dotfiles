#!/bin/bash
# Generates ctags using exuberant-ctags
if [ ! -d ~/.vim/tags ]; then
  mkdir ~/.vim/tags
fi
cd ~/projects/
ctags -f ~/.vim/tags/scala-tags.tag \
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
  --exclude="*.pem" \
  --exclude="*.asc" \
  --totals=yes \
  --tag-relative=yes