# Dansuh Dotfiles

## Dependencies

- zsh
- vim
- tmux
- cmake (YCM)
- python-dev (YCM)
- oh-my-zsh

## Installations

```
# backup previous dotfiles
mkdir -p ~/.dotfiles.backup
mv ~/.[^.]* ~/.dotfiles.backup/

# move new dotfiles
git clone <dotfile repo>
mv kaehops_settings/.[^.]* ~
rmdir kaehops_settings

# then install vundle as guided in .vimrc
```
