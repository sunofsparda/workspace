rm ~/workspace/vagrant/ -rf
cd ~/workspace/
git clone https://github.com/sunofsparda/vagrant.git
cd ~/workspace/vagrant
vagrant box add sbeliakou/centos-6.8-x86_64 ~/workspace/box/sbeliakou-vagrant-centos-6.8-x86_64.box
vagrant up	
