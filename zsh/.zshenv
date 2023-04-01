path+=('/opt/homebrew/bin')
path+=("$HOME/.emacs.d/bin")
path+=("/opt/homebrew/sbin")
path+=("/Applications/Postgres.app/Contents/Versions/latest/bin")
path+=("$HOME/.cargo/env")
rath+=("$HOME/.emacs.d/bin")
path+="$(go env GOPATH)/bin"
path+=("/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config")
path+=("$HOME/.local/scripts")
# gnu items
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-getopt/libexec/gnubin:$PATH"
export GUILE_TLS_CERTIFICATE_DIRECTORY=/opt/homebrew/etc/gnutls/

export PATH
. "$HOME/.cargo/env"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vaibhav/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vaibhav/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vaibhav/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vaibhav/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
export GPG_TTY=$(tty)
