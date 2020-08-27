#!/bin/sh

sudo systemctl stop cloud-minder-central

NODE=`which node`

npm install

cat cloud-minder-central.service.template | sed s+__USER__+$USER+ | sed s+__PWD__+$PWD+ | sed s+__NODE__+$NODE+ > cloud-minder-central.service

sudo cp cloud-minder-central.service /etc/systemd/system/
sudo systemctl --system daemon-reload
sudo systemctl enable cloud-minder-central
sudo systemctl start cloud-minder-central

