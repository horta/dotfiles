# dotfiles

## bash

```bash
git clone --bare https://github.com/horta/dotfiles.git $HOME/.cfg;
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no;
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout;
eval $HOME/bootstrap.sh
```
