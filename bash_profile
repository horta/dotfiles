export PATH=$HOME/bin:/usr/local/sbin:$HOME/.tmux/plugins/tpm/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

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

if ! command -v subl
then
    if [ -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]
    then
        export PATH=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH
    fi
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export EDITOR="nvr"
else
    export EDITOR=$(which nvim) || EDITOR=$(which vim) || EDITOR=$(which vi)
fi
export VISUAL=$EDITOR
alias v="$VISUAL"

[ -f ~/bin/conda-bash-init.sh ] && source ~/bin/conda-bash-init.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.bashrc ] && source ~/.bashrc

# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
