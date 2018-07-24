# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh
export ZSH=$HOME/.dansuh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

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
DISABLE_AUTO_TITLE="true"

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
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

## ENVIRONMENT VARIABLES ##
export DOTFILES=$HOME/.dansuh
export ZSH_BIN=$DOTFILES/zsh_build/bin
export FASD_BIN=$DOTFILES/fasd/bin

# Initial PATH setting
export PATH=$(getconf PATH)
export PATH=.:$PATH  # add current directory to PATH
export PATH=$ZSH_BIN:$FASD_BIN:$PATH

# ls aliases
alias l='ls -alh'
alias la='ls -a'
alias ll='ls -al'

# tmux related aliases
# use tmux server with separate socket using separate conf
alias tmux='tmux -L dansuh -f $DOTFILES/.tmux.conf'
alias tls='tmux ls'
alias ta='tmux attach -t'

# vim
export VIMINIT="source $DOTFILES/.vimrc"
alias vim='vim -u $DOTFILES/.vimrc'
alias vi='vim'
# alias vim='mvim -v'  # use only after installing macvim

# IMPORT LOCAL-SPECIFIC ALIASES
if [ -f ~/.bash_aliases ] ; then
  source $HOME/.bash_aliases
fi

# LANGUAGE SETTINGS
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

### BREW
# export PATH=/usr/local/bin:/opt/local/bin:$PATH  # OSX brew

### FASD -- NEED TO INSTALL BEFORE USE
eval "$(fasd --init auto)"
fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
alias v='f -e vim'  # quick open files with vim

### AUTOMATICALLY ACTIVATE PYHTON VENV SO COOL
function cd {
  builtin cd "$@"
  if [ -d "venv" ] ; then
    source venv/bin/activate
  fi
}

# Greet message
echo "Work Harder Bitch"
