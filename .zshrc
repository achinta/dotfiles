# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl vi-mode gcloud terraform poetry)

source $ZSH/oh-my-zsh.sh

# User configurationalia

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/achinta/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/achinta/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/achinta/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/achinta/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# grpc builds are failing. https://github.com/grpc/grpc/issues/25082
GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# ajay aliases
alias aimsup='cd ~/github;docker-compose -f infra/docker-compose.yml up -d; cd ~/github/aims;docker-compose -f odoo/docker-compose-local2.yaml up -d;docker-compose -f django/docker-compose-local.yaml up -d;cd -'
alias aimsdown='cd ~/github;docker-compose -f infra/docker-compose.yml down;cd ~/github/aims;docker-compose -f odoo/docker-compose-local2.yaml down;docker-compose -f django/docker-compose-local.yaml down;cd -'
alias vim=nvim

# spark
export SPARK_HOME=~/programs/spark-3.1.2-bin-hadoop3.2
export PATH=$SPARK_HOME/bin:$PATH
# to run spark in jupyter
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'

export AWS_PROFILE=aims_prod

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# needed for pymssql
export LDFLAGS="-L/opt/homebrew/opt/freetds/lib -L/opt/homebrew/opt/openssl@3/lib"
export CFLAGS="-I/opt/homebrew/opt/freetds/include"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

# load local secrets
source ~/secrets/secrets.sh
export JAVA_HOME=$(/usr/libexec/java_home)

# flutter
export PATH=$PATH:$HOME/programs/flutter/bin

#rbenv
eval "$(rbenv init - zsh)"
export GEM_HOME=$HOME/.gem
# export PATH=$GEM_HOME/bin:$PATH
export PATH=$GEM_HOME/ruby/3.2.0/bin:$PATH

# poetry
export PATH="/Users/achinta/.local/bin:$PATH"

# modular
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

# python msql client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/mysql-client/lib/pkgconfig"

# enable multi threading in python - https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# use buildkit
export DOCKER_BUILDKIT=1


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/achinta/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/achinta/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/achinta/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/achinta/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
