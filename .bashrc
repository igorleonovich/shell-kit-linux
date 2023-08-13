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
  $SCRIPTS_PATH/common/permissions-ssh-mac.sh
}
permissions-scripts() {
  $SCRIPTS_PATH/common/permissions-scripts.sh
}
