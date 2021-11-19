ZSH_THEME="agnoster"

plugins=(
  git
  osx
)


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#fi

# Continuation of gpg setup
# GPG_TTY=$(tty)
# export GPG_TTY

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

eval "$(rbenv init -)"
if [ -e /Users/bfung/.nix-profile/etc/profile.d/nix.sh ]; then
    . /Users/bfung/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer

#ohmyzsh theme to hide user@hostname
prompt_context(){}
