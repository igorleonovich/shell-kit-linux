#
# E N V I R O N M E N T
#

# ENVIRONMENT: PATHS

## ENVIRONMENT: PATHS: GENERAL
export SCRIPTS_PATH="$HOME/.scripts"


#
# M I S C E L L A N E O U S
#

# MISCELLANEOUS: COMMON
alias c="clear"
alias lsa="ls -la"
cdlsa() {
  cd $1
  lsa
}
alias cl="cdlsa"
alias update="sudo apt update && sudo apt upgrade"

# MISCELLANEOUS: COMMON: NETWORKING
ip-local() {
  hostname -I | awk '{print $1}'
}
alias ip-public="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/\"//g'"
ip-of-domain() {
  echo $(dig +short $1)
}

# MISCELLANEOUS: COMMON: SSH
alias ssh-new="eval `ssh-agent -s`"
ssh-ed25519() {
  ssh-keygen -o -a 100 -t ed25519 -f $1 -C $2
}
ssh-public() {
  ssh-keygen -y -f $1 > "$1.pub"
}

# MISCELLANEOUS: COMMON: PERMISSIONS
op() {
  stat -c '%A %a %n' $1
}
perms() {
  for file in "`find . -type f`"; do stat -c '%A %a %n' $file; done
}
permissions-ssh() {
  sudo $SCRIPTS_PATH/common/permissions-ssh-linux.sh
}
permissions-scripts() {
  $SCRIPTS_PATH/common/permissions-scripts.sh
}

# MISCELLANEOUS: COMMON: DOCKER
docker-stop-containers() {
  docker stop $(docker ps -a -q)
}
alias ds="docker-stop-containers"
docker-clean() {
  docker system prune -a -f
}
alias dc="docker-clean"
docker-nginx-logs-colorful() {
  docker logs --follow $1 | awk '
    /" 2/ {print "\033[32m" $0 "\033[39m"; next;}
    /" 3/ {print "\033[37m" $0 "\033[39m"; next;}
    /" 4/ {print "\033[33m" $0 "\033[39m"; next;}
    /" 5/ {print "\033[31m" $0 "\033[39m"}
  '
}
alias dnl="docker-nginx-logs-colorful"
