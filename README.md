# requirements

- [zsh](http://www.zsh.org/) - usually installable from package managers (apt, brew, etc)
- [oh-my-zsh](http://ohmyz.sh/)
- [tmux](https://github.com/tmux/tmux/wiki) - install from package manager
- git
- [the silver searcher (ag)](https://github.com/ggreer/the_silver_searcher) not required, but you'll regret if you don't

# backup previous dotfiles
```bash
mkdir -p ~/.dotfiles.backup
mv ~/.[^.]* ~/.dotfiles.backup/
```
The error message `mv: rename /Users/[user]/.dotfiles.backup to /Users/[user]/.dotfiles.backup/.dotfiles.backup: Invalid argument` is natural since it cannot place itself inside.

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

# screenshot

![](https://d2mxuefqeaa7sj.cloudfront.net/s_0EBF1CB4F0F5C1BE3C551B035CA58F5F5CBDE79E3E01743A9DDCC758BC6245A4_1527854433701_image.png)
