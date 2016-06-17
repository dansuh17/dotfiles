#---------------------------------------------------------------------
# Daniel Suh
#---------------------------------------------------------------------
export CLICOLOR=1

#---------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------
alias vim='mvim -v'

# the ubiquitos 'll' : directories first, with alphanumeric sorting:
alias ll='ls -ll'
alias la='ls -a'            # show hidden files
alias lal='ls -al'          # show hidden files with detail
alias f='open -a Finder ./' #open current directory in finder
alias ctags="usr/local/Cellar/ctags/5.8_1/bin/ctags"

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
alias aws='ssh -i "kehops.pem" ubuntu@ec2-52-79-116-244.ap-northeast-2.compute.amazonaws.com'
# the password is my student ID
alias os='ssh 4a@vc201.kaist.ac.kr'
# the password is the name of the band
alias os_master='ssh 4s@vc201.kaist.ac.kr'



#---------------------------------------------------------------------
# Environment Variables 
#---------------------------------------------------------------------
# searches for : current directory, upper directory, and indicated dirs
# this detects include files as if indicated by -I
CPATH=".:..:/usr/local/include:/Library/Frameworks"
export CPATH

# searches for indicated dirs for library files, as if indicated by -F
LIBRARY_PATH="/usr/local/lib:/System/Library/Frameworks/OpenGL.framework/Libraries"
export LIBRARY_PATH

# JDK path
export JAVA_HOME=$(/usr/libexec/java_home)

# add Maven (mvn) to $PATH
export PATH=/Users/deNsuh/mvn/apache-maven-3.3.9/bin:$PATH

#
# BASH customization
#
# customizing prompt line
force_color_prompt=yes
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

export PS1='\[$GREEN\]\h:\w $ \[$RESET\]\n'
export PS2='\[$GREEN\]> \[$RESET\]'
