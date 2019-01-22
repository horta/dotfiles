export PATH=$HOME/bin:/usr/local/sbin:$PATH

function config()
{
    /usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
export -f config

function vim()
{
    if ! _vim=$(which vim);
    then
        return 1
    fi

    if _nvim=$(which nvim);
    then
        $_nvim "$@"
    else
        $_vim "$@"
    fi
}
export -f vim

[ -f ~/bin/conda-bash-init.sh ] && source ~/bin/conda-bash-init.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.bashrc ] && source ~/.bashrc
