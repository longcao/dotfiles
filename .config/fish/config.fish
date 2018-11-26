############### ENVIRONMENT VARIABLES ###############
# Set PATH
set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/.okta/bin $PATH

# Make vim the default editor
set -x EDITOR vim

# Java options
set -x JAVA_OPTS "-XX:ReservedCodeCacheSize=256m -XX:MaxMetaspaceSize=512m"

# sbt options since it doesn't pick up JAVA_OPTS
set -x SBT_OPTS "-XX:ReservedCodeCacheSize=256m -Xmx4096m"

# Choose specific Python version for pyenv
set -x PYENV_VERSION "3.6.6"

############### ABBREVIATIONS ###############
# Easier navigation
abbr -a -- - 'cd -'
abbr -a ... 'cd ../..'

############### ALIASES ###############
# OS X has no `md5sum`, so use `md5` as a fallback
alias md5sum="md5"

# Copy the current directory to clipboard
alias cpd="pwd | pbcopy"

# grep color
alias grep="grep --color='auto'"

# warn if overwriting file when using mv
alias mv="mv -i"

# megaclean (delete target/ folders) all sbt/play projects in a given directory
alias megaclean="find . -name target | xargs rm -Rf"

# tree ignores target
alias tree="tree -I 'target|target-*'"

# paste from clipboard and pretty print JSON
alias pj="pbpaste | jq ."
alias pastejson="pj"

# use gdate
alias date='gdate'

############### FUNCTIONS ###############

# mkdir and immediately cd to it
function md
  mkdir -p $argv; and cd $argv
end

# Update registered git repos
function regen
  mr --directory ~/ --jobs 4 update
  printf "\n~~~ regenerating ctags ~~~\n"
  sh ~/.dotfiles/ctags.sh
  printf "\n"
end

############### OTHER INIT ###############
# Load pyenv automatically
status --is-interactive; and source (pyenv init -|psub)
