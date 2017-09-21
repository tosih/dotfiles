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

# UnSymLink
# =========

declare -a FOLDERS_TO_UNSTOW=(
  'files'
  'git'
  'karabiner'
  'vim'
  'zsh'
)

function cleanupDotFiles() {
  local i=''
  local sourceFolder=''
  local targetFile=''

  for i in ${FOLDERS_TO_UNSTOW[@]}; do
    sourceFolder="$i"
    execute "stow -D -t ${HOME} $sourceFolder" "$sourceFolder → ${HOME}"
  done

  unset FOLDERS_TO_UNSTOW
}

cleanVim() {
  vim +PluginClean +qall
}

read -p "This will uninstall dotfiles. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  cleanVim
  cleanupDotFiles
fi

unset cleanupDotFiles
unset cleanVim
