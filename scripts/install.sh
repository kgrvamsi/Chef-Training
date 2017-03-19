#!/bin/bash
set -x
set -e

#Reference from the Cumulus Networks Chef Demo Repo ##
## https://github.com/CumulusNetworks/cldemo-automation-chef/blob/master/steps
###

install_server(){
  echo "Installing the Chef Server 12.0"
  wget -qO - https://downloads.chef.io/packages-chef-io-public.key |sudo apt-key add -
  echo "deb https://packages.chef.io/stable-apt xenial main" >chef-stable.list
  mv chef-stable.list /etc/apt/sources.list.d/
  apt-get update
  apt-get install chef-server-core -y
  chef-server-ctl reconfigure
  chef-server-ctl restart
}

if [[ $1 == "help" ]];
then
  echo "This is a help area"
elif [[ $1 == "server" ]];
then
   install_server
fi



