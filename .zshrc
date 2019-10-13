### Added by Zplugin's installer
source '/Users/horta/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

# Load the pure theme, with zsh-async library that's bundled with it.
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

export PATH=/Users/horta/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Users/horta/.gem/ruby/2.6.0/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

command -v nvim > /dev/null 2>&1 && export EDITOR=nvim || export EDITOR=vim

[[ -v EDITOR ]] && alias vim="$EDITOR"
alias e="exit"
command -v exa > /dev/null 2>&1 && alias ls="exa"

# emacs line editing mode
bindkey -e

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/horta/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/horta/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/horta/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/horta/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

