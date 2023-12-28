#!/bin/bash

echo "Make sure you are a root user?"


echo "Making necessary changes to files"

chmod 600 sshd_config_pass_on
sleep 0.1
chmod 600 sshd_config_pass_off
sleep 0.1
chmod 600 passAuth.sh

echo "Copying files..."

cp sshd_config_pass_on sshd_config_pass_off passAuth.sh /etc/ssh

echo "Script not used yet" > /etc/ssh/passAuthStatus

echo "Setup complete"

