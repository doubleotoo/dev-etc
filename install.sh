#!/bin/bash

# Get absolute directory path for this script.
pushd "$(dirname "$0")" > /dev/null
declare -r SRCDIR="$(pwd -P)"
popd > /dev/null

declare -r DATE="$(date +%Y%m%d)"

# -s  create symlink
# -i  confirm via prompt if file already exists
# -F  link directory
function symlink () {
  if test $# -ne 2; then
      echo "Usage: symlink <source> <target>"
      exit 1
  else
      echo "Linking $1 ~> $2"
      ln -s -i -F "$1" "$2"
  fi
}

# ------------------------------------------------------------------------------
# Bash
symlink "${SRCDIR}/bash/bash_profile" "${HOME}/.bash_profile"
symlink "${SRCDIR}/bash/bashrc" "${HOME}/.bashrc"

# ------------------------------------------------------------------------------
# iterm2
symlink \
   "${SRCDIR}/iterm2/com.googlecode.iterm2.plist" \
   "${HOME}/Library/Preferences/com.googlecode.iterm2.plist"

# ------------------------------------------------------------------------------
# vim
if [ -d "${HOME}/.vim" ]; then
    mv "${HOME}/.vim" "${HOME}/.vim-${DATE}"
fi
symlink "${SRCDIR}/vim/" "${HOME}/.vim"
symlink "${SRCDIR}/vim/vimrc" "${HOME}/.vimrc"

# ------------------------------------------------------------------------------
# Submodule repositories
git submodule init
git submodule update

