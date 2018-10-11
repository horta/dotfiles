set PATH $HOME/.cargo/bin $PATH

set GOPATH $HOME/go
set PATH $PATH /usr/local/opt/go/libexec/bin
set PATH $PATH $GOPATH/bin

set PATH $PATH /usr/local/opt/llvm/bin

set GOOGLE_APPLICATION_CREDENTIALS /Users/horta/.google-api-pypi-downloads.json

if test -e /usr/local/anaconda3/etc/fish/conf.d/conda.fish
    source /usr/local/anaconda3/etc/fish/conf.d/conda.fish
    conda activate base
    conda activate default
end
