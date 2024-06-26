# export PATH="/usr/local/opt/openssl/bin:/usr/local/opt/php@7.4/bin:/usr/local/opt/php@7.4/sbin:$PATH"

## Load PHP 7.4
# export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
# Load PHP 8.2
export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.2/sbin:$PATH"

# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Python binaries
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Load Python 3.9
export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:$PATH"

# Load Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Kubectl Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Go
export GOPATH="${HOME}/go"

# # Load Node global installed binaries
# export PATH="$HOME/.node/bin:$PATH"

# # Use project specific binaries before global ones
# export PATH="node_modules/.bin:vendor/bin:$PATH"

# # Make sure coreutils are loaded before system commands
# # I've disabled this for now because I only use "ls" which is
# # referenced in my aliases.zsh file directly.
# #export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
