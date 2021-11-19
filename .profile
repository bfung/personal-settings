source /usr/local/etc/bash_completion.d/git-prompt.sh
#source /usr/local/etc/bash_completion.d/git-completion.zsh

#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
alias ll='ls -Gla'

#export GIT_PS1_SHOWDIRTYSTATE=1
#export PS1='\w$(__git_ps1 " [%s]")\$ '

#if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
#    . "$(brew --prefix)/etc/bash_completion"
#fi

export w=~/workspace
export JAVA_HOME="$(/usr/libexec/java_home)"

if which jenv > /dev/null; then
    eval "$(jenv init -)";
fi

# Add the following to your shell init to set up gpg-agent automatically for every shell
# 2018-04-06 - Comment out for now and use GPG Guite for macOS High Sierra
# if [ -f ~/.gnupg/gpg-agent-info ] && [ $(pgrep gpg-agent) ]; then
#     source ~/.gnupg/gpg-agent-info
#     export GPG_AGENT_INFO
#     export SSH_AUTH_SOCK
# else
#     gpg-agent --daemon --enable-ssh-support \
#               --write-env-file ~/.gnupg/gpg-agent-info
# fi

if which pyenv > /dev/null; then
	eval "$(pyenv init -)"
fi

alias grep='grep --color=auto --exclude-dir={.git,.stack-work}'

PATH=$PATH:/$HOME/.local/bin:usr/local/bin:/usr/local/sbin
PATH=$PATH:$HOME/.cargo/bin
export PATH

