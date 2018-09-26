#!/usr/bin/env bash

git config --global user.email "danilo.horta@gmail.com"
git config --global user.name "Danilo Horta"
config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
$config branch --set-upstream-to origin master

mkdir -p $HOME/.config/fish/functions
