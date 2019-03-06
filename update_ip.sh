echo `grep web1 /vagrant/settings.yaml | cut -d " " -f 2 |  tr -d '\r'` web1 >> /etc/hosts
echo `grep web2 /vagrant/settings.yaml | cut -d " " -f 2 |  tr -d '\r'` web2 >> /etc/hosts
sed -i -e "s/192.168.230.20/`grep virtual /vagrant/settings.yaml | cut -d \" \" -f 2 |  tr -d \'\r\'`/g" /etc/ha.d/haresources
sed -i -e "s/node1/`grep node1_hostname /vagrant/settings.yaml | cut -d \" \" -f 2`/g" /etc/ha.d/ha.cf
sed -i -e "s/node2/`grep node2_hostname /vagrant/settings.yaml | cut -d \" \" -f 2`/g" /etc/ha.d/ha.cf
