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

# eza
if command -v eza &> /dev/null; then
    alias ls='eza --classify --icons'
    alias l='eza --all --classify --icons'
    alias ll='eza --all --long --classify --icons'
    alias lt='eza --all --tree --classify --icons'
fi

# bat
if command -v bat &> /dev/null; then
    alias cat='bat'
fi

# lazygit
if command -v lazygit &> /dev/null; then
	alias lg='lazygit'
fi

# fastfetch
if command -v fastfetch &> /dev/null; then
    alias ff='fastfetch'
fi

# clear
alias cls='clear'
alias c='clear'
