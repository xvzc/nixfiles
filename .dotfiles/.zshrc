#!/bin/zsh
# vim:filetype=zsh:tw=80:et

ENABLE_ZPROF=false

$ENABLE_ZPROF && zmodload zsh/zprof

ZINIT="${HOME}/.local/share/zinit/zinit.git"
[ ! -d $ZINIT ] && mkdir -p "$(dirname $ZINIT)"
[ ! -d $ZINIT/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT"
source "${ZINIT}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

DOT_ZSH=$HOME/.zsh

source "$DOT_ZSH/plugins.zsh"
source "$DOT_ZSH/opt.zsh"
source "$DOT_ZSH/alias.zsh"
source "$DOT_ZSH/style.zsh"

for file in $HOME/.zsh/util/*
do
  source "$file"
done

[ -f $HOME/.lazy-profile ] && zsh-defer source "$HOME/.lazy-profile"
[ -f $HOME/.secrets ] && zsh-defer source "$HOME/.secrets"

fpath+="$DOT_ZSH/_completion"
autoload -Uz compinit && compinit -u

$ENABLE_ZPROF && zprof

