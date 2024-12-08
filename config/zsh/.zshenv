# XDG base Directory Specification
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# editor
export EDITOR=nvim

# rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo

# go
export GOPATH=$XDG_DATA_HOME/go

# zig
export ZVM_PATH=$XDG_DATA_HOME/zvm
export ZVM_INSTALL=$ZVM_PATH/self
export PATH=$ZVM_PATH/bin:$PATH
export PATH=$ZVM_INSTALL:$PATH

# gunpg
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# less
export LESSKEYIN=$XDG_CONFIG_HOME/less/lesskey

# path
export PATH=$HOME/.local/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$XDG_DATA_HOME/cargo/bin:$PATH
