# history
export HISTFILE=$XDG_CONFIG_HOME/zsh/history
export HISTSIZE=100000
export SAVEHIST=100000
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
setopt hist_ignore_dups
setopt append_history
setopt inc_append_history

# no cd
setopt auto_cd
export cdpath=(~/workspace ~)

# no beep
unsetopt beep

# keybinding
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[F" end-of-line

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# starship
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
