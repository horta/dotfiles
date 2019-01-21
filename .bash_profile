. /usr/local/anaconda3/etc/profile.d/conda.sh
launchctl setenv PATH $PATH

function config()
{
    /usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

function vim()
{
    _vim=$(which vim)
    if ! $?;
    then
        return 1
    fi
    _nvim=$(which nvim)
    if $?;
    then
        _nvim $@
    else
        _vim $@
    fi
}
