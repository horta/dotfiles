#!/usr/bin/env fish

git config --global user.email "danilo.horta@gmail.com"
git config --global user.name "Danilo Horta"
set config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
eval $config fetch --all
git config --global push.default current
git config --global credential.helper 'cache --timeout 3600000'

mkdir -p $HOME/.config/fish/functions

if test -e ~/anaconda/etc/fish/conf.d/conda.fish
    source ~/anaconda/etc/fish/conf.d/conda.fish
end

if  type conda ^/dev/null >/dev/null
    conda activate base
end

if count $argv > /dev/null
    if [ "$argv[1]" = "--all" ]
        brew install exa neovim
    else
        echo "Wrong argument. Use --all or nothing."
        exit 1
    end
else
    exit 0
end
