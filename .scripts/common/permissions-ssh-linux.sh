#!/bin/bash

USER_SSH_PATH=$HOME/.ssh
ROOT_SSH_PATH=/root/.ssh
SSH_PATHS=( $USER_SSH_PATH $ROOT_SSH_PATH )
for SSH_PATH in "${SSH_PATHS[@]}"
do
  chmod 700 $SSH_PATH
  for file in "`find $SSH_PATH -type f | grep -vP "\.pub$"`"; do chmod 600 $file; done
  for file in "`find $SSH_PATH -type f | grep -P "\.pub$"`"; do chmod 644 $file; done
done
