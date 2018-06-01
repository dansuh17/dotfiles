# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

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
export UPDATE_ZSH_DAYS=20

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
plugins=(git colorize colored-man-pages zsh-syntax-highlighting)

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

# backup dotfiles:
# mkdir -p ~/.dotfiles.backup
# mv ~/.[^.]* ~/.dotfiles.backup/

# ls aliases
alias l='ls -alh'
alias la='ls -a'
alias ll='ls -al'

# tmux related aliases
alias tls='tmux ls'
alias ta='tmux attach -t'

### VIM - MVIM OR VIM V.8.0 OR ABOVE IS REQUIRED FOR VARIOUS PLUGINS AND COLORSCHEMES
# alias vi='mvim -v'
# alias vim='mvim -v'

# git aliases provided oh-my-zsh
# ga = git add
# gc = git commit -v
# gst = git status
# gc! = git commit --amend

# fasd
# alias v='f -e vim'  # quick open files with vim

## ENVIRONMENT VARIABLES ##
export PATH=$(getconf PATH)
# export PATH=/usr/local/sbin:$PATH

# LANGUAGE SETTINGS
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

### PATH DEFAULT
# export PATH=/usr/local/bin:/opt/local/bin:$PATH  # brew

# PYTHON
# pip --version : shows the path to site-packages
# per package : pip show numpy
# python-config --include : gives the include path of current python

# JAVA
# export JAVA_HOME="$(/usr/libexec/java_home)"
# export PATH=$JAVA_HOME/bin:$PATH

# GO
# export PATH=/usr/local/go/bin:$PATH
# export PATH=$(go env GOPATH)/bin:$PATH
# export GOPATH=$(go env GOPATH)

# HOME FOLDER'S BIN FOLDER
# export PATH=~/bin:$PATH

# CUDNN - CUDA FOR NEURAL NETWORK .DYLIB PATH
# export DYLD_LIBRARY_PATH=~/cuda:$DYLD_LIBRARY_PATH

# IMPORT LOCAL-SPECIFIC ALIASES
# source $HOME/.bash_aliases

### FASD -- MIGHT NEED INSTALL BEFORE USE
# eval "$(fasd --init auto)"
# fasd_cache="$HOME/.fasd-init-zsh"
# if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#   fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
# fi
# source "$fasd_cache"
# unset fasd_cache

### AUTOMATICALLY ACTIVATE PYHTON VENV SO COOL
function cd {
  builtin cd "$@"
  if [ -d "venv" ] ; then
    source venv/bin/activate
  fi
}
