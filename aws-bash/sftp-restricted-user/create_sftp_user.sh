#!/bin/bash

NAME=$1
PASS=$2

echo "USAGE: create_sftp_user.sh [username] [password]"

# check input parameters
if [ -z "$NAME" ]; then
    echo "Error: username is not set"
    exit
fi

if [ -z "$PASS" ]; then
    echo "Error: password not set"
    exit
fi

# create system user
echo "Creating user: $NAME"
echo "With password: $PASS"

#adduser $NAME
#passwd $PASS

sudo useradd -p `openssl passwd -1 $PASS`  $NAME

# prevent ssh login & assign SFTP group
sudo usermod -g sftpusers $1
sudo usermod -s /bin/nologin $1

# chroot user (so they only see their directory after login)
sudo mkdir -p /home/$1
sudo chown root:root /home/$1
sudo chmod 755 /home/$1

sudo mkdir /home/$1/data
sudo chown $1:$1 /home/$1/data
sudo chmod 755 /home/$1/data