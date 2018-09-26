#!/usr/bin/env bash

git config --global user.email "danilo.horta@gmail.com"
git config --global user.name "Danilo Horta"
config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
$config fetch --all
git config --global push.default current
git config --global credential.helper 'cache --timeout 3600000'

mkdir -p $HOME/.config/fish/functions
source ~/anaconda/etc/fish/conf.d/conda.fish
conda activate base

if [ $# -eq 0 ]
then
    exit 0
fi

if [[ $1 == --all ]]
then
    brew install exa neovim
else
    echo "Wrong argument. Use --all or nothing."
    exit 1
fi
