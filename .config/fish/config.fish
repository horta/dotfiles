not set -q SHELL;and set -gx SHELL (which fish)

not set -q XDG_CONFIG_HOME;set -gx XDG_CONFIG_HOME $HOME/.config

. $HOME/bin/conda-fish-init.fish

# Move conda path to the front, if present.
set -l PATH_BAK $PATH[-1..1]
for p in $PATH_BAK
   if string match -q -r "naconda.*" $p
       if set -l index (contains -i $p $PATH)
           set -e PATH[$index]
       end
       set PATH $p $PATH
   end
end

# set -x VISUAL $EDITOR
# if set -q NVIM_LISTEN_ADDRESS
#    set -x EDITOR "nvr -cc split"
#    set -x VISUAL $EDITOR
# end
# alias v "$VISUAL"
# alias vim "$VISUAL"
alias v "nvim"
alias vim "nvim"


if status is-interactive
and set -q TMUX
and not set -q CONDA_EXE
    source /anaconda3/etc/fish/conf.d/conda.fish
    conda activate
end

if status is-interactive
and set -q CLUSTER_NAME
and [ $CLUSTER_NAME = "YODA" ]
    set -gx CONDA_ENVS_PATH /nfs/software/stegle/users/horta/conda-envs
    #source /usr/local/anaconda3/etc/fish/conf.d/conda.fish
    source /nfs/software/stegle/system/Anaconda3-2018.12-Linux-x86_64/etc/fish/conf.d/conda.fish
    conda activate
end
