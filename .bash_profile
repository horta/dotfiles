. /usr/local/anaconda3/etc/profile.d/conda.sh
launchctl setenv PATH $PATH

function config()
{
    /usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
