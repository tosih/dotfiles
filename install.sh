#!/usr/bin/env bash

# Utils
# =======
execute() {
  $1 &> /dev/null
  print_result $? "${2:-$1}"
}

print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  [ "$3" == "true" ] && [ $1 -ne 0 ] \
    && exit
}

print_error() {
  # Print output in red
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_success() {
  # Print output in green
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

# Symlink
# =======
declare -a FOLDERS_TO_STOW=(
  'files'
  'git'
  'karabiner'
  'vim'
  'zsh'
)

# Pull latest from GitHub
function pullLatest() {
  echo -n "Pulling latest dotfiles..."
  git pull;
  echo "done"
}

# Use stow to link dotfile packages
function linkDotFiles() {
  local i=''
  local sourceFolder=''

  for i in ${FOLDERS_TO_STOW[@]}; do
    sourceFolder="$i"
    execute "stow -t ${HOME} $sourceFolder" "$sourceFolder → ${HOME}"
  done

  unset FOLDERS_TO_STOW
}

function installVim() {
  vim +PluginInstall +qall
}

# Warn user this script will overwrite current dotfiles
read -p "Warning: this will overwrite your current dotfiles. Continue? [y/n] " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  pullLatest
  linkDotFiles
  installVim
fi

unset pullLatest
unset linkDotFiles
unset installVim