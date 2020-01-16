### Added by Zplugin's installer
source '/Users/horta/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin ice wait'0' atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions

# Syntax Highlighting (should always be at the end)
zplugin ice wait"0" atinit"zpcompinit; zpcdreplay" lucid
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait"1" \
    atload"bindkey '^[[A' history-substring-search-up" \
    atload"bindkey '^[[B' history-substring-search-down" lucid
zplugin light zsh-users/zsh-history-substring-search

zplugin ice wait'!0' lucid reset-prompt
zplugin snippet $HOME/.zconda

# Load the pure theme, with zsh-async library that's bundled with it.
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

export HISTSIZE=100000
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Save every command before it is executed.
setopt inc_append_history

# Read the history file everytime history is called.
setopt share_history

command -v nvim > /dev/null 2>&1 && export EDITOR=nvim || export EDITOR=vim

[[ -v EDITOR ]] && alias vim="$EDITOR"
alias e="exit"
alias g="git"
alias s="git status"
command -v exa > /dev/null 2>&1 && alias ls="exa"

# emacs line editing mode
bindkey -e
