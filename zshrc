export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="afowler"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="false"

plugins=(
  git
  docker
  docker-compose
  flutter
  zsh-autosuggestions
  zsh-syntax-highlighting
  macos
  web-search
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

alias vi=nvim
alias functon ff() {
fzf --preview="bat --color=always {}" --query="$1"
} 

