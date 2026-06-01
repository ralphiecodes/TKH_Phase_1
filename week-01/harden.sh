#!/bin/bash
# T1-M1-S02: SECURITY HARDENING AUTOMATION
# Task: Restore Gold Standard permissions to restricted artifacts.
# TODO: Add commands to secure ~/Vault/secrets.txt to 600
# TODO: Add commands to secure /etc/shadow to 640


#Chmod 600 means that the owner(6) me has access to read+write and that the group 0(nobody) and others(0) has no access. Thus 600
chmod 600 ~/Vault/secrets.txt
#chmod 640 means that the owner(6) me again has access to read+write and the group 4(shadow) has access as well but only to read and others(0) do not have access
sudo chmod 640 /etc/shadow
#Here we are chown(changing ownership to shadow group) for the root
sudo chown root:shadow /etc/shadow


