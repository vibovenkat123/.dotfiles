# path
if [ -d "/opt/homebrew/bin" ]; then
    path+=("/opt/homebrew/bin")
fi

if [ -d "/opt/homebrew/sbin" ]; then
    path+=("/opt/homebrew/sbin")
fi

if [ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ]; then
    path+=("/Applications/Postgres.app/Contents/Versions/latest/bin")
fi

if [ -d "/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config" ]; then
    path+=("/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config")
fi

if [ -d "$HOME/.cargo/env" ]; then
    path+=("$HOME/.cargo/env")
fi

if [ -d "$(go env GOPATH)/bin" ]; then
    path+=("$(go env GOPATH)/bin")
fi

if [ -d "$HOME/.local/scripts" ]; then
    path+=("$HOME/.local/scripts")
fi

# gnu items
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-getopt/libexec/gnubin:$PATH"

export GUILE_TLS_CERTIFICATE_DIRECTORY=/opt/homebrew/etc/gnutls

export PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # gnu man

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vaibhav/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vaibhav/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vaibhav/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vaibhav/gcloud/google-cloud-sdk/completion.zsh.inc'; fi

export GPG_TTY=$(tty) # so gpg works

[ -f "/Users/vaibhav/.ghcup/env" ] && source "/Users/vaibhav/.ghcup/env" # ghcup-env
