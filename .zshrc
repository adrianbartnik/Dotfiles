# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="robbyrussell" Defaultheme
ZSH_THEME="minimal"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(gradle gitfast python tmux web-search mvn docker)


# User configuration
source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
export EDITOR='vim'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export ANDROID_HOME='/opt/android-sdk/'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/adrian/bin"
export PATH=$PATH:/home/adrian/.local/bin
export PATH=$PATH:/opt/android-sdk/platform-tools
export PATH=$PATH:/opt/android-sdk/tools
export PATH=$PATH:/opt/anaconda3/bin

setopt extended_glob # Enables feature for more powerful regular expressions, such as match everything except something

export FZF_DEFAULT_OPTS="--extended"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# DIMA Peel
# for all bundles
export BUNDLE_BIN=~/Masterarbeit/Benchmarks/peel/bundles/bin                          # bundle binaries parent
export BUNDLE_SRC=~/Masterarbeit/Benchmarks/peel/bundles/src                          # bundle sources parent
# for the current bundle
export BUNDLE_GID=com.acme                               # bundle groupId
export BUNDLE_AID=peel-wordcount                         # bundle artifactId
export BUNDLE_PKG=com.acme.benchmarks.wordcount          # bundle root package
