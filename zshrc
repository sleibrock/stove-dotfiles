# steven's zshrc file
# contains aliases, memes, jokes, poorly-made hacks

export ZSH=/home/steve/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Add plugins here
plugins=(
  git
)

# Source the local ZSH programs
source $ZSH/oh-my-zsh.sh


# add any directories with binaries for development purposes
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin
export PATH=$PATH:$HOME/.cargo/bin
export GOPATH=$HOME/go

# end
