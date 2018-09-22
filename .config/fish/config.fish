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
# alias for docker
balias dc_i 'docker images'
balias dc_c 'docker container'

# general
balias ll 'ls -al'

. (pyenv init - | psub)
rvm default
