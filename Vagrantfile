require 'yaml'
settings = YAML.load_file 'settings.yaml'

node1_ip=settings['node1_ip']
node2_ip=settings['node2_ip']
node1_hostname=settings['node1_hostname']
node2_hostname=settings['node2_hostname']

$install = <<-INSTALL
apt-get update
apt-get install -y apache2
hostname -f > /tmp/test.html
cp /tmp/test.html /var/www/html/test.html
INSTALL

$setup = <<-SETUP
apt-get install -y heartbeat
cp /vagrant/ha.cf /etc/ha.d/ha.cf
cp /vagrant/haresources /etc/ha.d/haresources
cp /vagrant/authkeys /etc/ha.d/authkeys
chmod 600 /etc/ha.d/authkeys
bash /vagrant/update_ip.sh
/etc/init.d/heartbeat start
SETUP

Vagrant.configure("2") do |config|
  config.vm.define "node1" do |node1|
    node1.vm.box = "debian/stretch64"
    node1.vm.hostname = node1_hostname
    node1.vm.network :private_network, ip: node1_ip
    node1.vm.provision "shell", inline: $install
    node1.vm.provision "shell", inline: $setup
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "debian/stretch64"
    node2.vm.hostname = node2_hostname
    node2.vm.network :private_network, ip: node2_ip
    node2.vm.provision "shell", inline: $install
    node2.vm.provision "shell", inline: $setup
  end
end
