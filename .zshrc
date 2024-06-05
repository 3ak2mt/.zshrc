# ******************************************************************************
# Script Name: .zshrc
# Description: The configuration file for the ZSH.
# Author: makamat
# Date: 2024-04-28
# Version: 1.0
# ******************************************************************************

# ------------------------------------------------------------------------------
# General
# ------------------------------------------------------------------------------

export PATH="$HOME/bin:$PATH"
export EDITOR='vim'
export DIRSTACKSIZE=15
export BROWSER='firefox-developer-edition'
export WWW_HOME='duckduckgo.com'

setopt correct
setopt autocd
autoload -Uz zmv

# ------------------------------------------------------------------------------
# Specific
# ------------------------------------------------------------------------------

# oh-my-zsh
# ==============================================================================
if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    plugins=(git vi-mode zsh-autosuggestions z)
    zstyle ':omz:update' mode reminder
    zstyle ':omz:update' frequency 7
    ZSH_THEME='robbyrussell'
    DISABLE_UNTRACKED_FILES_DIRTY='true'
    . "$ZSH/oh-my-zsh.sh"
fi

# perl
# ==============================================================================
if which perl 2>&1 > /dev/null; then
    export PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"
    export PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
    export PERL_LOCAL_LIB_ROOT="${HOME}/\
      perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
    export PERL_MB_OPT="--install_base ${HOME}/perl5"
    export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
fi

# tex
# ==============================================================================
if [ -d "/usr/local/texlive/2023/" ]; then
    export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
    export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:/usr/local/\
            man:$MANPATH"
    export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
fi

# ------------------------------------------------------------------------------
# Sources
# ------------------------------------------------------------------------------

[ -f "$HOME/.shell_aliases" ] && . "$HOME/.shell_aliases"
[ -f "$HOME/.shell_funcs" ] && . "$HOME/.shell_funcs"
