# make and cd
function mcd() {
    mkdir -p $1
    cd $1
}

# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# alias
if command -v eza &> /dev/null; then
  alias ls='eza --classify --icons'
  alias l='eza --all --classify --icons'
  alias ll='eza --all --long --classify --icons'
  alias lt='eza --all --tree --classify --icons'
fi

