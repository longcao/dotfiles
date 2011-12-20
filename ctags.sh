#!/bin/bash
if [[ -f ~/.vim/tags/sf-tags.tag ]] ; then
    rm ~/.vim/tags/sf-tags.tag
fi
cd ~/sparefoot/genesis/src
ctags -f ~/.vim/tags/sf-tags.tag \
    -h ".php" -R \
    --exclude="\.svn" \
    --exclude="rad" \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=+cf \
    --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |static |abstract |protected |private |final )+function\s+([^ ()]*)/\2/f/' \
    --regex-PHP='/const ([^ ]*)/\1/c/'
  