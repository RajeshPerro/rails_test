#!/bin/bash
echo "preparing for installing Ruby 2.2.2"
 sudo apt-get update
 sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

echo "installing Ruby 2.2.2 using rbenv"
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.bashrc
echo "eval '$(rbenv init -)'" >> ~/.bashrc
# exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo "export PATH='$HOME/.rbenv/plugins/ruby-build/bin:$PATH'" >> ~/.bashrc
# exec $SHELL
echo "working...........................!!"
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
rbenv install 2.2.2
rbenv global 2.2.2
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
echo "##########################################"
echo "installing Bundler gem"
echo "##########################################"

gem install bundler

echo "##########################################"
echo "Bundler Installed!"
echo "##########################################"

echo "##########################################"
echo "Setup Git"
echo "##########################################"

git config --global color.ui true

echo "ENTER GIT YOUR NAME: "
read git_name
git config --global user.name $git_name
echo "ENTER GIT YOUR EMAIL: "
read git_email
git config --global user.email $git_email
ssh-keygen -t rsa -C $git_email

echo "##########################################"
echo "Git Setup complete."
echo "##########################################"


echo "Copy the ssh key and add it in your git profile..."
cat ~/.ssh/id_rsa.pub

echo "Press Return to continue: "
read temp

echo "##########################################"
echo "Installing Rails"
echo "##########################################"

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

gem install rails -v 4.2.1
echo "##########################################"
echo "Rails Installation Complete!!!"
echo "##########################################"

rbenv rehash

echo "##########################################"
echo "Installing Mysql"
echo '##########################################'

sudo apt-get install mysql-server mysql-client libmysqlclient-dev

echo "##########################################"
echo "installing postgresql"
echo "##########################################"

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.3 libpq-dev

echo "#########################################"
echo "postgres successfully installed."
echo "#########################################"

echo "enter your name for postgrsql user:"
read postgres_user
sudo -u postgres createuser $postgres_user -s

echo $postgres_user."is set as a porstgresql user. Please run the command:"
echo "sudo -u postgres psql"
echo "Then to set password, Run "
echo "\password ".$postgres_user

echo "Completed! YaY!!! :D"
echo "HARD WORK BEATS TALENT WHEN TALENT DOESN'T WORK HARD."
echo "GOOD LUCK..".$USER



