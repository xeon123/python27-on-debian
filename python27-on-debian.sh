#!/bin/bash - 
#===============================================================================
#
#          FILE: python27-on-debian.sh
# 
#         USAGE: ./python27-on-debian.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Dr. Fritz Mehner (fgm), mehner.fritz@fh-swf.de
#  ORGANIZATION: FH Südwestfalen, Iserlohn, Germany
#       CREATED: 23/08/14 09:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
apt-get install build-essential libsqlite3-dev zlib1g-dev libncurses5-dev libgdbm-dev libbz2-dev libreadline5-dev libssl-dev libdb-dev

wget --no-check-certificate https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz
tar -xzf Python-2.7.8.tgz
cd Python-2.7.8

./configure --prefix=/usr --enable-shared
make
make install
cd ..

update-alternatives --install /usr/bin/python python /usr/bin/python2.6 20
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 10
update-alternatives --set python /usr/bin/python2.6

wget http://peak.telecommunity.com/dist/ez_setup.py
python2.7 ez_setup.py
easy_install-2.7 virtualenv


