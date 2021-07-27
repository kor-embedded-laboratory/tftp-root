#!/bin/bash
sudo apt install tftp tftpd xinetd

sudo printf "service tftp\n" > tftp
sudo printf "{\n" >> tftp
sudo printf "    socket_type    = dgram\n" >> tftp
sudo printf "    protocol       = udp\n" >> tftp
sudo printf "    wait           = yes\n" >> tftp
sudo printf "    user           = %s\n" $(whoami) >> tftp
sudo printf "    server         = /usr/sbin/in.tftpd\n" >> tftp
sudo printf "    server_args    = -s /home/$(whoami)/EmbeddedPackage/tftp-root\n" >> tftp
sudo printf "    disable        = no\n" >> tftp
sudo printf "    per_source     = 11\n" >> tftp
sudo printf "    cps            = 100 2\n" >> tftp
sudo printf "    flags          = IPv4\n" >> tftp
sudo printf "}\n\n" >> tftp

sudo cp -a tftp /etc/xinetd.d/tftp
rm tftp
sudo service xinetd restart
