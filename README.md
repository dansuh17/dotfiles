# pre-install

**required**
- [zsh](http://www.zsh.org/) - usually installable from package managers (apt, brew, etc)
- [oh-my-zsh](http://ohmyz.sh/)
- [tmux](https://github.com/tmux/tmux/wiki) - install from package manager
- git
- python - to install YouCompleteMe

**optional**
- [the silver searcher (ag)](https://github.com/ggreer/the_silver_searcher) : not required, but you'll regret if you don't
- [fasd](https://github.com/clvv/fasd) : absolutely amazing command-line type-saver based on 'frecency'
- [fzf](https://github.com/junegunn/fzf) : best fuzzy finder

# backup previous dotfiles
```bash
mkdir -p ~/.dotfiles.backup
mv ~/.[^.]* ~/.dotfiles.backup/
```
The error message `mv: rename /Users/[user]/.dotfiles.backup to /Users/[user]/.dotfiles.backup/.dotfiles.backup: Invalid argument` is natural since it cannot place itself inside.

**careful** : This moves ALL dotfiles into the backup folder. Some other configuration files starting with '.' may not work and require restoration.

# get new dotfiles
```bash
git clone [address]
mv dotfiles/* dotfiles/.[^.]* ~
rmdir dotfiles
git submodule init
git submodule update
```
# post-install

chaning shell to zsh
```bash
chsh -s `which zsh`
```

install [vim-plug](https://github.com/junegunn/vim-plug) (vim plugin manager) - personally the best plugin manager so far
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

to install the plugins listed, run `:PlugInstall` in vi

# screenshot

![](https://d2mxuefqeaa7sj.cloudfront.net/s_0EBF1CB4F0F5C1BE3C551B035CA58F5F5CBDE79E3E01743A9DDCC758BC6245A4_1527854433701_image.png)

# auto-install

```bash
./install.sh
```

This will create a custom folder at `$HOME/.dansuh` and copy all conf files into that folder.
A initializer command will be appended to `.bashrc` to make the shell use custom configuration files from `$HOME/.dansuh`.
