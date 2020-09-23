############### ENVIRONMENT VARIABLES ###############

# Set fish_user_paths (which gets automatically prepended to PATH)
set -gx fish_user_paths ~/.cargo/bin $fish_user_paths
set -gx fish_user_paths "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/" $fish_user_paths
set -gx fish_user_paths ~/go/bin $fish_user_paths

# Make vim the default editor
set -gx EDITOR vim

# Java options
set -gx JAVA_OPTS "-XX:ReservedCodeCacheSize=256m -XX:MaxMetaspaceSize=512m"

# sbt options since it doesn't pick up JAVA_OPTS
set -gx SBT_OPTS "-XX:ReservedCodeCacheSize=256m -Xmx4096m"

# Set specific Python version for pyenv
set -gx PYENV_VERSION "3.7.3"

# Set specific Node version for nodenv
set -gx NODENV_VERSION "12.10.0"

# Don't shorten prompt_pwd directory names at all
set -g fish_prompt_pwd_dir_length 0

# Set fish_color_cwd to yellow
set fish_color_cwd yellow

# Set LS_COLORS
eval (gdircolors -c ~/.dir_colors)

############### ABBREVIATIONS ###############

# Easier navigation
abbr -a -- - 'cd -'
abbr -a ... 'cd ../..'

############### ALIASES ###############

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
end

############### OTHER INIT ###############

# Init language-specific versions automatically
status --is-interactive; source (pyenv init -|psub);
status --is-interactive; source (rbenv init -|psub);
status --is-interactive; source (nodenv init -|psub);

############### LOCAL CONFIG ###############
source ~/.local.fish

