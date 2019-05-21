#!/bin/bash
USER="$1"
SSH_PUBLIC_KEY="$2"
adduser --disabled-password --gecos "" ${USER}
#useradd ${USER} && usermod -a -G sudo ${USER} && sudo usermod -s /bin/bash ${USER}
sudo mkdir -p /home/${USER}/.ssh && echo $SSH_PUBLIC_KEY >> /home/${USER}/.ssh/authorized_keys && sudo chown -R ${USER}:${USER}  /home/${USER}
chmod 700 /home/${USER}/.ssh && chmod 600 /home/${USER}/.ssh/authorized_keys
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers