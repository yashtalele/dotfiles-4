# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Editor define
export VISUAL=nvim
export EDITOR="$VISUAL"

# Pager define
export PAGER='most'

# Disable files
export LESSHISTFILE='-'

# My dotfiles
export DOTFILES="$HOME/.dotfiles"

# Wallpapers
export wallpapers="~/pictures/Wallpapers"

# Polybar
export POLYBAR="$XDG_CONFIG_HOME/polybar"

# Zsh Env
ZDOTDIR="$XDG_CONFIG_HOME/shell"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Bin
PATH="${PATH:+${PATH}:}~/.local/bin"

# MISC
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

# Compiler
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"

xrdb ~/.Xresources

export LC_ALL=en_US.UTF-8
