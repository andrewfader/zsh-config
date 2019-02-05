# Path to your oh-my-zsh configuration.
PATH="/usr/local/Cellar/ctags/5.8/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/bin:$PATH"
export EDITOR="gvim"
export GIT_EDITOR="vim"
ZSH=$HOME/.oh-my-zsh
# alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"
POWERLINE_DETECT_SSH="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cw='cower --rsort=votes -s "$*" | head -n 5'
alias startvnc="x11vnc -display :0 -auth /var/lib/gdm/:0.Xauth -rfbauth ~/.vnc/passwd -forever -ncache 10 -ncache_cr"
alias gitspec='bundle exec rspec `echo $(git st | grep _spec.rb | grep -v deleted | cut -f 2 -d "#" | cut -f 2 -d ":" | uniq)`'
alias mvim='gvim'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux git screen bundler postgres rails ruby gem zsh-syntax-highlighting history-substring-search rvm)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
function _update_ruby_version()
{
  typeset -g ruby_version=''
  ruby_version="$(ruby -v | cut -c 1-10)"
  POWERLINE_RIGHT_A=${ruby_version}
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
}

_update_ruby_version
chpwd_functions=(${chpwd_functions[@]} "_update_ruby_version")
source $ZSH/oh-my-zsh.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
for keycode in '[' 'O'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
export TERM="xterm-256color"

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# PATH=$PATH:/home/andrew/.gem/ruby/2.2.0/bin

PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
autoload -U compinit
compinit
