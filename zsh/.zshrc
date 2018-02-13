# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,functions,path}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Start up gpg-agent, if needed
if ! [ -n "$(pgrep gpg-agent)" ]; then
    eval $(gpg-agent --daemon)
fi

# Init RBENV
#eval "$(rbenv init -)"

# Fix LS colors
unset LSCOLORS LS_COLORS

# Source kubectl completion
source <(kubectl completion zsh)

# Source direnv
eval "$(direnv hook zsh)"

# Source gcloud completion
source /Users/sohailahmed/Developer/google-cloud-sdk/completion.zsh.inc

# Maintain ssh config.
rm -f ~/.ssh/config && cat ~/.ssh/conf.d/* > ~/.ssh/config

# Save history on shell exit
unsetopt INC_APPEND_HISTORY
