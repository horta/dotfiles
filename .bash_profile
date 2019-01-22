export PATH=$HOME/bin:$PATH
. /usr/local/anaconda3/etc/profile.d/conda.sh

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

launchctl setenv PATH $PATH
