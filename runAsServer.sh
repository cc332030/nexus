
ln -s /home/root/program/nexus/nexus3/bin/nexus /usr/local/bin/nexus
ln -s /home/root/program/nexus/nexus3/bin/nexus /etc/init.d/nexus

cd /etc/init.d
chkconfig --add nexus

chkconfig nexus on
# chkconfig --levels 345 nexus on

service nexus start
