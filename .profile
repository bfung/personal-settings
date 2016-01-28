export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
alias ll='ls -Glta'

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export w=~/workspace
export JAVA_HOME=$(/usr/libexec/java_home)

if which jenv > /dev/null; then
    eval "$(jenv init -)";
fi

PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH
