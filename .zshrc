bindkey -v # vim mode
bindkey -s ^f "tmux-sessionizer\n" # tmux sesssions
export VISUAL=nvim  # neovim :)
export EDITOR="$VISUAL"
export TERM="xterm-256color" # colors
export PAGER=bat # use bat as the default man pager
export GPT4_CLI_MAX_TOKENS=400
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# functions
up () {
  local d=""
  local limit="$1" # the amount of times

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# for dotfiles
dtf () {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

# Aliases
alias git="/opt/homebrew/bin/git" # git works
alias grep="ggrep --color=auto" # get color for grep

alias gotoicloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/' # go to the icloud directory
 # all gnu items
alias sed="gsed"
alias find="gfind"

# nvim
alias vi="nvim"

# ps
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Exports
export icloud_path="~/Library/Mobile\\ Documents/com~apple~CloudDocs" # so i can navigate the icloud
# sources and paths
eval "$(pyenv init --path)" # pyenv
eval "$(pyenv init -)" # pyenv
eval "$(pyenv virtualenv-init -)"
fpath+=("$(brew --prefix)/share/zsh/site-functions") # zsh functions
# zsh suggestions
autoload -U promptinit; promptinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# opam configuration
[[ ! -r /Users/vaibhav/.opam/opam-init/init.zsh ]] || source /Users/vaibhav/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
