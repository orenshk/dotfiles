# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

autoload -U zmv
alias mmv='noglob zmv -W'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="orenshk"

# setup z
export _Z_CMD=j
alias cdj='j'
. `brew --prefix`/Cellar/z/1.5/etc/profile.d/z.sh

# Example aliases
alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias slimv="sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"

# ls aliases
alias ls=' ls'          # for histignorespace option
alias ll='ls -lah'
alias l.='ls -d .*'
alias ldir='ls -d */'
alias links='ll | egrep -o -e " [.?a-zA-Z0-9]+ -> (/[.?a-zA-Z0-9_]+)*" --colour'

## Browsers
alias chrome='open -a Google\ Chrome'
alias safari='open -a Safari'
alias browser=chrome

# tmux aliases
alias th='tmux_home.sh'

# poll tmux buffers.
if [ `ps | grep -c "poll-tmux-buffers"` -eq 1 ]; then
    $HOME/Scripts/poll-tmux-buffers.sh&
fi

# todo.sh 
alias t=todo.sh
alias tf="mvim /usr/local/bin/todo.txt"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# my title: $PWD and vi mode, is set in orenshk.zsh-theme

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx battery zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#build path
MYPATH=$PATH

# path for cmpt166 scripts
MYPATH="/Users/orenshklarsky/Dropbox/SFU/Teaching/CMPT_166_Spring_2013/\
Website_Source/scripts:"$MYPATH

# path for other scripts
MYPATH=/Users/orenshklarsky/Scripts:$MYPATH

# path for ruby gems
MYPATH=/usr/local/opt/ruby/bin:$MYPATH

export PATH=$MYPATH

cdpath=($HOME/c166 $HOME/Dropbox/SFU/Thesis)

# load vmail in a macvim instance
#export VMAIL_VIM=mvim

#use vimode on command line
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode #switch to command mode using 'jk'

# grc
source "`brew --prefix`/etc/grc.bashrc"

# Friendly zsh manual searching
function zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}

# Maintain a dirstack of at most 9 across sessions
DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

function chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

# when not last this gets overwritten? should find out why.
alias ll='ls -lah'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm;
fi
