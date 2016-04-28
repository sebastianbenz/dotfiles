# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# this version of agnoster is downloaded from: https://gist.github.com/3712874
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

# set default user for agnoster theme
DEFAULT_USER="sebastian"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(history-substring-search command-not-found ) 

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

# ignore some files during completion
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~|*.class|*.aux|*.auxlock|*.log|*.nav|*.out|*.snm|*.toc)"
# ignore pdf files for vi
zstyle ':completion:*:vi:*:(all-|)files' ignored-patterns "(*.pdf|*.pyc|*~|*.class|*.aux|*.auxlock|*.log|*.nav|*.out|*.snm|*.toc)"
# but not for these programs
zstyle ':completion:*:ls:*:(all-|)files' ignored-patterns
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns

# Provide emacs like binding for searching
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# vi mode
bindkey kj vi-cmd-mode
bindkey -v

# tell remote hosts to use byobu, if available
export LC_TERMTYPE=byobu

# SVN should use vi for editing messages to
export SVN_EDITOR=vim

# my default editor is vi
export EDITOR=vim

# always use english language
export LANG=en_GB.UTF-8

# chrome caches to tmpfs
alias google-chrome='google-chrome --disk-cache-dir="/tmp/google-chrome/"'

# do not autocorrect the following commands
alias lg='nocorrect git lg'

# set TERM variable to support vim-powerline
export TERM="screen-256color"

# ignore duplicate history entries
export HISTCONTROL=erasedups
alias vi='/usr/local/bin/vim'

export KEYTIMEOUT=1
source ~/.zsh/opp.zsh/*.zsh
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home

# android
export ANDROID_HOME=/Users/sbenz/Library/Android/sdk/
export ANDROID_SDK=/Users/sbenz/Library/Android/sdk/

# maven
export MAVEN_OPTS=-Xmx1024M

#gradle
export GRADLE_HOME=/usr/local/Cellar/gradle/2.1/libexec
export GOPATH=~/Projects/go
PATH=$PATH:$GOPATH/bin


DEFAULT_USER=sbenz
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=~/projects/go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/bin:$PATH"

export PATH="$PATH:/Users/sbenz/Tools/infer-osx-v0.1.0/infer/infer/bin"  


alias log adb logcat
alias logc adb logcat -c && adb logcat

# added by travis gem
[ -f /Users/sbenz/.travis/travis.sh ] && source /Users/sbenz/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/sbenz/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/sbenz/google-cloud-sdk/completion.zsh.inc'
