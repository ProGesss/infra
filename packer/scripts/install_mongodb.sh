#! /bin/bash/

 rm /etc/apt/sources.list.d/mongodb*.list 
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
 bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
 DEBIAN_FRONTEND=noninteractive apt-get update -yq
 DEBIAN_FRONTEND=noninteractive apt-get -yq install mongodb-org --allow-unauthenticated

 systemctl start mongod
 systemctl enable mongod 

 # git clone https://github.com/Artemmkin/reddit.git

 # cd /home/appuser/reddit
 # echo | pwd

 # /home/appuser/.rvm/gems/ruby-2.4.1/wrappers/bundle install
 # /home/appuser/.rvm/gems/ruby-2.4.1/wrappers/puma -d

