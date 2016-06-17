# Path to your oh-my-zsh installation.
export ZSH=/Users/deNsuh/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="re5et"
# previously pygmalion!
# looks good : mortalscumbag / fino-time / af-magic / crcandy

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

export PATH="/Users/deNsuh/mvn/apache-maven-3.3.9/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='mvim'

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
# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='mvim -v'

# the ubiquitos 'll' : directories first, with alphanumeric sorting:
alias f='open -a Finder ./' #open current directory in finder
alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

# temporary path aliases
alias kaist='cd ~/Documents/KAIST/'
alias denweb='cd /Users/deNsuh/Documents/denweb/deNsuh.github.io'
alias chuckex='cd /Library/ChucK/examples'
alias gchuck='cd ~/Documents/ChucK'
alias canon='cd ~/Documents/ChucK/canon'
alias cg='cd /Users/deNsuh/Documents/KAIST/16Spring/CG/projects/CS380'
alias os_local='cd /Users/deNsuh/Documents/KAIST/16Spring/OS/'
alias osans='cd /Users/deNsuh/Documents/KAIST/16Spring/OS/example/pintos/'
alias goog='cd /Users/deNsuh/Documents/KAIST/16Spring/CS492/repo/admin'
# amazon AWS ubuntu server
alias aws='ssh -i "redhat_key.pem" ec2-user@ec2-52-78-43-212.ap-northeast-2.compute.amazonaws.com'
# the password is my student ID
alias os='ssh 4a@vc201.kaist.ac.kr'
# the password is the name of the band
alias os_master='ssh 4s@vc201.kaist.ac.kr'
