#! /bin/bash/

 git clone https://github.com/Artemmkin/reddit.git

 cd /home/appuser/reddit
 echo | pwd

 /home/appuser/.rvm/gems/ruby-2.4.1/wrappers/bundle install
 /home/appuser/.rvm/gems/ruby-2.4.1/wrappers/puma -d

