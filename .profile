command -v nvim > /dev/null 2>&1 && export EDITOR=nvim || export EDITOR=vim

test -e $HOME/.bash_profile && . $HOME/.bash_profile
