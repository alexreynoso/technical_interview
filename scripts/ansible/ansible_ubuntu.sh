#!/bin/bash -eux

# workaround for dpkg lock error on ubuntu
# https://stackoverflow.com/questions/54327058/aws-ami-need-to-explicitly-remove-apt-locks-when-provisioning-ami-from-bionic
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
  echo "waiting for boot to finish"
  sleep 3
done

while fuser /var/lib/apt/lists/lock >/dev/null 2>&1 ; do
  echo "waiting for dpkg to unlock"
  sleep 3
done

# add ansible ppa if ubuntu version is lower than 20.04
release="$(lsb_release -a | grep -i 'release' | grep -Eo '[0-9]{2,2}.' | grep -Eo '[0-9]{2,2}')"
if [ $release -lt 19 ]; then
  # workaround for non-interactive mode on ubuntu
  # https://stackoverflow.com/questions/22466255/is-it-possible-to-answer-dialog-questions-when-installing-under-docker
  sudo apt-get update -yq
  sudo apt-get install -yq software-properties-common debconf-i18n apt-utils
  sudo apt-add-repository -y ppa:ansible/ansible
  echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
fi

# install ansible
sudo apt-get update -yq 
sudo apt-get install -yq ansible
