# PostgreSQL
#export PGVERSION=$(postgres --version | awk '{print $3}')

# less custom configuration
export LESS="--clear-screen --ignore-case --status-column --long-prompt --quiet"

# Add color to man pages - requires `brew install most`
export PAGER="most"

# Add Pentaho to PATH
export PATH=$PATH:/Applications/data-integration
# Add MySQL to PATH
export PATH="$PATH:/usr/local/opt/mysql@5.7/bin"
# Add python@3.8 (installed by brew) to PATH
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Powerline Config
pyver=$(python3 --version | awk -F'.' '{print $2}')
export PATH="$PATH:$HOME/Library/Python/3.${pyver}/bin"
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source $HOME/Library/Python/3.${pyver}/lib/python/site-packages/powerline/bindings/bash/powerline.sh

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
