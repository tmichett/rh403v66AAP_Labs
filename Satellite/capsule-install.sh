#!/bin/bash
#Artur Glogowski <aglogows@redhat.com>
#This script allows to use an ansible role to deploy a capsule automatically in chapter 06 s02 of the RH403 course
#It must be run on workstation
wget http://materials.example.com/rh403-capsule-install.tgz
scp rh403-capsule-install.tgz root@satellite:~
ssh root@satellite "mkdir ansible-role && mv rh403-capsule-install.tgz ansible-role" 
ssh root@satellite "cd ansible-role && tar xzvf rh403-capsule-install.tgz"
ssh root@satellite "ssh-keyscan -H capsule >> ~/.ssh/known_hosts"
ssh root@satellite "sshpass -p redhat ssh-copy-id -i ~foreman-proxy/.ssh/id_rsa_foreman_proxy.pub root@capsule"
ssh root@satellite "cd ansible-role/capsule-maintain && ansible-playbook capsule-install-playbook.yml"
