set -l PATH_BAK $PATH[-1..1]
for p in $PATH_BAK
   if string match -q -r "/usr/local/anaconda.*" $p
       if set -l index (contains -i $p $PATH)
           set -e PATH[$index]
       end
       set PATH $p $PATH
   end
end

if status is-interactive
and set -q TMUX
and not set -q CONDA_EXE
    source /usr/local/anaconda3/etc/fish/conf.d/conda.fish
    conda activate
end
