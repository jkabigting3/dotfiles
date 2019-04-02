export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "

DEFAULT_USER=$(whoami)
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github colorize colored-man-pages zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

setopt EXTENDED_GLOB

## never ever beep ever
setopt NO_BEEP

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Adding RPROMPT right segment to display SHLVL.
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs shlvl history time)
# Command number (in local history)
prompt_shlvl() {
  "$1_prompt_segment" "$0" "$2" "186" "$DEFAULT_COLOR" "$SHLVL"
}

#Uses vim for less
VLESS=$(find /usr/share/vim -name 'less.sh')
if [ ! -z $VLESS ]; then
  alias less=$VLESS
fi

fpath=(/usr/local/share/zsh-completions $fpath)
rm -f ~/.zcompdump; compinit -u

# Load my aliases/functions:
. ~/.aliases
. ~/.functions

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

PATH=$HOME/npm/bin:$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin:$HOME/bin:$HOME/.local/bin:/usr/bin/firefox
export PATH

CATALINA_HOME=$HOME/apache-tomcat-7.0.79
export CATALINA_HOME

source $HOME/env_vars/mocu_env_vars.sh

export CSCAPE=$MOCUHOME/ui/ui_cscape

