#!/bin/bash

echo "Attempting to install and setup diff-so-fancy"
echo "This requires git, node and npm to be installed"
echo -n "Continue? (y/n) "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
  npm i -g diff-so-fancy
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
else
  echo Skipped installing diff-so-fancy.sh
fi

