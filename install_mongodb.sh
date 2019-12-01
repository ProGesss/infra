#! /bin/bash/
path1="/home/appuser/reddit"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt-get update
yes Y | sudo apt-get install mongodb-org
sudo systemctl start mongod
echo | sudo systemctl enable mongod
sudo systemctl --no-pager status mongod
sleep 5 
git clone https://github.com/Artemmkin/reddit.git
cd $path1

echo | pwd

/home/appuser/.rvm/gems/ruby-2.4.1/wrappers/bundle install
/home/appuser/.rvm/gems/ruby-2.4.1/wrappers/puma -d

