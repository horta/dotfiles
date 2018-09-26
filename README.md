# dotfiles

## bash

```bash
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'; git clone --bare https://github.com/horta/dotfiles.git $HOME/.cfg; config config --local status.showUntrackedFiles no; eval $HOME/bootstrap.sh
```
