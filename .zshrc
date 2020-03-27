if [ "$(uname 2> /dev/null)" != "Linux" ]; then
    export PATH=$HOME/bin:/usr/local/bin:$PATH
# If you come from bash you might have to change your $PATH.
 # Path to your oh-my-zsh installation.
export TERM=xterm-256color
export ZSH=~/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/dotfiles/.p10k.zsh ]] && source ~/dotfiles/.p10k.zsh

alias vimzsh="vim ~/dotfiles/.zshrc"
alias sourcezsh="source ~/dotfiles/.zshrc"
alias vimrc="vim ~/dotfiles/.vimrc"
eval $(thefuck --alias)

bindkey -v
