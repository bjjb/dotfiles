#!/usr/bin/env bash

# Installs JJ's dotfiles, by installing prerequisites, and then symlinking
# things into their expected locations.

function fail() {
  echo $2
  exit -1
}

# OSX (Darwin) specific stuff -----------------------------------------------
function osx_ensure_ruby() {
  which -s ruby || fail "You need to install either ruby to continue"
}

function osx_ensure_curl() {
  which -s curl || fail "You need to install curl to continue"
}

function osx_install_homebrew() {
  osx_ensure_ruby
  osx_ensure_curl
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
}

function osx_ensure_homebrew() {
  which -s brew || osx_install_homebrew
  if [ "$osx_homebrew_checked" != "checked" ]; then
    brew update || fail "Error updating homebrew"
    brew doctor || fail "Please fix the homebrew issues"
  fi
  osx_homebrew_checked="checked"
}

function osx_install_git() {
  osx_ensure_homebrew
  brew install git
}

function osx_ensure_git() {
  which -s git || osx_install_git
}

function init_osx() {
  osx_ensure_git
}
# ----------------------------------------------------------------------------

case `uname` in
Darwin)
  init_osx
  ;;
*)
  exit "Platform `uname` not supported."
esac

_old_pwd=`pwd`
cd ~

if [ ! -d ~/.dotfiles ]; then
  git clone git@github.com:bjjb/dotfiles.vim ~/.dotfiles
else
  cd ~/.dotfiles
  git pull
fi

[ -x /usr/bin/bash ] && ln -nvsf .dotfiles/.bashrc
[ -x /usr/bin/bash ] && ln -nvsf .dotfiles/.bash_profile

cd $_old_pwd
