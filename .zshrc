# Path to your oh-my-zsh installation.
export ZSH=/Users/deNsuh/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="re5et"
ZSH_THEME="mh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize colored-man-pages)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias f='open -a Finder ./' # open current directory in finder
alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

# ls aliases
alias la='ls -a'
alias ll='ls -al'

# BREW
# brew --prefix

# tmux related aliases
alias tls='tmux ls'
alias ta='tmux attach -t'

# amazon web
alias aws='sudo ssh -i "redhat_key.pem" ec2-user@ec2-52-78-182-182.ap-northeast-2.compute.amazonaws.com'
alias ohws='sudo ssh -i "homepg.pem" ec2-user@ec2-52-78-186-215.ap-northeast-2.compute.amazonaws.com'

# nota server
alias adam='ssh kehops@143.248.136.11'
alias eve='ssh kehops@143.248.136.12'

# cpplint
alias cpplint='~/styleguide/cpplint/cpplint.py'

## ENVIRONMENT VARIABLES ##
export PATH=$(getconf PATH)
# LANGUAGE SETTINGS
export LANG=en_US.utf8
export LC_ALL="en_US.UTF-8"
export LC_LANG=ko_KR.UTF8
export LC_MESSAGES=ko_KR.UTF8
export NLS_LANG=AMERICAN_CIS.UTF8

# PATH
export PATH=/usr/local/bin:/opt/local/bin:$PATH  # brew

# for oracle database fucking client
export PATH=$PATH:~/db/instantclient_12_1
export DYLD_LIBRARY_PATH=~/db/instantclient_12_1
export TNS_ADMIN=~/db/instantclient_12_1/network/admin
export ORACLE_SID=orcl

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_73.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# cuDNN - Cuda for Neural Network .dylib path
export DYLD_LIBRARY_PATH=~/cuda:$DYLD_LIBRARY_PATH

# php Path
export PATH=/usr/local/php5/bin:$PATH

# mysql
export PATH=/usr/local/mysql/bin:$PATH

# pip3 install location - /usr/local/lib/python3.5/site-packages
export PATH=/usr/local/sbin:$PATH

# yarn
export PATH=`yarn global bin`:$PATH

# PYTHON
# which -a python : see all installed python interpreters
# which -a pypy3 : can see installed pypy
# pip --version : shows the path to site-packages
# python --version : python version
# python -c 'import numpy.core; print(numpy.core.__file__)' : shows the path to numpy installation - seems to be different from pip-installed numpy
# or you can use: pip show numpy
# python-config --include : gives the include path of current python

# ANACONDA
# uncomment each lines to use brew python instead of anaconda python
export PATH=/Users/deNsuh/anaconda2/bin:$PATH
export PATH=/Users/deNsuh/anaconda3/bin:$PATH  # primary location
# site-packages primary location - anaconda3 packages
export PATH=/Users/deNsuh/anaconda3/lib/python3.5/site-packages:$PATH

# pyvenv
# enable shims and autocompletion
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# pyenv-virtualenv
# enable autoactivation
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

