export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Personal
export WORK="$HOME/Documents/work"
export DOWNLOADS="$HOME/Downloads"
export PROJECTS="$HOME/Documents/work/projects"
export LOC_GIT="$HOME/Documents/work/git"
export SCREENSHOTS="$HOME/Pictures/screenshots"

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Laravel
alias a="php artisan"
# alias fresh="php artisan migrate:fresh --seed"
# alias seed="php artisan db:seed"
alias serve="php artisan serve"

# Jeffrey
alias cwor="cd $WORK"
alias cdow="cd $DOWNLOADS"
alias cans="cd $ANSIBLE"
alias cpro="cd $PROJECTS"
alias cgit="cd $LOC_GIT"

# alias mtr="sudo /usr/local/bin/mtr"

# Kubernetes
alias k="kubectl"
alias ken="export KUBECONFIG=\"$HOME/Documents/work/k8s/kubeconfig\""
alias kdis="export KUBECONFIG=\"\""
alias kex="kubectl exec -it"

## Git aliases
### Checkout
alias gic="git checkout"
alias gicb="git checkout -b"

### Branches
alias gib="git branch"
alias gibd="git branch -D"

### Pull
alias gip="git pull"

### Cloning
alias gicl="git clone"

###############
## FUNCTIONS ##
###############

function azgetk8s() {
  CLUSTER="${1}"
  
  if [[ $CLUSTER != aks-* ]]; then
    echo "Failed. The given Azure cluster should start with 'aks-'!"
    return 
  fi
  
  CLUSTER_STRIPPED="${CLUSTER/aks-/}"

  az account set -n su-${CLUSTER_STRIPPED}
  az aks get-credentials --resource-group rg-${CLUSTER_STRIPPED} --name aks-${CLUSTER_STRIPPED} --overwrite-existing
  [ $? = 0 ] && kubelogin convert-kubeconfig -l azurecli || echo "Could not find cluster ${CLUSTER}."
}
