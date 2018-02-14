# requirements

- [zsh](http://www.zsh.org/) - usually installable from package managers (apt, brew, etc)
- [oh-my-zsh](http://ohmyz.sh/)
- [tmux](https://github.com/tmux/tmux/wiki) - install from package manager

# backup previous dotfiles
```bash
mkdir -p ~/.dotfiles.backup
mv ~/.[^.]* ~/.dotfiles.backup/
```

# get new dotfiles
```bash
git clone [address]
mv dotfiles/* dotfiles/.[^.]* ~
rmdir dotfiles
git submodule init
git submodule update
```
# postinstall

chaning shell to zsh
```bash
chsh -s `which zsh`
```

install vundle (vim plugin manager)
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

to install the plugins listed, run `:PluginInstall` in vi
