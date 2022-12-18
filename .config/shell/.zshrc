#!/usr/bin/env zsh


# If not running interactively, don't do anything
# # -----------------------------------------------
[[ $- != *i* ]] && return


# +-------------+
# |    Theme    |
# +-------------+


# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"

# ohmyzsh theme
ZSH_THEME="jnrowe"

plugins=(git)

source $ZSH/oh-my-zsh.sh


# +------------+
# | Vi Keybind |
# +------------+


bindkey -v
export KEYTIMEOUT=1
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd  ]] ||
     [[ $1 = 'block'  ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main  ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} == '' ]] ||
       [[ $1 = 'beam'  ]]; then
    echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[ q"
}

zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[3 q' ;}


# +--------------+
# | Help command |
# +--------------+


autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help


# +--------+
# | COLORS |
# +--------+

# Override colors
eval "$(dircolors -b $ZDOTDIR/dircolors)"


# +---------+
# | ALIASES |
# +---------+

source $ZDOTDIR/aliases


# +----------+
# | FUNCTION |
# +----------+

source $ZDOTDIR/func


# +----------+
# | Bin Dir  |
# +----------+

[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

# +---------------------+
# | Plugins             |
# +---------------------+

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

xrdb ~/.Xresources

cls; neofetch
