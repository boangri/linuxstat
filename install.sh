#!/bin/sh
#
# $Id: install.sh,v 1.3 2005/07/16 09:25:40 boris Exp $
#
USER=boris
HOME=/home/$USER

mkdir $HOME/bin
chown $USER $HOME/bin
mkdir /var/lib/rrd
mkdir /var/lib/rrd/linuxstat
chown $USER /var/lib/rrd/linuxstat
DIR=`pwd`
su - $USER -c "$DIR/bin/linuxstat_cr"
ls -l /var/lib/rrd/linuxstat
cp bin/linuxstat_upd $HOME/bin
chown $USER $HOME/bin/linuxstat_upd

echo "0-59/5 * * * * [ -x $HOME/bin/linuxstat_upd ] && $HOME/bin/linuxstat_upd > /dev/null 2>&1" > /tmp/cr$$
crontab -u $USER /tmp/cr$$
rm -f /tmp/cr$$

mkdir /var/www/html/linuxstat
mkdir /var/www/html/linuxstat/img
chmod 777 /var/www/html/linuxstat/img
cp html/*.html /var/www/html/linuxstat
chown -R $USER /var/www/html/linuxstat 

cp cgi-bin/linuxstat /var/www/cgi-bin
chown $USER /var/www/cgi-bin/linuxstat
