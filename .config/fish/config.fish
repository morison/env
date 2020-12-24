# alias for git
balias gc 'git checkout'
balias gct 'git commit'
balias gf 'git fetch'
balias gs 'git status'
balias gd 'git diff'
balias gpll 'git pull'
balias gpsh 'git push'
balias ga 'git add'
balias gl 'git log'
balias gg 'git graph'
# alias for docker
balias dc_i 'docker images'
balias dc_c 'docker container'

# general
balias ll 'ls -al'

# Load pyenv automatically
set -x PATH "/home/naruhito/.pyenv/bin" $PATH
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
