export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH":"$HOME/.pub-cache/bin"
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
functon ff() {
fzf --preview="bat --color=always {}" --query="$1"
} 

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export EDITOR="vi"
