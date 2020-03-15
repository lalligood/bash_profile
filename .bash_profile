# Powerline Config
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
pyver=$(python3 --version | awk -F'.' '{print $2}')
source /usr/local/lib/python3.${pyver}/site-packages/powerline/bindings/bash/powerline.sh

# PostgreSQL
#export PGVERSION=$(postgres --version | awk '{print $3}')

# less custom configuration
export LESS="--clear-screen --ignore-case --status-column --long-prompt --quiet"

# Add color to man pages - requires `brew install most`
export PAGER="most"

# Add MySQL to PATH
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
# Add Pentaho to PATH
export PATH=$PATH:/Applications/data-integration  # <== DOUBLE-CHECK THIS PATH!

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
