#!/bin/bash

imageURL=https://cloud-images.ubuntu.com/minimal/releases/jammy/release/ubuntu-22.04-minimal-cloudimg-amd64.img
imageName="ubuntu-22.04-minimal-cloudimg-amd64.img"
volumeName="local-lvm"
virtualMachineId="700"
templateName="jammy-template"
tmp_cores="1"
tmp_memory="1024"
disk_size="8G"
user="terraform"
cipass="mypass123"

set -e

rm *.img
wget $imageURL
sleep 2
sudo virt-customize -a $imageName --install qemu-guest-agent
sleep 2
sudo virt-customize -a $imageName --run-command 'rm /etc/machine-id && touch /etc/machine-id'
sleep 1
qm create $virtualMachineId --name $templateName --scsihw virtio-scsi-single --ostype l26 --memory $tmp_memory --cores $tmp_cores --net0 virtio,bridge=vmbr0
sleep 1
qm set $virtualMachineId --agent enabled=1
qm set $virtualMachineId --ide2 $volumeName:cloudinit
qm set $virtualMachineId --ipconfig0 ip=dhcp
qm set $virtualMachineId --ciuser $user
qm set $virtualMachineId --cipassword $cipass
qm set $virtualMachineId --sshkey /etc/scripts/ansible.pub
sleep 1
qm cloudinit update $virtualMachineId
qm set $virtualMachineId --serial0 socket --vga serial0
qemu-img resize $imageName $disk_size
qm importdisk $virtualMachineId $imageName $volumeName
sleep 1
qm set $virtualMachineId --scsi0 $volumeName:vm-$virtualMachineId-disk-0
qm set $virtualMachineId --scsihw virtio-scsi-single 
qm set $virtualMachineId --boot order='ide2;scsi0;net0'
qm resize $virtualMachineId scsi0 $disk_size
qm template $virtualMachineId