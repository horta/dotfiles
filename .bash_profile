. /usr/local/anaconda3/etc/profile.d/conda.sh
launchctl setenv PATH $PATH

function config()
{
    /usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

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
