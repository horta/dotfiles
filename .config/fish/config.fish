for p in $HOME/.cargo/bin /usr/local/opt/go/libexec/bin $GOPATH/bin /usr/local/opt/llvm/bin $HOME/bin
    contains $p $PATH
    or set PATH $p $PATH
end

set -q GOPATH
or set -g -x GOPATH $HOME/go

set -q GOOGLE_APPLICATION_CREDENTIALS
or set -g -x GOOGLE_APPLICATION_CREDENTIALS /Users/horta/.google-api-pypi-downloads.json

# Anaconda
set conda_path /usr/local/anaconda3/etc/fish/conf.d/conda.fish

if status --is-interactive
    if test -e $conda_path
        source $conda_path
        conda activate default
    end
end

set -e conda_path

