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
balias dc_s 'docker service'

# general
balias ll 'ls -al'

. (pyenv init - | psub)
rvm default

set PATH $HOME/.local/bin $PATH
set LC_CTYPE 'en_US.UTF-8'

# For compilers to find zlib
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"

# For pkg-config to find zlib
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"

function kubectl-config
  set ctx (string split ' ' (kubectl config view -o jsonpath='{.users[*].name}') | peco)
  kubectl config use-context $ctx
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end
