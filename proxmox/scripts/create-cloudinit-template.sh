#!/bin/bash

imageURL=http://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
imageName="ubuntu-server-cloudimg-amd64.img"
volumeName="local-lvm"
virtualMachineId="200"
templateName="jammy-template"
tmp_cores="1"
tmp_memory="2048"

rm *.img
wget -O $imageName $imageURL
qm destroy $virtualMachineId
virt-customize -a $imageName --install qemu-guest-agent
qm create $virtualMachineId --name $templateName --memory $tmp_memory --cores $tmp_cores --net0 virtio,bridge=vmbr0
qm set $virtualMachineId --ide2 $volumeName:cloudinit
qm importdisk $virtualMachineId $imageName $volumeName
qm set $virtualMachineId --scsihw virtio-scsi-pci --scsi0 $volumeName:vm-$virtualMachineId-disk-0
qm set $virtualMachineId --boot c --bootdisk scsi0
qm set $virtualMachineId --serial0 socket --vga serial0
qm template $virtualMachineId
