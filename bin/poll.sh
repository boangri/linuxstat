#!/bin/bash

dir=~/projects/dmstat/bin
domain=rs.xland.ru

cd $dir

for host in prod-app-01 prod-app-02 prod-db-01 prod-db-02 stage-app-01 stage-db-01 vpn-01
do
    $dir/linuxstat_upd $domain $host
    $dir/traffic_upd $domain $host eth0
    $dir/traffic_upd $domain $host eth1
done
   
for host in prod-app-01 prod-app-02 stage-app-01 vpn-01
do
    $dir/traffic_upd $domain $host eth2
done
   
for host in prod-db-01 prod-db-02 stage-db-01 
do
    $dir/traffic_upd $domain $host eth3
done
   
for host in prod-app-01 prod-app-02 
do
    $dir/drbd_upd $domain $host
done
