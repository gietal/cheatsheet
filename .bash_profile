# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias xcodep='xcode-select -p'
alias isnotarized='spctl -a -vvv'
alias linfo='lipo -info'
