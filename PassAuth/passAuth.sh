#!/bin/bash

echo "Do you want to enable Password Authentication? [yes/no/status]"

read response

case $response in 
		"yes")
			echo "Enabling Password Authentication" 
			cp /etc/ssh/sshd_config_pass_on /etc/ssh/sshd_config
			sleep 0.5
			systemctl restart sshd
			echo "Password Authentication enabled" `date`
			echo "Password Authentication is ON" > /etc/ssh/passAuthStatus
		;;
		
		"no")
			echo "Disabling Password Authentication" 
			cp /etc/ssh/sshd_config_pass_off /etc/ssh/sshd_config
			sleep 0.5
			systemctl restart sshd
			echo "Password Authentication disabled" `date`
			echo "Password Authentication is OFF" > /etc/ssh/passAuthStatus
		;;
		
		"status")
			cat /etc/ssh/passAuthStatus
		;;
		
		*)
			echo "Invalid option"
		;;
esac
