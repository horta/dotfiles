#!/usr/bin/env fish

cd

set config "/usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

git config --global user.email "danilo.horta@gmail.com"
git config --global user.name "Danilo Horta"

git clone --bare https://github.com/horta/dotfiles.git $HOME/.cfg
eval "$config config --local status.showUntrackedFiles no"
eval "$config checkout"
eval "$config fetch --all"

git config --global push.default current
git config --global credential.helper 'cache --timeout 3600000'

mkdir -p $HOME/.config/fish/functions
mkdir -p $HOME/code

git clone https://github.com/gpakosz/.tmux.git
# ln -s -f .tmux/.tmux.conf
# cp .tmux/.tmux.conf.local .

if test -e ~/anaconda/etc/fish/conf.d/conda.fish
    . ~/anaconda/etc/fish/conf.d/conda.fish
end

if type conda >/dev/null ^&1
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

unset config
