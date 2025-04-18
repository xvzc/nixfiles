#!/bin/zsh

# ┌─────────────┐ 
# │ ZSH_OPTIONS │ 
# └─────────────┘ 
setopt no_global_rcs

# ┌───────────┐ 
# │ DETECT_OS │ 
# └───────────┘ 
export CUR_OS=$(uname)

if [ "$CUR_OS" = "Darwin" ]; then
  function _is_darwin() { return 0 }
else
  function _is_darwin() { return 1 }
fi

if [ "$CUR_OS" = "Linux" ]; then
  function _is_linux() { return 0 }
else
  function _is_linux() { return 1 }
fi

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts/git:$PATH"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/.spoofdpi/bin"

_is_darwin && export PATH="/opt/homebrew/bin:$PATH"
_is_darwin && export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

