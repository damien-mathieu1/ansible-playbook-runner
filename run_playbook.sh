#!/bin/bash

# Determine OS
echo "Detecting OS..."
OS=""
if grep -q 'Ubuntu' /etc/os-release; then
    OS="ubuntu"
elif grep -q 'Arch' /etc/os-release; then
    OS="archlinux"
else
    echo "Unsupported OS"
    exit 1
fi

echo "OS detected: $OS"

if command -v ansible >/dev/null 2>&1; then
    echo "Ansible is already installed"
else
    echo "Installing Ansible..."
    # Install Ansible
    if [ "$OS" == "ubuntu" ]; then
        sudo apt update
        sudo apt install software-properties-common
        sudo apt-add-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible
    elif [ "$OS" == "archlinux" ]; then
        sudo pacman -Syu
        sudo pacman -S ansible
    fi
    echo "Ansible installed"
fi


echo "Running playbook..."
# Run appropriate playbook
if [ "$OS" == "ubuntu" ]; then
    sudo ansible-playbook -i inventory.yaml --tags "ubuntu" playbook.yaml
elif [ "$OS" == "archlinux" ]; then
    sudo ansible-playbook -i inventory.yaml --tags "archlinux" playbook.yaml
fi
echo "End of script"
