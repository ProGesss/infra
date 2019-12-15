#!/bin/bash

git clone https://github.com/Artemmkin/reddit.git

 cd /home/appuser/reddit
 echo | pwd

 /home/appuser/.rvm/gems/ruby-2.4.1/wrappers/bundle install
 /home/appuser/.rvm/gems/ruby-2.4.1/wrappers/puma -d







#set -e

#source ~/.profile
#git clone https://github.com/Artemmkin/reddit.git
#cd reddit
#bundle install

#sudo mv /tmp/puma.service /etc/systemd/system/puma.service
#sudo systemctl start puma
#sudo systemctl enable puma
