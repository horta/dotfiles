# dotfiles

## bash

```bash
git clone --bare https://github.com/horta/dotfiles.git $HOME/.cfg; alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'; config config --local status.showUntrackedFiles no; $HOME/bootstrap.sh
```
