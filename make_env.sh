## node

sudo docker run -d --name routerA --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
sudo docker run -d --name routerB --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
# sudo docker run -d --name routerC --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init

sudo docker run -d --name router02 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
sudo docker run -d --name router03 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
# sudo docker run -d --name router04 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
# sudo docker run -d --name router05 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
# sudo docker run -d --name router06 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
# sudo docker run -d --name router07 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init

sudo docker run -d --name router22 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init
sudo docker run -d --name router23 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init

# sudo docker run -d --name router41 --net=none --privileged -v /lib/modules:/lib/modules kurochan/vyos:1.1.6 /sbin/init



sudo docker ps | cut -f 1 -d ' ' | xargs sudo docker kill
sudo docker ps -a | cut -f 1 -d ' ' | xargs sudo docker rm

##  switch
sudo ovs-vsctl add-br switch0
sudo ovs-vsctl add-br switch1
sudo ovs-vsctl add-br switch2
# sudo ovs-vsctl add-br switch3
# sudo ovs-vsctl add-br switch4

sudo ovs-vsctl del-br switch0
sudo ovs-vsctl del-br switch1
sudo ovs-vsctl del-br switch2
# sudo ovs-vsctl del-br switch3
# sudo ovs-vsctl del-br switch4



## NIC
### router A
sudo ovs-docker add-port switch0 eth0 routerA --ipaddress=10.0.0.1/24
sudo ovs-docker add-port switch1 eth1 routerA --ipaddress=10.0.1.1/24

### router B
sudo ovs-docker add-port switch1 eth0 routerB --ipaddress=10.0.1.2/24
sudo ovs-docker add-port switch2 eth1 routerB --ipaddress=10.0.2.1/24
# sudo ovs-docker add-port switch3 eth2 routerB --ipaddress=10.0.3.1/24

### router C
# sudo ovs-docker add-port switch3 eth0 routerC --ipaddress=10.0.3.2/24
# sudo ovs-docker add-port switch4 eth1 routerC --ipaddress=10.0.4.1/24


### router02
sudo ovs-docker add-port switch0 eth0 router02 --ipaddress=10.0.0.2/24

### router03
sudo ovs-docker add-port switch0 eth0 router03 --ipaddress=10.0.0.3/24

### router04
# sudo ovs-docker add-port switch0 eth0 router04 --ipaddress=10.0.0.4/24

### router05
# sudo ovs-docker add-port switch0 eth0 router05 --ipaddress=10.0.0.5/24

### router06
# sudo ovs-docker add-port switch0 eth0 router06 --ipaddress=10.0.0.6/24

### router07
# sudo ovs-docker add-port switch0 eth0 router07 --ipaddress=10.0.0.7/24


### router22
sudo ovs-docker add-port switch2 eth0 router22 --ipaddress=10.0.2.2/24

### router23
sudo ovs-docker add-port switch2 eth0 router23 --ipaddress=10.0.2.3/24

### router41
# sudo ovs-docker add-port switch4 eth0 router41 --ipaddress=10.0.4.2/24

## routing

### routerA
sudo docker exec -it routerA /bin/vbash
su - vyos
configure
set interfaces loopback lo address 172.16.0.1/32
set protocols ospf area 0 network 10.0.0.0/16
set protocols ospf parameters router-id 172.16.0.1
commit
save
exit
exit
exit

### router B
sudo docker exec -it routerB /bin/vbash
su - vyos
configure
set interfaces loopback lo address 172.16.0.2/32
set protocols ospf area 0 network 10.0.0.0/16
set protocols ospf parameters router-id 172.16.0.2
commit
save
exit
exit
exit

### router C
# sudo docker exec -it routerC /bin/vbash
# su - vyos
# configure
# set interfaces loopback lo address 172.16.0.3/32
# set protocols ospf area 0 network 10.0.0.0/16
# set protocols ospf parameters router-id 172.16.0.3
# commit
# save
# exit
# exit
# exit


### router02
sudo docker exec -it router02 /bin/vbash
su - vyos
configure
set interfaces loopback lo address 172.16.1.2/32
set protocols ospf area 0 network 10.0.0.0/16
set protocols ospf parameters router-id 172.16.1.2
commit
save
exit
exit
exit

### router03
sudo docker exec -it router03 /bin/vbash
su - vyos
configure
set interfaces loopback lo address 172.16.1.3/32
set protocols ospf area 0 network 10.0.0.0/16
set protocols ospf parameters router-id 172.16.1.3
commit
save
exit
exit
exit

### router04
sudo docker exec -it router04 /bin/vbash
su - vyos
configure
set interfaces loopback lo address 172.16.1.4/32
set protocols ospf area 0 network 10.0.0.0/16
set protocols ospf parameters router-id 172.16.1.4
commit
save
exit
exit
exit

### router05
# sudo docker exec -it router05 /bin/vbash
# su - vyos
# configure
# set interfaces loopback lo address 172.16.1.5/32
# set protocols ospf area 0 network 10.0.0.0/16
# set protocols ospf parameters router-id 172.16.1.5
# commit
# save
# exit
# exit
# exit

### router06
# sudo docker exec -it router06 /bin/vbash
# su - vyos
# configure
# set interfaces loopback lo address 172.16.1.6/32
# set protocols ospf area 0 network 10.0.0.0/16
# set protocols ospf parameters router-id 172.16.1.6
# commit
# save
# exit
# exit
# exit

### router07
# sudo docker exec -it router07 /bin/vbash
# su - vyos
# configure
# set interfaces loopback lo address 172.16.1.7/32
# set protocols ospf area 0 network 10.0.0.0/16
# set protocols ospf parameters router-id 172.16.1.7
# commit
# save
# exit
# exit
# exit


### router22
sudo docker exec -it router22 /bin/vbash
su - vyos
configure
set interfaces loopback lo address 172.16.1.22/32
set protocols ospf area 0 network 10.0.0.0/16
set protocols ospf parameters router-id 172.16.1.22
commit
save
exit
exit
exit

### router23
sudo docker exec -it router23 /bin/vbash
su - vyos
configure
set interfaces loopback lo address 172.16.1.23/32
set protocols ospf area 0 network 10.0.0.0/16
set protocols ospf parameters router-id 172.16.1.23
commit
save
exit
exit
exit

### router41
# sudo docker exec -it router41 /bin/vbash
# su - vyos
# configure
# set interfaces loopback lo address 172.16.1.41/32
# set protocols ospf area 0 network 10.0.0.0/16
# set protocols ospf parameters router-id 172.16.1.41
# commit
# save
# exit
# exit
# exit

































### router A

### router B

### router C


### router02

### router03

### router04

### router05

### router06

### router07


### router22

### router23

### router41
















