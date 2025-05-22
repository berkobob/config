export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH":"$HOME/.pub-cache/bin:/Users/antoine/Library/Flutter/bin"
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

alias lew="python3 ~/dev/lew-llm-cli/app/command.py"
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

LFCD="/Users/antoine/.config/ls/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

bindkey -v

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
export MANPAGER='nvim +Man!'
# autoload -Uz tetris

