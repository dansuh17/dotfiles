#!/bin/bash

DOTFILE_DIR=$HOME/.dansuh
if [ -d "$DOTFILE_DIR" ] ; then
  rm -rf "$DOTFILE_DIR"
fi
echo "Creating directory : $DOTFILE_DIR"
mkdir "$DOTFILE_DIR"

# copy everything to this directory
cp .gitconfig "$DOTFILE_DIR"/
cp .gitignore "$DOTFILE_DIR"/
cp .ideavimrc "$DOTFILE_DIR"/
cp .tmux.conf "$DOTFILE_DIR"/
cp -r .vim "$DOTFILE_DIR"/
cp .vimrc "$DOTFILE_DIR"/
cp .ycm_extra_conf.py "$DOTFILE_DIR"/
cp .zshrc "$DOTFILE_DIR"/

# move to dotfile directory
cd "$DOTFILE_DIR"

ZSH_BUILD=$DOTFILE_DIR/zsh_build
# create build directory
if ! [ -d "$ZSH_BUILD" ] ; then
  mkdir "$ZSH_BUILD"
fi

# download and install zsh
wget -c http://www.zsh.org/pub/zsh-5.5.1.tar.gz
tar -xzvf zsh-5.5.1.tar.gz
pushd zsh-5.5.1
./configure --prefix="$ZSH_BUILD" --exec-prefix="$ZSH_BUILD" --enable-cap --enable-pcre
make -j5
make check
make install
popd
echo "zsh installed"

# install oh-my-zsh and follow the steps
git clone https://github.com/robbyrussell/oh-my-zsh.git "$DOTFILE_DIR"/oh-my-zsh
echo "oh-my-zsh installed"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$DOTFILE_DIR/oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
echo "zsh syntax highlighting enabled"

# install vim-plug
DOT_VIM_DIR=$DOTFILE_DIR/.vim
VIM_CONF=$DOTFILE_DIR/.vimrc
curl -fLo "$DOT_VIM_DIR"/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "vim-plug installed"

# install plugins
vim -u "$VIM_CONF" +PlugInstall +qall
echo "vim plugins installed"

# install fasd
wget -O fasd-1.0.1.tar.gz -c https://github.com/clvv/fasd/tarball/1.0.1
mkdir fasd
tar -xvf fasd-1.0.1.tar.gz -C fasd --strip-components=1
pushd fasd
PREFIX=./ make install
popd
echo "fasd installed"

# install liquidprompt
git clone https://github.com/nojhan/liquidprompt.git $DOTFILE_DIR/liquidprompt

type tmux
if [ $? -ne 0 ] ; then
  echo "tmux doesn't exist - installation preferred"
else
  echo "tmux exists: installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

type ag
if [ $? -ne 0 ] ; then
  echo "ag doesn't exist - installation preferred"
fi

type fzf
if [ $? -ne 0 ] ; then
  echo "fzf doesn't exist - installation preferred"
fi

ZSHRC_PATH=$DOTFILE_DIR/.zshrc

prepend_zshrc() {
  printf '%s\n%s\n' "$1" "$(cat "$ZSHRC_PATH")" > "$ZSHRC_PATH"
}

# inherit path variables
prepend_zshrc "[[ $- = *i* ]] && source $DOTFILE_DIR/liquidprompt/liquidprompt"
prepend_zshrc "export PATH=\$ZSH_BIN:\$FASD_BIN:\$PATH"
prepend_zshrc "export GIT_EDITOR=vim"
prepend_zshrc "export FASD_BIN=$DOTFILE_DIR/fasd/bin"
prepend_zshrc "export ZSH_BIN=$ZSH_BUILD/bin"
prepend_zshrc "export GIT_CONFIG=$DOTFILE_DIR/.gitconfig"
prepend_zshrc "export DOTFILE_ROOT=$DOTFILE_DIR"
prepend_zshrc "export ZSH=$DOTFILE_DIR/oh-my-zsh"
prepend_zshrc "# Generated Environment Variables and PATHs - inherits existing PATH."

# add init function
INIT_FUNCTION="ds_init() { ZDOTDIR=$DOTFILE_DIR $ZSH_BUILD/bin/zsh ; }"
echo "$INIT_FUNCTION" >> ~/.bashrc
echo "Type 'ds_init' to initialize with dansuh's custom settings!"
source ~/.bashrc
