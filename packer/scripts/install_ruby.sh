#! /bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get update -yq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential
sudo DEBIAN_FRONTEND=noninteractive apt-get install curl

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

 \curl -sSL https://get.rvm.io | bash -s stable
 source ~/.rvm/scripts/rvm
 rvm requirements
 rvm install 2.4.1
 rvm use 2.4.1
 rvm use 2.4.1 --default
 gem install bundler -V --no-ri --no-rdoc
 ruby -v
 bundle -v
