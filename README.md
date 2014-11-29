$Id: README,v 1.3 2005/07/23 10:07:58 boris Exp $
Step-by-step instruction to setup linuxstat web application
It is assumed that username is 'boris'

1. compile and install rrdtool into /usr/local/rrdtool

2. mkdir ~/bin

3. move to some place and checkout sources of the project:
$ cvs co projects/linuxstat

4. Go into
$ cd projects/linuxstat/bin

5. As root make  
# mkdir /var/lib/rrd
# mkdir /var/lib/rrd/linuxstat
# chown boris /var/lib/rrd/linuxstat

6. run linuxstat_cr:
$ ./linuxstat_cr
   check for creation of 4 rrd files in /var/lib/rrd/linuxstat
$ ls -l  /var/lib/rrd/linuxstat/

7. 
$ cp linuxstat_upd ~/bin

8. Add line
0-59/5 * * * * [ -x /home/boris/bin/linuxstat_upd ] && /home/boris/bin/linuxstat_upd > /dev/null 2>&1
   to crontab 

9. As root:
# mkdir /var/www/html/linuxstat
# chown boris /var/www/html/linuxstat
$ mkdir /var/www/html/linuxstat/img
$ chmod 777 /var/www/html/linuxstat/img
or make it writable for apache

$ cd ../html
$ cp *.html /var/www/html/linuxstat

$ cd ../cgi-bin
$ su 
# cp linuxstat /var/www/cgi-bin
# chown boris /var/www/cgi-bin/linuxstat
# service httpd start

10.
check http://www.domain.ru/linuxstat/index.html
   
